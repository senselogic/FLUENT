// -- IMPORTS

import 'package:flutter/material.dart';
import '../../property/property.dart';
import 'user_property_edition_store.dart';

// -- TYPES

class UserPropertyEditionPageState extends State<UserPropertyEditionPage>
{
    // -- ATTRIBUTES

    late final UserPropertyEditionStore
        userPropertyEditionStore;
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

        userPropertyEditionStore = UserPropertyEditionStore();
        userPropertyEditionStore.fetch( widget.propertyId );

        titleController = TextEditingController( text: property?.title ?? "" );
        descriptionController = TextEditingController( text: property?.description ?? "" );
    }

    // ~~

    @override
    Widget build( BuildContext context )
    {
        return Scaffold(
            appBar: AppBar( title: Text( property == null ? 'Add Property' : 'Edit Property' ) ),
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

class UserPropertyEditionPage
    extends StatefulWidget
{
    // -- ATTRIBUTES

    final String
        propertyId;

    // -- CONSTRUCTORS

    const UserPropertyEditionPage(
        {
            super.key, 
            required this.propertyId
        }
        );

    @override
    UserPropertyEditionPageState createState(
        )
    {
        return UserPropertyEditionPageState();
    }
}
