// -- IMPORTS

import 'package:bloc/bloc.dart';
import 'view_properties_store_state.dart';
import '../../service/property_service.dart';

// -- TYPES

class ViewPropertiesStore
    extends Cubit<ViewPropertiesStoreState>
{
    // -- CONSTRUCTORS

    ViewPropertiesStore(
        ) :
        super( ViewPropertiesStoreInitialState() );

    // -- OPERATIONS

    Future<void> fetch(
        ) async
    {
        try
        {
            emit( ViewPropertiesStoreLoadingState() );
            final propertyList = await propertyService.getPropertyList();
            emit( ViewPropertiesStoreLoadedState( propertyList: propertyList ) );
        }
        catch ( exception )
        {
            emit( ViewPropertiesStoreErrorState( error: exception.toString() ) );
        }
    }
}
