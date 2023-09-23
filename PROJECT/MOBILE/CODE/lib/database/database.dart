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
        url: databaseUrl,
        anonKey: databaseKey
        );

    database = Supabase.instance.client;
}

// ~~

String getStorageFilePath(
    String filePath
    )
{
    if ( filePath.startsWith( '/upload/' ) )
    {
        return storageUrl + filePath;
    }
    else
    {
        return filePath;
    }
}
