// -- IMPORTS

import { json } from '@sveltejs/kit';
import { propertyService } from '$lib/service/property_service';

// -- FUNCTIONS

export async function GET(
    )
{
    let propertyArray = await propertyService.getPropertyArray();

    return json( propertyArray );
}
