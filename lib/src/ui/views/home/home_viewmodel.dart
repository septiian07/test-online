import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview_task/src/app/app.locator.dart';
import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/core/core_res_list.dart';
import 'package:interview_task/src/core/core_res_single.dart';
import 'package:interview_task/src/core/core_viewmodel.dart';
import 'package:interview_task/src/models/checklist.dart';
import 'package:interview_task/src/models/profile.dart';
import 'package:interview_task/src/network/network_exceptions.dart';
import 'package:interview_task/src/network/result_state.dart';
import 'package:interview_task/src/services/home_service.dart';
import 'package:stacked/stacked.dart';

const String _ChecklistData = 'delayedChecklist';

class HomeViewModel extends MultipleFutureViewModel with CoreViewModel {
  final _homeService = locator<HomeService>();

  ResultState<CoreResList<Checklist>> get fetchChecklist =>
      dataMap?[_ChecklistData];

  bool get fetchingChecklist => busy(_ChecklistData);

  Profile? user;
  List<Checklist> checkList = [];
  String? token;

  @override
  Map<String, Future Function()> get futuresMap => {
        _ChecklistData: getChecklist,
      };

  Future<ResultState<CoreResList<Checklist>>> getChecklist() async {
    var result = await _homeService.fetchChecklistAll();
    return result.when(
      success: (CoreResList<Checklist> data) async {
        checkList = data.data ?? [];
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (
        NetworkExceptions error,
        String? message,
      ) async {
        notifyListeners();
        showMessageError(message ?? '');
        return ResultState.error(error: error);
      },
    );
  }

  Future<ResultState<CoreResSingle<Checklist>>> deleteChecklist(
      int checklistId) async {
    setBusy(true);
    var result = await _homeService.deleteChecklist(checklistId);
    setBusy(false);
    return result.when(
      success: (CoreResSingle<Checklist> data) async {
        showMessageError(data.message ?? '');
        home();
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (
        NetworkExceptions error,
        String? message,
      ) async {
        showMessageError(message ?? '');
        notifyListeners();
        return ResultState.error(error: error);
      },
    );
  }

  void blankView() => navigationService.clearStackAndShow(Routes.blankView);

  void create() => navigationService.navigateTo(Routes.createChecklistView);

  void checklistItem(int checklistId) => navigationService.navigateTo(
        Routes.checklistItemView,
        arguments: ChecklistItemViewArguments(checklistId: checklistId),
      );

  void home() => navigationService.clearStackAndShow(Routes.mainView);
}
