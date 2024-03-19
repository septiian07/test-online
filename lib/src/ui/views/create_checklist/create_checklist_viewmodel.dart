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

class CreateChecklistViewModel extends BaseViewModel with CoreViewModel {
  final _homeService = locator<HomeService>();
  final TextEditingController nameController = TextEditingController();

  Future<ResultState<CoreResSingle<Checklist>>> createChecklist() async {
    setBusy(true);
    var result = await _homeService.createChecklist(
      nameController.text,
    );
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

  void home() => navigationService.clearStackAndShow(Routes.mainView);
}
