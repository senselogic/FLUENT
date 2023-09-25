// -- IMPORTS

import '../../../entity/property.dart';

// -- TYPES

abstract class DashboardPropertyListStoreState
{
}

// ~~

class DashboardPropertyListStoreInitialState
    extends DashboardPropertyListStoreState
{
}

// ~~

class DashboardPropertyListStoreLoadingState
    extends DashboardPropertyListStoreState
{
}

// ~~

class DashboardPropertyListStoreLoadedState
    extends DashboardPropertyListStoreState
{
    // -- ATTRIBUTES

    final List<Property>
        dashboardPropertyList;

    // -- CONSTRUCTORS

    DashboardPropertyListStoreLoadedState(
        { required this.dashboardPropertyList }
        );
}

// ~~

class DashboardPropertyListStoreErrorState
    extends DashboardPropertyListStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    DashboardPropertyListStoreErrorState(
        { required this.error }
        );
}
