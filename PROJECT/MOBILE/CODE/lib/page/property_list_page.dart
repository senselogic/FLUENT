// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../entity/property_entity.dart';
import '../store/property_store.dart';
import '../entity/property_entity.dart';

// -- TYPES

class PropertyListPage
    extends StatefulWidget
{
    // -- OPERATIONS

    @override PropertyListPageState createState(
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

    final
        propertyStore = PropertyStore();

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();
        propertyStore.getPropertyArray();
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
            body: ScopedBuilder<PropertyStore, List<PropertyEntity>>(
                store: propertyStore,
                onLoading: ( context ) => Center( child: CircularProgressIndicator() ),
                onError: ( context, error ) => Center( child: Text( error.toString() ) ),
                onState: ( context, propertyArray ) => Center(
                    child: Column(
                        children: [
                            ElevatedButton(
                                onPressed: () => context.go( '/property' ),
                                child: const Text( 'Property details' )
                                ),
                            ListView.builder(
                                itemCount: propertyArray.length,
                                itemBuilder:
                                    ( context, index )
                                    {
                                        final
                                            property = propertyArray[ index ];
print('property: $property');
                                        return ListTile(
                                            title: Text( property.title ),
                                            onTap: () => context.go( '/property' ),
                                            );
                                    }
                                )
                            ]
                        )
                    )
                )
            );
    }
}
