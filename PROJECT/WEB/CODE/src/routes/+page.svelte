<style>
    .property-list
    {
        display: flex;
        flex-direction: column;
        gap: 2rem;
    }

    .property
    {
    }

    .property-title
    {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
    }

    .property-image-list
    {
        display: flex;
        flex-wrap: wrap;
        gap: 0.5rem;
    }

    .property-image
    {
        width: 20rem;
        height: 15rem;
    }

    .property-image
    {
        object-fit: cover;
    }
</style>

<div class="property-list">
    { #each data.propertyArray as property }
        <div class="property">
            <div class="property-title">
                <a href="/property/{ property.id}">{ property.title }</a>
            </div>
            <div class="property-image-list">
                { #each property.imageArray as propertyImage }
                    <div class="property-image-container">
                        <img class="property-image" src="{ propertyImage.filePath }"/>
                    </div>
                { /each }
            </div>
        </div>
    { /each }
</div>

<script>
    export let data;
</script>

