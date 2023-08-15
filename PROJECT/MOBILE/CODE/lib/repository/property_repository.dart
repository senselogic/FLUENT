// -- IMPORTS

import '../database/database.dart';
import '../entity/property_entity.dart';

// -- TYPES

class PropertyRepository
{
    // -- OPERATIONS

    Future<List<PropertyEntity>> getDatabasePropertyArray(
        ) async
    {
        final response = await database.from( 'PROPERTY' ).select().execute();

        return response.data.map( ( map ) => PropertyEntity.fromMap( map ) ).toList();
    }
}

// -- VARIABLES

final
    propertyRepository = PropertyRepository();
