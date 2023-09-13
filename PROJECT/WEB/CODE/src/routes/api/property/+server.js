// -- IMPORTS

import { json } from '@sveltejs/kit';
import { propertyService } from '$lib/property/property_service';

// -- FUNCTIONS

export async function GET(
    { params }
    )
{
    let propertyArray = await propertyService.getPropertyArray();

    return json( propertyArray );
}
