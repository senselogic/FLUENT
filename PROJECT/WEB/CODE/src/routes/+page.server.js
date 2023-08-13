// -- IMPORTS

import { getDatabasePropertyArray } from '$lib/database/property';
import { getDatabasePropertyImageArray } from '$lib/database/property_image';

// -- FUNCTIONS

export async function load(
    )
{
    let propertyImageArray = await getDatabasePropertyImageArray();
    let propertyArray = await getDatabasePropertyArray( propertyImageArray );

    return {
        propertyArray,
        propertyImageArray
        };
}
