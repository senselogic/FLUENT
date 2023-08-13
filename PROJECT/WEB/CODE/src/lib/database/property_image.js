// -- IMPORTS

import { printError } from 'senselogic-gist';
import { database, databaseName, databaseTablePrefix } from '$lib/database';

// -- FUNCTIONS

export async function getDatabasePropertyImageArray(
    )
{
    const { data, error }
        = await database
              .from( databaseTablePrefix + 'property_image' )
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
              .from( databaseTablePrefix + 'property_image' )
              .select()
              .eq( 'id', propertyImageId )
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
              .from( databaseTablePrefix + 'property_image' )
              .select()
              .eq( 'id', propertyImageId );

    if ( error !== null )
    {
        printError( error );
    }

    return data;
}

// ~~

export async function addDatabasePropertyImage(
    propertyImage
    )
{
    const { data, error }
        = await database
              .from( databaseTablePrefix + 'property_image' )
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
              .from( databaseTablePrefix + 'property_image' )
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
              .from( databaseTablePrefix + 'property_image' )
              .delete()
              .eq( 'id', propertyImageId );

    if ( error !== null )
    {
        printError( error );
    }

    return data;
}
