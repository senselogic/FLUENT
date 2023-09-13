// -- IMPORTS

import { propertyService } from '$lib/property/property_service';

// -- FUNCTIONS

export async function load(
    )
{
    let propertyArray = await propertyService.getPropertyArray();

    return {
        propertyArray
        };
}
