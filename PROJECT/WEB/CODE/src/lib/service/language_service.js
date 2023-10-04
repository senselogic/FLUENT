// -- IMPORTS

import { getMap, logError } from 'senselogic-gist';
import { database } from '$lib/database';

// -- FUNCTIONS

class LanguageService
{
    // -- CONSTRUCTORS

    constructor(
        )
    {
        this.cachedLanguageArray = null;
        this.cachedLanguageByCodeMap = null;
    }

    // -- INQUIRIES

    async getLanguageArray(
        )
    {
        const { data, error }
            = await database
                  .from( 'LANGUAGE' )
                  .select();

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }

    // ~~

    async getLanguageByCode(
        languageCode
        )
    {
        const { data, error }
            = await database
                  .from( 'LANGUAGE' )
                  .select()
                  .eq( 'code', languageCode );

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
        this.cachedLanguageArray = null;
        this.cachedLanguageByCodeMap = null;
    }

    // ~~

    async getCachedLanguageArray(
        )
    {
        if ( this.cachedLanguageArray === null )
        {
            this.cachedLanguageArray = await this.getLanguageArray();
        }

        return this.cachedLanguageArray;
    }

    // ~~

    async getCachedLanguageByCodeMap(
        )
    {
        if ( this.cachedLanguageByCodeMap === null )
        {
            this.cachedLanguageByCodeMap = getMap( await this.getCachedLanguageArray(), 'code' );
        }

        return this.cachedLanguageByCodeMap;
    }

    // ~~

    async addLanguage(
        language
        )
    {
        this.clearCache();

        const { data, error }
            = await database
                  .from( 'LANGUAGE' )
                  .insert( language );

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }

    // ~~

    async setLanguageByCode(
        language,
        languageCode
        )
    {
        this.clearCache();

        const { data, error }
            = await database
                .from( 'LANGUAGE' )
                .update( language )
                .eq( 'code', languageCode );

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }

    // ~~

    async removeLanguageByCode(
        languageCode
        )
    {
        this.clearCache();

        const { data, error }
            = await database
                .from( 'LANGUAGE' )
                .delete()
                .eq( 'code', languageCode );

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }
}

// -- VARIABLES

export const languageService
    = new LanguageService();
