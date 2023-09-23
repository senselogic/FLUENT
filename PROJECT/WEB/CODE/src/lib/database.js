// -- IMPORTS

import { createClient } from '@supabase/supabase-js';

// -- CONSTANTS

export let
    databaseName = 'public';

// -- FUNCTIONS

export function getStorageFilePath(
    filePath
    )
{
    if ( filePath.startsWith( '/upload/' ) )
    {
        return process.env.FLUENT_STORAGE_URL + filePath;
    }
    else
    {
        return filePath;
    }
}

// -- STATEMENTS

export const database
    = createClient(
          process.env.FLUENT_DATABASE_URL,
          process.env.FLUENT_DATABASE_KEY
          );
