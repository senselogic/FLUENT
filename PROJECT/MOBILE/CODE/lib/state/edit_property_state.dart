// -- IMPORTS

import '../../entity/property.dart';

// -- TYPES

abstract class EditPropertyState
{
}

// ~~

class EditPropertyInitialState
    extends EditPropertyState
{
}

// ~~

class EditPropertyLoadingState
    extends EditPropertyState
{
}

// ~~

class EditPropertyLoadedState
    extends EditPropertyState
{
    // -- ATTRIBUTES

    final Property
        property;

    // -- CONSTRUCTORS

    EditPropertyLoadedState(
        {
            required this.property
        }
        );
}

// ~~

class EditPropertyErrorState
    extends EditPropertyState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    EditPropertyErrorState(
        {
            required this.error
        }
        );
}
