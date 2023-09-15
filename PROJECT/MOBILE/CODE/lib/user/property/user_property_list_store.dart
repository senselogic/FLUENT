// -- IMPORTS

import 'package:bloc/bloc.dart';
import 'user_property_list_store_state.dart';
import '../../property/property_service.dart';

// -- TYPES

class UserPropertyListStore
    extends Cubit<UserPropertyListStoreState>
{
    // -- CONSTRUCTORS

    UserPropertyListStore(
        ) :
        super( UserPropertyListStoreInitialState() );

    // -- OPERATIONS

    Future <void> fetch(
        ) async
    {
        try
        {
            emit( UserPropertyListStoreLoadingState() );
            final userPropertyList = await propertyService.getUserPropertyList();
            emit( UserPropertyListStoreLoadedState( userPropertyList: userPropertyList ) );
        }
        catch ( exception )
        {
            emit( UserPropertyListStoreErrorState( error: exception.toString() ) );
        }
    }
}
