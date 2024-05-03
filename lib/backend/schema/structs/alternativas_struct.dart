// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlternativasStruct extends BaseStruct {
  AlternativasStruct({
    String? texto,
    int? idResposta,
  })  : _texto = texto,
        _idResposta = idResposta;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  set texto(String? val) => _texto = val;
  bool hasTexto() => _texto != null;

  // "idResposta" field.
  int? _idResposta;
  int get idResposta => _idResposta ?? 0;
  set idResposta(int? val) => _idResposta = val;
  void incrementIdResposta(int amount) => _idResposta = idResposta + amount;
  bool hasIdResposta() => _idResposta != null;

  static AlternativasStruct fromMap(Map<String, dynamic> data) =>
      AlternativasStruct(
        texto: data['texto'] as String?,
        idResposta: castToType<int>(data['idResposta']),
      );

  static AlternativasStruct? maybeFromMap(dynamic data) => data is Map
      ? AlternativasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'texto': _texto,
        'idResposta': _idResposta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'texto': serializeParam(
          _texto,
          ParamType.String,
        ),
        'idResposta': serializeParam(
          _idResposta,
          ParamType.int,
        ),
      }.withoutNulls;

  static AlternativasStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlternativasStruct(
        texto: deserializeParam(
          data['texto'],
          ParamType.String,
          false,
        ),
        idResposta: deserializeParam(
          data['idResposta'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AlternativasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlternativasStruct &&
        texto == other.texto &&
        idResposta == other.idResposta;
  }

  @override
  int get hashCode => const ListEquality().hash([texto, idResposta]);
}

AlternativasStruct createAlternativasStruct({
  String? texto,
  int? idResposta,
}) =>
    AlternativasStruct(
      texto: texto,
      idResposta: idResposta,
    );
