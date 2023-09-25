// -- IMPORTS

import '../../../entity/property.dart';

// -- TYPES

abstract class DashboardPropertyEditionStoreState
{
}

// ~~

class DashboardPropertyEditionStoreInitialState
    extends DashboardPropertyEditionStoreState
{
}

// ~~

class DashboardPropertyEditionStoreLoadingState
    extends DashboardPropertyEditionStoreState
{
}

// ~~

class DashboardPropertyEditionStoreLoadedState
    extends DashboardPropertyEditionStoreState
{
    // -- ATTRIBUTES

    final Property
        property;

    // -- CONSTRUCTORS

    DashboardPropertyEditionStoreLoadedState(
        { 
            required this.property 
        }
        );
}

// ~~

class DashboardPropertyEditionStoreErrorState
    extends DashboardPropertyEditionStoreState
{
    // -- ATTRIBUTES

    final String
        error;

    // -- CONSTRUCTORS

    DashboardPropertyEditionStoreErrorState(
        { 
            required this.error 
        }
        );
}
