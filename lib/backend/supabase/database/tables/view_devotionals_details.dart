import '../database.dart';

class ViewDevotionalsDetailsTable
    extends SupabaseTable<ViewDevotionalsDetailsRow> {
  @override
  String get tableName => 'view_devotionals_details';

  @override
  ViewDevotionalsDetailsRow createRow(Map<String, dynamic> data) =>
      ViewDevotionalsDetailsRow(data);
}

class ViewDevotionalsDetailsRow extends SupabaseDataRow {
  ViewDevotionalsDetailsRow(super.data);

  @override
  SupabaseTable get table => ViewDevotionalsDetailsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get chapter => getField<int>('chapter');
  set chapter(int? value) => setField<int>('chapter', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  DateTime? get dtAlteracao => getField<DateTime>('dt_alteracao');
  set dtAlteracao(DateTime? value) => setField<DateTime>('dt_alteracao', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  List<int> get verses => getListField<int>('verses');
  set verses(List<int>? value) => setListField<int>('verses', value);

  String? get version => getField<String>('version');
  set version(String? value) => setField<String>('version', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);

  String? get bookNome => getField<String>('book_nome');
  set bookNome(String? value) => setField<String>('book_nome', value);

  String? get abbrev => getField<String>('abbrev');
  set abbrev(String? value) => setField<String>('abbrev', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get userNome => getField<String>('user_nome');
  set userNome(String? value) => setField<String>('user_nome', value);
}
