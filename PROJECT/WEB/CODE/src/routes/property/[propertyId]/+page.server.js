// -- IMPORTS

import { getDatabasePropertyById } from '$lib/database/property';
import { getDatabasePropertyImageArrayByPropertyId } from '$lib/database/property_image';

// -- FUNCTIONS

export async function load(
    { params }
    )
{
    let property = await getDatabasePropertyById( params.propertyId );
    let propertyImageArray = await getDatabasePropertyImageArrayByPropertyId( params.propertyId );

    return {
        property,
        propertyImageArray
        };
}
