// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// -- TYPES

class PropertyDetailsScreen extends StatelessWidget
{
    // -- CONSTRUCTORS

    const PropertyDetailsScreen(
        { super.key }
        );

    // -- OPERATIONS

    @override
    Widget build(
        BuildContext context
        )
    {
        return Scaffold(
            appBar: AppBar( title: const Text( 'Property details' ) ),
            body: Center(
                child: ElevatedButton(
                    onPressed: () => context.go( '/' ),
                    child: const Text( 'Back' )
                    )
                )
            );
    }
}
