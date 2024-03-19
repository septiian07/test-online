import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview_task/src/app/app.locator.dart';
import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/core/core_res_list.dart';
import 'package:interview_task/src/core/core_viewmodel.dart';
import 'package:interview_task/src/models/checklist.dart';
import 'package:interview_task/src/models/profile.dart';
import 'package:interview_task/src/network/network_exceptions.dart';
import 'package:interview_task/src/network/result_state.dart';
import 'package:interview_task/src/services/home_service.dart';
import 'package:stacked/stacked.dart';

const String _ChecklistData = 'delayedChecklist';

class ChecklistItemViewModel extends MultipleFutureViewModel
    with CoreViewModel {
  final _homeService = locator<HomeService>();

  ResultState<CoreResList<Checklist>> get fetchChecklist =>
      dataMap?[_ChecklistData];

  bool get fetchingChecklist => busy(_ChecklistData);

  Profile? user;
  List<Checklist> checkListItem = [];
  String? token;

  int checkListId;

  ChecklistItemViewModel({required this.checkListId});

  @override
  Map<String, Future Function()> get futuresMap => {
        _ChecklistData: getChecklistItem,
      };

  Future<ResultState<CoreResList<Checklist>>> getChecklistItem() async {
    var result = await _homeService.fetchChecklistItemAll(checkListId);
    return result.when(
      success: (CoreResList<Checklist> data) async {
        checkListItem = data.data ?? [];
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

  void blankView() => navigationService.clearStackAndShow(Routes.blankView);
}
