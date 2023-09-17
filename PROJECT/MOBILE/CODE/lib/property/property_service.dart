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
        final response = await database.from( 'PROPERTY' ).select();
        
        return response.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();
    }

    // ~~

    Future<Property> getPropertyById(
        String propertyId
        ) async
    {
        final response = await database.from( 'PROPERTY' ).select().eq( 'id', propertyId );        
        final propertyList = response.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();

        if ( propertyList.isNotEmpty )
        {
            return propertyList[ 0 ];
        }
        else
        {
            throw Exception( 'getPropertyById : $propertyId'  );
        }
    }

    // ~~

    Future<List<Property>> getUserPropertyList(
        ) async
    {
        final userId = database.auth.currentUser?.id;

        if ( userId != null )
        {
            final response = await database.from( 'PROPERTY' ).select().eq( 'userId', userId );

            return response.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();
        }
        else
        {
            throw Exception( 'getUserPropertyList : not connected' );
        }
    }
}

// -- VARIABLES

final
    propertyService = PropertyService();
