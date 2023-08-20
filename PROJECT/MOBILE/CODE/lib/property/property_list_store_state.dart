// -- IMPORTS

import 'property.dart';

// -- TYPES

abstract class PropertyListStoreState
{
}

// ~~

class PropertyListStoreInitialState
    extends PropertyListStoreState
{
}

// ~~

class PropertyListStoreLoadingState
    extends PropertyListStoreState
{
}

// ~~

class PropertyListStoreLoadedState
    extends PropertyListStoreState
{
    // -- ATTRIBUTES

    final List<Property>
        propertyList;

    // -- CONSTRUCTORS

    PropertyListStoreLoadedState(
        { required this.propertyList }
        );
}

// ~~

class PropertyListStoreErrorState
    extends PropertyListStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    PropertyListStoreErrorState(
        { required this.error }
        );
}
