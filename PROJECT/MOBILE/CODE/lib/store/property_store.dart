// -- IMPORTS

import 'package:flutter_triple/flutter_triple.dart';
import '../entity/property_entity.dart';
import '../repository/property_repository.dart';

// -- TYPES

class PropertyStore
    extends Store<List<PropertyEntity>>
{
    // -- CONSTRUCTORS

    PropertyStore(
        ) :
        super( [] );

    // -- OPERATIONS

    Future<void> getPropertyArray(
        ) async
    {
        setLoading(true);

        try
        {
            final propertyArray = await propertyRepository.getDatabasePropertyArray();
print('propertyArray: $propertyArray');
            update( propertyArray );
        }
        catch ( exception )
        {
            setError( Exception( 'Failed to get properties' ) );
        }

        setLoading(false);
    }
}

// -- VARIABLES

final
    propertyStore = PropertyStore();
