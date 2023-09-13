// -- IMPORTS

import { propertyService } from '$lib/service/property_service';
import { imageService } from '$lib/service/image_service';

// -- FUNCTIONS

export async function load(
    { params }
    )
{
    let property = await propertyService.getPropertyById( params.propertyId );
    let imageArray = await imageService.getImageArrayByPropertyId( params.propertyId );

    return {
        property,
        imageArray
        };
}
