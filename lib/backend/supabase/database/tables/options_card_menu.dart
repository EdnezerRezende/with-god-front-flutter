import '../database.dart';

class OptionsCardMenuTable extends SupabaseTable<OptionsCardMenuRow> {
  @override
  String get tableName => 'OptionsCardMenu';

  @override
  OptionsCardMenuRow createRow(Map<String, dynamic> data) =>
      OptionsCardMenuRow(data);
}

class OptionsCardMenuRow extends SupabaseDataRow {
  OptionsCardMenuRow(super.data);

  @override
  SupabaseTable get table => OptionsCardMenuTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  bool? get isShow => getField<bool>('isShow');
  set isShow(bool? value) => setField<bool>('isShow', value);

  String? get pageUrl => getField<String>('pageUrl');
  set pageUrl(String? value) => setField<String>('pageUrl', value);
}
