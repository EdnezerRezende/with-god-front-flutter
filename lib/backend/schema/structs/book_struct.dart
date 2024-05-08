// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookStruct extends BaseStruct {
  BookStruct({
    AbbrevStruct? abbrev,
    String? name,
    String? author,
    String? group,
    String? version,
  })  : _abbrev = abbrev,
        _name = name,
        _author = author,
        _group = group,
        _version = version;

  // "abbrev" field.
  AbbrevStruct? _abbrev;
  AbbrevStruct get abbrev => _abbrev ?? AbbrevStruct();
  set abbrev(AbbrevStruct? val) => _abbrev = val;
  void updateAbbrev(Function(AbbrevStruct) updateFn) =>
      updateFn(_abbrev ??= AbbrevStruct());
  bool hasAbbrev() => _abbrev != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;
  bool hasAuthor() => _author != null;

  // "group" field.
  String? _group;
  String get group => _group ?? '';
  set group(String? val) => _group = val;
  bool hasGroup() => _group != null;

  // "version" field.
  String? _version;
  String get version => _version ?? '';
  set version(String? val) => _version = val;
  bool hasVersion() => _version != null;

  static BookStruct fromMap(Map<String, dynamic> data) => BookStruct(
        abbrev: AbbrevStruct.maybeFromMap(data['abbrev']),
        name: data['name'] as String?,
        author: data['author'] as String?,
        group: data['group'] as String?,
        version: data['version'] as String?,
      );

  static BookStruct? maybeFromMap(dynamic data) =>
      data is Map ? BookStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'abbrev': _abbrev?.toMap(),
        'name': _name,
        'author': _author,
        'group': _group,
        'version': _version,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'abbrev': serializeParam(
          _abbrev,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'group': serializeParam(
          _group,
          ParamType.String,
        ),
        'version': serializeParam(
          _version,
          ParamType.String,
        ),
      }.withoutNulls;

  static BookStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookStruct(
        abbrev: deserializeStructParam(
          data['abbrev'],
          ParamType.DataStruct,
          false,
          structBuilder: AbbrevStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        group: deserializeParam(
          data['group'],
          ParamType.String,
          false,
        ),
        version: deserializeParam(
          data['version'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BookStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookStruct &&
        abbrev == other.abbrev &&
        name == other.name &&
        author == other.author &&
        group == other.group &&
        version == other.version;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([abbrev, name, author, group, version]);
}

BookStruct createBookStruct({
  AbbrevStruct? abbrev,
  String? name,
  String? author,
  String? group,
  String? version,
}) =>
    BookStruct(
      abbrev: abbrev ?? AbbrevStruct(),
      name: name,
      author: author,
      group: group,
      version: version,
    );
