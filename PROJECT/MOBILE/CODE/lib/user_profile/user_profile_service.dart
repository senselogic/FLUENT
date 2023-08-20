// -- IMPORTS

import '../database/database.dart';
import 'userProfile.dart';

// -- TYPES

class UserProfileService
{
    // -- INQUIRIES

    Future<UserProfile> getUserProfileById(
        String
        ) async
    {
        final response = await database.from( 'USER_PROFILE' ).select().execute();

        return response.data.map( ( map ) => UserProfile.fromMap( map ) ).toList().cast<UserProfile>();
    }
}

// -- VARIABLES

final
    userProfileService = UserProfileService();
final
    userProfile;
