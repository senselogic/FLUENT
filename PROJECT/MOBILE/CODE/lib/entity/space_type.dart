// -- TYPES

class SpaceType
{
    // -- ATTRIBUTES

    final String
        id;
    final double
        number;
    final String
        name;

    // -- CONSTRUCTORS

    SpaceType(
        {
            required this.id,
            required this.number,
            required this.name
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
                other is SpaceType
                && other.id == id;
        }
    }

    // -- INQUIRIES

    SpaceType copyWith(
        {
            String? id,
            double? number,
            String? name
        }
        )
    {
        return SpaceType(
            id: id ?? this.id,
            number: number ?? this.number,
            name: name ?? this.name
            );
    }

    // ~~

    factory SpaceType.fromMap(
        Map<String, dynamic> map
        )
    {
        return SpaceType(
            id: map[ 'id' ],
            number: map[ 'number' ],
            name: map[ 'name' ]
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
                'name': name
            };
    }

    // ~~

    @override
    String toString(
        )
    {
        return 'SpaceType { id: $id, number: $number, name: $name }';
    }

    // ~~

    @override
    int get hashCode
    {
        return id.hashCode;
    }
}
