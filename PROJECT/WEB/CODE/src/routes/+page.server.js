// -- IMPORTS

import { getDatabasePropertyArray } from '$lib/database/property';

// -- FUNCTIONS

export async function load(
    )
{
    let propertyArray = await getDatabasePropertyArray();

    return {
        propertyArray
        };
}
