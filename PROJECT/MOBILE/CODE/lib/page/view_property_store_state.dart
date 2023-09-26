// -- IMPORTS

import '../../entity/property.dart';

// -- TYPES

abstract class ViewPropertyStoreState
{
}

// ~~

class ViewPropertyStoreInitialState
    extends ViewPropertyStoreState
{
}

// ~~

class ViewPropertyStoreLoadingState
    extends ViewPropertyStoreState
{
}

// ~~

class ViewPropertyStoreLoadedState
    extends ViewPropertyStoreState
{
    // -- ATTRIBUTES

    final Property
        property;

    // -- CONSTRUCTORS

    ViewPropertyStoreLoadedState(
        { 
            required this.property 
        }
        );
}

// ~~

class ViewPropertyStoreErrorState
    extends ViewPropertyStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    ViewPropertyStoreErrorState(
        { 
            required this.error 
        }
        );
}
