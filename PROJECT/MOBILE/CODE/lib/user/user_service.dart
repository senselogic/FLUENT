// -- IMPORTS

import 'package:supabase_flutter/supabase_flutter.dart';
import '../database/database.dart';

// -- TYPES

class UserService
{
    // -- INQUIRIES

    Future<bool> signIn(
        String email,
        String password
        ) async
    {
        final response = await database.auth.signInWithPassword( email: email, password: password );

        session = response.session;
        user = response.user;

        if ( user != null )
        {
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
        final response = await database.auth.signUp( email: email, password: password );

        session = response.session;
        user = response.user;

        if ( user != null )
        {
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
        await database.auth.signOut();

        userIsAuthenticated = false;

        return true;
    }
}

// -- VARIABLES

final
    userService = UserService();
late User?
    user;
late Session?
    session;
bool
    userIsAuthenticated = false;
