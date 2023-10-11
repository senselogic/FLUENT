// -- TYPES

class Profile
{
    // -- ATTRIBUTES

    final String
        id,
        userId,
        firstName,
        lastName,
        email,
        phoneNumber,
        countryCode,
        imagePath;

    // -- CONSTRUCTORS

    Profile(
        {
            required this.id,
            required this.userId,
            required this.firstName,
            required this.lastName,
            required this.email,
            required this.phoneNumber,
            required this.countryCode,
            required this.imagePath
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
                other is Profile
                && other.id == id;
        }
    }

    // -- INQUIRIES

    Profile copyWith(
        {
            String? id,
            String? userId,
            String? firstName,
            String? lastName,
            String? email,
            String? phoneNumber,
            String? countryCode,
            String? imagePath
        }
        )
    {
        return Profile(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            countryCode: countryCode ?? this.countryCode,
            imagePath: imagePath ?? this.imagePath
            );
    }

    // ~~

    factory Profile.fromMap(
        Map<String, dynamic> map
        )
    {
        return Profile(
            id: map[ 'id' ],
            userId: map[ 'userId' ],
            firstName: map[ 'firstName' ],
            lastName: map[ 'lastName' ],
            email: map[ 'email' ],
            phoneNumber: map[ 'phoneNumber' ],
            countryCode: map[ 'countryCode' ],
            imagePath: map[ 'imagePath' ]
            );
    }

    // ~~

    Map<String, dynamic> toMap(
        )
    {
        return
            {
                'id': id,
                'userId': userId,
                'firstName': firstName,
                'lastName': lastName,
                'email': email,
                'phoneNumber': phoneNumber,
                'countryCode': countryCode,
                'imagePath': imagePath
            };
    }

    // ~~

    @override
    String toString(
        )
    {
        return
            'Profile {'
            ' id: $id,'
            ' userId: $userId,'
            ' firstName: $firstName,'
            ' lastName: $lastName,'
            ' email: $email,'
            ' phoneNumber: $phoneNumber,'
            ' countryCode: $countryCode,'
            ' imagePath: $imagePath '
            '}';
    }

    // ~~

    @override
    int get hashCode
    {
        return id.hashCode;
    }
}
