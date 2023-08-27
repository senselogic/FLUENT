// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'property_service.dart';
import 'user_service.dart';

// -- TYPES

class UserPropertyEditionPage
    extends StatefulWidget
{
    // -- ATTRIBUTES

    later String
        propertyId;

    // -- CONSTRUCTORS

    UserPropertyEditionPage(
        {
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

// ~~

class UserPropertyEditionPageState extends State<UserPropertyEditionPage>
{
    // -- ATTRIBUTES

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

        titleController = TextEditingController( text: widget.property?.title ?? "" );
        descriptionController = TextEditingController( text: widget.property?.description ?? "" );
    }

    // ~~

    @override
    Widget build( BuildContext context )
    {
        return Scaffold(
            appBar: AppBar( title: Text( widget.property == null ? 'Add Property' : 'Edit Property' ) ),
            body: Padding(
                padding: const EdgeInsets.all( 16.0 ),
                    child: Form(
                        key: formKey,
                        child: ListView(
                            children: [
                                TextFormField(
                                    controller: titleController,
                                    decoration: InputDecoration( labelText: 'Title' ),
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
                                    child: Text( widget.property == null ? 'Add' : 'Update' ),
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
