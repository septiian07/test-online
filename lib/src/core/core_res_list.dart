import 'package:json_annotation/json_annotation.dart';

part 'core_res_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreResList<T> {
  int? statusCode;
  String? message;
  List<T>? data;
  String? errorMessage;

  CoreResList({
    this.statusCode,
    this.message,
    this.data,
    this.errorMessage,
  });

  factory CoreResList.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CoreResListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$CoreResListToJson(this, toJsonT);
}
