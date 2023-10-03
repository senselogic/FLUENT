// -- IMPORTS

import { logError } from 'senselogic-gist';
import { database } from '$lib/database';

// -- FUNCTIONS

class CountryService
{
    // -- CONSTRUCTORS

    constructor(
        )
    {
        this.cachedCountryArray = null;
        this.cachedCountryByCodeMap = null;
    }

    // -- INQUIRIES

    async getCountryArray(
        )
    {
        const { data, error }
            = await database
                  .from( 'COUNTRY' )
                  .select();

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }

    // ~~

    async getCountryByCode(
        countryCode
        )
    {
        const { data, error }
            = await database
                  .from( 'COUNTRY' )
                  .select()
                  .eq( 'code', countryCode );

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
        this.cachedCountryArray = null;
        this.cachedCountryByCodeMap = null;
    }

    // ~~

    async getCachedCountryArray(
        )
    {
        if ( this.cachedCountryArray === null )
        {
            this.cachedCountryArray = await this.getCountryArray();
        }

        return this.cachedCountryArray;
    }

    // ~~

    async getCachedCountryByCodeMap(
        )
    {
        if ( this.cachedCountryByCodeMap === null )
        {
            this.cachedCountryByCodeMap = getMap( await this.getCachedCountryArray(), 'code' );
        }

        return this.cachedCountryByCodeMap;
    }

    // ~~

    async addCountry(
        country
        )
    {
        this.ClearCache();

        const { data, error }
            = await database
                  .from( 'COUNTRY' )
                  .insert( country );

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }

    // ~~

    async setCountryByCode(
        country,
        countryCode
        )
    {
        this.ClearCache();

        const { data, error }
            = await database
                .from( 'COUNTRY' )
                .update( country )
                .eq( 'code', countryCode );

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }

    // ~~

    async removeCountryByCode(
        countryCode
        )
    {
        this.ClearCache();

        const { data, error }
            = await database
                .from( 'COUNTRY' )
                .delete()
                .eq( 'code', countryCode );

        if ( error !== null )
        {
            logError( error );
        }

        return data;
    }
}

// -- VARIABLES

export const countryService
    = new CountryService();
