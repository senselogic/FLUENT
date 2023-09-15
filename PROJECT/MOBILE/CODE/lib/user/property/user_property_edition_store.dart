// -- IMPORTS

import 'package:bloc/bloc.dart';
import '../../property/property_service.dart';
import 'user_property_edition_store_state.dart';

// -- TYPES

class UserPropertyEditionStore
    extends Cubit<UserPropertyEditionStoreState>
{
    // -- CONSTRUCTORS

    UserPropertyEditionStore(
        ) :
        super( UserPropertyEditionStoreInitialState() );

    // -- OPERATIONS

    Future<void> fetch(
        String propertyId
        ) async
    {
        try
        {
            emit( UserPropertyEditionStoreLoadingState() );
            final property = await propertyService.getPropertyById( propertyId );
            emit( UserPropertyEditionStoreLoadedState( property: property ) );
        }
        catch ( exception )
        {
            emit( UserPropertyEditionStoreErrorState( error: exception.toString() ) );
        }
    }
}
