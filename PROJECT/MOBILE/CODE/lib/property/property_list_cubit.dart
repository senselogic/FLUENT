// -- IMPORTS

import 'package:bloc/bloc.dart';
import 'property.dart';
import 'property_list_cubit_state.dart';
import 'property_service.dart';

// -- TYPES

class PropertyListCubit
    extends Cubit<PropertyListCubitState>
{
    // -- CONSTRUCTORS

    PropertyListCubit(
        ) :
        super( PropertyListCubitInitialState() );

    // -- OPERATIONS

    Future<void> getPropertyList(
        ) async
    {
        try
        {
            emit( PropertyListCubitLoadingState() );
            final propertyList = await propertyService.getDatabasePropertyList();
print( propertyList );
            emit( PropertyListCubitLoadedState( propertyList: propertyList ) );
        }
        catch ( exception )
        {
            emit( PropertyListCubitErrorState( error: exception.toString() ) );
        }
    }
}

// -- VARIABLES

final
    propertyCubit = PropertyListCubit();
