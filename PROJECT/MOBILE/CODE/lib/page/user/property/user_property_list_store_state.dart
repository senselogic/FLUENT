// -- IMPORTS

import '../../../entity/property.dart';

// -- TYPES

abstract class UserPropertyListStoreState
{
}

// ~~

class UserPropertyListStoreInitialState
    extends UserPropertyListStoreState
{
}

// ~~

class UserPropertyListStoreLoadingState
    extends UserPropertyListStoreState
{
}

// ~~

class UserPropertyListStoreLoadedState
    extends UserPropertyListStoreState
{
    // -- ATTRIBUTES

    final List<Property>
        userPropertyList;

    // -- CONSTRUCTORS

    UserPropertyListStoreLoadedState(
        { required this.userPropertyList }
        );
}

// ~~

class UserPropertyListStoreErrorState
    extends UserPropertyListStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    UserPropertyListStoreErrorState(
        { required this.error }
        );
}
