<script>
    // -- IMPORTS

    import { getLocalizedText } from 'senselogic-gist';
    import { getStorageImagePath } from '$lib/storage.js';
    import { languageTagStore } from '$lib/store/languageTagStore';

    // -- STATEMENTS

    export let data;
</script>

<style lang="stylus">
    // -- IMPORTS

    @import '../../../constant.styl';

    // -- CLASSES

    .property
    {
    }

    .property-title
    {
        margin-bottom: 0.5rem;

        font-size: 2rem;
        font-weight: 700;
        color: redColor;
    }

    .property-title-icon
    {
        margin-left: 1rem;
        height: 2rem;
        width: 2rem;

        display: inline-block;
    }

    .property-image-list
    {
        display: flex;
        flex-wrap: wrap;
        gap: 0.5rem;
    }

    .property-image
    {
        height: 15rem;
        width: 20rem;

        object-fit: cover;
    }
</style>

<div class="property-list">
    <div class="property">
        <div class="property-title">
            { getLocalizedText( data.property.title, $languageTagStore ) }
            <span class="green-map-pin-icon property-title-icon">
            </span>
        </div>
        <div class="property-image-list">
            { #each data.property.imagePathArray as imagePath }
                <div class="property-image-container">
                    <img class="property-image" src="{ getStorageImagePath( imagePath, 640 ) }" alt="property"/>
                </div>
            { /each }
        </div>
    </div>
</div>

<div>
    <a href="/">Back</a>
</div>
