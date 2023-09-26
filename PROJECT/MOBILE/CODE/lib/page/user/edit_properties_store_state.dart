// -- IMPORTS

import '../../../entity/property.dart';

// -- TYPES

abstract class EditPropertiesStoreState
{
}

// ~~

class EditPropertiesStoreInitialState
    extends EditPropertiesStoreState
{
}

// ~~

class EditPropertiesStoreLoadingState
    extends EditPropertiesStoreState
{
}

// ~~

class EditPropertiesStoreLoadedState
    extends EditPropertiesStoreState
{
    // -- ATTRIBUTES

    final List<Property>
        userPropertyList;

    // -- CONSTRUCTORS

    EditPropertiesStoreLoadedState(
        { required this.userPropertyList }
        );
}

// ~~

class EditPropertiesStoreErrorState
    extends EditPropertiesStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    EditPropertiesStoreErrorState(
        { required this.error }
        );
}
