// -- IMPORTS

import 'package:supabase_flutter/supabase_flutter.dart';
import 'constant.dart';

// -- VARIABLES

late SupabaseClient
    database;

// -- FUNCTIONS

Future<void> initializeDatabase(
    ) async
{
    await Supabase.initialize(
        url: FLUENT_DATABASE_URL,
        anonKey: FLUENT_DATABASE_KEY
        );

    database = Supabase.instance.client;
}
