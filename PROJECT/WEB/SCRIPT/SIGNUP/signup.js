// -- IMPORTS

const { createClient } = require( '@supabase/supabase-js' );

// -- FUNCTIONS

async function createTestUsers(
    database
    )
{
    let userArray = [
        { email: 'test1@fluent.com', password: 'test1password' },
        { email: 'test2@fluent.com', password: 'test2password' },
        { email: 'test3@fluent.com', password: 'test3password' }
    ];

    for ( let user of userArray )
    {
        console.log( 'Signing up user : ', user.email, user.password );

        let { data, error } = await database.auth.signUp( user );

        if ( error )
        {
            console.error( 'Error :', error.message );
        }
        else if ( data && data.user )
        {
            console.log( data.user.id, '~', user.email, '~', user.password );
        }
    }
}

// -- STATEMENTS

let database
    = createClient(
          process.env.FLUENT_DATABASE_URL,
          process.env.FLUENT_DATABASE_KEY
          );

(
    async () =>
    {
        await createTestUsers( database );
    }
)();
