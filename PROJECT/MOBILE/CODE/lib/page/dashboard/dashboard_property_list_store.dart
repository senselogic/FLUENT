// -- IMPORTS

import 'package:bloc/bloc.dart';
import 'dashboard_property_list_store_state.dart';
import '../../../service/property_service.dart';

// -- TYPES

class DashboardPropertyListStore
    extends Cubit<DashboardPropertyListStoreState>
{
    // -- CONSTRUCTORS

    DashboardPropertyListStore(
        ) :
        super( DashboardPropertyListStoreInitialState() );

    // -- OPERATIONS

    Future <void> fetch(
        ) async
    {
        try
        {
            emit( DashboardPropertyListStoreLoadingState() );
            final dashboardPropertyList = await propertyService.getUserPropertyList();
            emit( DashboardPropertyListStoreLoadedState( dashboardPropertyList: dashboardPropertyList ) );
        }
        catch ( exception )
        {
            emit( DashboardPropertyListStoreErrorState( error: exception.toString() ) );
        }
    }
}
