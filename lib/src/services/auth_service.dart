import 'package:interview_task/src/constant/session.dart';
import 'package:interview_task/src/core/core_res_single.dart';
import 'package:interview_task/src/core/core_service.dart';
import 'package:interview_task/src/models/auth.dart';
import 'package:interview_task/src/network/api_result.dart';
import 'package:interview_task/src/network/network_exceptions.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class AuthService extends CoreService {
  Future<ApiResult<CoreResSingle<Auth>>> login(
    String username,
    String password,
  ) async {
    try {
      final Map<String, dynamic> body = {
        "username": username,
        "password": password,
      };
      var result = await apiService.auth(body);
      sharedPreferencesHelper.putString(
        Session.token,
        result.data?.token ?? '',
      );

      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e, true),
      );
    }
  }

  Future<ApiResult<CoreResSingle<Auth>>> register(
    String email,
    String username,
    String password,
  ) async {
    try {
      final Map<String, dynamic> body = {
        "email": email,
        "username": username,
        "password": password,
      };
      var result = await apiService.register(body);

      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e, true),
      );
    }
  }
}
