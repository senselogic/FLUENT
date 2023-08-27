// -- IMPORTS

import { printError } from 'senselogic-gist';
import { database, databaseName, databaseTablePrefix } from '$lib/database';

// -- FUNCTIONS

class PropertyService
{
    async getPropertyByIdMap(
        propertyArray
        )
    {
        let propertyByIdMap = {};

        for ( const property of propertyArray)
        {
            property.imageArray = [];
            propertyByIdMap[ property.id ] = property;
        }

        return propertyByIdMap;
    }

    // ~~

    async getInflatedPropertyArray(
        propertyArray,
        propertyImageArray
        )
    {
        const propertyByIdMap = getPropertyByIdMap( propertyArray );

        for ( const propertyImage of propertyImageArray )
        {
            propertyByIdMap[ propertyImage.propertyId ].imageArray.push( propertyImage );
        }

        return propertyArray;
    }

    // ~~

    async getPropertyArray(
        propertyImageArray
        )
    {
        const { data, error }
            = await database
                  .from( databaseTablePrefix + 'PROPERTY' )
                  .select()
                  .order( 'number' );

        let propertyArray = data ?? [];

        if ( propertyImageArray !== undefined )
        {
            propertyArray = getInflatedPropertyArray( propertyArray, propertyImageArray );
        }

        return propertyArray;
    }

    // ~~

    async getPropertyById(
        propertyId
        )
    {
        const { data, error }
            = await database
                  .from( databaseTablePrefix + 'PROPERTY' )
                  .select()
                  .eq( 'id', propertyId );

        if ( error !== null )
        {
            printError( error );
        }

        if ( data !== null )
        {
            return data[ 0 ];
        }
        else
        {
            return null;
        }
    }

    // ~~

    async addProperty(
        property
        )
    {
        const { data, error }
            = await database
                  .from( databaseTablePrefix + 'PROPERTY' )
                  .insert( property );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async setPropertyById(
        property,
        propertyId
        )
    {
        const { data, error }
            = await database
                .from( databaseTablePrefix + 'PROPERTY' )
                .update( property )
                .eq( 'id', propertyId );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async removePropertyById(
        propertyId
        )
    {
        const { data, error }
            = await database
                .from( databaseTablePrefix + 'PROPERTY' )
                .delete()
                .eq( 'id', propertyId );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }
}

// -- VARIABLES

export const propertyService
    = new PropertyService();
