// -- IMPORTS

import 'package:bloc/bloc.dart';
import '../../service/property_service.dart';
import '../state/edit_property_state.dart';

// -- TYPES

class EditPropertyStore
    extends Cubit<EditPropertyState>
{
    // -- CONSTRUCTORS

    EditPropertyStore(
        ) :
        super( EditPropertyInitialState() );

    // -- OPERATIONS

    Future<void> fetch(
        String propertyId
        ) async
    {
        try
        {
            emit( EditPropertyLoadingState() );
            final property = await propertyService.getPropertyById( propertyId );
            emit( EditPropertyLoadedState( property: property ) );
        }
        catch ( exception )
        {
            emit( EditPropertyErrorState( error: exception.toString() ) );
        }
    }
}
