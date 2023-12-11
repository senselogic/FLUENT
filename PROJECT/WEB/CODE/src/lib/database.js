// -- IMPORTS

import { createClient } from '@supabase/supabase-js';
import { PRIVATE_FLUENT_PROJECT_DATABASE_URL, PRIVATE_FLUENT_PROJECT_DATABASE_KEY } from '$env/static/private';

// -- CONSTANTS

export let
    databaseName = 'public';

// -- STATEMENTS

export const database
    = createClient(
          PRIVATE_FLUENT_PROJECT_DATABASE_URL,
          PRIVATE_FLUENT_PROJECT_DATABASE_KEY
          );
