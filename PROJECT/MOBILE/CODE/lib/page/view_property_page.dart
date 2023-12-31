// -- IMPORTS

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:senselogic_gist/senselogic_gist.dart';
import '../state/view_property_state.dart';
import '../storage/storage.dart';
import '../store/view_property_store.dart';

// -- TYPES

class ViewPropertyPageState extends State<ViewPropertyPage>
{
    // -- ATTRIBUTES

    late final ViewPropertyStore
        viewPropertyStore;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();

        viewPropertyStore = ViewPropertyStore();
        viewPropertyStore.fetch( widget.propertyId );
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
                        icon: const Icon( Icons.home ),
                        onPressed: ()
                        {
                            context.go( '/' );
                        },
                        ),
                    IconButton(
                        icon: const Icon( Icons.login ),
                        onPressed: ()
                        {
                            context.go( '/signin' );
                        },
                        ),
                    IconButton(
                        icon: const Icon( Icons.person_add ),
                        onPressed: ()
                        {
                            context.go( '/signup' );
                        }
                        )
                    ]
                ),
            body: BlocConsumer<ViewPropertyStore, ViewPropertyState>(
                bloc: viewPropertyStore,
                listener:
                    ( context, state )
                    {
                    },
                builder:
                    ( context, state )
                    {
                        if ( state is ViewPropertyInitialState )
                        {
                            return const Text( 'Initial' );
                        }
                        else if ( state is ViewPropertyLoadingState )
                        {
                            return const Center( child: CircularProgressIndicator() );
                        }
                        else if ( state is ViewPropertyErrorState )
                        {
                            return Center( child: Text( state.error ) );
                        }
                        else if ( state is ViewPropertyLoadedState )
                        {
                            return Column(
                                children: [
                                    Text( getLocalizedText( state.property.title ) ),
                                    Text( getLocalizedText( state.property.description ) ),
                                    Expanded(
                                        child: ListView.builder(
                                            itemCount: state.property.imagePathArray.length,
                                            itemBuilder: ( context, index )
                                            {
                                                return CachedNetworkImage(
                                                    imageUrl: getStorageImagePath( state.property.imagePathArray[ index ], 640 ),
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

// ~~

class ViewPropertyPage extends StatefulWidget
{
    // -- ATTRIBUTES

    final String
        propertyId;

    // -- CONSTRUCTORS

    const ViewPropertyPage(
        {
            super.key,
            required this.propertyId
        }
        );

    // -- OPERATIONS

    @override
    ViewPropertyPageState createState(
        )
    {
        return ViewPropertyPageState();
    }
}
