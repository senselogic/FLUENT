// -- IMPORTS

import 'package:bloc/bloc.dart';
import 'property_details_store_state.dart';
import '../../service/property_service.dart';

// -- TYPES

class PropertyDetailsStore
    extends Cubit<PropertyDetailsStoreState>
{
    // -- CONSTRUCTORS

    PropertyDetailsStore(
        ) :
        super( PropertyDetailsStoreInitialState() );

    // -- OPERATIONS

    Future<void> fetch(
        String propertyId
        ) async
    {
        try
        {
            emit( PropertyDetailsStoreLoadingState() );
            final property = await propertyService.getPropertyById( propertyId );
            emit( PropertyDetailsStoreLoadedState( property: property ) );
        }
        catch ( exception )
        {
            emit( PropertyDetailsStoreErrorState( error: exception.toString() ) );
        }
    }
}
