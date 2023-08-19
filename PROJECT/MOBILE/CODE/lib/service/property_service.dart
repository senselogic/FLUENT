// -- IMPORTS

import '../database/database.dart';
import '../entity/property_entity.dart';

// -- TYPES

class PropertyService
{
    // -- OPERATIONS

    Future<List<PropertyEntity>> getDatabasePropertyArray(
        ) async
    {
        final response = await database.from( 'PROPERTY' ).select().execute();
        final List<PropertyEntity> propertyArray = response.data.map( ( map ) => PropertyEntity.fromMap( map ) ).toList().cast<PropertyEntity>();

        return propertyArray;
    }
}

// -- VARIABLES

final
    propertyService = PropertyService();
