// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:senselogic_gist/senselogic_gist.dart';
import 'database/database.dart';
import 'router.dart';

// -- TYPES

class FluentApp
    extends StatelessWidget
{
    // -- CONSTRUCTORS

    const FluentApp(
        {
            super.key
        }
        );

    // -- OPERATIONS

    @override
    Widget build(
        BuildContext context
        )
    {
        logAnyLevel();

        return MaterialApp.router(
            routerConfig: router
            );
    }
}

// -- FUNCTIONS

Future<void> main(
    ) async
{
    WidgetsFlutterBinding.ensureInitialized();

    await initializeDatabase();

    runApp( const FluentApp() );
}

