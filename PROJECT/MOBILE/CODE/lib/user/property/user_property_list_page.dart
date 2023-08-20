// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'property_service.dart';
import 'user_service.dart';

// -- TYPES

class UserPropertyListPage
    extends StatefulWidget
{
    // -- OPERATIONS

    @override
    UserPropertyListPageState createState() => UserPropertyListPageState();
}

// ~~

class UserPropertyListPageState
    extends State<UserPropertyListPage>
{
    // -- ATTRIBUTES

    late final PropertyListStore
        propertyListStore;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();
        propertyListStore = PropertyListStore();
        propertyListStore.getUserPropertyList();
    }

    // ~~

    @override
    Widget build(
        BuildContext context
        )
    {
        return Scaffold(
            appBar: AppBar( title: Text( 'Properties' ) ),
            body: BlocConsumer<PropertyListStore, PropertyListStoreState> (
                bloc: propertyListStore,
                listener: ( context, state )
                {},
                builder: ( context, state )
                {
                    if ( state is PropertyListStoreInitialState )
                    {
                        return Text( 'Initial' );
                    }
                    else if ( state is PropertyListStoreLoadingState )
                    {
                        return Center( child: CircularProgressIndicator() );
                    }
                    else if ( state is PropertyListStoreErrorState )
                    {
                        return Center( child: Text( state.error ) );
                    }
                    else if ( state is PropertyListStoreLoadedState )
                    {
                        return ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.propertyList.length,
                            itemBuilder: ( context, index )
                            {
                                final property = state.propertyList[ index ];
                                return ListTile(
                                    title: Text( property.title ),
                                    onTap: () => Navigator.push( context, MaterialPageRoute(
                                        builder: ( context ) => UserPropertyEditionPage( property: property )
                                    ) ),
                                );
                            },
                        );
                    }
                    else
                    {
                        return Icon( Icons.error );
                    }
                },
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: ()
                {
                    context.go( '/user/property/...' );
                },
                child: Icon( Icons.add ),
                tooltip: 'Add Property',
            ),
        );
    }
}
