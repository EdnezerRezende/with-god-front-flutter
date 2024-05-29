import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Supabase APIs Group Code

class SupabaseAPIsGroup {
  static String getBaseUrl({
    String? email = 'teste@gmail.com',
    String? accessUserToken =
        'eyJhbGciOiJIUzI1NiIsImtpZCI6Iks2VFpSVmJDV1o5RHdtM0EiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzEzNTYzNzIxLCJpYXQiOjE3MTM1NjAxMjEsImlzcyI6Imh0dHBzOi8vYWxrbXVmcnh1dmx5dWpwb2ZraXIuc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6Ijk3MDhhNmZmLWZhNzUtNDgzNi05NzBlLTQ4YWVkZDcwOTI0MiIsImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7ImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiOTcwOGE2ZmYtZmE3NS00ODM2LTk3MGUtNDhhZWRkNzA5MjQyIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3MTM1NjAxMjF9XSwic2Vzc2lvbl9pZCI6IjllZTM0ODNmLTY5MjMtNGRjZS04ZGFlLWQzMmJhYTRhNTRmNCIsImlzX2Fub255bW91cyI6ZmFsc2V9.CT4OI2IYp06mmku3xck1ZwvMRBZnynmpoHcKldJojA0',
    String? password = '--',
    String? groupId = '',
  }) =>
      'https://alkmufrxuvlyujpofkir.supabase.co';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsa211ZnJ4dXZseXVqcG9ma2lyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0NTMxNDcsImV4cCI6MjAyODAyOTE0N30.eEFqtf8G1sv82UOz2lJfwjE6iZKfzhF2JkDAqMNyM2U',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [ACCESS_USER_TOKEN]',
  };
  static ForgottenPasswordCall forgottenPasswordCall = ForgottenPasswordCall();
  static RecuperarSenhaCall recuperarSenhaCall = RecuperarSenhaCall();
  static SelectBooksByGroupsCall selectBooksByGroupsCall =
      SelectBooksByGroupsCall();
  static SelectBooksCall selectBooksCall = SelectBooksCall();
  static SelectAdvertsCall selectAdvertsCall = SelectAdvertsCall();
}

