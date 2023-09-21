// -- TYPES

class Continent
{
    // -- ATTRIBUTES

    final String
        code,
        name;

    // -- CONSTRUCTORS

    Continent(
        {
            required this.code,
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
                other is Continent
                && other.code == code;
        }
    }

    // -- INQUIRIES

    Continent copyWith(
        {
            String? code,
            String? name
        }
        )
    {
        return Continent(
            code: code ?? this.code,
            name: name ?? this.name
            );
    }

    // ~~

    factory Continent.fromMap(
        Map<String, dynamic> map
        )
    {
        return Continent(
            code: map[ 'code' ],
            name: map[ 'name' ]
            );
    }

    // ~~

    Map<String, dynamic> toMap(
        )
    {
        return
            {
                'code': code,
                'name': name
            };
    }

    // ~~

    @override
    String toString(
        )
    {
        return 'Continent { code: $code, name: $name }';
    }

    // ~~

    @override
    int get hashCode
    {
        return code.hashCode;
    }
}
