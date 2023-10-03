// -- IMPORTS

import { getMap, logError } from 'senselogic-gist';
import { database } from '$lib/database';

// -- FUNCTIONS

class SpaceTypeService
{
    // -- CONSTRUCTORS

    constructor(
        )
    {
        this.cachedSpaceTypeArray = null;
        this.cachedSpaceTypeByIdMap = null;
    }

    // -- INQUIRIES

    async getSpaceTypeArray(
        )
    {
        const { data, error }
            = await database
                  .from( 'SPACE_TYPE' )
                  .select();

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }

    // ~~

    async getSpaceTypeById(
        spaceTypeId
        )
    {
        const { data, error }
            = await database
                  .from( 'SPACE_TYPE' )
                  .select()
                  .eq( 'id', spaceTypeId );

        if ( error !== null )
        {
            logError( error );
        }

        if ( data !== null )
        {
            return data[ 0 ];
        }
        else
        {
            return null;
        }
    }

    // -- OPERATIONS

    clearCache(
        )
    {
        this.cachedSpaceTypeArray = null;
        this.cachedSpaceTypeByIdMap = null;
    }

    // ~~

    async getCachedSpaceTypeArray(
        )
    {
        if ( this.cachedSpaceTypeArray === null )
        {
            this.cachedSpaceTypeArray = await this.getSpaceTypeArray();
        }

        return this.cachedSpaceTypeArray;
    }

    // ~~

    async getCachedSpaceTypeByIdMap(
        )
    {
        if ( this.cachedSpaceTypeByIdMap === null )
        {
            this.cachedSpaceTypeByIdMap = getMap( await this.getCachedSpaceTypeArray() );
        }

        return this.cachedSpaceTypeByIdMap;
    }

    // ~~

    async addSpaceType(
        spaceType
        )
    {
        this.clearCache();

        const { data, error }
            = await database
                  .from( 'SPACE_TYPE' )
                  .insert( spaceType );

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }

    // ~~

    async setSpaceTypeById(
        spaceType,
        spaceTypeId
        )
    {
        this.clearCache();

        const { data, error }
            = await database
                .from( 'SPACE_TYPE' )
                .update( spaceType )
                .eq( 'id', spaceTypeId );

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }

    // ~~

    async removeSpaceTypeById(
        spaceTypeId
        )
    {
        this.clearCache();

        const { data, error }
            = await database
                .from( 'SPACE_TYPE' )
                .delete()
                .eq( 'id', spaceTypeId );

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }
}

// -- VARIABLES

export const spaceTypeService
    = new SpaceTypeService();
