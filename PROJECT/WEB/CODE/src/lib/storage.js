// -- IMPORTS

import { PUBLIC_STORAGE_URL } from '$env/static/public';

// -- FUNCTIONS

export function getStorageFilePath(
    filePath
    )
{
    if ( filePath.startsWith( '/upload/' ) )
    {
        return PUBLIC_STORAGE_URL + filePath;
    }
    else
    {
        return filePath;
    }
}

// ~~

export function getStorageImagePath(
    imagePath,
    imageWidth
    )
{
    if ( !isNaN( imageWidth ) )
    {
        if ( imagePath.endsWith( '.jpg' ) )
        {
            imagePath += '.' + imageWidth + '.jpg';
        }
        else if ( imagePath.endsWith( '.png' ) )
        {
            imagePath += '.' + imageWidth + '.png';
        }
    }

    return getStorageFilePath( imagePath );
}

