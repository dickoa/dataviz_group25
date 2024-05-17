<script lang="ts">
    import {onMount} from 'svelte';
    import Scroller from '@sveltejs/svelte-scroller';

    export let data = [];
    let dataPurchases = 
    console.log(data.Purchases)

    function delayArrival(data2){
        return data2.reduce((acc, curr)=>{
            const actual = new Date(curr.ActualArrivalDateYard);
            const planned = new Date(curr.PlannedArrivalDateYard);
            const differenceMs = Math.abs(planned - actual);
            const delayArrDays = Math.ceil(differenceMs/(1000*60*60*24));
            
            acc.push({...curr, "Pl-Act_Arr": delayArrDays});
            return acc;
        }, []);
    }
    const newData = delayArrival(data.Purchases);
    console.log('Here');
    console.log(newData);

    var groupedData_YQM = [];
    newData.reduce(function(groupedData, row){
        
        var actualArrivalDate = new Date(row["ActualArrivalDateYard"]);
        var year = actualArrivalDate.getFullYear();
        var quarter = Math.floor((actualArrivalDate.getMonth() + 3) / 3);
        var month = actualArrivalDate.getMonth() + 1; // Month is zero-based
        var plantKey = row["PlantKey"];
        
        //unique key for each combination of year, month and plant key
        var groupKey = year+'-'+quarter+'-'+month+'-'+plantKey;

        if(!groupedData[groupKey]){
          groupedData[groupKey] = {
              Year: year,
              Quarter: quarter,
              Month: month,
              PlantKey: plantKey,
              ArrivalDelay: 0
          };
          groupedData_YQM.push(groupedData[groupKey]);
        }

        // groupedData[year] = groupedData[year] || {};
        // groupedData[year][month] = groupedData[year][month] || {};
        // groupedData[year][month][plantKey] = groupedData[year][month][plantKey] || [];
        // groupedData[year][month][plantKey].push(row["Pl-Act_Arr"]);
        
        //Accumulate inbound transportation time
        groupedData[groupKey].ArrivalDelay += Number(row["Pl-Act_Arr"]);
        return groupedData;
    }, {}); 
    console.log(groupedData_YQM);

    //sort the array by year, quarter and then month
    function sortByYQM(a,b){
      if(a.Year !== b.Year){
        return a.Year - b.Year;
      }
      if (a.Quarter !== b.Quarter){
        return a.Quarter - b.Quarter;
      }
      return a.Month - b.Month;
    }
    groupedData_YQM.sort(sortByYQM);

    console.log("Here 2");
    console.log(groupedData_YQM[0].PlantKey);

    //nested structure to iterate in the svelte style
    const groupedData_nested = {};
    groupedData_YQM.forEach(entry => {
      const { Year, Quarter, Month } = entry;
      if (!groupedData_nested[Year]) {
        groupedData_nested[Year] = {};
      }
      if (!groupedData_nested[Year][Quarter]) {
        groupedData_nested[Year][Quarter] = {};
      }
      if (!groupedData_nested[Year][Quarter][Month]) {
        groupedData_nested[Year][Quarter][Month] = [];
      }
      groupedData_nested[Year][Quarter][Month].push(entry);
    });

    console.log('Here 3');
    console.log(groupedData_nested);
    console.log(groupedData_nested[2022][3][9]);

    function createHeatMap(data){
      
      //Y axis labels
      const plantKeys = ['4','5','6','7','8'];
      
      //X-axis labels (year, quarter, month)
      const xAxisLabels = [];
      const heatMap2 = [];
      let  min = 0;
      let max = 0;
      for(const year in data){
        for (const quarter in data[year]){
          for (const month in data[year][quarter]){
            xAxisLabels.push(`${year}-${quarter}-${month}`);
            const dataByPlantKey = []; 
            const entries = data[year][quarter][month];
            for( const plantKey of plantKeys ){
                  //find entry for current plant key
                  const entry = entries.find(item => item.PlantKey === plantKey);
              
                  // If an entry is found, set the heat value as the ArrivalDelay
                  // Otherwise, set the heat value as 0
                  const heatValue = entry ? entry.ArrivalDelay : 0;
                  dataByPlantKey.push(heatValue);
                  if (heatValue > max){
                    max = heatValue;
                  }
                }
                heatMap2.push(dataByPlantKey);
          }
        }
      }
      

      // //Initialise Heat Map Grid
      // const heatMap = {};

      // //iterate over each year, quarter and month
      // for (const year in data){
      //   for (const quarter in data[year]){
      //     for (const month in data[year][quarter]){
      //       //entries for the current year, quarter and month
      //       const entries = data[year][quarter][month];

      //       //loop over each plant key
      //       for (const plantKey of plantKeys){
      //         //find entry for current plant key
      //         const entry = entries.find(item => item.PlantKey === plantKey);
              
      //         // If an entry is found, set the heat value as the ArrivalDelay
      //         // Otherwise, set the heat value as 0
      //         const heatValue = entry ? entry.ArrivalDelay : 0;

      //         // Initialize the heat map grid cell if it doesn't exist
      //         if(!heatMap[plantKey]){
      //           heatMap[plantKey] = [];
      //         }
      //         if(!heatMap[plantKey][year]){
      //           heatMap[plantKey][year] = [];
      //         }
      //         if(!heatMap[plantKey][year][quarter]){
      //           heatMap[plantKey][year][quarter]=[];
      //         }
      //         // if(!heatMap[plantKey][year][quarter][month]){
      //         //   heatMap[plantKey][year][quarter][month]=[];
      //         // }
              
      //         heatMap[plantKey][year][quarter] = heatValue;
      //       }
      //     }
      //   }
      // }

      return {xAxisLabels, yAxisLabels: plantKeys, heatMap2, min, max};
    }

    const {xAxisLabels, yAxisLabels, heatMap2, min, max} = createHeatMap(groupedData_nested);
    console.log('X-axis labels:', xAxisLabels);
    console.log('Y-axis labels:', yAxisLabels);
    console.log('Heat map:', heatMap2);

    // function renderHeatMap(data){
    //   const {xAxisLabels, yAxisLabels, heatMap} = createHeatMap(data);
    //   const container = document.getElementById('heatMapContainer');
    // }

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

  let top = 0.1;
	let threshold = 0.5;
	let bottom = 0.9;
