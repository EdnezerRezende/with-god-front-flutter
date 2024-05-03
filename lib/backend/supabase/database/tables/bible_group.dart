import '../database.dart';

class BibleGroupTable extends SupabaseTable<BibleGroupRow> {
  @override
  String get tableName => 'bibleGroup';

  @override
  BibleGroupRow createRow(Map<String, dynamic> data) => BibleGroupRow(data);
}

class BibleGroupRow extends SupabaseDataRow {
  BibleGroupRow(super.data);

  @override
  SupabaseTable get table => BibleGroupTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get grupo => getField<String>('grupo');
  set grupo(String? value) => setField<String>('grupo', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);
}
