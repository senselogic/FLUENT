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
        description,
        price,
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
            required this.imagePathArray,
        }
        );

    // -- INQUIRIES

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
}
