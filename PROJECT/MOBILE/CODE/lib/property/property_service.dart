// -- IMPORTS

import '../database/database.dart';
import 'property.dart';

// -- TYPES

class PropertyService
{
    // -- INQUIRIES

    Future<List<Property>> getDatabasePropertyList(
        ) async
    {
        final response = await database.from( 'PROPERTY' ).select().execute();

        return response.data.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();
    }
}

// -- VARIABLES

final
    propertyService = PropertyService();
