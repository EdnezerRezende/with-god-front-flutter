// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AbbrevStruct extends BaseStruct {
  AbbrevStruct({
    String? pt,
    String? en,
  })  : _pt = pt,
        _en = en;

  // "pt" field.
  String? _pt;
  String get pt => _pt ?? '';
  set pt(String? val) => _pt = val;
  bool hasPt() => _pt != null;

  // "en" field.
  String? _en;
  String get en => _en ?? '';
  set en(String? val) => _en = val;
  bool hasEn() => _en != null;

  static AbbrevStruct fromMap(Map<String, dynamic> data) => AbbrevStruct(
        pt: data['pt'] as String?,
        en: data['en'] as String?,
      );

  static AbbrevStruct? maybeFromMap(dynamic data) =>
      data is Map ? AbbrevStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pt': _pt,
        'en': _en,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pt': serializeParam(
          _pt,
          ParamType.String,
        ),
        'en': serializeParam(
          _en,
          ParamType.String,
        ),
      }.withoutNulls;

  static AbbrevStruct fromSerializableMap(Map<String, dynamic> data) =>
      AbbrevStruct(
        pt: deserializeParam(
          data['pt'],
          ParamType.String,
          false,
        ),
        en: deserializeParam(
          data['en'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AbbrevStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AbbrevStruct && pt == other.pt && en == other.en;
  }

  @override
  int get hashCode => const ListEquality().hash([pt, en]);
}

AbbrevStruct createAbbrevStruct({
  String? pt,
  String? en,
}) =>
    AbbrevStruct(
      pt: pt,
      en: en,
    );
