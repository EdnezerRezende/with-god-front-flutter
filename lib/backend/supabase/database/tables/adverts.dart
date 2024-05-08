import '../database.dart';

class AdvertsTable extends SupabaseTable<AdvertsRow> {
  @override
  String get tableName => 'adverts';

  @override
  AdvertsRow createRow(Map<String, dynamic> data) => AdvertsRow(data);
}

class AdvertsRow extends SupabaseDataRow {
  AdvertsRow(super.data);

  @override
  SupabaseTable get table => AdvertsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get pais => getField<String>('pais');
  set pais(String? value) => setField<String>('pais', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  String? get intagranLink => getField<String>('intagranLink');
  set intagranLink(String? value) => setField<String>('intagranLink', value);

  String? get nomeEmpresa => getField<String>('nomeEmpresa');
  set nomeEmpresa(String? value) => setField<String>('nomeEmpresa', value);

  String? get paginaWebLink => getField<String>('paginaWebLink');
  set paginaWebLink(String? value) => setField<String>('paginaWebLink', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get segmento => getField<String>('segmento');
  set segmento(String? value) => setField<String>('segmento', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  List<String> get fotos => getListField<String>('fotos');
  set fotos(List<String>? value) => setListField<String>('fotos', value);
}
