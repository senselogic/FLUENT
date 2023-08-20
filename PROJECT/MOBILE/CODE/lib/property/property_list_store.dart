// -- IMPORTS

import 'package:bloc/bloc.dart';
import 'property.dart';
import 'property_list_store_state.dart';
import 'property_service.dart';

// -- TYPES

class PropertyListStore
    extends Cubit<PropertyListStoreState>
{
    // -- CONSTRUCTORS

    PropertyListStore(
        ) :
        super( PropertyListStoreInitialState() );

    // -- OPERATIONS

    Future<void> getPropertyList(
        ) async
    {
        try
        {
            emit( PropertyListStoreLoadingState() );
            final propertyList = await propertyService.getPropertyList();
            emit( PropertyListStoreLoadedState( propertyList: propertyList ) );
        }
        catch ( exception )
        {
            emit( PropertyListStoreErrorState( error: exception.toString() ) );
        }
    }

    // ~~

    Future <void> getUserPropertyList(
        ) async
    {
        try
        {
            emit( PropertyListStoreLoadingState() );
            final propertyList = await propertyService.getUserPropertyList();
            emit( PropertyListStoreLoadedState( propertyList: propertyList ) );
        }
        catch ( exception )
        {
            emit( PropertyListStoreErrorState( error: exception.toString() ) );
        }
    }
}
