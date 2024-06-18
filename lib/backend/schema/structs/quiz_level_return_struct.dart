// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizLevelReturnStruct extends BaseStruct {
  QuizLevelReturnStruct({
    DataStruct? data,
    bool? success,
    String? message,
  })  : _data = data,
        _success = success,
        _message = message;

  // "data" field.
  DataStruct? _data;
  DataStruct get data => _data ?? DataStruct();
  set data(DataStruct? val) => _data = val;

  void updateData(Function(DataStruct) updateFn) {
    updateFn(data ??= DataStruct());
  }

  bool hasData() => _data != null;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '-';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  static QuizLevelReturnStruct fromMap(Map<String, dynamic> data) =>
      QuizLevelReturnStruct(
        data: DataStruct.maybeFromMap(data['data']),
        success: data['success'] as bool?,
        message: data['message'] as String?,
      );

  static QuizLevelReturnStruct? maybeFromMap(dynamic data) => data is Map
      ? QuizLevelReturnStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
        'success': _success,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuizLevelReturnStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizLevelReturnStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: DataStruct.fromSerializableMap,
        ),
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuizLevelReturnStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizLevelReturnStruct &&
        data == other.data &&
        success == other.success &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality().hash([data, success, message]);
}

QuizLevelReturnStruct createQuizLevelReturnStruct({
  DataStruct? data,
  bool? success,
  String? message,
}) =>
    QuizLevelReturnStruct(
      data: data ?? DataStruct(),
      success: success,
      message: message,
    );
