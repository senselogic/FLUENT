// -- TYPES

class PropertyEntity
{
    // -- ATTRIBUTES

    final String
        id,
        title,
        description;

    // -- CONSTRUCTORES

    PropertyEntity(
        {
            required this.id,
            required this.title,
            required this.description
        }
        );

    // -- INQUIRIES

    factory PropertyEntity.fromMap(
        Map<String, dynamic> map
        )
    {
        return PropertyEntity(
            id: map[ 'id' ],
            title: map[ 'title' ],
            description: map[ 'description' ]
            );
    }
}