class ForgottenPasswordCall {
  Future<ApiCallResponse> call({
    String? email = 'teste@gmail.com',
    String? accessUserToken =
        'eyJhbGciOiJIUzI1NiIsImtpZCI6Iks2VFpSVmJDV1o5RHdtM0EiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzEzNTYzNzIxLCJpYXQiOjE3MTM1NjAxMjEsImlzcyI6Imh0dHBzOi8vYWxrbXVmcnh1dmx5dWpwb2ZraXIuc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6Ijk3MDhhNmZmLWZhNzUtNDgzNi05NzBlLTQ4YWVkZDcwOTI0MiIsImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7ImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiOTcwOGE2ZmYtZmE3NS00ODM2LTk3MGUtNDhhZWRkNzA5MjQyIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3MTM1NjAxMjF9XSwic2Vzc2lvbl9pZCI6IjllZTM0ODNmLTY5MjMtNGRjZS04ZGFlLWQzMmJhYTRhNTRmNCIsImlzX2Fub255bW91cyI6ZmFsc2V9.CT4OI2IYp06mmku3xck1ZwvMRBZnynmpoHcKldJojA0',
    String? password = '--',
    String? groupId = '',
  }) async {
    final baseUrl = SupabaseAPIsGroup.getBaseUrl(
      email: email,
      accessUserToken: accessUserToken,
      password: password,
      groupId: groupId,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ForgottenPassword',
      apiUrl: '$baseUrl/auth/v1/recover',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsa211ZnJ4dXZseXVqcG9ma2lyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0NTMxNDcsImV4cCI6MjAyODAyOTE0N30.eEFqtf8G1sv82UOz2lJfwjE6iZKfzhF2JkDAqMNyM2U',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessUserToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RecuperarSenhaCall {
  Future<ApiCallResponse> call({
    String? email = 'teste@gmail.com',
    String? accessUserToken =
        'eyJhbGciOiJIUzI1NiIsImtpZCI6Iks2VFpSVmJDV1o5RHdtM0EiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzEzNTYzNzIxLCJpYXQiOjE3MTM1NjAxMjEsImlzcyI6Imh0dHBzOi8vYWxrbXVmcnh1dmx5dWpwb2ZraXIuc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6Ijk3MDhhNmZmLWZhNzUtNDgzNi05NzBlLTQ4YWVkZDcwOTI0MiIsImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7ImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiOTcwOGE2ZmYtZmE3NS00ODM2LTk3MGUtNDhhZWRkNzA5MjQyIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3MTM1NjAxMjF9XSwic2Vzc2lvbl9pZCI6IjllZTM0ODNmLTY5MjMtNGRjZS04ZGFlLWQzMmJhYTRhNTRmNCIsImlzX2Fub255bW91cyI6ZmFsc2V9.CT4OI2IYp06mmku3xck1ZwvMRBZnynmpoHcKldJojA0',
    String? password = '--',
    String? groupId = '',
  }) async {
    final baseUrl = SupabaseAPIsGroup.getBaseUrl(
      email: email,
      accessUserToken: accessUserToken,
      password: password,
      groupId: groupId,
    );

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RecuperarSenha',
      apiUrl: '$baseUrl/auth/v1/user',
      callType: ApiCallType.PUT,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsa211ZnJ4dXZseXVqcG9ma2lyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0NTMxNDcsImV4cCI6MjAyODAyOTE0N30.eEFqtf8G1sv82UOz2lJfwjE6iZKfzhF2JkDAqMNyM2U',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessUserToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SelectBooksByGroupsCall {
  Future<ApiCallResponse> call({
    String? email = 'teste@gmail.com',
    String? accessUserToken =
        'eyJhbGciOiJIUzI1NiIsImtpZCI6Iks2VFpSVmJDV1o5RHdtM0EiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzEzNTYzNzIxLCJpYXQiOjE3MTM1NjAxMjEsImlzcyI6Imh0dHBzOi8vYWxrbXVmcnh1dmx5dWpwb2ZraXIuc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6Ijk3MDhhNmZmLWZhNzUtNDgzNi05NzBlLTQ4YWVkZDcwOTI0MiIsImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7ImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiOTcwOGE2ZmYtZmE3NS00ODM2LTk3MGUtNDhhZWRkNzA5MjQyIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3MTM1NjAxMjF9XSwic2Vzc2lvbl9pZCI6IjllZTM0ODNmLTY5MjMtNGRjZS04ZGFlLWQzMmJhYTRhNTRmNCIsImlzX2Fub255bW91cyI6ZmFsc2V9.CT4OI2IYp06mmku3xck1ZwvMRBZnynmpoHcKldJojA0',
    String? password = '--',
    String? groupId = '',
  }) async {
    final baseUrl = SupabaseAPIsGroup.getBaseUrl(
      email: email,
      accessUserToken: accessUserToken,
      password: password,
      groupId: groupId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SelectBooksByGroups',
      apiUrl:
          '$baseUrl/rest/v1/bibliaLivros?group_id=in.($groupId)&order=id_livro.asc',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsa211ZnJ4dXZseXVqcG9ma2lyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0NTMxNDcsImV4cCI6MjAyODAyOTE0N30.eEFqtf8G1sv82UOz2lJfwjE6iZKfzhF2JkDAqMNyM2U',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessUserToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? nome(dynamic response) => (getJsonField(
        response,
        r'''$[:].nome''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? abbrev(dynamic response) => (getJsonField(
        response,
        r'''$[:].abbrev''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? testamento(dynamic response) => (getJsonField(
        response,
        r'''$[:].testamento''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? autor(dynamic response) => (getJsonField(
        response,
        r'''$[:].autor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? capitulos(dynamic response) => (getJsonField(
        response,
        r'''$[:].capitulos''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? grupo(dynamic response) => (getJsonField(
        response,
        r'''$[:].grupo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? idLivro(dynamic response) => (getJsonField(
        response,
        r'''$[:].id_livro''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? groupId(dynamic response) => (getJsonField(
        response,
        r'''$[:].group_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class SelectBooksCall {
  Future<ApiCallResponse> call({
    String? email = 'teste@gmail.com',
    String? accessUserToken =
        'eyJhbGciOiJIUzI1NiIsImtpZCI6Iks2VFpSVmJDV1o5RHdtM0EiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzEzNTYzNzIxLCJpYXQiOjE3MTM1NjAxMjEsImlzcyI6Imh0dHBzOi8vYWxrbXVmcnh1dmx5dWpwb2ZraXIuc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6Ijk3MDhhNmZmLWZhNzUtNDgzNi05NzBlLTQ4YWVkZDcwOTI0MiIsImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7ImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiOTcwOGE2ZmYtZmE3NS00ODM2LTk3MGUtNDhhZWRkNzA5MjQyIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3MTM1NjAxMjF9XSwic2Vzc2lvbl9pZCI6IjllZTM0ODNmLTY5MjMtNGRjZS04ZGFlLWQzMmJhYTRhNTRmNCIsImlzX2Fub255bW91cyI6ZmFsc2V9.CT4OI2IYp06mmku3xck1ZwvMRBZnynmpoHcKldJojA0',
    String? password = '--',
    String? groupId = '',
  }) async {
    final baseUrl = SupabaseAPIsGroup.getBaseUrl(
      email: email,
      accessUserToken: accessUserToken,
      password: password,
      groupId: groupId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SelectBooks',
      apiUrl:
          '$baseUrl/rest/v1/bibliaLivros?select=%2A&order=id.asc.nullslast',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsa211ZnJ4dXZseXVqcG9ma2lyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0NTMxNDcsImV4cCI6MjAyODAyOTE0N30.eEFqtf8G1sv82UOz2lJfwjE6iZKfzhF2JkDAqMNyM2U',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessUserToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SelectAdvertsCall {
  Future<ApiCallResponse> call({
    String? searchString = '',
    String? email = 'teste@gmail.com',
    String? accessUserToken =
        'eyJhbGciOiJIUzI1NiIsImtpZCI6Iks2VFpSVmJDV1o5RHdtM0EiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzEzNTYzNzIxLCJpYXQiOjE3MTM1NjAxMjEsImlzcyI6Imh0dHBzOi8vYWxrbXVmcnh1dmx5dWpwb2ZraXIuc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6Ijk3MDhhNmZmLWZhNzUtNDgzNi05NzBlLTQ4YWVkZDcwOTI0MiIsImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7ImVtYWlsIjoidGVzdGVzMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiOTcwOGE2ZmYtZmE3NS00ODM2LTk3MGUtNDhhZWRkNzA5MjQyIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3MTM1NjAxMjF9XSwic2Vzc2lvbl9pZCI6IjllZTM0ODNmLTY5MjMtNGRjZS04ZGFlLWQzMmJhYTRhNTRmNCIsImlzX2Fub255bW91cyI6ZmFsc2V9.CT4OI2IYp06mmku3xck1ZwvMRBZnynmpoHcKldJojA0',
    String? password = '--',
    String? groupId = '',
  }) async {
    final baseUrl = SupabaseAPIsGroup.getBaseUrl(
      email: email,
      accessUserToken: accessUserToken,
      password: password,
      groupId: groupId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SelectAdverts',
      apiUrl:
          '$baseUrl/rest/v1/adverts?nomeEmpresa=ilike.*$searchString*&descricao=ilike.*$searchString*&segmento=ilike.*$searchString*&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsa211ZnJ4dXZseXVqcG9ma2lyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0NTMxNDcsImV4cCI6MjAyODAyOTE0N30.eEFqtf8G1sv82UOz2lJfwjE6iZKfzhF2JkDAqMNyM2U',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessUserToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? dataCreate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].created_at''',
      ));
  String? pais(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].pais''',
      ));
  String? descricao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].descricao''',
      ));
  String? linkInstagran(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].intagranLink''',
      ));
  String? nomeEmpresa(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nomeEmpresa''',
      ));
  String? linkWeb(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].paginaWebLink''',
      ));
  String? telefone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].telefone''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].email''',
      ));
  String? endereco(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].endereco''',
      ));
  String? segmento(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].segmento''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_id''',
      ));
  List<String>? urlFotos(dynamic response) => (getJsonField(
        response,
        r'''$[:].fotos''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Supabase APIs Group Code

/// Start API Biblia Group Code

class APIBibliaGroup {
  static String getBaseUrl({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) =>
      'https://www.abibliadigital.com.br/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [AUTHORIZATION_TOKEN]',
  };
  static GetAllBooksBibleCall getAllBooksBibleCall = GetAllBooksBibleCall();
  static GetBookBibleWithCommentCall getBookBibleWithCommentCall =
      GetBookBibleWithCommentCall();
  static LoginAndUpdateTokenByEmailCall loginAndUpdateTokenByEmailCall =
      LoginAndUpdateTokenByEmailCall();
  static DeleteUserByEmailCall deleteUserByEmailCall = DeleteUserByEmailCall();
  static GetUserStatsCall getUserStatsCall = GetUserStatsCall();
  static CreateUserCall createUserCall = CreateUserCall();
  static GetNumberRequisitionsCall getNumberRequisitionsCall =
      GetNumberRequisitionsCall();
  static GetVersionsBibleCall getVersionsBibleCall = GetVersionsBibleCall();
  static GetVersesByWordCall getVersesByWordCall = GetVersesByWordCall();
  static GetAllVersesByChapterCall getAllVersesByChapterCall =
      GetAllVersesByChapterCall();
}

class GetAllBooksBibleCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAllBooksBible',
      apiUrl: '$baseUrl/books',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBookBibleWithCommentCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getBookBibleWithComment',
      apiUrl: '$baseUrl/books/$book',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginAndUpdateTokenByEmailCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginAndUpdateTokenByEmail',
      apiUrl: '$baseUrl/users/token',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? nomeLoginBiblia(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? emailLoginBiblia(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? tokenLoginBiblia(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class DeleteUserByEmailCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteUserByEmail',
      apiUrl: '$baseUrl/users',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserStatsCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getUserStats',
      apiUrl: '$baseUrl/users/stats',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? dtUltimoLogin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lastLogin''',
      ));
  List? requestPerMonth(dynamic response) => getJsonField(
        response,
        r'''$.requestsPerMonth''',
        true,
      ) as List?;
  List<String>? requestPerMonthDate(dynamic response) => (getJsonField(
        response,
        r'''$.requestsPerMonth[:].range''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? requestPerMonthTotal(dynamic response) => (getJsonField(
        response,
        r'''$.requestsPerMonth[:].total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class CreateUserCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    final ffApiRequestBody = '''
{
  "name": "$name",
  "email": "$email",
  "password": "$password",
  "notifications": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUser',
      apiUrl: '$baseUrl/users',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  bool? notifications(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.notifications''',
      ));
  String? tokenBible(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class GetNumberRequisitionsCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getNumberRequisitions',
      apiUrl: '$baseUrl/requests/amount/$range',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
  List? requests(dynamic response) => getJsonField(
        response,
        r'''$.requests''',
        true,
      ) as List?;
  List<String>? requestsApis(dynamic response) => (getJsonField(
        response,
        r'''$.requests[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? requestsCounts(dynamic response) => (getJsonField(
        response,
        r'''$.requests[:].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetVersionsBibleCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getVersionsBible',
      apiUrl: '$baseUrl/versions',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? version(dynamic response) => (getJsonField(
        response,
        r'''$[:].version''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? qtdVerses(dynamic response) => (getJsonField(
        response,
        r'''$[:].verses''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetVersesByWordCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    final ffApiRequestBody = '''
{
  "version": "$version",
  "search": "$word"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getVersesByWord',
      apiUrl: '$baseUrl/verses/search',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? qtdOcorrencias(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.occurrence''',
      ));
  String? version(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.version''',
      ));
  List? versesResult(dynamic response) => getJsonField(
        response,
        r'''$.verses''',
        true,
      ) as List?;
  List? book(dynamic response) => getJsonField(
        response,
        r'''$.verses[:].book''',
        true,
      ) as List?;
  List? abbrev(dynamic response) => getJsonField(
        response,
        r'''$.verses[:].book.abbrev''',
        true,
      ) as List?;
  List<String>? author(dynamic response) => (getJsonField(
        response,
        r'''$.verses[:].book.author''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? chaptersBook(dynamic response) => (getJsonField(
        response,
        r'''$.verses[:].book.chapters''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? group(dynamic response) => (getJsonField(
        response,
        r'''$.verses[:].book.group''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nomeBook(dynamic response) => (getJsonField(
        response,
        r'''$.verses[:].book.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? testament(dynamic response) => (getJsonField(
        response,
        r'''$.verses[:].book.testament''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? chapter(dynamic response) => (getJsonField(
        response,
        r'''$.verses[:].chapter''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? numberVerse(dynamic response) => (getJsonField(
        response,
        r'''$.verses[:].number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? textResult(dynamic response) => (getJsonField(
        response,
        r'''$.verses[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetAllVersesByChapterCall {
  Future<ApiCallResponse> call({
    String? authorizationToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHIiOiJTYXQgQXByIDIwIDIwMjQgMTA6NDc6NTggR01UKzAwMDAuNjUzM2Q1YTM5MWQyNGMwMDJhYWE2N2UwIiwiaWF0IjoxNzEzNjEwMDc4fQ.LrxLAcfaSsjgbX96ZA6a4ef8Q_UfH4ae1ECcfyL-n78',
    String? book = '--',
    String? email = 'testes2@gmail.com',
    String? password = '102030',
    String? name = 'Admin general',
    String? range = 'month',
    String? version = 'nvi',
    String? word = 'Deus',
    String? bookAbbrev = 'gn',
    int? chapter = 1,
  }) async {
    final baseUrl = APIBibliaGroup.getBaseUrl(
      authorizationToken: authorizationToken,
      book: book,
      email: email,
      password: password,
      name: name,
      range: range,
      version: version,
      word: word,
      bookAbbrev: bookAbbrev,
      chapter: chapter,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAllVersesByChapter',
      apiUrl: '$baseUrl/verses/$version/$bookAbbrev/$chapter',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authorizationToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? versesByChapter(dynamic response) => getJsonField(
        response,
        r'''$.verses''',
        true,
      ) as List?;
  int? number(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.chapter.number''',
      ));
  List<String>? textVerse(dynamic response) => (getJsonField(
        response,
        r'''$.verses[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End API Biblia Group Code

/// Start ShowDoCristao Group Code

class ShowDoCristaoGroup {
  static String getBaseUrl({
    int? level = 6,
  }) =>
      'https://www.showdocristao.com.br:5000/api';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
  };
  static GetQuizCall getQuizCall = GetQuizCall();
  static GetQuizByLevelCall getQuizByLevelCall = GetQuizByLevelCall();
}

class GetQuizCall {
  Future<ApiCallResponse> call({
    int? level = 6,
  }) async {
    final baseUrl = ShowDoCristaoGroup.getBaseUrl(
      level: level,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getQuiz',
      apiUrl: '$baseUrl/perguntas/modo/classico',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetQuizByLevelCall {
  Future<ApiCallResponse> call({
    int? level = 6,
  }) async {
    final baseUrl = ShowDoCristaoGroup.getBaseUrl(
      level: level,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getQuizByLevel',
      apiUrl: '$baseUrl/perguntas/modo/classico/nivel',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
      params: {
        'nivel': level,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ShowDoCristao Group Code

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
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
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
