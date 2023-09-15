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
        
        if ( response.error == null ) 
        {
            return response.data.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();
        }
        else
        {
            throw Exception( 'getPropertyList: ${ response.error!.message }' );
        }
    }

    // ~~

    Future<Property> getPropertyById(
        String propertyId
        ) async
    {
        final response = await database.from( 'PROPERTY' ).select().eq( 'id', propertyId );
        
        if ( response.error == null ) 
        {
            final propertyList = response.data.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();

            if ( propertyList.isNotEmpty )
            {
                return propertyList[ 0 ];
            }
            else
            {
                throw Exception( 'getPropertyById: not found' );
            }
        }
        else
        {
            throw Exception( 'getPropertyById: ${ response.error!.message }' );
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

            if ( response.error == null ) 
            {
                return response.data.map( ( map ) => Property.fromMap( map ) ).toList().cast<Property>();
            }
            else
            {
                throw Exception( 'getUserPropertyList: ${ response.error!.message }' );
            }
        }
        else
        {
            throw Exception( 'getUserPropertyList: no current user' );
        }
    }
}

// -- VARIABLES

final
    propertyService = PropertyService();
