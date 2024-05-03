import '../database.dart';

class DevotionalsTable extends SupabaseTable<DevotionalsRow> {
  @override
  String get tableName => 'devotionals';

  @override
  DevotionalsRow createRow(Map<String, dynamic> data) => DevotionalsRow(data);
}

class DevotionalsRow extends SupabaseDataRow {
  DevotionalsRow(super.data);

  @override
  SupabaseTable get table => DevotionalsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  int? get chapter => getField<int>('chapter');
  set chapter(int? value) => setField<int>('chapter', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);

  String? get version => getField<String>('version');
  set version(String? value) => setField<String>('version', value);

  List<int> get verses => getListField<int>('verses');
  set verses(List<int>? value) => setListField<int>('verses', value);

  DateTime? get dtAlteracao => getField<DateTime>('dt_alteracao');
  set dtAlteracao(DateTime? value) => setField<DateTime>('dt_alteracao', value);
}
