import '../database.dart';

class ViewDevotionalsListTable extends SupabaseTable<ViewDevotionalsListRow> {
  @override
  String get tableName => 'view_devotionals_list';

  @override
  ViewDevotionalsListRow createRow(Map<String, dynamic> data) =>
      ViewDevotionalsListRow(data);
}

class ViewDevotionalsListRow extends SupabaseDataRow {
  ViewDevotionalsListRow(super.data);

  @override
  SupabaseTable get table => ViewDevotionalsListTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get chapter => getField<int>('chapter');
  set chapter(int? value) => setField<int>('chapter', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  String? get bookNome => getField<String>('book_nome');
  set bookNome(String? value) => setField<String>('book_nome', value);

  String? get abbrev => getField<String>('abbrev');
  set abbrev(String? value) => setField<String>('abbrev', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);

  String? get userNome => getField<String>('user_nome');
  set userNome(String? value) => setField<String>('user_nome', value);
}
