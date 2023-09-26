// -- IMPORTS

import '../../../entity/property.dart';

// -- TYPES

abstract class EditPropertyStoreState
{
}

// ~~

class EditPropertyStoreInitialState
    extends EditPropertyStoreState
{
}

// ~~

class EditPropertyStoreLoadingState
    extends EditPropertyStoreState
{
}

// ~~

class EditPropertyStoreLoadedState
    extends EditPropertyStoreState
{
    // -- ATTRIBUTES

    final Property
        property;

    // -- CONSTRUCTORS

    EditPropertyStoreLoadedState(
        { 
            required this.property 
        }
        );
}

// ~~

class EditPropertyStoreErrorState
    extends EditPropertyStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    EditPropertyStoreErrorState(
        { 
            required this.error 
        }
        );
}
