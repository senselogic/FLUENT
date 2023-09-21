// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'user_property_edition_page.dart';
import 'user_property_list_store.dart';
import 'user_property_list_store_state.dart';

// -- TYPES

class UserPropertyListPageState
    extends State<UserPropertyListPage>
{
    // -- ATTRIBUTES

    late final UserPropertyListStore
        userPropertyListStore;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();

        userPropertyListStore = UserPropertyListStore();
        userPropertyListStore.fetch();
    }

    // ~~

    @override
    Widget build(
        BuildContext context
        )
    {
        return Scaffold(
            appBar: AppBar( title: const Text( 'Properties' ) ),
            body: BlocConsumer<UserPropertyListStore, UserPropertyListStoreState> (
                bloc: userPropertyListStore,
                listener: ( context, state )
                {},
                builder: ( context, state )
                {
                    if ( state is UserPropertyListStoreInitialState )
                    {
                        return const Text( 'Initial' );
                    }
                    else if ( state is UserPropertyListStoreLoadingState )
                    {
                        return const Center( child: CircularProgressIndicator() );
                    }
                    else if ( state is UserPropertyListStoreErrorState )
                    {
                        return Center( child: Text( state.error ) );
                    }
                    else if ( state is UserPropertyListStoreLoadedState )
                    {
                        return ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.userPropertyList.length,
                            itemBuilder: ( context, index )
                            {
                                final userProperty = state.userPropertyList[ index ];
                                return ListTile(
                                    title: Text( userProperty.title ),
                                    onTap: () => Navigator.push( context, MaterialPageRoute(
                                        builder: ( context ) => UserPropertyEditionPage( propertyId: userProperty.id )
                                    ) ),
                                );
                            },
                        );
                    }
                    else
                    {
                        return const Icon( Icons.error );
                    }
                },
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: ()
                {
                    context.go( '/user/property/...' );
                },
                tooltip: 'Add Property',
                child: const Icon( Icons.add ),
            ),
        );
    }
}

// ~~

class UserPropertyListPage
    extends StatefulWidget
{
    // -- CONSTRUCTORS

    const UserPropertyListPage(
        {
            super.key
        }
        );

    // -- OPERATIONS

    @override
    UserPropertyListPageState createState(
        )
    {
        return UserPropertyListPageState();
    }
}
