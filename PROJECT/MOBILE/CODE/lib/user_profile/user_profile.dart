// -- TYPES

class UserProfile
{
    // -- ATTRIBUTES

    final String
        id,
        title,
        description;

    // -- CONSTRUCTORS

    UserProfile(
        {
            required this.id,
            required this.title,
            required this.description
        }
        );

    // -- INQUIRIES

    factory UserProfile.fromMap(
        Map<String, dynamic> map
        )
    {
        return UserProfile(
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
