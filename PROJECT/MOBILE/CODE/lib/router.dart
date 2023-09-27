// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'page/view_property_page.dart';
import 'page/view_properties_page.dart';
import 'page/sign_in_user_page.dart';
import 'page/sign_up_user_page.dart';
import 'page/edit_properties_page.dart';
import 'page/edit_property_page.dart';

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
                                    child: const ViewPropertiesPage(),
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
                                    child: ViewPropertyPage( propertyId: propertyId ),
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
                                    child: PublicSignInUserPage(),
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
                                    child: PublicSignUpUserScreen(),
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
                                            child: const EditPropertiesPage(),
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
                                            child: EditPropertyPage( propertyId: propertyId ),
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
