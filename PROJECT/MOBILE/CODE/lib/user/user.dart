// -- TYPES

class User
{
    // -- ATTRIBUTES

    final String
        id,
        title,
        description;

    // -- CONSTRUCTORS

    User(
        {
            required this.id,
            required this.title,
            required this.description
        }
        );

    // -- INQUIRIES

    factory User.fromMap(
        Map<String, dynamic> map
        )
    {
        return User(
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
