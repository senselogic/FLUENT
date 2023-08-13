// -- IMPORTS

import { json } from '@sveltejs/kit';
import { getRandomTuid } from 'senselogic-gist';
import { getDatabasePropertyImageById, addDatabasePropertyImage, setDatabasePropertyImageById, removeDatabasePropertyImageById } from '$lib/database';

// -- FUNCTIONS

export async function GET(
    { params }
    )
{
    const propertyImage = await getDatabasePropertyImageById( params.propertyImageId );

    return json( propertyImage );
}

// ~~

export async function POST(
    { params }
    )
{
    const propertyImage
        = await addDatabasePropertyImage(
              {
                  id: getRandomTuid()
              }
              );

    return json( propertyImage );
}

// ~~

export async function PUT(
    { params }
    )
{
    const propertyImageId
        = await setDatabasePropertyImageById(
              {},
              params.propertyImageId
              );

    return json( propertyImage );
}

// ~~

export async function DELETE(
    { params }
    )
{
    await removeDatabasePropertyImageById( params.propertyImageId );

    return json( {} );
}
