// -- IMPORTS

import 'package:bloc/bloc.dart';
import 'view_property_store_state.dart';
import '../../service/property_service.dart';

// -- TYPES

class ViewPropertyStore
    extends Cubit<ViewPropertyStoreState>
{
    // -- CONSTRUCTORS

    ViewPropertyStore(
        ) :
        super( ViewPropertyStoreInitialState() );

    // -- OPERATIONS

    Future<void> fetch(
        String propertyId
        ) async
    {
        try
        {
            emit( ViewPropertyStoreLoadingState() );
            final property = await propertyService.getPropertyById( propertyId );
            emit( ViewPropertyStoreLoadedState( property: property ) );
        }
        catch ( exception )
        {
            emit( ViewPropertyStoreErrorState( error: exception.toString() ) );
        }
    }
}
