// -- IMPORTS

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gist/gist.dart';
import 'package:go_router/go_router.dart';
import 'property_details_store.dart';
import 'property_details_store_state.dart';

// -- TYPES

class PropertyDetailsPage extends StatefulWidget
{
    // -- ATTRIBUTES

    final String
        propertyId;

    // -- CONSTRUCTORS

    const PropertyDetailsPage(
        {
            super.key, 
            required this.propertyId
        }
        );

    // -- OPERATIONS

    @override
    PropertyDetailsPageState createState(
        )
    {
        return PropertyDetailsPageState();
    }
}

// ~~

class PropertyDetailsPageState extends State<PropertyDetailsPage>
{
    // -- ATTRIBUTES

    late final PropertyDetailsStore
        propertyDetailsStore;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();

        propertyDetailsStore = PropertyDetailsStore();
        propertyDetailsStore.fetch( widget.propertyId );
    }

    // ~~

    @override
    Widget build(
        BuildContext context
        )
    {
        return Scaffold(
            appBar: AppBar(
                title: const Text( 'Property Details' ),
                actions: [
                    IconButton(
                        icon: const Icon( Icons.login ),
                        onPressed: ()
                        {
                            context.go( '/user/signin' );
                        },
                        ),
                    IconButton(
                        icon: const Icon( Icons.person_add ),
                        onPressed: ()
                        {
                            context.go( '/user/signup' );
                        }
                        )
                    ]
                ),
            body: BlocConsumer<PropertyDetailsStore, PropertyDetailsStoreState>(
                bloc: propertyDetailsStore,
                listener:
                    ( context, state )
                    {
                    },
                builder:
                    ( context, state )
                    {
                        if ( state is PropertyDetailsStoreInitialState )
                        {
                            return const Text( 'Initial' );
                        }
                        else if ( state is PropertyDetailsStoreLoadingState )
                        {
                            return const Center( child: CircularProgressIndicator() );
                        }
                        if ( state is PropertyDetailsStoreErrorState )
                        {
                            return Center( child: Text( state.error ) );
                        }
                        else if ( state is PropertyDetailsStoreLoadedState )
                        {
                            return Column(
                                children: [
                                    Text( GetLocalizedText( state.property.title ) ),
                                    Text( state.property.description ),
                                    Expanded(
                                        child: ListView.builder(
                                            itemCount: state.property.imagePathArray.length,
                                            itemBuilder: ( context, index )
                                            {
                                                return CachedNetworkImage(
                                                    imageUrl: state.property.imagePathArray[ index ],
                                                    placeholder: ( context, url ) => const CircularProgressIndicator(),
                                                    errorWidget: ( context, url, error ) => const Icon( Icons.error )
                                                    );
                                            }
                                            )
                                        ),
                                    Center(
                                        child: ElevatedButton(
                                            onPressed: () => context.go( '/' ),
                                            child: const Text( 'Back' )
                                            )
                                        )
                                    ]
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
