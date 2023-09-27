// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../entity/property.dart';
import '../store/edit_property_store.dart';

// -- TYPES

class EditPropertyPageState extends State<EditPropertyPage>
{
    // -- ATTRIBUTES

    late final EditPropertyStore
        editPropertyStore;
    final
        formKey = GlobalKey<FormState>();
    late Property?
        property;
    late TextEditingController
        titleController,
        descriptionController;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();

        editPropertyStore = EditPropertyStore();
        editPropertyStore.fetch( widget.propertyId );

        titleController = TextEditingController( text: property?.title ?? "" );
        descriptionController = TextEditingController( text: property?.description ?? "" );
    }

    // ~~

    @override
    Widget build( BuildContext context )
    {
        return Scaffold(
            appBar: AppBar(
                title: Text( property == null ? 'Add Property' : 'Edit Property' ),
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
            body: Padding(
                padding: const EdgeInsets.all( 16.0 ),
                    child: Form(
                        key: formKey,
                        child: ListView(
                            children: [
                                TextFormField(
                                    controller: titleController,
                                    decoration: const InputDecoration( labelText: 'Title' ),
                                    validator: ( value )
                                    {
                                        if ( value == null || value.isEmpty )
                                        {
                                            return 'Please enter a title';
                                        }

                                        return null;
                                    },
                                ),
                                ElevatedButton(
                                    child: Text( property == null ? 'Add' : 'Update' ),
                                    onPressed:
                                        () async
                                        {
                                            if ( formKey.currentState!.validate() )
                                            {
                                                // :TODO:
                                            }
                                        }
                                    )
                                ]
                            )
                        )
                )
            );
    }
}

// ~~

class EditPropertyPage
    extends StatefulWidget
{
    // -- ATTRIBUTES

    final String
        propertyId;

    // -- CONSTRUCTORS

    const EditPropertyPage(
        {
            super.key,
            required this.propertyId
        }
        );

    @override
    EditPropertyPageState createState(
        )
    {
        return EditPropertyPageState();
    }
}
