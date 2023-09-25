// -- IMPORTS

import 'constant.dart';

// -- FUNCTIONS

String getStorageFilePath(
    String filePath
    )
{
    if ( filePath.startsWith( '/upload/' ) )
    {
        return storageUrl + filePath;
    }
    else
    {
        return filePath;
    }
}

// ~~

String getStorageImagePath(
    String imagePath,
    int imageWidth
    )
{
    if ( imagePath.endsWith( '.jpg' ) )
    {
        imagePath = '$imagePath.$imageWidth.jpg';
    }
    else if ( imagePath.endsWith( '.png' ) )
    {
        imagePath = '$imagePath.$imageWidth.png';
    }

    return getStorageFilePath( imagePath );
}

