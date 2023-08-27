// -- IMPORTS

import { propertyService } from '$lib/service/property_service';
import { propertyImageService } from '$lib/service/property_image_service';

// -- FUNCTIONS

export async function load(
    { params }
    )
{
    let property = await propertyService.getPropertyById( params.propertyId );
    let propertyImageArray = await propertyImageService.getPropertyImageArrayByPropertyId( params.propertyId );

    return {
        property,
        propertyImageArray
        };
}
