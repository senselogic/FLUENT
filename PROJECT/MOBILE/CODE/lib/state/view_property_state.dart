// -- IMPORTS

import '../../entity/property.dart';

// -- TYPES

abstract class ViewPropertyState
{
}

// ~~

class ViewPropertyInitialState
    extends ViewPropertyState
{
}

// ~~

class ViewPropertyLoadingState
    extends ViewPropertyState
{
}

// ~~

class ViewPropertyLoadedState
    extends ViewPropertyState
{
    // -- ATTRIBUTES

    final Property
        property;

    // -- CONSTRUCTORS

    ViewPropertyLoadedState(
        {
            required this.property
        }
        );
}

// ~~

class ViewPropertyErrorState
    extends ViewPropertyState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    ViewPropertyErrorState(
        {
            required this.error
        }
        );
}
