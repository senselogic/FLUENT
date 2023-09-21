// -- TYPES

class Image
{
    // -- ATTRIBUTES

    final String
        path,
        propertyId;

    // -- CONSTRUCTORS

    Image(
        {
            required this.path,
            required this.propertyId
        }
        );

    // -- OPERATORS

    @override
    bool operator==(
        Object other
        )
    {
        if ( identical( this, other ) )
        {
            return true;
        }
        else
        {
            return
                other is Image
                && other.path == path;
        }
    }

    // -- INQUIRIES

    Image copyWith(
        {
            String? path,
            String? propertyId
        }
        )
    {
        return Image(
            path: path ?? this.path,
            propertyId: propertyId ?? this.propertyId
            );
    }

    // ~~

    factory Image.fromMap(
        Map<String, dynamic> map
        )
    {
        return Image(
            path: map[ 'path' ],
            propertyId: map[ 'propertyId' ]
            );
    }

    // ~~

    Map<String, dynamic> toMap(
        )
    {
        return
            {
                'path': path,
                'propertyId': propertyId
            };
    }

    // ~~

    @override
    String toString(
        )
    {
        return 'Image { path: $path, propertyId: $propertyId }';
    }

    // ~~

    @override
    int get hashCode
    {
        return path.hashCode;
    }
}
