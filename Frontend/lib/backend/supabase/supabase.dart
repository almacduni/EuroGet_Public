import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://isddthgxttxvmszhpemb.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzZGR0aGd4dHR4dm1zemhwZW1iIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM2Njc0NjEsImV4cCI6MjAwOTI0MzQ2MX0.sCfD6euD0G5Qd11e0TeQTL5ROK0hA05ySYkU66qlHoE';

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
