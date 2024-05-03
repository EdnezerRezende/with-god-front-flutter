// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BooksByGrupoStruct extends BaseStruct {
  BooksByGrupoStruct({
    int? id,
    String? testamento,
    String? grupo,
    List<BooksStruct>? livros,
    String? nomeGrupo,
  })  : _id = id,
        _testamento = testamento,
        _grupo = grupo,
        _livros = livros,
        _nomeGrupo = nomeGrupo;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "testamento" field.
  String? _testamento;
  String get testamento => _testamento ?? '';
  set testamento(String? val) => _testamento = val;
  bool hasTestamento() => _testamento != null;

  // "grupo" field.
  String? _grupo;
  String get grupo => _grupo ?? '';
  set grupo(String? val) => _grupo = val;
  bool hasGrupo() => _grupo != null;

  // "livros" field.
  List<BooksStruct>? _livros;
  List<BooksStruct> get livros => _livros ?? const [];
  set livros(List<BooksStruct>? val) => _livros = val;
  void updateLivros(Function(List<BooksStruct>) updateFn) =>
      updateFn(_livros ??= []);
  bool hasLivros() => _livros != null;

  // "nomeGrupo" field.
  String? _nomeGrupo;
  String get nomeGrupo => _nomeGrupo ?? '';
  set nomeGrupo(String? val) => _nomeGrupo = val;
  bool hasNomeGrupo() => _nomeGrupo != null;

  static BooksByGrupoStruct fromMap(Map<String, dynamic> data) =>
      BooksByGrupoStruct(
        id: castToType<int>(data['id']),
        testamento: data['testamento'] as String?,
        grupo: data['grupo'] as String?,
        livros: getStructList(
          data['livros'],
          BooksStruct.fromMap,
        ),
        nomeGrupo: data['nomeGrupo'] as String?,
      );

  static BooksByGrupoStruct? maybeFromMap(dynamic data) => data is Map
      ? BooksByGrupoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'testamento': _testamento,
        'grupo': _grupo,
        'livros': _livros?.map((e) => e.toMap()).toList(),
        'nomeGrupo': _nomeGrupo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'testamento': serializeParam(
          _testamento,
          ParamType.String,
        ),
        'grupo': serializeParam(
          _grupo,
          ParamType.String,
        ),
        'livros': serializeParam(
          _livros,
          ParamType.DataStruct,
          true,
        ),
        'nomeGrupo': serializeParam(
          _nomeGrupo,
          ParamType.String,
        ),
      }.withoutNulls;

  static BooksByGrupoStruct fromSerializableMap(Map<String, dynamic> data) =>
      BooksByGrupoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        testamento: deserializeParam(
          data['testamento'],
          ParamType.String,
          false,
        ),
        grupo: deserializeParam(
          data['grupo'],
          ParamType.String,
          false,
        ),
        livros: deserializeStructParam<BooksStruct>(
          data['livros'],
          ParamType.DataStruct,
          true,
          structBuilder: BooksStruct.fromSerializableMap,
        ),
        nomeGrupo: deserializeParam(
          data['nomeGrupo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BooksByGrupoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BooksByGrupoStruct &&
        id == other.id &&
        testamento == other.testamento &&
        grupo == other.grupo &&
        listEquality.equals(livros, other.livros) &&
        nomeGrupo == other.nomeGrupo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, testamento, grupo, livros, nomeGrupo]);
}

BooksByGrupoStruct createBooksByGrupoStruct({
  int? id,
  String? testamento,
  String? grupo,
  String? nomeGrupo,
}) =>
    BooksByGrupoStruct(
      id: id,
      testamento: testamento,
      grupo: grupo,
      nomeGrupo: nomeGrupo,
    );
