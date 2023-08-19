// -- IMPORTS

import 'property.dart';

// -- TYPES

abstract class PropertyListCubitState
{
}

// ~~

class PropertyListCubitInitialState
    extends PropertyListCubitState
{
}

// ~~

class PropertyListCubitLoadingState
    extends PropertyListCubitState
{
}

// ~~

class PropertyListCubitLoadedState
    extends PropertyListCubitState
{
    // -- ATTRIBUTES

    final List<Property>
        propertyList;

    // -- CONSTRUCTORS

    PropertyListCubitLoadedState(
        { required this.propertyList }
        );
}

// ~~

class PropertyListCubitErrorState
    extends PropertyListCubitState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    PropertyListCubitErrorState(
        { required this.error }
        );
}
