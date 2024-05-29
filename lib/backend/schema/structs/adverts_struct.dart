// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvertsStruct extends BaseStruct {
  AdvertsStruct({
    String? id,
    String? createdAt,
    String? pais,
    String? descricao,
    String? intagranLink,
    String? nomeEmpresa,
    String? paginaWebLink,
    String? telefone,
    String? email,
    String? endereco,
    String? segmento,
    String? userId,
    List<String>? fotos,
  })  : _id = id,
        _createdAt = createdAt,
        _pais = pais,
        _descricao = descricao,
        _intagranLink = intagranLink,
        _nomeEmpresa = nomeEmpresa,
        _paginaWebLink = paginaWebLink,
        _telefone = telefone,
        _email = email,
        _endereco = endereco,
        _segmento = segmento,
        _userId = userId,
        _fotos = fotos;

  // "id" field.
  String? _id;
  String get id => _id ?? '-';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '-';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "pais" field.
  String? _pais;
  String get pais => _pais ?? '-';
  set pais(String? val) => _pais = val;
  bool hasPais() => _pais != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '-';
  set descricao(String? val) => _descricao = val;
  bool hasDescricao() => _descricao != null;

  // "intagranLink" field.
  String? _intagranLink;
  String get intagranLink => _intagranLink ?? '-';
  set intagranLink(String? val) => _intagranLink = val;
  bool hasIntagranLink() => _intagranLink != null;

  // "nomeEmpresa" field.
  String? _nomeEmpresa;
  String get nomeEmpresa => _nomeEmpresa ?? '-';
  set nomeEmpresa(String? val) => _nomeEmpresa = val;
  bool hasNomeEmpresa() => _nomeEmpresa != null;

  // "paginaWebLink" field.
  String? _paginaWebLink;
  String get paginaWebLink => _paginaWebLink ?? '-';
  set paginaWebLink(String? val) => _paginaWebLink = val;
  bool hasPaginaWebLink() => _paginaWebLink != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '-';
  set telefone(String? val) => _telefone = val;
  bool hasTelefone() => _telefone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '-';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '-';
  set endereco(String? val) => _endereco = val;
  bool hasEndereco() => _endereco != null;

  // "segmento" field.
  String? _segmento;
  String get segmento => _segmento ?? '-';
  set segmento(String? val) => _segmento = val;
  bool hasSegmento() => _segmento != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '-';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "fotos" field.
  List<String>? _fotos;
  List<String> get fotos => _fotos ?? const [];
  set fotos(List<String>? val) => _fotos = val;
  void updateFotos(Function(List<String>) updateFn) => updateFn(_fotos ??= []);
  bool hasFotos() => _fotos != null;

  static AdvertsStruct fromMap(Map<String, dynamic> data) => AdvertsStruct(
        id: data['id'] as String?,
        createdAt: data['created_at'] as String?,
        pais: data['pais'] as String?,
        descricao: data['descricao'] as String?,
        intagranLink: data['intagranLink'] as String?,
        nomeEmpresa: data['nomeEmpresa'] as String?,
        paginaWebLink: data['paginaWebLink'] as String?,
        telefone: data['telefone'] as String?,
        email: data['email'] as String?,
        endereco: data['endereco'] as String?,
        segmento: data['segmento'] as String?,
        userId: data['user_id'] as String?,
        fotos: getDataList(data['fotos']),
      );

  static AdvertsStruct? maybeFromMap(dynamic data) =>
      data is Map ? AdvertsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'pais': _pais,
        'descricao': _descricao,
        'intagranLink': _intagranLink,
        'nomeEmpresa': _nomeEmpresa,
        'paginaWebLink': _paginaWebLink,
        'telefone': _telefone,
        'email': _email,
        'endereco': _endereco,
        'segmento': _segmento,
        'user_id': _userId,
        'fotos': _fotos,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'pais': serializeParam(
          _pais,
          ParamType.String,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'intagranLink': serializeParam(
          _intagranLink,
          ParamType.String,
        ),
        'nomeEmpresa': serializeParam(
          _nomeEmpresa,
          ParamType.String,
        ),
        'paginaWebLink': serializeParam(
          _paginaWebLink,
          ParamType.String,
        ),
        'telefone': serializeParam(
          _telefone,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'segmento': serializeParam(
          _segmento,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'fotos': serializeParam(
          _fotos,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static AdvertsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdvertsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        pais: deserializeParam(
          data['pais'],
          ParamType.String,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        intagranLink: deserializeParam(
          data['intagranLink'],
          ParamType.String,
          false,
        ),
        nomeEmpresa: deserializeParam(
          data['nomeEmpresa'],
          ParamType.String,
          false,
        ),
        paginaWebLink: deserializeParam(
          data['paginaWebLink'],
          ParamType.String,
          false,
        ),
        telefone: deserializeParam(
          data['telefone'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        segmento: deserializeParam(
          data['segmento'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        fotos: deserializeParam<String>(
          data['fotos'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'AdvertsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AdvertsStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        pais == other.pais &&
        descricao == other.descricao &&
        intagranLink == other.intagranLink &&
        nomeEmpresa == other.nomeEmpresa &&
        paginaWebLink == other.paginaWebLink &&
        telefone == other.telefone &&
        email == other.email &&
        endereco == other.endereco &&
        segmento == other.segmento &&
        userId == other.userId &&
        listEquality.equals(fotos, other.fotos);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        pais,
        descricao,
        intagranLink,
        nomeEmpresa,
        paginaWebLink,
        telefone,
        email,
        endereco,
        segmento,
        userId,
        fotos
      ]);
}

AdvertsStruct createAdvertsStruct({
  String? id,
  String? createdAt,
  String? pais,
  String? descricao,
  String? intagranLink,
  String? nomeEmpresa,
  String? paginaWebLink,
  String? telefone,
  String? email,
  String? endereco,
  String? segmento,
  String? userId,
}) =>
    AdvertsStruct(
      id: id,
      createdAt: createdAt,
      pais: pais,
      descricao: descricao,
      intagranLink: intagranLink,
      nomeEmpresa: nomeEmpresa,
      paginaWebLink: paginaWebLink,
      telefone: telefone,
      email: email,
      endereco: endereco,
      segmento: segmento,
      userId: userId,
    );
