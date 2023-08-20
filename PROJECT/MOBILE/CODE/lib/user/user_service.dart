// -- IMPORTS

import '../database/database.dart';
import 'user.dart';

// -- TYPES

class UserService
{
    // -- INQUIRIES

    Future<bool> signIn(
        String email,
        String password
        ) async
    {
        final response = await supabase.auth.signIn( email: email, password: password );

        if ( response.error == null )
        {
            user = User.fromMap( response.data );
            userIsAuthenticated = true;

            return true;
        }
        else
        {
            return false;
        }
    }

    // ~~

    Future<bool> signUp(
        String email,
        String password
        ) async
    {
        final response = await supabase.auth.signUp( email: email, password: password );

        if ( response.error == null )
        {
            user = User.fromMap( response.data );
            userIsAuthenticated = true;

            return true;
        }
        else
        {
            return false;
        }
    }

    // ~~

    Future<bool> signOut(
        ) async
    {
        final response = await supabase.auth.signOut();

        if ( response.error == null )
        {
            userIsAuthenticated = false;

            return true;
        }
        else
        {
            return false;
        }
    }
}

// -- VARIABLES

final
    userService = UserService();
late User
    user;
bool
    userIsAuthenticated = false;
