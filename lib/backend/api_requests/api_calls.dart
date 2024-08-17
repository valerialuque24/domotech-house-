import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateAccountCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "$username",
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create account',
      apiUrl: 'https://gw.apiflow.online/q/bfae63c080b84af4b3437705c12cad25',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer YzFkMTQ4ZDI4NGQzZDJiNTJhZTY5ZTM2MTMxZmI1MzY6OTU3NTg1NjY1MGVlOGI3ZWU3MjJhZGVkOGY3ZDhjN2Y=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InicioSesionCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Inicio sesion',
      apiUrl: 'https://gw.apiflow.online/q/e97363d9954a4f42a2ca78341e6a5734',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer YzFkMTQ4ZDI4NGQzZDJiNTJhZTY5ZTM2MTMxZmI1MzY6OTU3NTg1NjY1MGVlOGI3ZWU3MjJhZGVkOGY3ZDhjN2Y=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
