// -- IMPORTS

import { printError } from 'senselogic-gist';
import { database, databaseName, databaseEmailPrefix } from '$lib/database';

// -- FUNCTIONS

export async function signUpUser(
    email,
    password
    )
{
    const { user, error }
        = await supabase.auth.signUp(
              {
                  email: databaseEmailPrefix + email,
                  password
              }
              );

    if ( error !== null )
    {
        printError( error );
    }

    return user;
}

// ~~

export async function signInUser(
    email,
    password
    )
{
    const { user, error }
        = await supabase.auth.signIn(
              {
                  email: databaseEmailPrefix + email,
                  password
              }
              );

    if ( error !== null )
    {
        printError( error );
    }

    return user;
}

// ~~

export async function signOut(
    )
{
    const { error }
        = await supabase.auth.signOut();

    if ( error !== null )
    {
        printError( error );
    }
}
