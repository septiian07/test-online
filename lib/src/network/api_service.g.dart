// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://94.74.86.174:8080/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CoreResSingle<Auth>> auth(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResSingle<Auth>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResSingle<Auth>.fromJson(
      _result.data!,
      (json) => Auth.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResSingle<Auth>> register(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResSingle<Auth>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResSingle<Auth>.fromJson(
      _result.data!,
      (json) => Auth.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResList<Checklist>> getChecklistAll() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResList<Checklist>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'checklist',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResList<Checklist>.fromJson(
      _result.data!,
      (json) => Checklist.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResSingle<Checklist>> createChecklist(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResSingle<Checklist>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'checklist',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResSingle<Checklist>.fromJson(
      _result.data!,
      (json) => Checklist.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResSingle<Checklist>> deleteChecklist(checklistId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResSingle<Checklist>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'checklist/${checklistId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResSingle<Checklist>.fromJson(
      _result.data!,
      (json) => Checklist.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResList<Checklist>> getChecklistItemAll(checklistId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResList<Checklist>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'checklist/${checklistId}/item',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResList<Checklist>.fromJson(
      _result.data!,
      (json) => Checklist.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResSingle<Checklist>> createChecklistItem(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResSingle<Checklist>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'checklist/{checklistId}/item',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResSingle<Checklist>.fromJson(
      _result.data!,
      (json) => Checklist.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResSingle<Checklist>> getChecklistItemAllById(
    checklistId,
    checklistItemId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResSingle<Checklist>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'checklist/${checklistId}/item/${checklistItemId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResSingle<Checklist>.fromJson(
      _result.data!,
      (json) => Checklist.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResSingle<Checklist>> updateStatusChecklistItem(
    checklistId,
    checklistItemId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResSingle<Checklist>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'checklist/${checklistId}/item/${checklistItemId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResSingle<Checklist>.fromJson(
      _result.data!,
      (json) => Checklist.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResSingle<Checklist>> deleteChecklistItem(
    checklistId,
    checklistItemId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResSingle<Checklist>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'checklist/${checklistId}/item/${checklistItemId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResSingle<Checklist>.fromJson(
      _result.data!,
      (json) => Checklist.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<CoreResSingle<Checklist>> editChecklistItem(
    checklistId,
    checklistItemId,
    body,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreResSingle<Checklist>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'checklist/${checklistId}/item/${checklistItemId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreResSingle<Checklist>.fromJson(
      _result.data!,
      (json) => Checklist.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
