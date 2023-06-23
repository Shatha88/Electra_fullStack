// ignore_for_file: file_names

import 'package:supabase/supabase.dart';

class SupabaseEnv {
  final _url = 'https://pcutspwauwjlfsgpunwg.supabase.co';
  final _key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBjdXRzcHdhdXdqbGZzZ3B1bndnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NTAwMDY2NywiZXhwIjoyMDAwNTc2NjY3fQ.s4tGaRYZFJqUFJxK2v7TYCdq4BnnDfdTChGe5hywQ_o';
  final _jwt =
      'lr/VuYdk9JDXlbBnBXDHCexwCDYhfTgc56b7TtvKaKOI98U3FNPQOiK0kIJF0rCv/xq1+AnWpL7ytN2gPYYozw==';

  get getJWT {
    return _jwt;
  }

  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
  }
}
