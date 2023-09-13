// -- IMPORTS

import { imageService } from '$lib/image/image_service';
import { propertyService } from '$lib/property/property_service';

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
