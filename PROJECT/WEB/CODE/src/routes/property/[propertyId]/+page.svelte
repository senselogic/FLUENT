<style>
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
    <div class="property">
        <div class="property-title">
            { data.property.title }
        </div>
        <div class="property-image-list">
            { #each data.propertyImageArray as propertyImage }
                <div class="property-image-container">
                    <img class="property-image" src="{ propertyImage.filePath }"/>
                </div>
            { /each }
        </div>
    </div>
</div>

<div>
    <a href="/">Back</a>
</div>

<script>
    export let data;
</script>

