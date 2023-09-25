// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dashboard_property_edition_page.dart';
import 'dashboard_property_list_store.dart';
import 'dashboard_property_list_store_state.dart';

// -- TYPES

class DashboardPropertyListPageState
    extends State<DashboardPropertyListPage>
{
    // -- ATTRIBUTES

    late final DashboardPropertyListStore
        dashboardPropertyListStore;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();

        dashboardPropertyListStore = DashboardPropertyListStore();
        dashboardPropertyListStore.fetch();
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
            body: BlocConsumer<DashboardPropertyListStore, DashboardPropertyListStoreState> (
                bloc: dashboardPropertyListStore,
                listener: ( context, state )
                {},
                builder: ( context, state )
                {
                    if ( state is DashboardPropertyListStoreInitialState )
                    {
                        return const Text( 'Initial' );
                    }
                    else if ( state is DashboardPropertyListStoreLoadingState )
                    {
                        return const Center( child: CircularProgressIndicator() );
                    }
                    else if ( state is DashboardPropertyListStoreErrorState )
                    {
                        return Center( child: Text( state.error ) );
                    }
                    else if ( state is DashboardPropertyListStoreLoadedState )
                    {
                        return ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.dashboardPropertyList.length,
                            itemBuilder: ( context, index )
                            {
                                final dashboardProperty = state.dashboardPropertyList[ index ];
                                return ListTile(
                                    title: Text( dashboardProperty.title ),
                                    onTap: () => Navigator.push( context, MaterialPageRoute(
                                        builder: ( context ) => DashboardPropertyEditionPage( propertyId: dashboardProperty.id )
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

class DashboardPropertyListPage
    extends StatefulWidget
{
    // -- CONSTRUCTORS

    const DashboardPropertyListPage(
        {
            super.key
        }
        );

    // -- OPERATIONS

    @override
    DashboardPropertyListPageState createState(
        )
    {
        return DashboardPropertyListPageState();
    }
}
