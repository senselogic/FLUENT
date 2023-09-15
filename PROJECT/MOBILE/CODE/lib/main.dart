// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'database/database.dart';
import 'property/property_details_page.dart';
import 'property/property_list_page.dart';
import 'user/user_sign_in_page.dart';
import 'user/user_sign_up_page.dart';
import 'user/property/user_property_list_page.dart';
import 'user/property/user_property_edition_page.dart';

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

// -- FUNCTIONS

bool requiresUserIsAuthenticated(
    BuildContext context,
    GoRouterState state
    )
{
    if ( userIsAuthenticated )
    {
        return true;
    }
    else
    {
        context.go( '/signin' );

        return false;
    }
}

// -- VARIABLES

bool
    userIsAuthenticated = false;
final GoRouter
    router 
        = GoRouter(
            routes:
                <RouteBase>[
                    GoRoute(
                        path: '/',
                        pageBuilder: 
                            ( context, state )
                            {
                                return CustomTransitionPage(
                                    key: state.pageKey,
                                    child: const PropertyListPage(),
                                    transitionsBuilder: ( context, animation, secondaryAnimation, child )
                                    {
                                        return FadeTransition( opacity: animation, child: child );
                                    }
                                    );
                            }
                            ),
                    GoRoute(
                        path: '/property/:propertyId',
                        pageBuilder: 
                            ( context, state )
                            {
                                final propertyId = state.pathParameters[ 'propertyId' ]!;

                                return CustomTransitionPage(
                                    key: state.pageKey,
                                    child: PropertyDetailsPage( propertyId: propertyId ),
                                    transitionsBuilder: ( context, animation, secondaryAnimation, child )
                                    {
                                        return FadeTransition( opacity: animation, child: child );
                                    }
                                    );
                            }
                            ),
                    GoRoute(
                        path: '/signin',
                        pageBuilder: 
                            ( context, state )
                            {
                                return CustomTransitionPage(
                                    key: state.pageKey,
                                    child: UserSignInPage(),
                                    transitionsBuilder: ( context, animation, secondaryAnimation, child )
                                    {
                                        return FadeTransition( opacity: animation, child: child );
                                    }
                                    );
                            }
                            ),
                    GoRoute(
                        path: '/signup',
                        pageBuilder: 
                            ( context, state )
                            {
                                return CustomTransitionPage(
                                    key: state.pageKey,
                                    child: UserSignUpScreen(),
                                    transitionsBuilder: ( context, animation, secondaryAnimation, child )
                                    {
                                        return FadeTransition( opacity: animation, child: child );
                                    }
                                    );
                            }
                            ),
                    GoRoute(
                        path: '/user',
                        pageBuilder: ( context, state) => MaterialPage( child: Container() ),
                        redirect: 
                            ( context, state ) 
                            {
                                if (!userIsAuthenticated) 
                                {
                                    return '/signin';
                                }
                                else
                                {
                                    return null;
                                }
                            },
                        routes: [
                            GoRoute(
                                path: 'properties',
                                pageBuilder: 
                                    ( context, state )
                                    {
                                        return CustomTransitionPage(
                                            key: state.pageKey,
                                            child: const UserPropertyListPage(),
                                            transitionsBuilder: ( context, animation, secondaryAnimation, child )
                                            {
                                                return FadeTransition( opacity: animation, child: child );
                                            }
                                            );
                                    },
                                ),
                            GoRoute(
                                path: 'property/:propertyId',
                                pageBuilder: 
                                    ( context, state )
                                    {
                                        final propertyId = state.pathParameters[ 'propertyId' ]!;
                                        
                                        return CustomTransitionPage(
                                            key: state.pageKey,
                                            child: UserPropertyEditionPage( propertyId: propertyId ),
                                            transitionsBuilder: ( context, animation, secondaryAnimation, child )
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
