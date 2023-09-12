// -- IMPORTS

import { printError } from 'senselogic-gist';
import { database } from '$lib/database';

// -- TYPES

class PropertyImageService
{
    // -- INQUIRIES

    async getPropertyImageArray(
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .select()
                  .order( 'number' );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async getPropertyImageArrayByPropertyId(
        propertyImageId
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .select()
                  .eq( 'propertyId', propertyImageId )
                  .order( 'number' );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async getPropertyImageById(
        propertyImageId
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .select()
                  .eq( 'id', propertyImageId );

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

    // -- OPERATIONS

    async addPropertyImage(
        propertyImage
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .insert( propertyImage );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async setPropertyImageById(
        propertyImage,
        propertyImageId
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .update( propertyImage )
                  .eq( 'id', propertyImageId );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async removePropertyImageById(
        propertyImageId
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .delete()
                  .eq( 'id', propertyImageId );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }
}

// -- VARIABLES

export const propertyImageService
    = new PropertyImageService();
