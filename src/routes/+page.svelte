<script lang="ts">
  import { onMount } from "svelte";
  import Heatmap from "./Heatmap.svelte";

  export let data = [];
  let slice1;
  let slice2;
  let dataPurchases = console.log(data.Purchases);

  function delayArrival(data2) {
    return data2.reduce((acc, curr) => {
      const actual = new Date(curr.ActualArrivalDateYard);
      const planned = new Date(curr.PlannedArrivalDateYard);
      const differenceMs = Math.abs(planned - actual);
      const delayArrDays = Math.ceil(differenceMs / (1000 * 60 * 60 * 24));

      acc.push({ ...curr, "Pl-Act_Arr": delayArrDays });
      return acc;
    }, []);
  }
  const newData = delayArrival(data.Purchases);
  console.log("Here");
  console.log(newData);

  var groupedData_YQM = [];
  newData.reduce(function (groupedData, row) {
    var actualArrivalDate = new Date(row["ActualArrivalDateYard"]);
    var year = actualArrivalDate.getFullYear();
    var quarter = Math.floor((actualArrivalDate.getMonth() + 3) / 3);
    var month = actualArrivalDate.getMonth() + 1; // Month is zero-based
    var plantKey = row["PlantKey"];

    //unique key for each combination of year, month and plant key
    var groupKey = year + "-" + quarter + "-" + month + "-" + plantKey;

    if (!groupedData[groupKey]) {
      groupedData[groupKey] = {
        Year: year,
        Quarter: quarter,
        Month: month,
        PlantKey: plantKey,
        ArrivalDelay: 0,
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
  function sortByYQM(a, b) {
    if (a.Year !== b.Year) {
      return a.Year - b.Year;
    }
    if (a.Quarter !== b.Quarter) {
      return a.Quarter - b.Quarter;
    }
    return a.Month - b.Month;
  }
  groupedData_YQM.sort(sortByYQM);

  console.log("Here 2");
  console.log(groupedData_YQM[0].PlantKey);

  //nested structure to iterate in the svelte style
  const groupedData_nested = {};
  groupedData_YQM.forEach((entry) => {
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

  console.log("Here 3");
  console.log(groupedData_nested);
  console.log(groupedData_nested[2022][3][9]);

  function createHeatMap(data) {
    //Y axis labels
    const plantKeys = ["4", "5", "6", "7", "8"];

    //X-axis labels (year, quarter, month)
    const xAxisLabels = [];
    const heatMap2 = [];
    let min = 0;
    let max = 0;
    for (const year in data) {
      for (const quarter in data[year]) {
        for (const month in data[year][quarter]) {
          xAxisLabels.push(`${year}-${quarter}-${month}`);
          const dataByPlantKey = [];
          const entries = data[year][quarter][month];
          for (const plantKey of plantKeys) {
            //find entry for current plant key
            const entry = entries.find((item) => item.PlantKey === plantKey);

            // If an entry is found, set the heat value as the ArrivalDelay
            // Otherwise, set the heat value as 0
            const heatValue = entry ? entry.ArrivalDelay : 0;
            dataByPlantKey.push(heatValue);
            if (heatValue > max) {
              max = heatValue;
            }
          }
          heatMap2.push(dataByPlantKey);
        }
      }
    }

    
    return { xAxisLabels, yAxisLabels: plantKeys, heatMap2, min, max };
  }

  const { xAxisLabels, yAxisLabels, heatMap2, min, max } =
    createHeatMap(groupedData_nested);
  console.log("X-axis labels:", xAxisLabels);
  console.log("Y-axis labels:", yAxisLabels);
  console.log("Heat map:", heatMap2);

  // histogram on side
  let category: 'month' | 'plant' = 'plant';
  const isplant = category==='plant';
  let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  const plantKeys = ["4", "5", "6", "7", "8"];
  const plantTotals = Array(5).fill(0);
  const monthlyTotals = [];

  for (const row of heatMap2){
    let monthlytotal = 0;
    for (const [idx, value] of row.entries()){
      console.log(idx, value);
      plantTotals[idx] += value;
      monthlytotal += value;
    }
    monthlyTotals.push(monthlytotal);
  }


  console.log('Im here');
  console.log(monthlyTotals);
  console.log(plantTotals);

  const histData = isplant ? plantTotals : monthlyTotals;
  const intervals = isplant ? plantKeys : months;

  console.log('A')
  console.log(isplant)
  console.log(histData)
  console.log(intervals)

  function getSize(value) {
    const size = lerp({
      x: value,
      xMin: 0,
      xMax: Math.max(...histData),
      yMin: 0,
      yMax: 200,
    });
    return `${size}px`;
  }



  // linear interpolation function (lerp)
  function lerp({ x, xMin, xMax, yMin = 0, yMax = 1 }) {
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

  let active = false, navigating = false, 
  year1=false,
  year2=false,
  year3=false,
  year4=false,
  year5=false;
  
  let foo = true;

  function simulateNavigation() {
    if(foo){
      navigating = true;
    active = true;
    foo = false;
    }
    else{
      foo = true;
      navigating = false;
    active = false;
    }
  }


</script>



<div class="parent">
  <div class="hoverbuttons">
    <h2
      
      class:year1
      on:mouseenter={() => {
        // console.log("enter", navigating);
        if (!navigating) {
          active = true;
          year1 = true;
        }
        slice1 = 0;
        slice2 = 1;
      }}
      on:mouseleave={() => {
        // console.log("leave", navigating);
        if (!navigating) {
          active = false;
          year1 = false;
        }
      }}
      on:click={simulateNavigation}
    >
      2021
    </h2>

    <h2
      
      class:year2
      on:mouseenter={() => {
        // console.log("enter", navigating);
        if (!navigating) {
          active = true;
          year2 = true;
        }
        slice1 = 1;
        slice2 = 13;
      }}
      on:mouseleave={() => {
        // console.log("leave", navigating);
        if (!navigating) {
          active = false;
          year2 = false;
        }
      }}
      on:click={simulateNavigation}
    >
      2022
    </h2>

    <h2
      
      class:year3
      on:mouseenter={() => {
        // console.log("enter", navigating);
        if (!navigating) {
          active = true;
          year3 = true;
        }
        slice1 = 13;
        slice2 = 25;
      }}
      on:mouseleave={() => {
        // console.log("leave", navigating);
        if (!navigating) {
          active = false;
          year3 = false;
        }
      }}
      on:click={simulateNavigation}
    >
      2023
    </h2>

    <h2
      
      class:year4
      on:mouseenter={() => {
        // console.log("enter", navigating);
        if (!navigating) {
          active = true;
          year4 = true;
        }
        slice1 = 25;
        slice2 = 37;
      }}
      on:mouseleave={() => {
        // console.log("leave", navigating);
        if (!navigating) {
          active = false;
          year4 = false;
        }
      }}
      on:click={simulateNavigation}
    >
      2024
    </h2>

    <h2
      class:year5
      on:mouseenter={() => {
        // console.log("enter", navigating);
        if (!navigating) {
          active = true;
          year5 = true;
        }
        slice1 = 37;
        slice2 = 38;
      }}
      on:mouseleave={() => {
        // console.log("leave", navigating);
        if (!navigating) {
          active = false;
          year5 = false;
        }
      }}
      on:click={simulateNavigation}
    >
      2025
    </h2>

  </div>

  <div class="maps">
    <!-- <div>
      Active: {active}
      Navigating: {navigating}
    </div> -->

    <div class="heat-map">
      <div class="grid max-w-xl grid-cols-5 gap-0.5">
        <!-- {#each heatMap2.slice(0,1) as xaxis, i }
    {#each xaxis as heat}
      
      <div class="flex items-center justify-center child" 
      style="background-color: {getHeatmapColor(heat, min, max)}">{heat}</div>          
          
      {/each}
      
    {/each} -->
        <Heatmap {heatMap2} {slice1} {slice2} {min} {max} {active}/>
      </div>
    </div>
    
    <!-- 
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

    <div class="heat-map">
      <div class="grid max-w-xl grid-cols-5 gap-0.5">
        {#each heatMap2.slice(38,39) as xaxis, i }
          {#each xaxis as heat}
            
            <div class="flex items-center justify-center child" 
            style="background-color: {getHeatmapColor(heat, min, max)}">{heat}</div>          
                
            {/each}
            
          {/each}
      
      </div>
    </div> -->
  
  <!-- <div class="max-w-xl">
    {#if !isplant}
      <div class="flex items-end space-x-1">
        {#each plantTotals as value}
          <div class="w-12 bg-teal-400" style="height: {getSize(value)}" />
        {/each}
      </div>
      <div class="flex space-x-1">
        {#each plantKeys as interval}
          <div class="w-12 text-center">{interval}</div>
        {/each}
      </div>
    {:else}
      <div class="container">
        {#each monthlyTotals.slice(0, 1) as value, idx}
          <div class="flex items-center">{months[idx]}</div>
          <div class="h-12 bg-teal-400" style="width: {getSize(value)}" />
        {/each}
      </div>
    {/if}
  </div> -->

</div>
</div>





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
  /* .bg-teal-400{
    background: teal;
  } */

  .child {
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
  .parent {
    display: grid;
    grid-template-columns: 1fr 3fr;
  }
  .container {
    display: grid;
    grid-template-columns: 60px 1fr;
    grid-gap: 0.125rem;
  }
  .active {
    background: red;
  }
  .year1 {
    background: yellow;
  }
  .year2 {
    background: yellow;
  }
  .year3 {
    background: yellow;
  }
  .year4 {
    background: yellow;
  }
  .year5 {
    background: yellow;
  }
  .hoverbuttons{
    margin-top: 80px;
    margin-left: 70px;
  }
</style>
