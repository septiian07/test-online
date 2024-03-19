import 'package:interview_task/src/core/core_res_list.dart';
import 'package:interview_task/src/core/core_res_single.dart';
import 'package:interview_task/src/core/core_service.dart';
import 'package:interview_task/src/models/checklist.dart';
import 'package:interview_task/src/network/api_result.dart';
import 'package:interview_task/src/network/network_exceptions.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class HomeService extends CoreService {
  Future<ApiResult<CoreResList<Checklist>>> fetchChecklistAll() async {
    try {
      var result = await apiService.getChecklistAll();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e, true),
      );
    }
  }

  Future<ApiResult<CoreResSingle<Checklist>>> createChecklist(
      String? name) async {
    try {
      var body = {"name": name};

      var result = await apiService.createChecklist(body);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e, true),
      );
    }
  }

  Future<ApiResult<CoreResSingle<Checklist>>> deleteChecklist(
      int checklistId) async {
    try {
      var result = await apiService.deleteChecklist(checklistId);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e, true),
      );
    }
  }

  Future<ApiResult<CoreResList<Checklist>>> fetchChecklistItemAll(
      int checklistId) async {
    try {
      var result = await apiService.getChecklistItemAll(checklistId);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e, true),
      );
    }
  }

  Future<ApiResult<CoreResSingle<Checklist>>> fetchChecklistItemAllById(
    int checklistId,
    int checklistItemId,
  ) async {
    try {
      var result = await apiService.getChecklistItemAllById(
        checklistId,
        checklistItemId,
      );
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e, true),
      );
    }
  }
}
