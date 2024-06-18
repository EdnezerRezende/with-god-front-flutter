// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends BaseStruct {
  DataStruct({
    int? id,
    String? pergunta,
    List<AlternativasStruct>? alternativas,
    int? idRespostaCorreta,
    int? dificuldade,
    String? enviadoPor,
    String? referencia,
    int? idRespostaEscolhida,
    bool? selecaoCorreta,
  })  : _id = id,
        _pergunta = pergunta,
        _alternativas = alternativas,
        _idRespostaCorreta = idRespostaCorreta,
        _dificuldade = dificuldade,
        _enviadoPor = enviadoPor,
        _referencia = referencia,
        _idRespostaEscolhida = idRespostaEscolhida,
        _selecaoCorreta = selecaoCorreta;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "pergunta" field.
  String? _pergunta;
  String get pergunta => _pergunta ?? '';
  set pergunta(String? val) => _pergunta = val;

  bool hasPergunta() => _pergunta != null;

  // "alternativas" field.
  List<AlternativasStruct>? _alternativas;
  List<AlternativasStruct> get alternativas => _alternativas ?? const [];
  set alternativas(List<AlternativasStruct>? val) => _alternativas = val;

  void updateAlternativas(Function(List<AlternativasStruct>) updateFn) {
    updateFn(alternativas ??= []);
  }

  bool hasAlternativas() => _alternativas != null;

  // "idRespostaCorreta" field.
  int? _idRespostaCorreta;
  int get idRespostaCorreta => _idRespostaCorreta ?? 0;
  set idRespostaCorreta(int? val) => _idRespostaCorreta = val;

  void incrementIdRespostaCorreta(int amount) =>
      idRespostaCorreta = idRespostaCorreta + amount;

  bool hasIdRespostaCorreta() => _idRespostaCorreta != null;

  // "dificuldade" field.
  int? _dificuldade;
  int get dificuldade => _dificuldade ?? 0;
  set dificuldade(int? val) => _dificuldade = val;

  void incrementDificuldade(int amount) => dificuldade = dificuldade + amount;

  bool hasDificuldade() => _dificuldade != null;

  // "enviadoPor" field.
  String? _enviadoPor;
  String get enviadoPor => _enviadoPor ?? '';
  set enviadoPor(String? val) => _enviadoPor = val;

  bool hasEnviadoPor() => _enviadoPor != null;

  // "referencia" field.
  String? _referencia;
  String get referencia => _referencia ?? '';
  set referencia(String? val) => _referencia = val;

  bool hasReferencia() => _referencia != null;

  // "idRespostaEscolhida" field.
  int? _idRespostaEscolhida;
  int get idRespostaEscolhida => _idRespostaEscolhida ?? 0;
  set idRespostaEscolhida(int? val) => _idRespostaEscolhida = val;

  void incrementIdRespostaEscolhida(int amount) =>
      idRespostaEscolhida = idRespostaEscolhida + amount;

  bool hasIdRespostaEscolhida() => _idRespostaEscolhida != null;

  // "selecaoCorreta" field.
  bool? _selecaoCorreta;
  bool get selecaoCorreta => _selecaoCorreta ?? false;
  set selecaoCorreta(bool? val) => _selecaoCorreta = val;

  bool hasSelecaoCorreta() => _selecaoCorreta != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        id: castToType<int>(data['id']),
        pergunta: data['pergunta'] as String?,
        alternativas: getStructList(
          data['alternativas'],
          AlternativasStruct.fromMap,
        ),
        idRespostaCorreta: castToType<int>(data['idRespostaCorreta']),
        dificuldade: castToType<int>(data['dificuldade']),
        enviadoPor: data['enviadoPor'] as String?,
        referencia: data['referencia'] as String?,
        idRespostaEscolhida: castToType<int>(data['idRespostaEscolhida']),
        selecaoCorreta: data['selecaoCorreta'] as bool?,
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'pergunta': _pergunta,
        'alternativas': _alternativas?.map((e) => e.toMap()).toList(),
        'idRespostaCorreta': _idRespostaCorreta,
        'dificuldade': _dificuldade,
        'enviadoPor': _enviadoPor,
        'referencia': _referencia,
        'idRespostaEscolhida': _idRespostaEscolhida,
        'selecaoCorreta': _selecaoCorreta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'pergunta': serializeParam(
          _pergunta,
          ParamType.String,
        ),
        'alternativas': serializeParam(
          _alternativas,
          ParamType.DataStruct,
          isList: true,
        ),
        'idRespostaCorreta': serializeParam(
          _idRespostaCorreta,
          ParamType.int,
        ),
        'dificuldade': serializeParam(
          _dificuldade,
          ParamType.int,
        ),
        'enviadoPor': serializeParam(
          _enviadoPor,
          ParamType.String,
        ),
        'referencia': serializeParam(
          _referencia,
          ParamType.String,
        ),
        'idRespostaEscolhida': serializeParam(
          _idRespostaEscolhida,
          ParamType.int,
        ),
        'selecaoCorreta': serializeParam(
          _selecaoCorreta,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        pergunta: deserializeParam(
          data['pergunta'],
          ParamType.String,
          false,
        ),
        alternativas: deserializeStructParam<AlternativasStruct>(
          data['alternativas'],
          ParamType.DataStruct,
          true,
          structBuilder: AlternativasStruct.fromSerializableMap,
        ),
        idRespostaCorreta: deserializeParam(
          data['idRespostaCorreta'],
          ParamType.int,
          false,
        ),
        dificuldade: deserializeParam(
          data['dificuldade'],
          ParamType.int,
          false,
        ),
        enviadoPor: deserializeParam(
          data['enviadoPor'],
          ParamType.String,
          false,
        ),
        referencia: deserializeParam(
          data['referencia'],
          ParamType.String,
          false,
        ),
        idRespostaEscolhida: deserializeParam(
          data['idRespostaEscolhida'],
          ParamType.int,
          false,
        ),
        selecaoCorreta: deserializeParam(
          data['selecaoCorreta'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataStruct &&
        id == other.id &&
        pergunta == other.pergunta &&
        listEquality.equals(alternativas, other.alternativas) &&
        idRespostaCorreta == other.idRespostaCorreta &&
        dificuldade == other.dificuldade &&
        enviadoPor == other.enviadoPor &&
        referencia == other.referencia &&
        idRespostaEscolhida == other.idRespostaEscolhida &&
        selecaoCorreta == other.selecaoCorreta;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        pergunta,
        alternativas,
        idRespostaCorreta,
        dificuldade,
        enviadoPor,
        referencia,
        idRespostaEscolhida,
        selecaoCorreta
      ]);
}

DataStruct createDataStruct({
  int? id,
  String? pergunta,
  int? idRespostaCorreta,
  int? dificuldade,
  String? enviadoPor,
  String? referencia,
  int? idRespostaEscolhida,
  bool? selecaoCorreta,
}) =>
    DataStruct(
      id: id,
      pergunta: pergunta,
      idRespostaCorreta: idRespostaCorreta,
      dificuldade: dificuldade,
      enviadoPor: enviadoPor,
      referencia: referencia,
      idRespostaEscolhida: idRespostaEscolhida,
      selecaoCorreta: selecaoCorreta,
    );
