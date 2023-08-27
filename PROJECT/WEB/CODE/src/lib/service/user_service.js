// -- IMPORTS

import { printError } from 'senselogic-gist';
import { database, databaseName, databaseEmailPrefix } from '$lib/database';

// -- FUNCTIONS

class UserService
{
    async signUpUser(
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

    async signInUser(
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

    async signOut(
        )
    {
        const { error }
            = await supabase.auth.signOut();

        if ( error !== null )
        {
            printError( error );
        }
    }
}

// -- VARIABLES

export const userService
    = new UserService();
