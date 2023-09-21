// -- TYPES

class Country
{
    // -- ATTRIBUTES

    final String
        code,
        name,
        fullName,
        continentCode;

    // -- CONSTRUCTORS

    Country(
        {
            required this.code,
            required this.name,
            required this.fullName,
            required this.continentCode
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
                other is Country
                && other.code == code;
        }
    }

    // -- INQUIRIES

    Country copyWith(
        {
            String? code,
            String? name,
            String? fullName,
            String? continentCode
        }
        )
    {
        return Country(
            code: code ?? this.code,
            name: name ?? this.name,
            fullName: fullName ?? this.fullName,
            continentCode: continentCode ?? this.continentCode
            );
    }

    // ~~

    factory Country.fromMap(
        Map<String, dynamic> map
        )
    {
        return Country(
            code: map[ 'code' ],
            name: map[ 'name' ],
            fullName: map[ 'fullName' ],
            continentCode: map[ 'continentCode' ]
            );
    }

    // ~~

    Map<String, dynamic> toMap(
        )
    {
        return
            {
                'code': code,
                'name': name,
                'fullName': fullName,
                'continentCode': continentCode
            };
    }

    // ~~

    @override
    String toString(
        )
    {
        return 'Country { code: $code, name: $name, fullName: $fullName, continentCode: $continentCode }';
    }

    // ~~

    @override
    int get hashCode
    {
        return code.hashCode;
    }
}
