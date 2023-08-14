// -- IMPORTS

import { printError } from 'senselogic-gist';
import { database, databaseName, databaseTablePrefix } from '$lib/database';

// -- FUNCTIONS

export function getPropertyByIdMap(
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

export function getInflatedPropertyArray(
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

export async function getDatabasePropertyArray(
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

export async function getDatabasePropertyById(
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

export async function addDatabaseProperty(
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

export async function setDatabasePropertyById(
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

export async function removeDatabasePropertyById(
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
