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

        return ( user != null );
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

        return ( user != null );
    }

    // ~~

    Future<bool> signOut(
        ) async
    {
        await database.auth.signOut();

        user = null;

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
