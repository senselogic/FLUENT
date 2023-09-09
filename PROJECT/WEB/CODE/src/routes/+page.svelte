<style>
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
        font-size: 1rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
    }

    .property-image
    {
        width: 20rem;
        height: 15rem;
        object-fit: cover;
    }
</style>

<div class="property-list">
    { #each data.propertyArray as property }
        <div class="property">
            <img class="property-image" src="{ property.imagePath }"/>
            <div class="property-title">
                <a class="color-green-500" href="/property/{ property.id }">{ property.title }</a>
            </div>
        </div>
    { /each }
</div>

<script>
    export let data;
</script>

