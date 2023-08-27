// -- IMPORTS

import { json } from '@sveltejs/kit';
import { propertyImageService } from '$lib/service/property_image_service';

// -- FUNCTIONS

export async function GET(
    { params }
    )
{
    let propertyImageArray = await propertyImageService.getPropertyImageArray();

    return json( propertyImageArray );
}
