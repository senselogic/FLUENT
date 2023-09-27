// -- IMPORTS

import 'package:bloc/bloc.dart';
import '../../service/property_service.dart';
import '../state/view_property_state.dart';

// -- TYPES

class ViewPropertyStore
    extends Cubit<ViewPropertyState>
{
    // -- CONSTRUCTORS

    ViewPropertyStore(
        ) :
        super( ViewPropertyInitialState() );

    // -- OPERATIONS

    Future<void> fetch(
        String propertyId
        ) async
    {
        try
        {
            emit( ViewPropertyLoadingState() );
            final property = await propertyService.getPropertyById( propertyId );
            emit( ViewPropertyLoadedState( property: property ) );
        }
        catch ( exception )
        {
            emit( ViewPropertyErrorState( error: exception.toString() ) );
        }
    }
}
