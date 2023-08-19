// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'database/database.dart';
import 'property/property_details_page.dart';
import 'property/property_list_page.dart';

// -- TYPES

class FluentApp
    extends StatelessWidget
{
    // -- CONSTRUCTORS

    const FluentApp(
        { super.key }
        );

    // -- OPERATIONS

    @override
    Widget build(
        BuildContext context
        )
    {
        return MaterialApp.router(
            routerConfig: router,
            );
    }
}

// -- TYPES

Future<void> main(
    ) async
{
    WidgetsFlutterBinding.ensureInitialized();

    await initializeDatabase();

    runApp( const FluentApp() );
}

// -- VARIABLES

final GoRouter
    router = GoRouter(
        routes: <RouteBase>[
            GoRoute(
                path: '/',
                pageBuilder:
                    ( context, state )
                    {
                        return CustomTransitionPage(
                            key: state.pageKey,
                            child: PropertyListPage(),
                            transitionsBuilder:
                                ( context, animation, secondaryAnimation, child )
                                {
                                    return FadeTransition( opacity: animation, child: child );
                                }
                            );
                    },
                routes: <RouteBase>[
                    GoRoute(
                        path: 'property',
                        pageBuilder:
                            ( context, state )
                            {
                                return CustomTransitionPage(
                                    key: state.pageKey,
                                    child: PropertyDetailsPage(),
                                    transitionsBuilder:
                                        ( context, animation, secondaryAnimation, child )
                                        {
                                            return FadeTransition( opacity: animation, child: child );
                                        }
                                    );
                            }
                        )
                    ]
                )
            ]
        );
