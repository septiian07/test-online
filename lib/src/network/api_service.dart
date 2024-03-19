import 'package:dio/dio.dart';
import 'package:interview_task/src/constant/config.dart';
import 'package:interview_task/src/core/core_res_list.dart';
import 'package:interview_task/src/core/core_res_single.dart';
import 'package:interview_task/src/helpers/http_helper.dart';
import 'package:interview_task/src/models/auth.dart';
import 'package:interview_task/src/models/checklist.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Config.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(HttpHelper().getDioInterceptor());
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("login")
  Future<CoreResSingle<Auth>> auth(@Body() Map<String, dynamic> body);

  @POST("register")
  Future<CoreResSingle<Auth>> register(@Body() Map<String, dynamic> body);

  @GET("checklist")
  Future<CoreResList<Checklist>> getChecklistAll();

  @POST("checklist")
  Future<CoreResSingle<Checklist>> createChecklist(
    @Body() Map<String, dynamic> body,
  );

  @DELETE("checklist/{checklistId}")
  Future<CoreResSingle<Checklist>> deleteChecklist(
    @Path("checklistId") int checklistId,
  );

  @GET("checklist/{checklistId}/item")
  Future<CoreResList<Checklist>> getChecklistItemAll(
    @Path("checklistId") int checklistId,
  );

  @POST("checklist/{checklistId}/item")
  Future<CoreResSingle<Checklist>> createChecklistItem(
    @Body() Map<String, dynamic> body,
  );

  @GET("checklist/{checklistId}/item/{checklistItemId}")
  Future<CoreResSingle<Checklist>> getChecklistItemAllById(
    @Path("checklistId") int checklistId,
    @Path("checklistItemId") int checklistItemId,
  );

  @PUT("checklist/{checklistId}/item/{checklistItemId}")
  Future<CoreResSingle<Checklist>> updateStatusChecklistItem(
    @Path("checklistId") int checklistId,
    @Path("checklistItemId") int checklistItemId,
  );

  @DELETE("checklist/{checklistId}/item/{checklistItemId}")
  Future<CoreResSingle<Checklist>> deleteChecklistItem(
    @Path("checklistId") int checklistId,
    @Path("checklistItemId") int checklistItemId,
  );

  @PUT("checklist/{checklistId}/item/{checklistItemId}")
  Future<CoreResSingle<Checklist>> editChecklistItem(
    @Path("checklistId") int checklistId,
    @Path("checklistItemId") int checklistItemId,
    @Body() Map<String, dynamic> body,
  );
}
