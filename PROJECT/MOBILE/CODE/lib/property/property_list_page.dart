// -- IMPORTS

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gist/gist.dart';
import 'package:go_router/go_router.dart';
import 'property_list_store.dart';
import 'property_list_store_state.dart';

// -- TYPES

class PropertyListPage
    extends StatefulWidget
{
    // -- CONSTRUCTORS

    const PropertyListPage(
        {
            super.key
        }
        );

    // -- OPERATIONS

    @override
    PropertyListPageState createState(
        )
    {
        return PropertyListPageState();
    }
}

// ~~

class PropertyListPageState
    extends State<PropertyListPage>
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
        propertyListStore.fetch();
    }

    // ~~

    @override
    Widget build(
        BuildContext context
        )
    {
        return Scaffold(
            appBar: AppBar(
                title: const Text( 'Property list' )
                ),
            body: BlocConsumer<PropertyListStore, PropertyListStoreState>(
                bloc: propertyListStore,
                listener:
                    ( context, state )
                    {
                    },
                builder:
                    ( context, state )
                    {
                        if ( state is PropertyListStoreInitialState )
                        {
                            return const Text( 'Initial' );
                        }
                        else if ( state is PropertyListStoreLoadingState )
                        {
                            return const Center( child: CircularProgressIndicator() );
                        }
                        if ( state is PropertyListStoreErrorState )
                        {
                            return Center( child: Text( state.error ) );
                        }
                        else if ( state is PropertyListStoreLoadedState )
                        {
                            return
                                ListView.builder(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.propertyList.length,
                                    itemBuilder:
                                        ( context, index )
                                        {
                                            final
                                                property = state.propertyList[ index ];

                                            return ListTile(
                                                title: Text( getLocalizedText( property.title ) ),
                                                leading: CachedNetworkImage(
                                                    imageUrl: property.imagePath,
                                                    placeholder: ( context, url ) => const CircularProgressIndicator(),
                                                    errorWidget: ( context, url, error ) => const Icon( Icons.error )
                                                    ),
                                                onTap: () => context.go( '/property' ),
                                                );
                                        }
                                    );
                        }
                        else
                        {
                            return const Icon( Icons.error );
                        }
                    }
                )
            );
    }
}
