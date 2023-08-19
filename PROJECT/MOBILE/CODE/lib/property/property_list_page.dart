// -- IMPORTS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'property.dart';
import 'property_list_cubit.dart';
import 'property_list_cubit_state.dart';

// -- TYPES

class PropertyListPage
    extends StatefulWidget
{
    // -- CONSTRUCTORS

    PropertyListPage(
        {
            Key? key
        }
        ) :
        super( key: key );

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

    late final PropertyListCubit
        propertyListCubit;

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();

        propertyListCubit = PropertyListCubit();
        propertyListCubit.getPropertyList();
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
            body: BlocConsumer<PropertyListCubit, PropertyListCubitState>(
                bloc: propertyCubit,
                listener:
                    ( context, state )
                    {
                    },
                builder:
                    ( context, state )
                    {
print( state );
                        if ( state is PropertyListCubitInitialState )
                        {
                            return Text( 'Initial' );
                        }
                        else if ( state is PropertyListCubitLoadingState )
                        {
                            return Center( child: CircularProgressIndicator() );
                        }
                        if ( state is PropertyListCubitErrorState )
                        {
                            return Center( child: Text( state.error ) );
                        }
                        else if ( state is PropertyListCubitLoadedState )
                        {
                            return
                                ListView.builder(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.propertyList.length,
                                    itemBuilder:
                                        ( context, index )
                                        {
                                            final
                                                property = state.propertyList[ index ];

                                            return ListTile(
                                                title: Text( property.title ),
                                                onTap: () => context.go( '/property' ),
                                                );
                                        }
                                    );
                        }
                        else
                        {
                            return Text( 'Invalid state' );
                        }
                    }
                )
            );
    }
}
