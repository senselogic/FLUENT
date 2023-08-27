// -- IMPORTS

import { json } from '@sveltejs/kit';
import { getRandomTuid } from 'senselogic-gist';
import { propertyImageService } from '$lib/service/property_image_service';

// -- FUNCTIONS

export async function GET(
    { params }
    )
{
    const propertyImage = await propertyImageService.getPropertyImageById( params.propertyImageId );

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
