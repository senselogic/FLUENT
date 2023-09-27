// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'edit_property_page.dart';
import '../state/edit_properties_state.dart';
import '../store/edit_properties_store.dart';

// -- TYPES

class EditPropertiesPageState
    extends State<EditPropertiesPage>
{
    // -- ATTRIBUTES

    late final EditPropertiesStore
        editPropertiesStore;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();

        editPropertiesStore = EditPropertiesStore();
        editPropertiesStore.fetch();
    }

    // ~~

    @override
    Widget build(
        BuildContext context
        )
    {
        return Scaffold(
            appBar: AppBar(
                title: const Text( 'Properties' ),
                actions: [
                    IconButton(
                        icon: const Icon( Icons.home ),
                        onPressed: ()
                        {
                            context.go( '/' );
                        }
                        ),
                    IconButton(
                        icon: const Icon( Icons.logout ),
                        onPressed: ()
                        {
                            context.go( '/signout' );
                        }
                        )
                    ]
                ),
            body: BlocConsumer<EditPropertiesStore, EditPropertiesState> (
                bloc: editPropertiesStore,
                listener: ( context, state )
                {},
                builder: ( context, state )
                {
                    if ( state is EditPropertiesInitialState )
                    {
                        return const Text( 'Initial' );
                    }
                    else if ( state is EditPropertiesLoadingState )
                    {
                        return const Center( child: CircularProgressIndicator() );
                    }
                    else if ( state is EditPropertiesErrorState )
                    {
                        return Center( child: Text( state.error ) );
                    }
                    else if ( state is EditPropertiesLoadedState )
                    {
                        return ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.userPropertyList.length,
                            itemBuilder: ( context, index )
                            {
                                final dashboardProperty = state.userPropertyList[ index ];
                                return ListTile(
                                    title: Text( dashboardProperty.title ),
                                    onTap: () => Navigator.push( context, MaterialPageRoute(
                                        builder: ( context ) => EditPropertyPage( propertyId: dashboardProperty.id )
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

class EditPropertiesPage
    extends StatefulWidget
{
    // -- CONSTRUCTORS

    const EditPropertiesPage(
        {
            super.key
        }
        );

    // -- OPERATIONS

    @override
    EditPropertiesPageState createState(
        )
    {
        return EditPropertiesPageState();
    }
}
