// -- IMPORTS

import '../../entity/property.dart';

// -- TYPES

abstract class ViewPropertiesStoreState
{
}

// ~~

class ViewPropertiesStoreInitialState
    extends ViewPropertiesStoreState
{
}

// ~~

class ViewPropertiesStoreLoadingState
    extends ViewPropertiesStoreState
{
}

// ~~

class ViewPropertiesStoreLoadedState
    extends ViewPropertiesStoreState
{
    // -- ATTRIBUTES

    final List<Property>
        propertyList;

    // -- CONSTRUCTORS

    ViewPropertiesStoreLoadedState(
        { required this.propertyList }
        );
}

// ~~

class ViewPropertiesStoreErrorState
    extends ViewPropertiesStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    ViewPropertiesStoreErrorState(
        { required this.error }
        );
}
