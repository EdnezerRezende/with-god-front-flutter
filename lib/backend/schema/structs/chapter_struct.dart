// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChapterStruct extends BaseStruct {
  ChapterStruct({
    int? number,
    int? verses,
  })  : _number = number,
        _verses = verses;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  // "verses" field.
  int? _verses;
  int get verses => _verses ?? 0;
  set verses(int? val) => _verses = val;
  void incrementVerses(int amount) => _verses = verses + amount;
  bool hasVerses() => _verses != null;

  static ChapterStruct fromMap(Map<String, dynamic> data) => ChapterStruct(
        number: castToType<int>(data['number']),
        verses: castToType<int>(data['verses']),
      );

  static ChapterStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChapterStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'number': _number,
        'verses': _verses,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'verses': serializeParam(
          _verses,
          ParamType.int,
        ),
      }.withoutNulls;

  static ChapterStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChapterStruct(
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        verses: deserializeParam(
          data['verses'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ChapterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChapterStruct &&
        number == other.number &&
        verses == other.verses;
  }

  @override
  int get hashCode => const ListEquality().hash([number, verses]);
}

ChapterStruct createChapterStruct({
  int? number,
  int? verses,
}) =>
    ChapterStruct(
      number: number,
      verses: verses,
    );
