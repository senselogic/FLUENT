// -- IMPORTS

import { printError } from 'senselogic-gist';
import { database } from '$lib/database';

// -- TYPES

class ImageService
{
    // -- INQUIRIES

    async getImageArray(
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .select();

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async getImageArrayByPropertyId(
        imageId
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .select()
                  .eq( 'propertyId', imageId );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async getImageById(
        imageId
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .select()
                  .eq( 'id', imageId );

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

    async addImage(
        image
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .insert( image );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async setImageById(
        image,
        imageId
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .update( image )
                  .eq( 'id', imageId );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }

    // ~~

    async removeImageById(
        imageId
        )
    {
        const { data, error }
            = await database
                  .from( 'PROPERTY_IMAGE' )
                  .delete()
                  .eq( 'id', imageId );

        if ( error !== null )
        {
            printError( error );
        }

        return data;
    }
}

// -- VARIABLES

export const imageService
    = new ImageService();
