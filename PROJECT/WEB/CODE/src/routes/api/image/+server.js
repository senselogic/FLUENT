// -- IMPORTS

import { json } from '@sveltejs/kit';
import { imageService } from '$lib/image/image_service';

// -- FUNCTIONS

export async function GET(
    { params }
    )
{
    let imageArray = await imageService.getImageArray();

    return json( imageArray );
}
