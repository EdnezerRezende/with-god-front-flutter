// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VersesStruct extends BaseStruct {
  VersesStruct({
    int? number,
    String? text,
  })  : _number = number,
        _text = text;

  // "number" field.
  int? _number;
  int get number => _number ?? 1;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '-';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static VersesStruct fromMap(Map<String, dynamic> data) => VersesStruct(
        number: castToType<int>(data['number']),
        text: data['text'] as String?,
      );

  static VersesStruct? maybeFromMap(dynamic data) =>
      data is Map ? VersesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'number': _number,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static VersesStruct fromSerializableMap(Map<String, dynamic> data) =>
      VersesStruct(
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VersesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VersesStruct &&
        number == other.number &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([number, text]);
}

VersesStruct createVersesStruct({
  int? number,
  String? text,
}) =>
    VersesStruct(
      number: number,
      text: text,
    );
