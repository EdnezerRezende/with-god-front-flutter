import '../database.dart';

class NotNotificacaoTable extends SupabaseTable<NotNotificacaoRow> {
  @override
  String get tableName => 'not_notificacao';

  @override
  NotNotificacaoRow createRow(Map<String, dynamic> data) =>
      NotNotificacaoRow(data);
}

class NotNotificacaoRow extends SupabaseDataRow {
  NotNotificacaoRow(super.data);

  @override
  SupabaseTable get table => NotNotificacaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  String? get mensagem => getField<String>('mensagem');
  set mensagem(String? value) => setField<String>('mensagem', value);

  String? get fcmtoken => getField<String>('fcmtoken');
  set fcmtoken(String? value) => setField<String>('fcmtoken', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);
}
