// -- IMPORTS

import { json } from '@sveltejs/kit';
import { getRandomTuid } from 'senselogic-gist';
import { imageService } from '$lib/service/image_service';

// -- FUNCTIONS

export async function GET(
    { params }
    )
{
    const image = await imageService.getImageById( params.imageId );

    return json( image );
}

// ~~

export async function POST(
    { params }
    )
{
    const image
        = await addDatabaseImage(
              {
                  id: getRandomTuid()
              }
              );

    return json( image );
}

// ~~

export async function PUT(
    { params }
    )
{
    const imageId
        = await setDatabaseImageById(
              {},
              params.imageId
              );

    return json( image );
}

// ~~

export async function DELETE(
    { params }
    )
{
    await removeDatabaseImageById( params.imageId );

    return json( {} );
}
