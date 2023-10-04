<script>
    // -- IMPORTS

    import { getLocalizedText } from 'senselogic-gist';
    import { getStorageImagePath } from '$lib/storage.js';

    // -- STATEMENTS

    export let data;
</script>

<style lang="stylus">
    // -- IMPORTS

    @import '../constant.styl';

    // -- CLASSES

    .property-list
    {
        display: grid;
        grid-template-columns: repeat( auto-fill, minmax( 20rem, 1fr ) );
        gap: 2rem;
    }

    .property
    {
    }

    .property-title
    {
        margin-bottom: 0.5rem;

        font-size: 1rem;
        font-weight: 700;
        color: redColor;
    }

    .property-image
    {
        height: 15rem;
        width: 20rem;

        object-fit: cover;
    }
</style>

<div class="property-list">
    { #each data.propertyArray as property }
        <div class="property">
            <img class="property-image" src="{ getStorageImagePath( property.imagePath, 640 ) }" alt="property"/>
            <div class="property-title">
                <a class="color-green-500" href="/property/{ property.id }">{ getLocalizedText( property.title ) }</a>
                <div>
                    { getLocalizedText( property.description ) }
                </div>
            </div>
        </div>
    { /each }
</div>
