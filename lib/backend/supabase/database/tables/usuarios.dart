import '../database.dart';

class UsuariosTable extends SupabaseTable<UsuariosRow> {
  @override
  String get tableName => 'usuarios';

  @override
  UsuariosRow createRow(Map<String, dynamic> data) => UsuariosRow(data);
}

class UsuariosRow extends SupabaseDataRow {
  UsuariosRow(super.data);

  @override
  SupabaseTable get table => UsuariosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get fcmtoken => getField<String>('fcmtoken');
  set fcmtoken(String? value) => setField<String>('fcmtoken', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  bool? get isBiometrics => getField<bool>('isBiometrics');
  set isBiometrics(bool? value) => setField<bool>('isBiometrics', value);

  String? get tokenBible => getField<String>('tokenBible');
  set tokenBible(String? value) => setField<String>('tokenBible', value);
}
