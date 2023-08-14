// -- IMPORTS

import { printError } from 'senselogic-gist';
import { database, databaseName, databaseTablePrefix } from '$lib/database';

// -- FUNCTIONS

export async function getDatabasePropertyImageArray(
    )
{
    const { data, error }
        = await database
              .from( databaseTablePrefix + 'PROPERTY_IMAGE' )
              .select()
              .order( 'number' );

    if ( error !== null )
    {
        printError( error );
    }

    return data;
}

// ~~

export async function getDatabasePropertyImageArrayByPropertyId(
    propertyImageId
    )
{
    const { data, error }
        = await database
              .from( databaseTablePrefix + 'PROPERTY_IMAGE' )
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

export async function getDatabasePropertyImageById(
    propertyImageId
    )
{
    const { data, error }
        = await database
              .from( databaseTablePrefix + 'PROPERTY_IMAGE' )
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

// ~~

export async function addDatabasePropertyImage(
    propertyImage
    )
{
    const { data, error }
        = await database
              .from( databaseTablePrefix + 'PROPERTY_IMAGE' )
              .insert( propertyImage );

    if ( error !== null )
    {
        printError( error );
    }

    return data;
}

// ~~

export async function setDatabasePropertyImageById(
    propertyImage,
    propertyImageId
    )
{
    const { data, error }
        = await database
              .from( databaseTablePrefix + 'PROPERTY_IMAGE' )
              .update( propertyImage )
              .eq( 'id', propertyImageId );

    if ( error !== null )
    {
        printError( error );
    }

    return data;
}

// ~~

export async function removeDatabasePropertyImageById(
    propertyImageId
    )
{
    const { data, error }
        = await database
              .from( databaseTablePrefix + 'PROPERTY_IMAGE' )
              .delete()
              .eq( 'id', propertyImageId );

    if ( error !== null )
    {
        printError( error );
    }

    return data;
}
