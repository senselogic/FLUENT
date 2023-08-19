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
        late final List<Property>
            propertyList;

        try
        {
            final response = await database.from( 'PROPERTY' ).select().execute();

            propertyList = response.data.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();
        }
        catch ( exception )
        {
            print( exception.toString() );
        }
print( propertyList.toString() );
        return propertyList;
    }
}

// -- VARIABLES

final
    propertyService = PropertyService();
