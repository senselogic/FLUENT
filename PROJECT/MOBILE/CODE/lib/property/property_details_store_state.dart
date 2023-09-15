// -- IMPORTS

import 'property.dart';

// -- TYPES

abstract class PropertyDetailsStoreState
{
}

// ~~

class PropertyDetailsStoreInitialState
    extends PropertyDetailsStoreState
{
}

// ~~

class PropertyDetailsStoreLoadingState
    extends PropertyDetailsStoreState
{
}

// ~~

class PropertyDetailsStoreLoadedState
    extends PropertyDetailsStoreState
{
    // -- ATTRIBUTES

    final Property
        property;

    // -- CONSTRUCTORS

    PropertyDetailsStoreLoadedState(
        { 
            required this.property 
        }
        );
}

// ~~

class PropertyDetailsStoreErrorState
    extends PropertyDetailsStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    PropertyDetailsStoreErrorState(
        { 
            required this.error 
        }
        );
}
