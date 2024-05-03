import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://alkmufrxuvlyujpofkir.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsa211ZnJ4dXZseXVqcG9ma2lyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0NTMxNDcsImV4cCI6MjAyODAyOTE0N30.eEFqtf8G1sv82UOz2lJfwjE6iZKfzhF2JkDAqMNyM2U';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
