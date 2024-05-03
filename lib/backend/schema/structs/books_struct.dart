// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BooksStruct extends BaseStruct {
  BooksStruct({
    int? id,
    String? nome,
    String? abbrev,
    String? testamento,
    String? autor,
    int? capitulos,
    String? grupo,
    int? idLivro,
    int? groupId,
  })  : _id = id,
        _nome = nome,
        _abbrev = abbrev,
        _testamento = testamento,
        _autor = autor,
        _capitulos = capitulos,
        _grupo = grupo,
        _idLivro = idLivro,
        _groupId = groupId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  // "abbrev" field.
  String? _abbrev;
  String get abbrev => _abbrev ?? '';
  set abbrev(String? val) => _abbrev = val;
  bool hasAbbrev() => _abbrev != null;

  // "testamento" field.
  String? _testamento;
  String get testamento => _testamento ?? '';
  set testamento(String? val) => _testamento = val;
  bool hasTestamento() => _testamento != null;

  // "autor" field.
  String? _autor;
  String get autor => _autor ?? '';
  set autor(String? val) => _autor = val;
  bool hasAutor() => _autor != null;

  // "capitulos" field.
  int? _capitulos;
  int get capitulos => _capitulos ?? 0;
  set capitulos(int? val) => _capitulos = val;
  void incrementCapitulos(int amount) => _capitulos = capitulos + amount;
  bool hasCapitulos() => _capitulos != null;

  // "grupo" field.
  String? _grupo;
  String get grupo => _grupo ?? '';
  set grupo(String? val) => _grupo = val;
  bool hasGrupo() => _grupo != null;

  // "id_livro" field.
  int? _idLivro;
  int get idLivro => _idLivro ?? 0;
  set idLivro(int? val) => _idLivro = val;
  void incrementIdLivro(int amount) => _idLivro = idLivro + amount;
  bool hasIdLivro() => _idLivro != null;

  // "group_id" field.
  int? _groupId;
  int get groupId => _groupId ?? 0;
  set groupId(int? val) => _groupId = val;
  void incrementGroupId(int amount) => _groupId = groupId + amount;
  bool hasGroupId() => _groupId != null;

  static BooksStruct fromMap(Map<String, dynamic> data) => BooksStruct(
        id: castToType<int>(data['id']),
        nome: data['nome'] as String?,
        abbrev: data['abbrev'] as String?,
        testamento: data['testamento'] as String?,
        autor: data['autor'] as String?,
        capitulos: castToType<int>(data['capitulos']),
        grupo: data['grupo'] as String?,
        idLivro: castToType<int>(data['id_livro']),
        groupId: castToType<int>(data['group_id']),
      );

  static BooksStruct? maybeFromMap(dynamic data) =>
      data is Map ? BooksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'abbrev': _abbrev,
        'testamento': _testamento,
        'autor': _autor,
        'capitulos': _capitulos,
        'grupo': _grupo,
        'id_livro': _idLivro,
        'group_id': _groupId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'abbrev': serializeParam(
          _abbrev,
          ParamType.String,
        ),
        'testamento': serializeParam(
          _testamento,
          ParamType.String,
        ),
        'autor': serializeParam(
          _autor,
          ParamType.String,
        ),
        'capitulos': serializeParam(
          _capitulos,
          ParamType.int,
        ),
        'grupo': serializeParam(
          _grupo,
          ParamType.String,
        ),
        'id_livro': serializeParam(
          _idLivro,
          ParamType.int,
        ),
        'group_id': serializeParam(
          _groupId,
          ParamType.int,
        ),
      }.withoutNulls;

  static BooksStruct fromSerializableMap(Map<String, dynamic> data) =>
      BooksStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        abbrev: deserializeParam(
          data['abbrev'],
          ParamType.String,
          false,
        ),
        testamento: deserializeParam(
          data['testamento'],
          ParamType.String,
          false,
        ),
        autor: deserializeParam(
          data['autor'],
          ParamType.String,
          false,
        ),
        capitulos: deserializeParam(
          data['capitulos'],
          ParamType.int,
          false,
        ),
        grupo: deserializeParam(
          data['grupo'],
          ParamType.String,
          false,
        ),
        idLivro: deserializeParam(
          data['id_livro'],
          ParamType.int,
          false,
        ),
        groupId: deserializeParam(
          data['group_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BooksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BooksStruct &&
        id == other.id &&
        nome == other.nome &&
        abbrev == other.abbrev &&
        testamento == other.testamento &&
        autor == other.autor &&
        capitulos == other.capitulos &&
        grupo == other.grupo &&
        idLivro == other.idLivro &&
        groupId == other.groupId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        nome,
        abbrev,
        testamento,
        autor,
        capitulos,
        grupo,
        idLivro,
        groupId
      ]);
}

BooksStruct createBooksStruct({
  int? id,
  String? nome,
  String? abbrev,
  String? testamento,
  String? autor,
  int? capitulos,
  String? grupo,
  int? idLivro,
  int? groupId,
}) =>
    BooksStruct(
      id: id,
      nome: nome,
      abbrev: abbrev,
      testamento: testamento,
      autor: autor,
      capitulos: capitulos,
      grupo: grupo,
      idLivro: idLivro,
      groupId: groupId,
    );
