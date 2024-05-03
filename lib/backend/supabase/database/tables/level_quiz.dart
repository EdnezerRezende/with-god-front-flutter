import '../database.dart';

class LevelQuizTable extends SupabaseTable<LevelQuizRow> {
  @override
  String get tableName => 'LevelQuiz';

  @override
  LevelQuizRow createRow(Map<String, dynamic> data) => LevelQuizRow(data);
}

class LevelQuizRow extends SupabaseDataRow {
  LevelQuizRow(super.data);

  @override
  SupabaseTable get table => LevelQuizTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get level => getField<String>('level');
  set level(String? value) => setField<String>('level', value);

  int? get valueLevel => getField<int>('value_level');
  set valueLevel(int? value) => setField<int>('value_level', value);
}
