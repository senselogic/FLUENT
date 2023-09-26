// -- IMPORTS

import 'package:bloc/bloc.dart';
import '../../../service/property_service.dart';
import 'edit_property_store_state.dart';

// -- TYPES

class EditPropertyStore
    extends Cubit<EditPropertyStoreState>
{
    // -- CONSTRUCTORS

    EditPropertyStore(
        ) :
        super( EditPropertyStoreInitialState() );

    // -- OPERATIONS

    Future<void> fetch(
        String propertyId
        ) async
    {
        try
        {
            emit( EditPropertyStoreLoadingState() );
            final property = await propertyService.getPropertyById( propertyId );
            emit( EditPropertyStoreLoadedState( property: property ) );
        }
        catch ( exception )
        {
            emit( EditPropertyStoreErrorState( error: exception.toString() ) );
        }
    }
}
