// -- TYPES

class Language
{
    // -- ATTRIBUTES

    final String
        code;
    final double
        number;
    final String
        name;

    // -- CONSTRUCTORS

    Language(
        {
            required this.code,
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
                other is Language
                && other.code == code;
        }
    }

    // -- INQUIRIES

    Language copyWith(
        {
            String? code,
            double? number,
            String? name
        }
        )
    {
        return Language(
            code: code ?? this.code,
            number: number ?? this.number,
            name: name ?? this.name
            );
    }

    // ~~

    factory Language.fromMap(
        Map<String, dynamic> map
        )
    {
        return Language(
            code: map[ 'code' ],
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
                'code': code,
                'number': number,
                'name': name
            };
    }

    // ~~

    @override
    String toString(
        )
    {
        return
            'Language {'
            ' code: $code,'
            ' number: $number,'
            ' name: $name '
            '}';
    }

    // ~~

    @override
    int get hashCode
    {
        return code.hashCode;
    }
}
