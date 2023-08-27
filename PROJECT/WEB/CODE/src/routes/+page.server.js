// -- IMPORTS

import { propertyService } from '$lib/service/property_service';

// -- FUNCTIONS

export async function load(
    )
{
    let propertyArray = await propertyService.getPropertyArray();

    return {
        propertyArray
        };
}
