// -- IMPORTS

import { createClient } from '@supabase/supabase-js';

// -- CONSTANTS

export let
    databaseName = 'public',
    databaseTablePrefix = '',
    databaseEmailPrefix = '';

// -- STATEMENTS

export const database
    = createClient(
          process.env.FLUENT_DATABASE_URL,
          process.env.FLUENT_DATABASE_KEY
          );
