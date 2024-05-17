<script>

    export let heatMap2;
    export let slice1;
    export let slice2;
    export let min;
    export let max;
    export let active;

    // linear interpolation function (lerp)
        function lerp({
        x,
        xMin,
        xMax,
        yMin = 0,
        yMax = 1
        }) {
        const ySpread = yMax - yMin;
        const xRatio = (x - xMin) / (xMax - xMin);
        const y = xRatio * ySpread + yMin;
        return y;
        }



    function getHeatmapColor(value, min, max) {
        const alpha = lerp({
        x: value,
        xMin: min,
        xMax: max,
        yMin: 0.2,
        yMax: 1,
        });
        return `rgba(253, 186, 116, ${alpha})`;
    }

    let plants = [4,5,6,7,8];
    let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

</script>

{#if active}

<!-- <div class="flex items-center justify-center child">
    <h2>Plant Keys</h2>
</div> -->


{#each plants as k }
<div class="flex items-center justify-center child"
style="background-color: Orange">Plant Key {k}</div> 
{/each}

{#each heatMap2.slice(slice1,slice2) as xaxis, i }
    {#each xaxis as heat}
      
      <div class="flex items-center justify-center child" 
      style="background-color: {getHeatmapColor(heat, min, max)}">{heat}</div>          
          
      {/each}
      
    {/each}

{/if}