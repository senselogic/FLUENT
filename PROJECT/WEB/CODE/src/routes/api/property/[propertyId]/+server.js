// -- IMPORTS

import { json } from '@sveltejs/kit';
import { getRandomTuid } from 'senselogic-gist';
import { getDatabasePropertyById, setDatabasePropertyById } from '$lib/database/property';

// -- FUNCTIONS

export async function GET(
    { params }
    )
{
    let property = await getDatabasePropertyById( params.propertyId );

    return json( property );
}

// ~~

export async function PUT(
    { params }
    )
{
    const property = await setDatabasePropertyById(
        {
        },
        params.propertyId
        );

    return json( property );
}
