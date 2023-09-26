// -- IMPORTS

import 'package:bloc/bloc.dart';
import 'edit_properties_store_state.dart';
import '../../../service/property_service.dart';

// -- TYPES

class EditPropertiesStore
    extends Cubit<EditPropertiesStoreState>
{
    // -- CONSTRUCTORS

    EditPropertiesStore(
        ) :
        super( EditPropertiesStoreInitialState() );

    // -- OPERATIONS

    Future <void> fetch(
        ) async
    {
        try
        {
            emit( EditPropertiesStoreLoadingState() );
            final userPropertyList = await propertyService.getUserPropertyList();
            emit( EditPropertiesStoreLoadedState( userPropertyList: userPropertyList ) );
        }
        catch ( exception )
        {
            emit( EditPropertiesStoreErrorState( error: exception.toString() ) );
        }
    }
}
