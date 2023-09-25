// -- IMPORTS

import 'package:bloc/bloc.dart';
import '../../../service/property_service.dart';
import 'dashboard_property_edition_store_state.dart';

// -- TYPES

class DashboardPropertyEditionStore
    extends Cubit<DashboardPropertyEditionStoreState>
{
    // -- CONSTRUCTORS

    DashboardPropertyEditionStore(
        ) :
        super( DashboardPropertyEditionStoreInitialState() );

    // -- OPERATIONS

    Future<void> fetch(
        String propertyId
        ) async
    {
        try
        {
            emit( DashboardPropertyEditionStoreLoadingState() );
            final property = await propertyService.getPropertyById( propertyId );
            emit( DashboardPropertyEditionStoreLoadedState( property: property ) );
        }
        catch ( exception )
        {
            emit( DashboardPropertyEditionStoreErrorState( error: exception.toString() ) );
        }
    }
}
