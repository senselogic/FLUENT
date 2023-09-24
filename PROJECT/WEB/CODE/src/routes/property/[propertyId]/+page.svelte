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
            { getLocalizedText( data.property.title ) }
        </div>
        <div class="property-image-list">
            { #each data.property.imagePathArray as imagePath }
                <div class="property-image-container">
                    <img class="property-image" src="{ getStorageImagePath( imagePath, 640 ) }"/>
                </div>
            { /each }
        </div>
    </div>
</div>

<div>
    <a href="/">Back</a>
</div>

<script>
    // -- IMPORTS

    import { getLocalizedText } from 'senselogic-gist';
    import { getStorageImagePath } from '$lib/storage.js';

    // -- STATEMENTS

    export let data;
</script>
