// -- IMPORTS

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:senselogic_gist/senselogic_gist.dart';
import '../state/view_properties_state.dart';
import '../storage/storage.dart';
import '../store/view_properties_store.dart';

// -- TYPES

class ViewPropertiesPageState
    extends State<ViewPropertiesPage>
{
    // -- ATTRIBUTES

    late final ViewPropertiesStore
        propertyListStore;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();

        propertyListStore = ViewPropertiesStore();
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
            body: BlocConsumer<ViewPropertiesStore, ViewPropertiesState>(
                bloc: propertyListStore,
                listener:
                    ( context, state )
                    {
                    },
                builder:
                    ( context, state )
                    {
                        if ( state is ViewPropertiesInitialState )
                        {
                            return const Text( 'Initial' );
                        }
                        else if ( state is ViewPropertiesLoadingState )
                        {
                            return const Center( child: CircularProgressIndicator() );
                        }
                        if ( state is ViewPropertiesErrorState )
                        {
                            return Center( child: Text( state.error ) );
                        }
                        else if ( state is ViewPropertiesLoadedState )
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
                                                    imageUrl: getStorageImagePath( property.imagePath, 640 ),
                                                    placeholder: ( context, url ) => const CircularProgressIndicator(),
                                                    errorWidget: ( context, url, error ) => const Icon( Icons.error )
                                                    ),
                                                onTap: () => context.go( '/property/${ property.id }' ),
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

// ~~

class ViewPropertiesPage
    extends StatefulWidget
{
    // -- CONSTRUCTORS

    const ViewPropertiesPage(
        {
            super.key
        }
        );

    // -- OPERATIONS

    @override
    ViewPropertiesPageState createState(
        )
    {
        return ViewPropertiesPageState();
    }
}
