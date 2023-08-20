// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'user_service.dart';

// -- TYPES

class UserSignInPage
    extends StatelessWidget
{
    // -- ATTRIBUTES

    final
        formKey = GlobalKey<FormState>();
    final
        emailController = TextEditingController();
    final
        passwordController = TextEditingController();

    // -- OPERATIONS

    @override
    Widget build(
        BuildContext context
        )
    {
        // :TODO: form validation

        return Scaffold(
            appBar: AppBar( title: Text( 'Sign In' ) ),
            body: Padding(
                padding: const EdgeInsets.all( 16.0 ),
                    child: Column(
                        children: [
                            TextField( controller: emailController, decoration: InputDecoration( labelText: 'Email' ) ),
                            TextField( controller: passwordController, decoration: InputDecoration( labelText: 'Password' ), obscureText: true ),
                            ElevatedButton(
                                child: Text( 'Sign In' ),
                                onPressed:
                                    () async
                                    {
                                        bool success = await userService.signIn( emailController.text, passwordController.text );

                                        if ( success )
                                        {
                                            Navigator.pop( context );
                                        }
                                        else
                                        {
                                            ScaffoldMessenger.of( context ).showSnackBar(
                                                SnackBar( content: Text( 'Failed to sign in.' ) )
                                                );
                                        }
                                    }
                                )
                            ]
                        )
                )
            );
    }
}
