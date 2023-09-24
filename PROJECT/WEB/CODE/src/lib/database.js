// -- IMPORTS

import { createClient } from '@supabase/supabase-js';
import { SECRET_DATABASE_URL, SECRET_DATABASE_KEY } from '$env/static/private';

// -- CONSTANTS

export let
    databaseName = 'public';

// -- STATEMENTS

export const database
    = createClient(
          SECRET_DATABASE_URL,
          SECRET_DATABASE_KEY
          );
