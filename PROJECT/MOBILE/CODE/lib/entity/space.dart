// -- TYPES

class Space
{
    // -- ATTRIBUTES

    final String
        id,
        propertyId,
        typeId,
        name,
        description;
    final int
        floorNumber;
    final double
        area;

    // -- CONSTRUCTORS

    Space(
        {
            required this.id,
            required this.propertyId,
            required this.typeId,
            required this.name,
            required this.description,
            required this.floorNumber,
            required this.area
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
                other is Space
                && other.id == id;
        }
    }

    // -- INQUIRIES

    Space copyWith(
        {
            String? id,
            String? propertyId,
            String? typeId,
            String? name,
            String? description,
            int? floorNumber,
            double? area
        }
        )
    {
        return Space(
            id: id ?? this.id,
            propertyId: propertyId ?? this.propertyId,
            typeId: typeId ?? this.typeId,
            name: name ?? this.name,
            description: description ?? this.description,
            floorNumber: floorNumber ?? this.floorNumber,
            area: area ?? this.area
            );
    }

    // ~~

    factory Space.fromMap(
        Map<String, dynamic> map
        )
    {
        return Space(
            id: map[ 'id' ],
            propertyId: map[ 'propertyId' ],
            typeId: map[ 'typeId' ],
            name: map[ 'name' ],
            description: map[ 'description' ],
            floorNumber: map[ 'floorNumber' ],
            area: map[ 'area' ]
            );
    }

    // ~~

    Map<String, dynamic> toMap(
        )
    {
        return
            {
                'id': id,
                'propertyId': propertyId,
                'typeId': typeId,
                'name': name,
                'description': description,
                'floorNumber': floorNumber,
                'area': area
            };
    }

    // ~~

    @override
    String toString(
        )
    {
        return
            'Space {'
            ' id: $id,'
            ' propertyId: $propertyId,'
            ' typeId: $typeId,'
            ' name: $name,'
            ' description: $description,'
            ' floorNumber: $floorNumber,'
            ' area: $area '
            '}';
    }

    // ~~

    @override
    int get hashCode
    {
        return id.hashCode;
    }
}
