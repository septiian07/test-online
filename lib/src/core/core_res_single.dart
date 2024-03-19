import 'package:json_annotation/json_annotation.dart';

part 'core_res_single.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreResSingle<T> {
  int? statusCode;
  String? message;
  T? data;
  String? errorMessage;

  CoreResSingle({
    this.statusCode,
    this.message,
    this.data,
    this.errorMessage,
  });

  factory CoreResSingle.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CoreResSingleFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$CoreResSingleToJson(this, toJsonT);
}
