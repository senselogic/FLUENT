// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'database/supabase.dart';
import 'screen/property_details_screen.dart';
import 'screen/property_list_screen.dart';

// -- TYPES

class FluentApp extends StatelessWidget
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

    await Supabase.initialize(
        url: FLUENT_DATABASE_URL,
        anonKey: FLUENT_DATABASE_KEY
        );

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
                            child: const PropertyListScreen(),
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
                                    child: const PropertyDetailsScreen(),
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

final SupabaseClient
    database = Supabase.instance.client;

