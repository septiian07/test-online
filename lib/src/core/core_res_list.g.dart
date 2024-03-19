// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_res_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoreResList<T> _$CoreResListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CoreResList<T>(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$CoreResListToJson<T>(
  CoreResList<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data?.map(toJsonT).toList(),
      'errorMessage': instance.errorMessage,
    };
