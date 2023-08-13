// -- IMPORTS

import { json } from '@sveltejs/kit';
import { getPropertyArray } from '$lib/database/property';

// -- FUNCTIONS

export async function GET(
    { params }
    )
{
    let propertyArray = await getDatabasePropertyArray();

    return json( propertyArray );
}
