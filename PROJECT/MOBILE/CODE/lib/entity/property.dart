// -- TYPES

class Property
{
    // -- ATTRIBUTES

    final String
        id;
    final double
        number;
    final String
        city,
        country,
        title,
        description;
    final double
        price;
    final String
        imagePath;
    final List<String>
        imagePathArray;

    // -- CONSTRUCTORS

    Property(
        {
            required this.id,
            required this.number,
            required this.city,
            required this.country,
            required this.title,
            required this.description,
            required this.price,
            required this.imagePath,
            required this.imagePathArray
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
                other is Property
                && other.id == id;
        }
    }

    // -- INQUIRIES

    Property copyWith(
        {
            String? id,
            double? number,
            String? city,
            String? country,
            String? title,
            String? description,
            double? price,
            String? imagePath,
            List<String>? imagePathArray
        }
        )
    {
        return Property(
            id: id ?? this.id,
            number: number ?? this.number,
            city: city ?? this.city,
            country: country ?? this.country,
            title: title ?? this.title,
            description: description ?? this.description,
            price: price ?? this.price,
            imagePath: imagePath ?? this.imagePath,
            imagePathArray: imagePathArray ?? this.imagePathArray
            );
    }

    // ~~

    factory Property.fromMap(
        Map<String, dynamic> map
        )
    {
        return Property(
            id: map[ 'id' ],
            number: map[ 'number' ],
            city: map[ 'city' ],
            country: map[ 'country' ],
            title: map[ 'title' ],
            description: map[ 'description' ],
            price: map[ 'price' ],
            imagePath: map[ 'imagePath' ],
            imagePathArray: List<String>.from( map[ 'imagePathArray' ] )
            );
    }

    // ~~

    Map<String, dynamic> toMap(
        )
    {
        return
            {
                'id': id,
                'number': number,
                'city': city,
                'country': country,
                'title': title,
                'description': description,
                'price': price,
                'imagePath': imagePath,
                'imagePathArray': imagePathArray
            };
    }

    // ~~

    @override
    String toString(
        )
    {
        return 'Property { id: $id, number: $number, city: $city, country: $country, title: $title, description: $description, price: $price, imagePath: $imagePath, imagePathArray: $imagePathArray }';
    }

    // ~~

    @override
    int get hashCode
    {
        return id.hashCode;
    }
}
