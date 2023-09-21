// -- TYPES

class UserProfile
{
    // -- ATTRIBUTES

    final String
        id,
        firstName,
        lastName,
        email,
        phoneNumber,
        countryCode,
        imagePath;

    // -- CONSTRUCTORS

    UserProfile(
        {
            required this.id,
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
                other is UserProfile
                && other.id == id;
        }
    }

    // -- INQUIRIES

    UserProfile copyWith(
        {
            String? id,
            String? firstName,
            String? lastName,
            String? email,
            String? phoneNumber,
            String? countryCode,
            String? imagePath
        }
        )
    {
        return UserProfile(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            countryCode: countryCode ?? this.countryCode,
            imagePath: imagePath ?? this.imagePath
            );
    }

    // ~~

    factory UserProfile.fromMap(
        Map<String, dynamic> map
        )
    {
        return UserProfile(
            id: map[ 'id' ],
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
        return 'UserProfile { id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, countryCode: $countryCode, imagePath: $imagePath }';
    }

    // ~~

    @override
    int get hashCode
    {
        return id.hashCode;
    }
}
