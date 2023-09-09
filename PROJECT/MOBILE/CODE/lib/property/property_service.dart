// -- IMPORTS

import '../database/database.dart';
import 'property.dart';

// -- TYPES

class PropertyService
{
    // -- INQUIRIES

    Future<List<Property>> getPropertyList(
        ) async
    {
        final response = await database.from( 'PROPERTY' ).select().execute();

        return response.data.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();
    }

    // ~~

    Future<List<Property>> getUserPropertyList(
        ) async
    {
        final userId = supabase.auth.currentUser?.id;

        if ( userId == null )
        {
            return [];
        }

        final response = await database.from( 'PROPERTY' ).select().eq( 'userId', userId ).execute();

        return response.data.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();
    }
}

// -- VARIABLES

final
    propertyService = PropertyService();