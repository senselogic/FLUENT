// -- IMPORTS

import '../../entity/property.dart';

// -- TYPES

abstract class EditPropertiesState
{
}

// ~~

class EditPropertiesInitialState
    extends EditPropertiesState
{
}

// ~~

class EditPropertiesLoadingState
    extends EditPropertiesState
{
}

// ~~

class EditPropertiesLoadedState
    extends EditPropertiesState
{
    // -- ATTRIBUTES

    final List<Property>
        userPropertyList;

    // -- CONSTRUCTORS

    EditPropertiesLoadedState(
        { required this.userPropertyList }
        );
}

// ~~

class EditPropertiesErrorState
    extends EditPropertiesState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    EditPropertiesErrorState(
        { required this.error }
        );
}
