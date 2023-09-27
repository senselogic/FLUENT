// -- IMPORTS

import '../../entity/property.dart';

// -- TYPES

abstract class ViewPropertiesState
{
}

// ~~

class ViewPropertiesInitialState
    extends ViewPropertiesState
{
}

// ~~

class ViewPropertiesLoadingState
    extends ViewPropertiesState
{
}

// ~~

class ViewPropertiesLoadedState
    extends ViewPropertiesState
{
    // -- ATTRIBUTES

    final List<Property>
        propertyList;

    // -- CONSTRUCTORS

    ViewPropertiesLoadedState(
        { required this.propertyList }
        );
}

// ~~

class ViewPropertiesErrorState
    extends ViewPropertiesState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    ViewPropertiesErrorState(
        { required this.error }
        );
}
