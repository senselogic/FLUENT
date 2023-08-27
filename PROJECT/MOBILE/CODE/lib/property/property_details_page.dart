// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../property/property.dart';

// -- TYPES

class PropertyDetailsPage extends StatefulWidget
{
    // -- ATTRIBUTES

    late String
        propertyId;

    // -- CONSTRUCTORS

    PropertyDetailsPage(
        {
            required this.propertyId,
            Key ? key
        }
        ) :
        super( key: key );

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

    late Property
        property;
    late List<String>
        propertyImageList;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();
        // :TODO: fetch property
        // :TODO: fetch propertyImageList
    }

    // ~~

    @override
    Widget build(
        BuildContext context
        )
    {
        return Scaffold(
            appBar: AppBar(
                title: Text( 'Property Details' ),
                actions: [
                    IconButton(
                        icon: Icon( Icons.login ),
                        onPressed: ()
                        {
                            context.go( '/user/signin' );
                        },
                        ),
                    IconButton(
                        icon: Icon( Icons.person_add ),
                        onPressed: ()
                        {
                            context.go( '/user/signup' );
                        }
                        )
                    ]
                ),
            body: Column(
                children: [
                    Text( property.title ),
                    Text( property.description ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: propertyImageList.length,
                            itemBuilder: ( context, index )
                            {
                                return CachedNetworkImage(
                                    imageUrl: propertyImagePathList[ index ],
                                    placeholder: ( context, url ) => CircularProgressIndicator(),
                                    errorWidget: ( context, url, error ) => Icon( Icons.error )
                                    );
                            }
                        ),
                    Center(
                        child: ElevatedButton(
                            onPressed: () => context.go( '/' ),
                            child: const Text( 'Back' )
                            )
                        )
                    )
                ]
            )
        );
    }
}
