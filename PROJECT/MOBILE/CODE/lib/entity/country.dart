// -- TYPES

class Country
{
    // -- ATTRIBUTES

    final String
        code;
    final double
        number;
    final String
        name,
        fullName,
        continentCode,
        iconImagePath,
        phonePrefix;

    // -- CONSTRUCTORS

    Country(
        {
            required this.code,
            required this.number,
            required this.name,
            required this.fullName,
            required this.continentCode,
            required this.iconImagePath,
            required this.phonePrefix
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
            double? number,
            String? name,
            String? fullName,
            String? continentCode,
            String? iconImagePath,
            String? phonePrefix
        }
        )
    {
        return Country(
            code: code ?? this.code,
            number: number ?? this.number,
            name: name ?? this.name,
            fullName: fullName ?? this.fullName,
            continentCode: continentCode ?? this.continentCode,
            iconImagePath: iconImagePath ?? this.iconImagePath,
            phonePrefix: phonePrefix ?? this.phonePrefix
            );
    }

    // ~~

    factory Country.fromMap(
        Map<String, dynamic> map
        )
    {
        return Country(
            code: map[ 'code' ],
            number: map[ 'number' ],
            name: map[ 'name' ],
            fullName: map[ 'fullName' ],
            continentCode: map[ 'continentCode' ],
            iconImagePath: map[ 'iconImagePath' ],
            phonePrefix: map[ 'phonePrefix' ]
            );
    }

    // ~~

    Map<String, dynamic> toMap(
        )
    {
        return
            {
                'code': code,
                'number': number,
                'name': name,
                'fullName': fullName,
                'continentCode': continentCode,
                'iconImagePath': iconImagePath,
                'phonePrefix': phonePrefix
            };
    }

    // ~~

    @override
    String toString(
        )
    {
        return
            'Country {'
            ' code: $code,'
            ' number: $number,'
            ' name: $name,'
            ' fullName: $fullName,'
            ' continentCode: $continentCode,'
            ' iconImagePath: $iconImagePath,'
            ' phonePrefix: $phonePrefix '
            '}';
    }

    // ~~

    @override
    int get hashCode
    {
        return code.hashCode;
    }
}