</script>

<!-- <div>
  <div id="heatmapContainer">

  </div>
</div> -->

<Scroller {top}{threshold}{bottom}>
  <div slot="background">
    <div class="heat-map">
      <div class="grid max-w-xl grid-cols-5 gap-0.5">
      {#each heatMap2.slice(0,1) as xaxis, i }
        {#each xaxis as heat}
          
          <div class="flex items-center justify-center child" 
          style="background-color: {getHeatmapColor(heat, min, max)}">{heat}</div>          
              
          {/each}
          
        {/each}
    
    </div>
    </div>
  </div>

  <div slot="foreground">
    <section>
      <p>Foreground</p>
    </section>
  </div>
</Scroller>


<Scroller {top}{threshold}{bottom}>
<div slot="background">
    <div class="heat-map">
  <div class="grid max-w-xl grid-cols-5 gap-0.5">
    {#each heatMap2.slice(1,13) as xaxis, i }
      {#each xaxis as heat}
        
        <div class="flex items-center justify-center child" 
        style="background-color: {getHeatmapColor(heat, min, max)}">{heat}</div>          
            
        {/each}
        
      {/each}
   
  </div>
</div>
</div>


<div slot="foreground">
  <section>
    <p>Foreground 2022</p>
  </section>
</div>
</Scroller>

<Scroller {top}{threshold}{bottom}>
  <div slot="background">
      <div class="heat-map">
    <div class="grid max-w-xl grid-cols-5 gap-0.5">
      {#each heatMap2.slice(13,25) as xaxis, i }
        {#each xaxis as heat}
          
          <div class="flex items-center justify-center child" 
          style="background-color: {getHeatmapColor(heat, min, max)}">{heat}</div>          
              
          {/each}
          
        {/each}
    
    </div>
  </div>
  </div> 


  <div slot="foreground">
    <section>
      <p>Foreground 2023</p>
    </section>
  </div>
</Scroller>

<Scroller {top}{threshold}{bottom}>
  <div slot="background">
      <div class="heat-map">
    <div class="grid max-w-xl grid-cols-5 gap-0.5">
      {#each heatMap2.slice(25,37) as xaxis, i }
        {#each xaxis as heat}
          
          <div class="flex items-center justify-center child" 
          style="background-color: {getHeatmapColor(heat, min, max)}">{heat}</div>          
              
          {/each}
          
        {/each}
    
    </div>
  </div>
  </div>


  <div slot="foreground">
    <section>
      <p>Foreground 2024</p>
    </section>
  </div>
</Scroller>

<Scroller {top}{threshold}{bottom}>
  <div slot="background">
      <div class="heat-map">
    <div class="grid max-w-xl grid-cols-5 gap-0.5">
      {#each heatMap2.slice(37,38) as xaxis, i }
        {#each xaxis as heat}
          
          <div class="flex items-center justify-center child" 
          style="background-color: {getHeatmapColor(heat, min, max)}">{heat}</div>          
              
          {/each}
          
        {/each}
    
    </div>
  </div>
  </div>


  <div slot="foreground">
    <section>
      <p>Foreground 2025</p>
    </section>
  </div>
</Scroller>

<Scroller {top}{threshold}{bottom}>
  <div slot="background">
      <div class="heat-map">
    <div class="grid max-w-xl grid-cols-5 gap-0.5">
      {#each heatMap2.slice(38,39) as xaxis, i }
        {#each xaxis as heat}
          
          <div class="flex items-center justify-center child" 
          style="background-color: {getHeatmapColor(heat, min, max)}">{heat}</div>          
              
          {/each}
          
        {/each}
    
    </div>
  </div>
  </div>


  <div slot="foreground">
    <section>
      <p>Foreground 2026</p>
    </section>
  </div>
</Scroller>


<!-- <div class="heat-map">
   {#each yAxisLabels as plantKey}
    <div class="y-axis-label">{plantKey}</div>
     {#each heatMap[plantKey] as year, i}
      <div class="year">
         <div class="x-axis-label">{xAxisLabels[i]}</div>
         {#each year as quarter}
          <div class="quarter">
             {#each quarter as month}
              <div class="month" style="background-color: rgba(255, 0, 0, {month / 300})"></div>
            {/each}
          </div>
        {/each}
      </div>
    {/each}
  {/each}
</div> -->


<!-- <div class="grid max-w-xl grid-cols-5 gap-0.5">
    {#each yAxisLabels as PlantKey}
        <div class="y-axis-label flex items-center justify-center bg-orange-300">
          <div class="font-bold">{PlantKey}</div>
        </div>
    {/each}
    </div>
    {#each groupedData_YQM as row}
    {#each row.Year as month}
      {#each month.quarters as quarter}
        <div class="flex items-center justify-center bg-orange-300">
          <div>{quarter.year}-{quarter.quarter}-{month.name}</div>
        </div>
        {#each plantKeys as plantKey}
          {#if getHeatValue(dateGroup.year, quarter.quarter, month.value, plantKey)}
            <div class="flex items-center justify-center bg-blue-500">
              <div>{getHeatValue(dateGroup.year, quarter.quarter, month.value, plantKey)}</div>
            </div>
          {:else}
            <div class="flex items-center justify-center bg-gray-300">
              <div>-</div>
            </div>
          {/if}
        {/each}
      {/each}
    {/each}
  {/each}
  </div> -->



<!-- 
""
: 
"1"
ActualArrivalDateYard
: 
"2023-07-02"
ActualGoodsReceiptDate
: 
"2023-07-04"
ActualVendorShipmentDate
: 
"2023-07-01"
MaterialKey
: 
"1"
MaterialPlantKey
: 
"10005"
PlannedArrivalDateYard
: 
"2023-06-28"
PlannedGoodsReceiptDate
: 
"2023-06-30"
PlannedVendorShipmentDate
: 
"2023-06-27"
PlantKey
: 
"5"
PurchaseOrder
: 
"4500000001"
PurchaseOrderCreationDate
: 
"2023-06-07"
PurchaseOrderQuantity
: 
"69"
VendorKey
: 
"1002" 
Pl-Act_Arr
-->

<style>
  /* CSS styles for the heat map */
 
  .grid {
    display: grid;
    grid-template-columns: repeat(5, 1fr); /* 5 columns */
    gap: 0.5rem; /* Gap between grid items */
  }

  .grid-item {
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #ffa500; /* Orange background color */
    border: 1px solid #ccc; /* Border for each grid item */
    height: 50px; /* Height of each grid item */
  }

  .heat-map {
    margin: 50px;
    /* transform: translate(-50%, -50%); */
  }

  .child{
    padding: 5px;
    text-align: center;
  }
  .y-axis-label {
    font-size: 14px;
    margin-bottom: 5px;
  }
  .year {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 10px;
  }
  .x-axis-label {
    font-size: 12px;
    margin-top: 5px;
  }
  .quarter {
    display: flex;
    margin-top: 5px;
  }
  .month {
    width: 30px;
    height: 30px;
    border: 1px solid #ccc;
    margin-right: 5px;
  }
</style>