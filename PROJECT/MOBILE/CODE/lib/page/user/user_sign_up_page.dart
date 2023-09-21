// -- IMPORTS

import 'package:flutter/material.dart';
import '../../service/user_service.dart';

// -- TYPES

class UserSignUpScreen
    extends StatelessWidget
{
    // -- ATTRIBUTES

    final
        formKey = GlobalKey<FormState>();
    final
        emailController = TextEditingController();
    final
        passwordController = TextEditingController();

  UserSignUpScreen({super.key});

    // -- OPERATIONS

    @override
    Widget build(
        BuildContext context
        )
    {
        // :TODO: form validation

        return Scaffold(
            appBar: AppBar( title: const Text( 'Sign Up' ) ),
            body: Padding(
                padding: const EdgeInsets.all( 16.0 ),
                    child: Column(
                        children: [
                            TextField( controller: emailController, decoration: const InputDecoration( labelText: 'Email' ) ),
                            TextField( controller: passwordController, decoration: const InputDecoration( labelText: 'Password' ), obscureText: true ),
                            ElevatedButton(
                                child: const Text( 'Sign Up' ),
                                onPressed:
                                    () async
                                    {
                                        bool success = await userService.signUp( emailController.text, passwordController.text );

                                        if ( success )
                                        {
                                            Navigator.pop( context );
                                        }
                                        else
                                        {
                                            ScaffoldMessenger.of( context ).showSnackBar(
                                                const SnackBar( content: Text( 'Failed to sign up.' ) )
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
