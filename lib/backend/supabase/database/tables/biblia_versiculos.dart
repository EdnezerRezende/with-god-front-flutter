import '../database.dart';

class BibliaVersiculosTable extends SupabaseTable<BibliaVersiculosRow> {
  @override
  String get tableName => 'bibliaVersiculos';

  @override
  BibliaVersiculosRow createRow(Map<String, dynamic> data) =>
      BibliaVersiculosRow(data);
}

class BibliaVersiculosRow extends SupabaseDataRow {
  BibliaVersiculosRow(super.data);

  @override
  SupabaseTable get table => BibliaVersiculosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idLivro => getField<int>('id_livro');
  set idLivro(int? value) => setField<int>('id_livro', value);

  int? get capitulo => getField<int>('capitulo');
  set capitulo(int? value) => setField<int>('capitulo', value);

  int? get versiculo => getField<int>('versiculo');
  set versiculo(int? value) => setField<int>('versiculo', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);
}
