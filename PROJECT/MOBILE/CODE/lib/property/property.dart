// -- TYPES

class Property
{
    // -- ATTRIBUTES

    final String
        id,
        title,
        description;

    // -- CONSTRUCTORS

    Property(
        {
            required this.id,
            required this.title,
            required this.description
        }
        );

    // -- INQUIRIES

    factory Property.fromMap(
        Map<String, dynamic> map
        )
    {
        return Property(
            id: map[ 'id' ],
            title: map[ 'title' ],
            description: map[ 'description' ]
            );
    }

    // ~~

    Map<String, dynamic> toMap(
        )
    {
        return
            {
                "id": id,
                "title": title,
                "description": description
            };
    }
}
