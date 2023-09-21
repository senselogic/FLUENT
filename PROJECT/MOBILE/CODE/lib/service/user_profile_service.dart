// -- IMPORTS

import '../database/database.dart';
import '../entity/user_profile.dart';

// -- TYPES

class UserProfileService
{
    // -- INQUIRIES

    Future<UserProfile> getUserProfile(
        ) async
    {
        final userId = database.auth.currentUser?.id;
        final response = await database.from( 'USER_PROFILE' ).select().eq( 'userId', userId );

        userProfile = response.data.map( ( map ) => UserProfile.fromMap( map ) ).toList().cast<UserProfile>();

        return userProfile;
    }
}

// -- VARIABLES

final
    userProfileService = UserProfileService();
late UserProfile
    userProfile;
