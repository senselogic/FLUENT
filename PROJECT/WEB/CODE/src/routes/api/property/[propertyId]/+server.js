// -- IMPORTS

import { json } from '@sveltejs/kit';
import { propertyService } from '$lib/service/property_service';

// -- FUNCTIONS

export async function GET(
    {
        params
    }
    )
{
    let property = await propertyService.getPropertyById( params.propertyId );

    return json( property );
}

// ~~

export async function PUT(
    {
        params
    }
    )
{
    const property = await propertyService.setDatabasePropertyById(
        {
        },
        params.propertyId
        );

    return json( property );
}
