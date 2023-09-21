// -- IMPORTS

import '../../../entity/property.dart';

// -- TYPES

abstract class UserPropertyEditionStoreState
{
}

// ~~

class UserPropertyEditionStoreInitialState
    extends UserPropertyEditionStoreState
{
}

// ~~

class UserPropertyEditionStoreLoadingState
    extends UserPropertyEditionStoreState
{
}

// ~~

class UserPropertyEditionStoreLoadedState
    extends UserPropertyEditionStoreState
{
    // -- ATTRIBUTES

    final Property
        property;

    // -- CONSTRUCTORS

    UserPropertyEditionStoreLoadedState(
        { 
            required this.property 
        }
        );
}

// ~~

class UserPropertyEditionStoreErrorState
    extends UserPropertyEditionStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    UserPropertyEditionStoreErrorState(
        { 
            required this.error 
        }
        );
}
