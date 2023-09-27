// -- IMPORTS

import 'package:bloc/bloc.dart';
import '../../service/property_service.dart';
import '../state/edit_properties_state.dart';

// -- TYPES

class EditPropertiesStore
    extends Cubit<EditPropertiesState>
{
    // -- CONSTRUCTORS

    EditPropertiesStore(
        ) :
        super( EditPropertiesInitialState() );

    // -- OPERATIONS

    Future <void> fetch(
        ) async
    {
        try
        {
            emit( EditPropertiesLoadingState() );
            final userPropertyList = await propertyService.getUserPropertyList();
            emit( EditPropertiesLoadedState( userPropertyList: userPropertyList ) );
        }
        catch ( exception )
        {
            emit( EditPropertiesErrorState( error: exception.toString() ) );
        }
    }
}
