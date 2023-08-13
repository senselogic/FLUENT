// -- IMPORTS

import { json } from '@sveltejs/kit';
import { getDatabasePropertyImageArray } from '$lib/database/property_image';

// -- FUNCTIONS

export async function GET(
    { params }
    )
{
    let propertyImageArray = await getDatabasePropertyImageArray();

    return json( propertyImageArray );
}
