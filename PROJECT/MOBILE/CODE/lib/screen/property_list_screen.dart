// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// -- TYPES

class PropertyListScreen extends StatelessWidget
{
    // -- CONSTRUCTORS

    const PropertyListScreen(
        { super.key }
        );

    // -- OPERATIONS

    @override
    Widget build(
        BuildContext context
        )
    {
        return Scaffold(
            appBar: AppBar( title: const Text( 'Property list' ) ),
            body: Center(
                child: ElevatedButton(
                    onPressed: () => context.go( '/property' ),
                    child: const Text( 'Property details' )
                    )
                )
            );
    }
}
