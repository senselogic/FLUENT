// -- IMPORTS

import { propertyService } from '$lib/property/property_service';

// -- FUNCTIONS

export async function load(
    { params }
    )
{
    let property = await propertyService.getPropertyById( params.propertyId );

    return {
        property
        };
}
