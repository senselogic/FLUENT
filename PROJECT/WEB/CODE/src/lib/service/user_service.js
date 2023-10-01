// -- IMPORTS

import { logError } from 'senselogic-gist';
import { database } from '$lib/database';

// -- TYPES

class UserService
{
    // -- OPERATIONS

    async signUpUser(
        email,
        password
        )
    {
        const { user, error }
            = await supabase.auth.signUp(
                  {
                      email,
                      password
                  }
                  );

        if ( error !== null )
        {
            logError( error );
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
                      email,
                      password
                  }
                  );

        if ( error !== null )
        {
            logError( error );
        }

        return user;
    }

    // ~~

    async signOutUser(
        )
    {
        const { error }
            = await supabase.auth.signOut();

        if ( error !== null )
        {
            logError( error );
        }
    }
}

// -- VARIABLES

export const userService
    = new UserService();
