// -- IMPORTS

import 'package:bloc/bloc.dart';
import '../../service/property_service.dart';
import '../state/view_properties_state.dart';

// -- TYPES

class ViewPropertiesStore
    extends Cubit<ViewPropertiesState>
{
    // -- CONSTRUCTORS

    ViewPropertiesStore(
        ) :
        super( ViewPropertiesInitialState() );

    // -- OPERATIONS

    Future<void> fetch(
        ) async
    {
        try
        {
            emit( ViewPropertiesLoadingState() );
            final propertyList = await propertyService.getPropertyList();
            emit( ViewPropertiesLoadedState( propertyList: propertyList ) );
        }
        catch ( exception )
        {
            emit( ViewPropertiesErrorState( error: exception.toString() ) );
        }
    }
}
