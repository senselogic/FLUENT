// -- IMPORTS

import '../database/database.dart';
import '../entity/profile.dart';

// -- TYPES

class ProfileService
{
    // -- INQUIRIES

    Future<Profile> getUserProfile(
        ) async
    {
        final userId = database.auth.currentUser?.id;
        final response = await database.from( 'PROFILE' ).select().eq( 'userId', userId );

        profile = response.data.map( ( map ) => Profile.fromMap( map ) ).toList().cast<Profile>();

        return profile;
    }
}

// -- VARIABLES

final
    profileService = ProfileService();
late Profile
    profile;
