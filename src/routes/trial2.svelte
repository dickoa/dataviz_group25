<script>
    // ---------------------------------------------------------- copy pasting all from prev version
    // ---------------------------------------------------------- 
    // ---------------------------------------------------------- 





    // ---------------------------------------------------------- end of copy pasting all from prev version
    // ---------------------------------------------------------- 
    // ---------------------------------------------------------- 


    // ---------------------------------------------------------- drop down box
    
        let selectedOption = 'general';
      
        function handleChange(event) {
          selectedOption = event.target.value;
        }
    // ---------------------------------------------------------- slider function
    let slider_value = 20;
      $: get_xy = function(idx) {
          let y = 25 + (Math.floor(idx / slider_value) * 50)
          let x = 25 + ((idx % slider_value) * 50)
          return [x,y]
      }
    // ---------------------------------------------------------- slider custom content
      let inventory_year_slider_value=0
      let monthsinventorylist=[ 'December 2021',    'January 2022',    'February 2022',    'March 2022',    'April 2022',
        'May 2022',    'June 2022',    'July 2022',    'August 2022',    'September 2022',    'October 2022',
        'November 2022',    'December 2022',    'January 2023',    'February 2023',    'March 2023',    'April 2023',
        'May 2023',    'June 2023',    'July 2023',    'August 2023',    'September 2023',    'October 2023',
        'November 2023',    'December 2023',    'January 2024']
    // ---------------------------------------------------------- general coordinates
    let general_midden=500
    // ---------------------------------------------------------- factory coordinates
    
     let fact_left=0
      let fact_floor=16
      let fact_lowceiling=8
      let fact_peak1=4
      let fact_highceiling=6
      let fact_peak2=8
      let fact_peak3=12
      let fact_right=20
      let fact_towerlowleft=15
      let fact_towerhighleft=16
      let fact_towertop=0
      let fact_towerhighright=18
      let fact_towerlowright=19
      let fact_0_factor=10
      let fact_1_factor=10
      let fact_2_factor=20
      let fact_3_factor=30
      let vendor_0_factor=10
      let vendor_1_factor=10
      let vendor_2_factor=10
      let vendor_3_factor=10
      let vendor_4_factor=10
      let vendor_5_factor=10
      let vendor_6_factor=10
    
    // ---------------------------------------------------------- shopping cart
    
      let shopping_factor=20
    
    // ---------------------------------------------------------- histogram
    
      let hist_scale=20
      let hist_scale_list=[ [20,5],[5,2.5],[10,5],[1,0.2],[5,5]    ]
      let plant_index=0
      let material_index=0
     let hist_start_x=60
     let hist_end_x=hist_start_x+400

    // ---------------------------------------------------------- sankey arrows
      let sankeyarrow0_upleft_x=0
      let sankeyarrow0_upleft_y=0
      let sankeyarrow0_upright_x=4
      let sankeyarrow0_upright_y=0
      let sankeyarrow0_downleft_x=0
      let sankeyarrow0_downleft_y=14
      let sankeyarrow0_downright_x=4
      let sankeyarrow0_downright_y=14
    
      let sankeyarrow1_upleft_x=4
      let sankeyarrow1_upleft_y=0
      let sankeyarrow1_upright_x=8
      let sankeyarrow1_upright_y=0
      let sankeyarrow1_downleft_x=0
      let sankeyarrow1_downleft_y=14
      let sankeyarrow1_downright_x=4
      let sankeyarrow1_downright_y=14
      let sankeyarrow2_upleft_x=0
      let sankeyarrow2_upleft_y=0
      let sankeyarrow2_upright_x=4
      let sankeyarrow2_upright_y=0
      let sankeyarrow2_downleft_x=0
      let sankeyarrow2_downleft_y=14
      let sankeyarrow2_downright_x=4
      let sankeyarrow2_downright_y=14
      let sankeyarrow3_upleft_x=0
      let sankeyarrow3_upleft_y=0
      let sankeyarrow3_upright_x=4
      let sankeyarrow3_upright_y=0
      let sankeyarrow3_downleft_x=4
      let sankeyarrow3_downleft_y=14
      let sankeyarrow3_downright_x=8
      let sankeyarrow3_downright_y=14
    
      let sankeyarrow0_factor=10 
      let sankeyarrow1_factor=1
      let sankeyarrow2_factor=1
      let sankeyarrow3_factor=1
    
    // ---------------------------------------------------------- distribution center 
    
      let floor=153
              let bottom=150
              let height=40
              let rooftop=0
              let roofmiddle=165
              let widestleft=0
              let wideleft=15
              let widestright=315
              let wideright=300
              let garageleft=0.9*wideleft
              let garageright=0.9*wideright
              let garagetop=0.9*height
              let garagedoor=0.8*height
              let housewidth=0
              let smallerbyfactor_plant0_car=1
    
    let smallerbyfactor_plant0_dc=1
    let smallerbyfactor_plant4_dc=1
    let smallerbyfactor_plant5_dc=1
    let smallerbyfactor_plant6_dc=1
    let smallerbyfactor_plant7_dc=1
    let smallerbyfactor_plant8_dc=1 
    
    
    
    // ---------------------------------------------------------- car coordinates

    let carleft=wideleft+1.1*housewidth
              let carright=wideleft+1.1*housewidth+housewidth/2
              let carbottom=bottom
              let cartop=bottom-(bottom-garagetop)*0.8
              let carunder=bottom-(bottom-garagetop)*0.2
              let carfront=carright+housewidth/4
              let carfrontabove=carright+housewidth/8
              let carfronttop=bottom-(bottom-garagetop)*0.6
              let smallerbyfactor_plant4_car=1
      let smallerbyfactor_plant5_car=1
      let smallerbyfactor_plant6_car=1
      let smallerbyfactor_plant7_car=1
      let smallerbyfactor_plant8_car=1

      let transformtotalcar0_x=0
      let transformtotalcar0_y=0
    // ---------------------------------------------------------- plotting batteries values
    let xposition = 0
      let ypositionindex = 0
      let yposition = 0
      let imagecounter=0
      let widthskip1=30
      let widthskip2=28
      let datapoint
      let index=0
      let index1=0
      const colorsinventory = ['red', 'orange', 'yellow', 'lightgreen', 'cyan'];
      const colorsinventorydark = ['#b71c1c', '#e65100', '#f57f17', '#33691e', '#006064'];
      const inventoryexpiration = [1,2,3,4,4,4,4,4,3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];

    
    // ---------------------------------------------------------- declare custom inventory values 
    

  let inv_shelf_mat1_sum=[];
  let inv_shelf_mat2_sum=[];
 


      let headers2 = [];
      let inv_indexnr= [];
      let inv_matkey= [];
      let inv_plantkey= [];
      let inv_plantmatkey= [];
      let inv_date= [];
      let inv_gross= [];
      let inv_shelf= [];
      let inv_trans= [];
    // ---------------------------------------------------------- load inventory values from csv
    import { onMount } from 'svelte';
    import { VERSION } from 'svelte/compiler';
      //import { csvParse } from 'd3-dsv'; // Importing CSV parsing function from d3-dsv
    
      let inventoryData = []; // Array to store inventory data
    
    
    
     let waarde;
    
    
      // Load inventory data on component mount
      onMount(async () => {
        try {
          // Fetch CSV file
          const response = await fetch('https://raw.githubusercontent.com/JannesPeeters/suncharge/main/data/Inventory.csv');
          if (!response.ok) {
            throw new Error('Failed to fetch inventory data');
          }
          
          // Parse CSV data
          const csvText = await response.text();
          const rows = csvText.split('\n').map(row => row.split(','));
    
    
    
          //for (let i = 0; i<rows.length;i++) {
        for (let i = 1; i<rows.length;i++) {
            // skip the first row because headers
            inv_indexnr[i-1]= rows[i][0];
            inv_matkey[i-1]= rows[i][1];
            inv_plantkey[i-1]= rows[i][2];
            inv_plantmatkey[i-1]=rows[i][3];
            inv_date[i-1]= rows[i][4];
            inv_gross[i-1]= parseInt(rows[i][5]);
            inv_shelf[i-1]= parseInt(rows[i][6]);
            inv_trans[i-1]= parseInt(rows[i][7]);
            if (i%10 === 1 ) {
              inv_shelf_mat1_sum[i-1]=0}
              else if (i%10 === 2) {
              inv_shelf_mat1_sum[i-1]=parseInt(Math.ceil(rows[i-1][6]/100))}
              else if (i%10 === 3) {
                inv_shelf_mat1_sum[i-1]=parseInt(Math.ceil(rows[i-1][6]/100))+parseInt(Math.ceil(rows[i-2][6]/100))}
                else if (i%10 === 4) {
                inv_shelf_mat1_sum[i-1]=parseInt(Math.ceil(rows[i-1][6]/100))+parseInt(Math.ceil(rows[i-2][6]/100))+parseInt(Math.ceil(rows[i-3][6]/100))}
                else if (i%10 === 5) {
                inv_shelf_mat1_sum[i-1]=parseInt(Math.ceil(rows[i-1][6]/100))+parseInt(Math.ceil(rows[i-2][6]/100))+parseInt(Math.ceil(rows[i-3][6]/100))+parseInt(Math.ceil(rows[i-4][6]/100))}
                else if (i%10 === 6) {
                inv_shelf_mat2_sum[i-1]=0}
                else if (i%10 === 7) {
                inv_shelf_mat2_sum[i-1]=parseInt(Math.ceil(rows[i-1][6]/100))}
                else if (i%10 === 8) {
                inv_shelf_mat2_sum[i-1]=parseInt(Math.ceil(rows[i-1][6]/100))+parseInt(Math.ceil(rows[i-2][6]/100))}
                else if (i%10 === 9) {
                inv_shelf_mat2_sum[i-1]=parseInt(Math.ceil(rows[i-1][6]/100))+parseInt(Math.ceil(rows[i-2][6]/100))+parseInt(Math.ceil(rows[i-3][6]/100))}
                else if (i%10 === 0) {
                inv_shelf_mat2_sum[i-1]=parseInt(Math.ceil(rows[i-1][6]/100))+parseInt(Math.ceil(rows[i-2][6]/100))+parseInt(Math.ceil(rows[i-3][6]/100))+parseInt(Math.ceil(rows[i-4][6]/100))}
        
                }
           
        for (let i = 0; i<rows[0].length;i++) {
            headers2[i]= rows[0][i];
    
    
                }
          //Accessing the value of the 3rd column and 5th row [inside onmount!]
          if (rows.length >= 5 && rows[4].length >= 3) {
           waarde = rows[4][2];
          } else {
           console.error('Insufficient data rows or columns');
          }
    
    
        } catch (error) {
          console.error(error);
        }
      });
    
    // ---------------------------------------------------------- functions to compute what to plot
    $: invspecificarree=[];
      function inventoryspecificarray(inventory_year_slider_value){
      invspecificarree=[];
      for (let i=0; i<5;i++){
        invspecificarree[i]=parseInt(Math.ceil(get_onshelf_value(inventory_year_slider_value,i+4,1)/100));
        }
    return invspecificarree
      }
    
      $: invspecificarreesum=[];
      $: dummy_invspecificarree = [];
      function inventoryspecificarraysum(inventory_year_slider_value){
      dummy_invspecificarree = [];
      invspecificarreesum=[];
      for (let i=0; i<5;i++){
        dummy_invspecificarree[i]=parseInt(Math.ceil(get_onshelf_value(inventory_year_slider_value,i+4,1)/100));
        }
        invspecificarreesum[0]=0;
        invspecificarreesum[1]=dummy_invspecificarree[0];
        invspecificarreesum[2]=dummy_invspecificarree[0]+dummy_invspecificarree[1];
        invspecificarreesum[3]=dummy_invspecificarree[0]+dummy_invspecificarree[1]+dummy_invspecificarree[2];
        invspecificarreesum[4]=dummy_invspecificarree[0]+dummy_invspecificarree[1]+dummy_invspecificarree[2]+dummy_invspecificarree[3];
    
    return invspecificarreesum
      }
    
    // inv2specificarrey and sum
    $: inv2specificarree=[];
      function inventory2specificarray(inventory_year_slider_value){
      inv2specificarree=[];
      for (let i=0; i<5;i++){
        inv2specificarree[i]=parseInt(Math.ceil(get_onshelf_value(inventory_year_slider_value,i+4,2)/100));
        }
    return inv2specificarree
      }
    
      $: inv2specificarreesum=[];
      $: dummy_inv2specificarree = [];
      function inventory2specificarraysum(inventory_year_slider_value){
      dummy_inv2specificarree = [];
      inv2specificarreesum=[];
      for (let i=0; i<5;i++){
        dummy_inv2specificarree[i]=parseInt(Math.ceil(get_onshelf_value(inventory_year_slider_value,i+4,2)/100));
        }
        inv2specificarreesum[0]=0;
        inv2specificarreesum[1]=dummy_inv2specificarree[0];
        inv2specificarreesum[2]=dummy_inv2specificarree[0]+dummy_inv2specificarree[1];
        inv2specificarreesum[3]=dummy_inv2specificarree[0]+dummy_inv2specificarree[1]+dummy_inv2specificarree[2];
        inv2specificarreesum[4]=dummy_inv2specificarree[0]+dummy_inv2specificarree[1]+dummy_inv2specificarree[2]+dummy_inv2specificarree[3];
    
    return inv2specificarreesum
      }
    
    
    // intransit1specificarray
    $: intr1specificarree=[];
      function intransit1specificarray(inventory_year_slider_value){
        intr1specificarree=[];
      for (let i=0; i<5;i++){
        intr1specificarree[i]=parseInt(Math.ceil(get_intransit_value(inventory_year_slider_value,i+4,1)/100));
        }
    return intr1specificarree
      }
    // intransit1specificarraysum
    $: intr1specificarreesum=[];
      $: dummy_intr1specificarree = [];
      function intransit1specificarraysum(inventory_year_slider_value){
        dummy_intr1specificarree = [];
        intr1specificarreesum=[];
      for (let i=0; i<5;i++){
        dummy_intr1specificarree[i]=parseInt(Math.ceil(get_intransit_value(inventory_year_slider_value,i+4,1)/100));
        }
        intr1specificarreesum[0]=0;
        intr1specificarreesum[1]=dummy_intr1specificarree[0];
        intr1specificarreesum[2]=dummy_intr1specificarree[0]+dummy_intr1specificarree[1];
        intr1specificarreesum[3]=dummy_intr1specificarree[0]+dummy_intr1specificarree[1]+dummy_intr1specificarree[2];
        intr1specificarreesum[4]=dummy_intr1specificarree[0]+dummy_intr1specificarree[1]+dummy_intr1specificarree[2]+dummy_intr1specificarree[3];
    
    return intr1specificarreesum
      }
    // intransit2 array and sum
    // intransit1specificarray
    $: intr2specificarree=[];
      function intransit2specificarray(inventory_year_slider_value){
        intr2specificarree=[];
      for (let i=0; i<5;i++){
        intr2specificarree[i]=parseInt(Math.ceil(get_intransit_value(inventory_year_slider_value,i+4,2)/100));
        }
    return intr2specificarree
      }
    // intransit1specificarraysum
    $: intr2specificarreesum=[];
      $: dummy_intr2specificarree = [];
      function intransit2specificarraysum(inventory_year_slider_value){
        dummy_intr2specificarree = [];
        intr2specificarreesum=[];
      for (let i=0; i<5;i++){
        dummy_intr2specificarree[i]=parseInt(Math.ceil(get_intransit_value(inventory_year_slider_value,i+4,2)/100));
        }
        intr2specificarreesum[0]=0;
        intr2specificarreesum[1]=dummy_intr2specificarree[0];
        intr2specificarreesum[2]=dummy_intr2specificarree[0]+dummy_intr2specificarree[1];
        intr2specificarreesum[3]=dummy_intr2specificarree[0]+dummy_intr2specificarree[1]+dummy_intr2specificarree[2];
        intr2specificarreesum[4]=dummy_intr2specificarree[0]+dummy_intr2specificarree[1]+dummy_intr2specificarree[2]+dummy_intr2specificarree[3];
    
    return intr2specificarreesum
      }
    
      function createarrayoflength(len) {
        let dummyarray=[];
        for (let i=0; i<len;i++){
          dummyarray[i]=0;
        }
        return dummyarray
      }
    
      function get_intransit_value(slider,warehouseno,matno) {
        let intransitval;
        intransitval=inv_trans[warehouseno-4+slider*10+(matno-1)*5];
        //console.log(`In transit values for slider ${slider}:`, intransitval);
        return parseInt(intransitval);
        }
    
      function get_onshelf_value(slider,warehouseno,matno) {
        let onshelfval;
        onshelfval=inv_shelf[warehouseno-4+slider*10+(matno-1)*5];
        //console.log(`On shelf values for slider ${slider}:`, onshelfval);
        return parseInt(onshelfval);
        }
    

//-------------------------------------------------------------------------------------------------hover code

  let mouseX = 0;
  let mouseY = 0;
  let rectangleBlue = '';
  let rectangleGreen = '';
  let rectangleYellow = '';
  let rectangleOrange= '';
  let rectangleRed = '';

  let rectangleColorSecondGroup = '';
let showRedRectangle = false
let showOrangeRectangle = false
let showYellowRectangle = false
let showGreenRectangle = false
let showBlueRectangle = false

  function handleMouseMove(event) {
    mouseX = event.clientX;
    mouseY = event.clientY;
  }

  
    // ---------------------------------------------------------------------------------------------------------- end of script 
    // ---------------------------------------------------------------------------------------------------------- end of script 
    // ---------------------------------------------------------------------------------------------------------- end of script 
    
    </script>



  

<br/>
<h2>Introduction</h2>
Welcome to the demonstration of the supply chain of the battery company Suncharge!<br/>
In this page you can investigate different stages along the supply chain. Among the interactive elements you fill find:
<ul>
      <li>A drop down box where you can choose between a general overview and a breakdown by plant.</li>
      <li>A warehouse and van with glyphs that allow you to inspect the inventory quantities in an attractive way. </li>
      <li>A slider that allows you to visualise the inventory by month. </li>
      <li>A hover functionality, that shows the histogram of the inventory over time of a plant when your mouse is on a glyph. </li>
      <li>The inventory section in the general overview is the most sophisticated part of this demonstration. It is a proof of concept that could be implemented for other sections of the supply chain as well. </li>
</ul>
<br/>
      <h3>Please select you preferred level of detail here </h3>
    The default is set to general.<br/>
      <select bind:value={selectedOption} on:change={handleChange}>
        <option value="">Select an option</option>
        <option value="general">General overview</option>
        <option value="split">Split by Distribution Centre</option>
      </select>
      <br/>
    
    
      {#if selectedOption === 'general'}
    
<h3>Worldmap of vendors </h3>
<p>In a future version, a worldmap would be encoded, showing the location of the vendors of the different materials. This will get the reader familiar with the components that go into the batteries and give an impression of the global complexity of the supply chain. </p>
    <svg width="1300" height="450">
        <g>
            <circle cx={500} cy={230} r={200} fill="white" stroke="black" stroke-width="3" />
            <text x={340} y={160} fill="black">Imagine worldmap of the vendors around here!</text>
        </g>


            { vendor_0_factor=10}
            <g transform="translate({general_midden-70}, {200})">
                <polygon points="
                {fact_left*vendor_0_factor},{fact_floor*vendor_0_factor} {fact_left*vendor_0_factor},{fact_lowceiling*vendor_0_factor} 
                {fact_peak1*vendor_0_factor},{fact_highceiling*vendor_0_factor} {fact_peak1*vendor_0_factor},{fact_lowceiling*vendor_0_factor} 
                {fact_peak2*vendor_0_factor},{fact_highceiling*vendor_0_factor} {fact_peak2*vendor_0_factor},{fact_lowceiling*vendor_0_factor} 
                {fact_peak3*vendor_0_factor},{fact_highceiling*vendor_0_factor} {fact_peak3*vendor_0_factor},{fact_lowceiling*vendor_0_factor} 
                {fact_right*vendor_0_factor},{fact_lowceiling*vendor_0_factor} 
                {fact_towerlowleft*vendor_0_factor},{fact_lowceiling*vendor_0_factor} {fact_towerhighleft*vendor_0_factor},{fact_towertop*vendor_0_factor} 
                {fact_towerhighright*vendor_0_factor},{fact_towertop*vendor_0_factor} {fact_towerlowright*vendor_0_factor},{fact_lowceiling*vendor_0_factor}
                {fact_towerlowleft*vendor_0_factor},{fact_lowceiling*vendor_0_factor}
                {fact_right*vendor_0_factor},{fact_lowceiling*vendor_0_factor}
                {fact_right*vendor_0_factor},{fact_floor*vendor_0_factor}
                {fact_left*vendor_0_factor},{fact_floor*vendor_0_factor}
                " fill="white" stroke="black" stroke-width="3"   />
              </g>
            <br/>
    

    </svg>
    <h3>Supply from vendors to the production plant.</h3>
   <p> Arrows towards the production plants would allow for encoding on the transportation time, where colours could indicate the sensitivity of that specific supply path to be disrupted for geopolitical reasons and based on the reliability of punctual deliveries with these suppliers in the past. Any weak link in the supply of raw materials should catch the eye immediately. </p>
   
        {sankeyarrow0_factor=10} 
        <svg width="1300" height="200">
        
            <g transform="translate({general_midden}, {10})">
    
                <polygon points=" {sankeyarrow0_upleft_x*sankeyarrow0_factor} {sankeyarrow0_upleft_y*sankeyarrow0_factor}
                {sankeyarrow0_upright_x*sankeyarrow0_factor} {sankeyarrow0_upright_y*sankeyarrow0_factor}
                {sankeyarrow0_downright_x*sankeyarrow0_factor} {sankeyarrow0_downleft_y*sankeyarrow0_factor}
            
                {sankeyarrow0_downleft_x*sankeyarrow0_factor} {sankeyarrow0_downleft_y*sankeyarrow0_factor}
                {sankeyarrow0_upleft_x*sankeyarrow0_factor} {sankeyarrow0_upleft_y*sankeyarrow0_factor}
              " fill="white" stroke="black" stroke-width="3"   />
            </g>
        </svg>
        <br/>

        <h3>Production plants </h3>
        <p>In a future version, quantitative information on the three production plant could be encoded here. </p>    
    
        <svg width="1300" height="200">
            { fact_0_factor=10}
            <g transform="translate({general_midden-70}, {10})">
                <polygon points="
                {fact_left*fact_0_factor},{fact_floor*fact_0_factor} {fact_left*fact_0_factor},{fact_lowceiling*fact_0_factor} 
                {fact_peak1*fact_0_factor},{fact_highceiling*fact_0_factor} {fact_peak1*fact_0_factor},{fact_lowceiling*fact_0_factor} 
                {fact_peak2*fact_0_factor},{fact_highceiling*fact_0_factor} {fact_peak2*fact_0_factor},{fact_lowceiling*fact_0_factor} 
                {fact_peak3*fact_0_factor},{fact_highceiling*fact_0_factor} {fact_peak3*fact_0_factor},{fact_lowceiling*fact_0_factor} 
                {fact_right*fact_0_factor},{fact_lowceiling*fact_0_factor} 
                {fact_towerlowleft*fact_0_factor},{fact_lowceiling*fact_0_factor} {fact_towerhighleft*fact_0_factor},{fact_towertop*fact_0_factor} 
                {fact_towerhighright*fact_0_factor},{fact_towertop*fact_0_factor} {fact_towerlowright*fact_0_factor},{fact_lowceiling*fact_0_factor}
                {fact_towerlowleft*fact_0_factor},{fact_lowceiling*fact_0_factor}
                {fact_right*fact_0_factor},{fact_lowceiling*fact_0_factor}
                {fact_right*fact_0_factor},{fact_floor*fact_0_factor}
                {fact_left*fact_0_factor},{fact_floor*fact_0_factor}
                " fill="white" stroke="black" stroke-width="3"   />
              </g>
            </svg>
            <br/>


                <h3>Purchases from production plants to distribution centres. </h3>
                <p>In a future version, quantitative information on the supply from the production plants to the distribution centres could be encoded here. There is a clear relationship between delays and specific combinations of plants and distribution centres. The layout of the lines connecting them should clearly draw attention to these deficiencies in this step of the supply chain.</p>                
              

            <svg width="1300" height="200">
                {sankeyarrow0_factor=10} 
                <g transform="translate({general_midden}, {10})">
        
                    <polygon points=" {sankeyarrow0_upleft_x*sankeyarrow0_factor} {sankeyarrow0_upleft_y*sankeyarrow0_factor}
                    {sankeyarrow0_upright_x*sankeyarrow0_factor} {sankeyarrow0_upright_y*sankeyarrow0_factor}
                    {sankeyarrow0_downright_x*sankeyarrow0_factor} {sankeyarrow0_downleft_y*sankeyarrow0_factor}
                
                    {sankeyarrow0_downleft_x*sankeyarrow0_factor} {sankeyarrow0_downleft_y*sankeyarrow0_factor}
                    {sankeyarrow0_upleft_x*sankeyarrow0_factor} {sankeyarrow0_upleft_y*sankeyarrow0_factor}
                  " fill="white" stroke="black" stroke-width="3"   />
                </g>
            </svg>
            <br/>
    <!--------------------------------------------------------------------------------------------------------------------------->
    <h3>In transit and on shelf inventory </h3>
    <ul>
        <li>The slider allows you to choose a month between December 2021 and January 2024. </li>
        <li>The corresponding amount of batteries in transit between the production plants and distribution centres will be shown in the van. </li>
        <li>The total number of batteries on the shelf is shown in the distribution centre. </li>
        <li>The fullness of the battery shows how close the stock is to optimal in shelf quantities. In this current version, the 'optimalness' is hardcoded using a dummy array, based on the hypothesis that both very empty and overfull on shelf inventories are correlated with delays in the supply chain. To fully implement this, this would require one to combine information on planned and realistic arrival dates from 'Purchases' to on shelf inventory quantities from 'Inventory', and then build a predictive model that feeds into the glyphs.  </li>
        <li>Upon hovering on the battery glyphs, a histogram shows up with the breakdown of the in transit and on shelf inventory of the corresponding plant over the whole period. Note that the vertical axis is flexible, which has the advantage that the full area of the graphic item is used, but has the downside that the difference in size of plant 4 and plant 7 is less obvious on first glance in the histograms. However, this contrast should still be clear from the glyphs in the distribution centre. </li>
        <li>In an expanded version, the same slider, van and distribution centre and glyphs could be used to show the data in Forecast. It is recommended to use more faded tones for predictions to emphasise that these data are hypothetical. </li>
  </ul>
                

            <input type="range" min="0" max="25" bind:value={inventory_year_slider_value} /><br/>
            The selected month is {monthsinventorylist[inventory_year_slider_value]}<br/>
            Legend:<br/>

            <svg width="430" height="200">
        <rect x="10" y="10" width="20" height="30" stroke="black" fill={colorsinventory[0]} stroke-width="1" />
        <rect x="15" y="8" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
        <rect x="10" y="45" width="20" height="30" stroke="black" fill={colorsinventory[1]} stroke-width="1" />
        <rect x="15" y="43" width="8" height="2" stroke="black" fill="black" stroke-width="1" />

        <rect x="10" y="80" width="20" height="30" stroke="black" fill={colorsinventory[2]} stroke-width="1" />
        <rect x="15" y="78" width="8" height="2" stroke="black" fill="black" stroke-width="1" />

        <rect x="10" y="115" width="20" height="30" stroke="black" fill={colorsinventory[3]} stroke-width="1" />
        <rect x="15" y="113" width="8" height="2" stroke="black" fill="black" stroke-width="1" />

        <rect x="10" y="150" width="20" height="30" stroke="black" fill={colorsinventory[4]} stroke-width="1" />
        <rect x="15" y="148" width="8" height="2" stroke="black" fill="black" stroke-width="1" />

        <text x="40" y="30" fill="black"> 100 batteries in transit to or stored in distribution centre 4</text>
        <text x="40" y="65" fill="black"> 100 batteries in transit to or stored in distribution centre 5</text>
        <text x="40" y="100" fill="black"> 100 batteries in transit to or stored in distribution centre 6</text>
        <text x="40" y="135" fill="black"> 100 batteries in transit to or stored in distribution centre 7</text>
        <text x="40" y="170" fill="black"> 100 batteries in transit to or stored in distribution centre 8</text>

            </svg>
            
    <!--------------------------------------------------------------------------------------------------------------------------->
    <svg width="900" height="220">
      {floor=297}{bottom=290}{height=80}{rooftop=10}{widestleft=3}{wideleft=15}
    {widestright=497}{wideright=485}{roofmiddle=(widestright-widestleft)/2.}
    {housewidth=wideright-wideleft}{garageleft=wideleft+0.1*housewidth}
    {garageright=wideright-0.1*housewidth}{garagetop=1.1*height}
    {garagedoor=1.2*height}{carleft=wideleft+0.95*housewidth}
    {carright=wideleft+0.95*housewidth+housewidth/2}{carbottom=bottom*1.05}
    {cartop=bottom*1.05-(bottom-garagetop)*0.8}{carunder=bottom*1.05-(bottom-garagetop)*0.15}
    {carfront=carright+housewidth/4}{carfrontabove=carright+housewidth/8}
    {carfronttop=bottom*1.05-(bottom-garagetop)*0.6}
    {transformtotalcar0_x=-400}
    {transformtotalcar0_y=-110}

    <g>
        <text x="80" y="20" fill="black"> In transit from plant to DC </text>  
    </g>
    <g transform="translate({transformtotalcar0_x}, {transformtotalcar0_y})">
        <!-- Define car lengths -->

      <polygon points="
      {carleft},{carunder} {carright},{carunder} {carright},{carfronttop} {carfrontabove},{carfronttop} 
      {carfront},{carunder} {carfront},{carbottom} {carleft},{carbottom} {carleft},{cartop} {carright},{cartop}
      {carright},{carbottom} {carright},{carunder} {carleft},{carunder}
      " fill="white" stroke="black" stroke-width="3"   />
      <!-- Define car window -->
      <polygon points=" 
      {carright*1.02},{carfronttop*1.1} {carfrontabove*0.99},{carfronttop*1.1} 
      {carfront*0.95},{carunder*0.88} {carright*1.02},{carunder*0.88}
      " fill="white" stroke="black" stroke-width="3"   />
      <!-- Define car wheels -->
      <circle cx={wideleft+1.05*housewidth} cy={carbottom} r="23" fill="white" stroke="black" stroke-width="3" />
      <circle cx={wideleft+1.55*housewidth} cy={carbottom} r="23" fill="white" stroke="black" stroke-width="3" />
    </g>
    
    {#each intransit1specificarray(inventory_year_slider_value) as datapoint, index1}
    {#each createarrayoflength(datapoint) as _, index}

    {#if index1===0}
    <g transform="translate({transformtotalcar0_x+
      carleft*0.995+20 + ((intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2 ) 
      - (8*widthskip2) * Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2))}, {transformtotalcar0_y+carunder*0.99-20-(Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2)))*35})"
      > 
      <rect x="-4" y="-18" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
      <rect x="-10" y="-15" width="20" height="29" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showRedRectangle = true} on:mouseleave={() => showRedRectangle = false}/> 
      <rect x="-6" y={11-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showRedRectangle = true} on:mouseleave={() => showRedRectangle = false}/> 
    </g>
    {/if}

    {#if index1===1}
    <g transform="translate({transformtotalcar0_x+
      carleft*0.995+20 + ((intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2 ) 
      - (8*widthskip2) * Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2))}, {transformtotalcar0_y+carunder*0.99-20-(Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2)))*35})"
      > 
      <rect x="-4" y="-18" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
      <rect x="-10" y="-15" width="20" height="29" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showOrangeRectangle = true} on:mouseleave={() => showOrangeRectangle = false}/> 
      <rect x="-6" y={11-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showOrangeRectangle = true} on:mouseleave={() => showOrangeRectangle = false}/> 
    </g>
    {/if}
    {#if index1===2}
    <g transform="translate({transformtotalcar0_x+
      carleft*0.995+20 + ((intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2 ) 
      - (8*widthskip2) * Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2))}, {transformtotalcar0_y+carunder*0.99-20-(Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2)))*35})"
      > 
      <rect x="-4" y="-18" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
      <rect x="-10" y="-15" width="20" height="29" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showYellowRectangle = true} on:mouseleave={() => showYellowRectangle = false}/> 
      <rect x="-6" y={11-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showYellowRectangle = true} on:mouseleave={() => showYellowRectangle = false}/> 
    </g>
    {/if}
    {#if index1===3}
    <g transform="translate({transformtotalcar0_x+
      carleft*0.995+20 + ((intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2 ) 
      - (8*widthskip2) * Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2))}, {transformtotalcar0_y+carunder*0.99-20-(Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2)))*35})"
      > 
      <rect x="-4" y="-18" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
      <rect x="-10" y="-15" width="20" height="29" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showGreenRectangle = true} on:mouseleave={() => showGreenRectangle = false}/> 
      <rect x="-6" y={11-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showGreenRectangle = true} on:mouseleave={() => showGreenRectangle = false}/> 
    </g>
    {/if}

    {#if index1===4}
    <g transform="translate({transformtotalcar0_x+
      carleft*0.995+20 + ((intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2 ) 
      - (8*widthskip2) * Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2))}, {transformtotalcar0_y+carunder*0.99-20-(Math.floor(((20 + (intransit1specificarraysum(inventory_year_slider_value)[index1]+index)* widthskip2))/(8*widthskip2)))*35})"
      > 
      <rect x="-4" y="-18" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
      <rect x="-10" y="-15" width="20" height="29" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showBlueRectangle = true} on:mouseleave={() => showBlueRectangle = false}/> 
      <rect x="-6" y={11-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
      role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showBlueRectangle = true} on:mouseleave={() => showBlueRectangle = false}/> 
    </g>
    {/if}
    {/each}
    {/each}
    
    </svg>


    <!--------------------------------------------------------------------------------------------------------------------------->
    <br/>
    <svg width="380" height="350">
        <g transform="translate({0},{0})">
                  <rect x="10" y="10" width="20" height="30" stroke="black" fill={colorsinventory[0]} stroke-width="1" />
      <rect x="15" y="8" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
      <rect x="14" y={35-5*inventoryexpiration[0]} width="12" height={5*inventoryexpiration[0]} stroke="black" fill={colorsinventorydark[0]} stroke-width="0.5" />
      <text x="40" y="30" fill="black"> Extremely low or overfull inventory </text>

    </g>
    <g transform="translate({0},{40})">
        <rect x="10" y="10" width="20" height="30" stroke="black" fill={colorsinventory[0]} stroke-width="1" />
<rect x="15" y="8" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
<rect x="14" y={35-5*inventoryexpiration[1]} width="12" height={5*inventoryexpiration[1]} stroke="black" fill={colorsinventorydark[0]} stroke-width="0.5" />
<text x="40" y="30" fill="black"> Rather low or overfull inventory </text>

</g>

<g transform="translate({0},{80})">
    <rect x="10" y="10" width="20" height="30" stroke="black" fill={colorsinventory[0]} stroke-width="1" />
<rect x="15" y="8" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
<rect x="14" y={35-5*inventoryexpiration[2]} width="12" height={5*inventoryexpiration[2]} stroke="black" fill={colorsinventorydark[0]} stroke-width="0.5" />
<text x="40" y="30" fill="black"> Close to optimal stocking in inventory </text>

</g>

<g transform="translate({0},{120})">
    <rect x="10" y="10" width="20" height="30" stroke="black" fill={colorsinventory[0]} stroke-width="1" />
<rect x="15" y="8" width="8" height="2" stroke="black" fill="black" stroke-width="1" />
<rect x="14" y={35-5*inventoryexpiration[3]} width="12" height={5*inventoryexpiration[3]} stroke="black" fill={colorsinventorydark[0]} stroke-width="0.5" />
<text x="40" y="30" fill="black"> Optimal stocking in inventory </text>

</g>
    </svg>
      
    <svg width="500" height="350">


      <g>
        <polygon points="
        {wideleft},{height} {roofmiddle},{rooftop} {wideright},{height} {wideright},{bottom} {widestright},{bottom} 
        {widestright},{floor}, {widestleft},{floor}, {widestleft},{bottom} {wideleft},{bottom} {wideleft},{height} 
        {wideleft},{bottom} {wideright},{bottom} 
        {garageright},{bottom} {garageright},{garagetop} {garageleft},{garagetop} 
        {garageleft},{garagedoor} {garageright},{garagedoor} {garageleft},{garagedoor} {garageleft},{bottom}
        {wideleft},{bottom}
        " fill="none" stroke="black" stroke-width="3"   />
        </g>
    
        {#each inventoryspecificarray(inventory_year_slider_value) as datapoint, index1}
        {#if index1 === 0}
        <g > 
          <rect x={garageleft*1.03} y={garagedoor*1.02} width={(garageright-garageleft)*0.99} height={(bottom-garagedoor)*0.98} stroke="none" fill={"white"} stroke-width="1" />
          </g>
        {/if}
    


        {#each createarrayoflength(datapoint) as _, index}
        {imagecounter=inventoryspecificarraysum(inventory_year_slider_value)[index1]+index}


        {#if index1===0}
        <g transform="translate(
          {garageleft+20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index )* widthskip1- (12*widthskip1) *
           ( Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1))  )}, 
           {bottom-20-(Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1)))*35}
           )"> 

           <rect x="-4" y="-18" width="8" height="3" stroke="black" fill="black" stroke-width="1" />
            <rect x="-10" y="-15" width="20" height="27" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showRedRectangle = true} on:mouseleave={() => showRedRectangle = false}/> 
            <rect x="-6" y={9-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showRedRectangle = true} on:mouseleave={() => showRedRectangle = false}/> 
        </g>
        {/if}


        {#if index1===1}
        <g transform="translate(
          {garageleft+20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index )* widthskip1- (12*widthskip1) *
           ( Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1))  )}, 
           {bottom-20-(Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1)))*35}
           )"> 

           <rect x="-4" y="-18" width="8" height="3" stroke="black" fill="black" stroke-width="1" />
            <rect x="-10" y="-15" width="20" height="27" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showOrangeRectangle = true} on:mouseleave={() => showOrangeRectangle = false}/> 
            <rect x="-6" y={9-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showOrangeRectangle = true} on:mouseleave={() => showOrangeRectangle = false}/> 
        </g>
        {/if}
        {#if index1===2}
        <g transform="translate(
          {garageleft+20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index )* widthskip1- (12*widthskip1) *
           ( Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1))  )}, 
           {bottom-20-(Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1)))*35}
           )"> 

           <rect x="-4" y="-18" width="8" height="3" stroke="black" fill="black" stroke-width="1" />
            <rect x="-10" y="-15" width="20" height="27" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showYellowRectangle = true} on:mouseleave={() => showYellowRectangle = false}/> 
            <rect x="-6" y={9-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showYellowRectangle = true} on:mouseleave={() => showYellowRectangle = false}/> 
        </g>
        {/if}


        {#if index1===3}
        <g transform="translate(
          {garageleft+20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index )* widthskip1- (12*widthskip1) *
           ( Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1))  )}, 
           {bottom-20-(Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1)))*35}
           )"> 

           <rect x="-4" y="-18" width="8" height="3" stroke="black" fill="black" stroke-width="1" />
            <rect x="-10" y="-15" width="20" height="27" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showGreenRectangle = true} on:mouseleave={() => showGreenRectangle = false}/> 
            <rect x="-6" y={9-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showGreenRectangle = true} on:mouseleave={() => showGreenRectangle = false}/> 
        </g>
        {/if}

        {#if index1===4}
        <g transform="translate(
          {garageleft+20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index )* widthskip1- (12*widthskip1) *
           ( Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1))  )}, 
           {bottom-20-(Math.floor((20 + (inventoryspecificarraysum(inventory_year_slider_value)[index1]+index)* widthskip1)/(12*widthskip1)))*35}
           )"> 

           <rect x="-4" y="-18" width="8" height="3" stroke="black" fill="black" stroke-width="1" />
            <rect x="-10" y="-15" width="20" height="27" stroke="black" fill={colorsinventory[index1]} stroke-width="1" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showBlueRectangle = true} on:mouseleave={() => showBlueRectangle = false}/> 
            <rect x="-6" y={9-5*inventoryexpiration[index]} width="12" height={5*inventoryexpiration[index]} stroke="black" fill={colorsinventorydark[index1]} stroke-width="0.5" 
            role="button" aria-label="Circle" tabindex="0" on:mouseenter={() => showBlueRectangle = true} on:mouseleave={() => showBlueRectangle = false}/> 
        </g>
        {/if}
        {/each}
    {/each}
    
    <g>
        <text x="110" y="80" fill="black"> On shelf inventory in distribution centres </text>  
    </g>
      </svg>

    <!--------------------------------------------------------------------------------------showing the histogram-->


    {#if showRedRectangle}
    <svg width="600" height="270">
      <line  x1={hist_start_x} y1={205} x2={hist_end_x} y2={205} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={205} x2={hist_start_x} y2={0} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={175} x2={hist_end_x} y2={175} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={150} x2={hist_end_x} y2={150} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={125} x2={hist_end_x} y2={125} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={100} x2={hist_end_x} y2={100} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={75} x2={hist_end_x} y2={75} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={50} x2={hist_end_x} y2={50} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={25} x2={hist_end_x} y2={25} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+1*15+2} y1={0} x2={hist_start_x+1*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+13*15+2} y1={0} x2={hist_start_x+13*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+25*15+2} y1={0} x2={hist_start_x+25*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <text x={hist_start_x-25} y="180" fill="grey" style="font-size: 14px;" >{25*hist_scale_list[0][0]}</text>
      <text x={hist_start_x-32} y="155" fill="grey" style="font-size: 14px;"  >{50*hist_scale_list[0][0]}</text>
      <text x={hist_start_x-32} y="130" fill="grey" style="font-size: 14px;" >{75*hist_scale_list[0][0]}</text>
      <text x={hist_start_x-32} y="105" fill="grey" style="font-size: 14px;" >{100*hist_scale_list[0][0]}</text>
      <text x={hist_start_x-32} y="80" fill="grey" style="font-size: 14px;" >{125*hist_scale_list[0][0]}</text>
      <text x={hist_start_x-32} y="55" fill="grey" style="font-size: 14px;" >{150*hist_scale_list[0][0]}</text>
      <text x={hist_start_x-32} y="30" fill="grey" style="font-size: 14px;" >{175*hist_scale_list[0][0]}</text>
      <text x="200" y="260" fill="black" style="font-size: 20px;" >Date</text>
      <text x={hist_start_x+1*15+4} y="240" fill="grey" style="font-size: 14p;" >2022</text>
      <text x={hist_start_x+13*15+4} y="240" fill="grey" style="font-size: 14p;" >2023</text>
      <text x={hist_start_x+25*15+4} y="240" fill="grey" style="font-size: 14p;" >2024</text>
      {#each monthsinventorylist as datapoint, index1}
      <text x={hist_start_x+5+index1*15} y="220" fill="grey" style="font-size: 14p;" >{datapoint.charAt(0)}</text>
      {/each}
      <text x="20" y="130" fill="black" transform="rotate(-90, 20, 130)" style="font-size: 20px;" >Quantity</text>
      {#each monthsinventorylist as datapoint, index1}
       <g >     
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[4-4+index1*10+(0)*5]/hist_scale_list[0][0])} 
        width={10} height={parseInt(inv_shelf[4-4+index1*10+(0)*5]/hist_scale_list[0][material_index])} 
        stroke="none" fill=#d32f2f stroke-width="1" />
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[4-4+index1*10+(0)*5]/hist_scale_list[0][0])-parseInt(inv_trans[4-4+index1*10+(0)*5]/hist_scale_list[0][0])-3} 
        width={10} height={parseInt(inv_trans[4-4+index1*10+(0)*5]/hist_scale_list[0][0])} 
        stroke="none" fill=#ef5350 stroke-width="1" />
    </g>
    {/each}
    </svg>
    {/if}

    {#if showOrangeRectangle}
    <svg width="600" height="270">
      <line  x1={hist_start_x} y1={205} x2={hist_end_x} y2={205} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={205} x2={hist_start_x} y2={0} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={175} x2={hist_end_x} y2={175} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={150} x2={hist_end_x} y2={150} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={125} x2={hist_end_x} y2={125} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={100} x2={hist_end_x} y2={100} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={75} x2={hist_end_x} y2={75} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={50} x2={hist_end_x} y2={50} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={25} x2={hist_end_x} y2={25} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+1*15+2} y1={0} x2={hist_start_x+1*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+13*15+2} y1={0} x2={hist_start_x+13*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+25*15+2} y1={0} x2={hist_start_x+25*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <text x={hist_start_x-25} y="180" fill="grey" style="font-size: 14px;" >{25*hist_scale_list[1][0]}</text>
      <text x={hist_start_x-32} y="155" fill="grey" style="font-size: 14px;"  >{50*hist_scale_list[1][0]}</text>
      <text x={hist_start_x-32} y="130" fill="grey" style="font-size: 14px;" >{75*hist_scale_list[1][0]}</text>
      <text x={hist_start_x-32} y="105" fill="grey" style="font-size: 14px;" >{100*hist_scale_list[1][0]}</text>
      <text x={hist_start_x-32} y="80" fill="grey" style="font-size: 14px;" >{125*hist_scale_list[1][0]}</text>
      <text x={hist_start_x-32} y="55" fill="grey" style="font-size: 14px;" >{150*hist_scale_list[1][0]}</text>
      <text x={hist_start_x-32} y="30" fill="grey" style="font-size: 14px;" >{175*hist_scale_list[1][0]}</text>
      <text x="200" y="260" fill="black" style="font-size: 20px;" >Date</text>
      <text x={hist_start_x+1*15+4} y="240" fill="grey" style="font-size: 14p;" >2022</text>
      <text x={hist_start_x+13*15+4} y="240" fill="grey" style="font-size: 14p;" >2023</text>
      <text x={hist_start_x+25*15+4} y="240" fill="grey" style="font-size: 14p;" >2024</text>
      {#each monthsinventorylist as datapoint, index1}
      <text x={hist_start_x+5+index1*15} y="220" fill="grey" style="font-size: 14p;" >{datapoint.charAt(0)}</text>
      {/each}
      <text x="20" y="130" fill="black" transform="rotate(-90, 20, 130)" style="font-size: 20px;" >Quantity</text>
      {#each monthsinventorylist as datapoint, index1}
       <g >     
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[5-4+index1*10+(0)*5]/hist_scale_list[1][0])} 
        width={10} height={parseInt(inv_shelf[5-4+index1*10+(0)*5]/hist_scale_list[1][0])} 
        stroke="none" fill=#f57c00 stroke-width="1" />
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[5-4+index1*10+(0)*5]/hist_scale_list[1][0])-parseInt(inv_trans[5-4+index1*10+(0)*5]/hist_scale_list[1][material_index])-3} 
        width={10} height={parseInt(inv_trans[5-4+index1*10+(0)*5]/hist_scale_list[1][0])} 
        stroke="none" fill=#ffa726 stroke-width="1" />
    </g>
    {/each}
    </svg>
    {/if}
    
    {#if showYellowRectangle}
    <svg width="600" height="270">
      <line  x1={hist_start_x} y1={205} x2={hist_end_x} y2={205} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={205} x2={hist_start_x} y2={0} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={175} x2={hist_end_x} y2={175} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={150} x2={hist_end_x} y2={150} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={125} x2={hist_end_x} y2={125} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={100} x2={hist_end_x} y2={100} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={75} x2={hist_end_x} y2={75} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={50} x2={hist_end_x} y2={50} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={25} x2={hist_end_x} y2={25} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+1*15+2} y1={0} x2={hist_start_x+1*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+13*15+2} y1={0} x2={hist_start_x+13*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+25*15+2} y1={0} x2={hist_start_x+25*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <text x={hist_start_x-25} y="180" fill="grey" style="font-size: 14px;" >{25*hist_scale_list[2][material_index]}</text>
      <text x={hist_start_x-32} y="155" fill="grey" style="font-size: 14px;"  >{50*hist_scale_list[2][material_index]}</text>
      <text x={hist_start_x-32} y="130" fill="grey" style="font-size: 14px;" >{75*hist_scale_list[2][material_index]}</text>
      <text x={hist_start_x-32} y="105" fill="grey" style="font-size: 14px;" >{100*hist_scale_list[2][material_index]}</text>
      <text x={hist_start_x-32} y="80" fill="grey" style="font-size: 14px;" >{125*hist_scale_list[2][material_index]}</text>
      <text x={hist_start_x-32} y="55" fill="grey" style="font-size: 14px;" >{150*hist_scale_list[2][material_index]}</text>
      <text x={hist_start_x-32} y="30" fill="grey" style="font-size: 14px;" >{175*hist_scale_list[2][material_index]}</text>
      <text x="200" y="260" fill="black" style="font-size: 20px;" >Date</text>
      <text x={hist_start_x+1*15+4} y="240" fill="grey" style="font-size: 14p;" >2022</text>
      <text x={hist_start_x+13*15+4} y="240" fill="grey" style="font-size: 14p;" >2023</text>
      <text x={hist_start_x+25*15+4} y="240" fill="grey" style="font-size: 14p;" >2024</text>
      {#each monthsinventorylist as datapoint, index1}
      <text x={hist_start_x+5+index1*15} y="220" fill="grey" style="font-size: 14p;" >{datapoint.charAt(0)}</text>
      {/each}
      <text x="20" y="130" fill="black" transform="rotate(-90, 20, 130)" style="font-size: 20px;" >Quantity</text>
      {#each monthsinventorylist as datapoint, index1}
       <g >     
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[6-4+index1*10+(0)*5]/hist_scale_list[2][material_index])} 
        width={10} height={parseInt(inv_shelf[6-4+index1*10+(0)*5]/hist_scale_list[2][material_index])} 
        stroke="none" fill=#fbc02d stroke-width="1" />
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[6-4+index1*10+(0)*5]/hist_scale_list[2][material_index])-parseInt(inv_trans[6-4+index1*10+(0)*5]/hist_scale_list[2][material_index])-3} 
        width={10} height={parseInt(inv_trans[6-4+index1*10+(0)*5]/hist_scale_list[2][material_index])} 
        stroke="none" fill=#ffee58 stroke-width="1" />
    </g>
    {/each}
    </svg>
    {/if}
    
    {#if showGreenRectangle}
    <svg width="600" height="270">
      <line  x1={hist_start_x} y1={205} x2={hist_end_x} y2={205} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={205} x2={hist_start_x} y2={0} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={175} x2={hist_end_x} y2={175} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={150} x2={hist_end_x} y2={150} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={125} x2={hist_end_x} y2={125} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={100} x2={hist_end_x} y2={100} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={75} x2={hist_end_x} y2={75} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={50} x2={hist_end_x} y2={50} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={25} x2={hist_end_x} y2={25} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+1*15+2} y1={0} x2={hist_start_x+1*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+13*15+2} y1={0} x2={hist_start_x+13*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+25*15+2} y1={0} x2={hist_start_x+25*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <text x={hist_start_x-25} y="180" fill="grey" style="font-size: 14px;" >{25*hist_scale_list[3][material_index]}</text>
      <text x={hist_start_x-32} y="155" fill="grey" style="font-size: 14px;"  >{50*hist_scale_list[3][material_index]}</text>
      <text x={hist_start_x-32} y="130" fill="grey" style="font-size: 14px;" >{75*hist_scale_list[3][material_index]}</text>
      <text x={hist_start_x-32} y="105" fill="grey" style="font-size: 14px;" >{100*hist_scale_list[3][material_index]}</text>
      <text x={hist_start_x-32} y="80" fill="grey" style="font-size: 14px;" >{125*hist_scale_list[3][material_index]}</text>
      <text x={hist_start_x-32} y="55" fill="grey" style="font-size: 14px;" >{150*hist_scale_list[3][material_index]}</text>
      <text x={hist_start_x-32} y="30" fill="grey" style="font-size: 14px;" >{175*hist_scale_list[3][material_index]}</text>
      <text x="200" y="260" fill="black" style="font-size: 20px;" >Date</text>
      <text x={hist_start_x+1*15+4} y="240" fill="grey" style="font-size: 14p;" >2022</text>
      <text x={hist_start_x+13*15+4} y="240" fill="grey" style="font-size: 14p;" >2023</text>
      <text x={hist_start_x+25*15+4} y="240" fill="grey" style="font-size: 14p;" >2024</text>
      {#each monthsinventorylist as datapoint, index1}
      <text x={hist_start_x+5+index1*15} y="220" fill="grey" style="font-size: 14p;" >{datapoint.charAt(0)}</text>
      {/each}
      <text x="20" y="130" fill="black" transform="rotate(-90, 20, 130)" style="font-size: 20px;" >Quantity</text>
      {#each monthsinventorylist as datapoint, index1}
       <g >     
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[7-4+index1*10+(0)*5]/hist_scale_list[3][material_index])} 
        width={10} height={parseInt(inv_shelf[7-4+index1*10+(0)*5]/hist_scale_list[3][material_index])} 
        stroke="none" fill=#689f38 stroke-width="1" />
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[7-4+index1*10+(0)*5]/hist_scale_list[3][material_index])-parseInt(inv_trans[7-4+index1*10+(0)*5]/hist_scale_list[3][material_index])-3} 
        width={10} height={parseInt(inv_trans[7-4+index1*10+(0)*5]/hist_scale_list[3][material_index])} 
        stroke="none" fill=#9ccc65 stroke-width="1" />
    </g>
    {/each}
    </svg>
    {/if}
    
    {#if showBlueRectangle}
    <svg width="600" height="270">
      <line  x1={hist_start_x} y1={205} x2={hist_end_x} y2={205} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={205} x2={hist_start_x} y2={0} stroke="black" stroke-width="1" />
      <line  x1={hist_start_x} y1={175} x2={hist_end_x} y2={175} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={150} x2={hist_end_x} y2={150} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={125} x2={hist_end_x} y2={125} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={100} x2={hist_end_x} y2={100} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={75} x2={hist_end_x} y2={75} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={50} x2={hist_end_x} y2={50} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x} y1={25} x2={hist_end_x} y2={25} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+1*15+2} y1={0} x2={hist_start_x+1*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+13*15+2} y1={0} x2={hist_start_x+13*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <line  x1={hist_start_x+25*15+2} y1={0} x2={hist_start_x+25*15+2} y2={240} stroke="lightgrey" stroke-width="1" />
      <text x={hist_start_x-25} y="180" fill="grey" style="font-size: 14px;" >{25*hist_scale_list[4][material_index]}</text>
      <text x={hist_start_x-32} y="155" fill="grey" style="font-size: 14px;"  >{50*hist_scale_list[4][material_index]}</text>
      <text x={hist_start_x-32} y="130" fill="grey" style="font-size: 14px;" >{75*hist_scale_list[4][material_index]}</text>
      <text x={hist_start_x-32} y="105" fill="grey" style="font-size: 14px;" >{100*hist_scale_list[4][material_index]}</text>
      <text x={hist_start_x-32} y="80" fill="grey" style="font-size: 14px;" >{125*hist_scale_list[4][material_index]}</text>
      <text x={hist_start_x-32} y="55" fill="grey" style="font-size: 14px;" >{150*hist_scale_list[4][material_index]}</text>
      <text x={hist_start_x-32} y="30" fill="grey" style="font-size: 14px;" >{175*hist_scale_list[4][material_index]}</text>
      <text x="200" y="260" fill="black" style="font-size: 20px;" >Date</text>
      <text x={hist_start_x+1*15+4} y="240" fill="grey" style="font-size: 14p;" >2022</text>
      <text x={hist_start_x+13*15+4} y="240" fill="grey" style="font-size: 14p;" >2023</text>
      <text x={hist_start_x+25*15+4} y="240" fill="grey" style="font-size: 14p;" >2024</text>
      {#each monthsinventorylist as datapoint, index1}
      <text x={hist_start_x+5+index1*15} y="220" fill="grey" style="font-size: 14p;" >{datapoint.charAt(0)}</text>
      {/each}
      <text x="20" y="130" fill="black" transform="rotate(-90, 20, 130)" style="font-size: 20px;" >Quantity</text>
      {#each monthsinventorylist as datapoint, index1}
       <g >     
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[8-4+index1*10+(0)*5]/hist_scale_list[4][material_index])} 
        width={10} height={parseInt(inv_shelf[8-4+index1*10+(0)*5]/hist_scale_list[4][material_index])} 
        stroke="none" fill=#0097a7 stroke-width="1" />
        <rect x={hist_start_x+5+index1*15} y={200-parseInt(inv_shelf[8-4+index1*10+(0)*5]/hist_scale_list[4][material_index])-parseInt(inv_trans[8-4+index1*10+(0)*5]/hist_scale_list[4][material_index])-3} 
        width={10} height={parseInt(inv_trans[8-4+index1*10+(0)*5]/hist_scale_list[4][material_index])} 
        stroke="none" fill=#26c6da stroke-width="1" />
    </g>
    {/each}
    </svg>
    {/if}
    <!--------------------------------------------------------------------------------------------------------------------------->
    
    <br/>
    <h3>From warehouse to sales</h3>
This arrow could encode information on the time it takes to process orders, namely the time it takes from items from the inventory to leave the distribution centre.
    <svg width="1300" height="200">
        {sankeyarrow0_factor=10} 

        <g transform="translate({general_midden}, {10})">
    
            <polygon points=" {sankeyarrow0_upleft_x*sankeyarrow0_factor} {sankeyarrow0_upleft_y*sankeyarrow0_factor}
            {sankeyarrow0_upright_x*sankeyarrow0_factor} {sankeyarrow0_upright_y*sankeyarrow0_factor}
            {sankeyarrow0_downright_x*sankeyarrow0_factor} {sankeyarrow0_downleft_y*sankeyarrow0_factor}
        
            {sankeyarrow0_downleft_x*sankeyarrow0_factor} {sankeyarrow0_downleft_y*sankeyarrow0_factor}
            {sankeyarrow0_upleft_x*sankeyarrow0_factor} {sankeyarrow0_upleft_y*sankeyarrow0_factor}
          " fill="white" stroke="black" stroke-width="3"   />
        </g>
    </svg>
    <br/>
    
    <h3>Sales quantities</h3>
The shopping cart could interactively encode information on the quantities of orders over time, similar to the information of the inventory.
    <svg width="1300" height="290">
        {shopping_factor=20} 

    <g transform="translate({300}, {10})">
    <polygon points="
    {0*shopping_factor},{0*shopping_factor}
    {2*shopping_factor},{0*shopping_factor}
    {2.7*shopping_factor},{2*shopping_factor}
    {16*shopping_factor},{2*shopping_factor}
    {13*shopping_factor},{9*shopping_factor}
    {5*shopping_factor},{9*shopping_factor}
    {2*shopping_factor},{0*shopping_factor}
    {5*shopping_factor},{9*shopping_factor}
    {6*shopping_factor},{11*shopping_factor}
    {13*shopping_factor},{11*shopping_factor}
    {6*shopping_factor},{11*shopping_factor}
    {6*shopping_factor},{11*shopping_factor}
    {5*shopping_factor},{9*shopping_factor}
    {2*shopping_factor},{0*shopping_factor}
    
    " fill="none" stroke="black" stroke-width="3"   />
    
    <circle cx={7*shopping_factor} cy={12.5*shopping_factor} r={shopping_factor} fill="white" stroke="black" stroke-width="3" />
    <circle cx={11*shopping_factor} cy={12.5*shopping_factor} r={shopping_factor} fill="white" stroke="black" stroke-width="3" />
    
    </g>
    
    </svg>
    <h3>From sales to delivery</h3>
    This arrow could encode information on the time it takes deliver orders from the moment that the products leave the distribution centres, to the moment that the customers confirm the receipt. This should help to troubleshoot inefficient matches between distribution centres and the geograhpical area that they cater to.  
        <svg width="1300" height="200">
            {sankeyarrow0_factor=10} 
    
            <g transform="translate({general_midden}, {10})">
        
                <polygon points=" {sankeyarrow0_upleft_x*sankeyarrow0_factor} {sankeyarrow0_upleft_y*sankeyarrow0_factor}
                {sankeyarrow0_upright_x*sankeyarrow0_factor} {sankeyarrow0_upright_y*sankeyarrow0_factor}
                {sankeyarrow0_downright_x*sankeyarrow0_factor} {sankeyarrow0_downleft_y*sankeyarrow0_factor}
            
                {sankeyarrow0_downleft_x*sankeyarrow0_factor} {sankeyarrow0_downleft_y*sankeyarrow0_factor}
                {sankeyarrow0_upleft_x*sankeyarrow0_factor} {sankeyarrow0_upleft_y*sankeyarrow0_factor}
              " fill="white" stroke="black" stroke-width="3"   />
            </g>
        </svg>
        <br/>

        <h3>Geographical distribution of customer</h3>
<p>This map could encode the geographical density of orders by the customers, by plotting dots with a level of transparency, similar to the flights map. A slider could be included to see the development of orders over time. The colour of the dots could encode orders that are structurally late. This should reveal any geographical or temporal correlation with late deliveries.</p>    
    <svg width="1300" height="450">
    <g>
    <circle cx={500} cy={230} r={200} fill="white" stroke="black" stroke-width="3" />
    <text x={320} y={230} fill="black">Imagine a map of the costumers around Europe here!</text>
    </g>
    </svg>
    
    
      {:else if selectedOption === 'split'}
        <!-- Display content for Split by Distribution Centre -->
        <p>This is the content for Split by Distribution Centre.</p>
    
        <svg width="1300" height="450">
          <g>
              <ellipse cx={500} cy={230} rx={480} ry={150} fill="white" stroke="black" stroke-width="3" />
              <text x={320} y={130} fill="black">Imagine worldmap of the vendors around here!</text>
            </g>
          {vendor_1_factor=5}
      
        <g transform="translate({50}, {160})">
          <polygon points="
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor} {fact_left*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak1*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak1*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak2*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak2*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak3*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak3*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor} {fact_towerhighleft*vendor_1_factor},{fact_towertop*vendor_1_factor} 
          {fact_towerhighright*vendor_1_factor},{fact_towertop*vendor_1_factor} {fact_towerlowright*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_floor*vendor_1_factor}
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor}
          " fill="white" stroke="black" stroke-width="3"   />
        </g>
        <g transform="translate({240}, {160})">
          <polygon points="
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor} {fact_left*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak1*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak1*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak2*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak2*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak3*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak3*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor} {fact_towerhighleft*vendor_1_factor},{fact_towertop*vendor_1_factor} 
          {fact_towerhighright*vendor_1_factor},{fact_towertop*vendor_1_factor} {fact_towerlowright*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_floor*vendor_1_factor}
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor}
          " fill="white" stroke="black" stroke-width="3"   />
        </g>
        <g transform="translate({430}, {160})">
          <polygon points="
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor} {fact_left*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak1*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak1*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak2*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak2*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak3*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak3*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor} {fact_towerhighleft*vendor_1_factor},{fact_towertop*vendor_1_factor} 
          {fact_towerhighright*vendor_1_factor},{fact_towertop*vendor_1_factor} {fact_towerlowright*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_floor*vendor_1_factor}
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor}
          " fill="white" stroke="black" stroke-width="3"   />
        </g>
        <g transform="translate({620}, {160})">
          <polygon points="
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor} {fact_left*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak1*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak1*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak2*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak2*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak3*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak3*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor} {fact_towerhighleft*vendor_1_factor},{fact_towertop*vendor_1_factor} 
          {fact_towerhighright*vendor_1_factor},{fact_towertop*vendor_1_factor} {fact_towerlowright*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_floor*vendor_1_factor}
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor}
          " fill="white" stroke="black" stroke-width="3"   />
        </g>
        <g transform="translate({810}, {160})">
          <polygon points="
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor} {fact_left*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak1*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak1*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak2*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak2*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_peak3*vendor_1_factor},{fact_highceiling*vendor_1_factor} {fact_peak3*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor} 
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor} {fact_towerhighleft*vendor_1_factor},{fact_towertop*vendor_1_factor} 
          {fact_towerhighright*vendor_1_factor},{fact_towertop*vendor_1_factor} {fact_towerlowright*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_towerlowleft*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_lowceiling*vendor_1_factor}
          {fact_right*vendor_1_factor},{fact_floor*vendor_1_factor}
          {fact_left*vendor_1_factor},{fact_floor*vendor_1_factor}
          " fill="white" stroke="black" stroke-width="3"   />
        </g>
        </svg>
      
      
      <svg width="1300" height="310">
      
        <polygon points=" 
        {80},{10} {100},{10}
         {570},{300} {550},{300}
        {80},{10}
      " fill="white" stroke="black" stroke-width="3"   />
      <polygon points=" 
      {280},{10} {300},{10}
       {570},{300} {550},{300}
      
      " fill="white" stroke="black" stroke-width="3"   />
      <polygon points=" 
      {480},{10} {500},{10}
      {570},{300} {550},{300}
      
      " fill="white" stroke="black" stroke-width="3"   />
      <polygon points=" 
      {680},{10} {700},{10}
      {570},{300} {550},{300}
      
      " fill="white" stroke="black" stroke-width="3"   />
      <polygon points=" 
      {880},{10} {900},{10}
      {570},{300} {550},{300}
      
      " fill="white" stroke="black" stroke-width="3"   />
      </svg>
      
      <svg width="1300" height="180">
          <g transform="translate({10+170}, {10})">
          <polygon points="
          {fact_left*fact_1_factor},{fact_floor*fact_1_factor} {fact_left*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_peak1*fact_1_factor},{fact_highceiling*fact_1_factor} {fact_peak1*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_peak2*fact_1_factor},{fact_highceiling*fact_1_factor} {fact_peak2*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_peak3*fact_1_factor},{fact_highceiling*fact_1_factor} {fact_peak3*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_right*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_towerlowleft*fact_1_factor},{fact_lowceiling*fact_1_factor} {fact_towerhighleft*fact_1_factor},{fact_towertop*fact_1_factor} 
          {fact_towerhighright*fact_1_factor},{fact_towertop*fact_1_factor} {fact_towerlowright*fact_1_factor},{fact_lowceiling*fact_1_factor}
          {fact_towerlowleft*fact_1_factor},{fact_lowceiling*fact_1_factor}
          {fact_right*fact_1_factor},{fact_lowceiling*fact_1_factor}
          {fact_right*fact_1_factor},{fact_floor*fact_1_factor}
          {fact_left*fact_1_factor},{fact_floor*fact_1_factor}
          " fill="white" stroke="black" stroke-width="3"   />
          </g>
          <g transform="translate({310+170}, {10})">
          <polygon points="
          {fact_left*fact_1_factor},{fact_floor*fact_1_factor} {fact_left*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_peak1*fact_1_factor},{fact_highceiling*fact_1_factor} {fact_peak1*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_peak2*fact_1_factor},{fact_highceiling*fact_1_factor} {fact_peak2*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_peak3*fact_1_factor},{fact_highceiling*fact_1_factor} {fact_peak3*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_right*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_towerlowleft*fact_1_factor},{fact_lowceiling*fact_1_factor} {fact_towerhighleft*fact_1_factor},{fact_towertop*fact_1_factor} 
          {fact_towerhighright*fact_1_factor},{fact_towertop*fact_1_factor} {fact_towerlowright*fact_1_factor},{fact_lowceiling*fact_1_factor}
          {fact_towerlowleft*fact_1_factor},{fact_lowceiling*fact_1_factor}
          {fact_right*fact_1_factor},{fact_lowceiling*fact_1_factor}
          {fact_right*fact_1_factor},{fact_floor*fact_1_factor}
          {fact_left*fact_1_factor},{fact_floor*fact_1_factor}
          " fill="white" stroke="black" stroke-width="3"   />
          </g>
          <g transform="translate({620+170}, {10})">
          <polygon points="
          {fact_left*fact_1_factor},{fact_floor*fact_1_factor} {fact_left*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_peak1*fact_1_factor},{fact_highceiling*fact_1_factor} {fact_peak1*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_peak2*fact_1_factor},{fact_highceiling*fact_1_factor} {fact_peak2*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_peak3*fact_1_factor},{fact_highceiling*fact_1_factor} {fact_peak3*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_right*fact_1_factor},{fact_lowceiling*fact_1_factor} 
          {fact_towerlowleft*fact_1_factor},{fact_lowceiling*fact_1_factor} {fact_towerhighleft*fact_1_factor},{fact_towertop*fact_1_factor} 
          {fact_towerhighright*fact_1_factor},{fact_towertop*fact_1_factor} {fact_towerlowright*fact_1_factor},{fact_lowceiling*fact_1_factor}
          {fact_towerlowleft*fact_1_factor},{fact_lowceiling*fact_1_factor}
          {fact_right*fact_1_factor},{fact_lowceiling*fact_1_factor}
          {fact_right*fact_1_factor},{fact_floor*fact_1_factor}
          {fact_left*fact_1_factor},{fact_floor*fact_1_factor}
          " fill="white" stroke="black" stroke-width="3"   />
          </g>
          </svg>
      
      {sankeyarrow1_factor=10} 
      <svg width="1300" height="200">
      
        <g transform="translate({150}, {10})">
      
          <polygon points=" {sankeyarrow1_upleft_x*sankeyarrow1_factor} {sankeyarrow1_upleft_y*sankeyarrow1_factor}
          {sankeyarrow1_upright_x*sankeyarrow1_factor} {sankeyarrow1_upright_y*sankeyarrow1_factor}
          {sankeyarrow1_downright_x*sankeyarrow1_factor} {sankeyarrow1_downleft_y*sankeyarrow1_factor}
      
          {sankeyarrow1_downleft_x*sankeyarrow1_factor} {sankeyarrow1_downleft_y*sankeyarrow1_factor}
          {sankeyarrow1_upleft_x*sankeyarrow1_factor} {sankeyarrow1_upleft_y*sankeyarrow1_factor}
        " fill="white" stroke="black" stroke-width="3"   />
      </g>
      
      <g transform="translate({300}, {10})">
       
        <polygon points=" 
        {sankeyarrow2_downright_x*sankeyarrow1_factor} {sankeyarrow2_downleft_y*sankeyarrow1_factor} 
        {sankeyarrow2_downleft_x*sankeyarrow1_factor} {sankeyarrow2_downleft_y*sankeyarrow1_factor} 
        {sankeyarrow2_upleft_x*sankeyarrow1_factor} {sankeyarrow2_upleft_y*sankeyarrow1_factor} 
        {sankeyarrow2_upright_x*sankeyarrow1_factor} {sankeyarrow2_upright_y*sankeyarrow1_factor} 
        " fill="white" stroke="black" stroke-width="3"   />
      
      </g>
      
      <g transform="translate({550}, {10})">
       
        <polygon points=" 
        {sankeyarrow2_downright_x*sankeyarrow1_factor} {sankeyarrow2_downleft_y*sankeyarrow1_factor} 
        {sankeyarrow2_downleft_x*sankeyarrow1_factor} {sankeyarrow2_downleft_y*sankeyarrow1_factor} 
        {sankeyarrow2_upleft_x*sankeyarrow1_factor} {sankeyarrow2_upleft_y*sankeyarrow1_factor} 
        {sankeyarrow2_upright_x*sankeyarrow1_factor} {sankeyarrow2_upright_y*sankeyarrow1_factor} 
        " fill="white" stroke="black" stroke-width="3"   />
      
      </g>
      <g transform="translate({780}, {10})">
      
        <polygon points=" {sankeyarrow1_upleft_x*sankeyarrow1_factor} {sankeyarrow1_upleft_y*sankeyarrow1_factor}
        {sankeyarrow1_upright_x*sankeyarrow1_factor} {sankeyarrow1_upright_y*sankeyarrow1_factor}
        {sankeyarrow1_downright_x*sankeyarrow1_factor} {sankeyarrow1_downleft_y*sankeyarrow1_factor}
      
        {sankeyarrow1_downleft_x*sankeyarrow1_factor} {sankeyarrow1_downleft_y*sankeyarrow1_factor}
        {sankeyarrow1_upleft_x*sankeyarrow1_factor} {sankeyarrow1_upleft_y*sankeyarrow1_factor}
      " fill="white" stroke="black" stroke-width="3"   />
      </g>
      <g transform="translate({900}, {10})">
      
        <polygon points=" 
        {sankeyarrow3_downright_x*sankeyarrow1_factor} {sankeyarrow3_downleft_y*sankeyarrow1_factor} 
        {sankeyarrow3_downleft_x*sankeyarrow1_factor} {sankeyarrow3_downleft_y*sankeyarrow1_factor} 
        {sankeyarrow3_upleft_x*sankeyarrow1_factor} {sankeyarrow3_upleft_y*sankeyarrow1_factor} 
        {sankeyarrow3_upright_x*sankeyarrow1_factor} {sankeyarrow3_upright_y*sankeyarrow1_factor} 
        " fill="white" stroke="black" stroke-width="3"   />
      </g>
      
      </svg>
      
      
        
      <svg width="1300" height="200">
        {smallerbyfactor_plant4_car=2}
      
        {floor=297}{bottom=290}{height=80}{rooftop=10}{widestleft=3}{wideleft=15}
        {widestright=497}{wideright=485}{roofmiddle=(widestright-widestleft)/2.}
        {housewidth=wideright-wideleft}{garageleft=wideleft+0.1*housewidth}
        {garageright=wideright-0.1*housewidth}{garagetop=1.1*height}
        {garagedoor=1.2*height}{carleft=wideleft+0.95*housewidth}
        {carright=wideleft+0.95*housewidth+housewidth/2}{carbottom=bottom*1.05}
        {cartop=bottom*1.05-(bottom-garagetop)*0.8}{carunder=bottom*1.05-(bottom-garagetop)*0.15}
        {carfront=carright+housewidth/4}{carfrontabove=carright+housewidth/8}
        {carfronttop=bottom*1.05-(bottom-garagetop)*0.6}
      

        <g transform="translate({-200}, {0})">
          
          <!-- Define car lengths -->
          <polygon points="
          {carleft/smallerbyfactor_plant4_car},{carunder/smallerbyfactor_plant4_car} {carright/smallerbyfactor_plant4_car},{carunder/smallerbyfactor_plant4_car} {carright/smallerbyfactor_plant4_car},{carfronttop/smallerbyfactor_plant4_car} {carfrontabove/smallerbyfactor_plant4_car},{carfronttop/smallerbyfactor_plant4_car} 
          {carfront/smallerbyfactor_plant4_car},{carunder/smallerbyfactor_plant4_car} {carfront/smallerbyfactor_plant4_car},{carbottom/smallerbyfactor_plant4_car} {carleft/smallerbyfactor_plant4_car},{carbottom/smallerbyfactor_plant4_car} {carleft/smallerbyfactor_plant4_car},{cartop/smallerbyfactor_plant4_car} {carright/smallerbyfactor_plant4_car},{cartop/smallerbyfactor_plant4_car}
          {carright/smallerbyfactor_plant4_car},{carbottom/smallerbyfactor_plant4_car} {carright/smallerbyfactor_plant4_car},{carunder/smallerbyfactor_plant4_car} {carleft/smallerbyfactor_plant4_car},{carunder/smallerbyfactor_plant4_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car window -->
          <polygon points=" 
          {carright*1.02/smallerbyfactor_plant4_car},{carfronttop*1.1/smallerbyfactor_plant4_car} {carfrontabove*0.99/smallerbyfactor_plant4_car},{carfronttop*1.1/smallerbyfactor_plant4_car} 
          {carfront*0.95/smallerbyfactor_plant4_car},{carunder*0.88/smallerbyfactor_plant4_car} {carright*1.02/smallerbyfactor_plant4_car},{carunder*0.88/smallerbyfactor_plant4_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car wheels -->
          <circle cx={(wideleft+1.05*housewidth)/smallerbyfactor_plant4_car} cy={carbottom/smallerbyfactor_plant4_car} r={23/smallerbyfactor_plant4_car} fill="white" stroke="black" stroke-width="3" />
          <circle cx={(wideleft+1.55*housewidth)/smallerbyfactor_plant4_car} cy={carbottom/smallerbyfactor_plant4_car} r={23/smallerbyfactor_plant4_car} fill="white" stroke="black" stroke-width="3" />
      
        </g>
      
        {smallerbyfactor_plant5_car=2.5}
        <g transform="translate({90}, {30})">
          
          <!-- Define car lengths -->
          <polygon points="
          {carleft/smallerbyfactor_plant5_car},{carunder/smallerbyfactor_plant5_car} {carright/smallerbyfactor_plant5_car},{carunder/smallerbyfactor_plant5_car} {carright/smallerbyfactor_plant5_car},{carfronttop/smallerbyfactor_plant5_car} {carfrontabove/smallerbyfactor_plant5_car},{carfronttop/smallerbyfactor_plant5_car} 
          {carfront/smallerbyfactor_plant5_car},{carunder/smallerbyfactor_plant5_car} {carfront/smallerbyfactor_plant5_car},{carbottom/smallerbyfactor_plant5_car} {carleft/smallerbyfactor_plant5_car},{carbottom/smallerbyfactor_plant5_car} {carleft/smallerbyfactor_plant5_car},{cartop/smallerbyfactor_plant5_car} {carright/smallerbyfactor_plant5_car},{cartop/smallerbyfactor_plant5_car}
          {carright/smallerbyfactor_plant5_car},{carbottom/smallerbyfactor_plant5_car} {carright/smallerbyfactor_plant5_car},{carunder/smallerbyfactor_plant5_car} {carleft/smallerbyfactor_plant5_car},{carunder/smallerbyfactor_plant5_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car window -->
          <polygon points=" 
          {carright*1.02/smallerbyfactor_plant5_car},{carfronttop*1.1/smallerbyfactor_plant5_car} {carfrontabove*0.99/smallerbyfactor_plant5_car},{carfronttop*1.1/smallerbyfactor_plant5_car} 
          {carfront*0.95/smallerbyfactor_plant5_car},{carunder*0.88/smallerbyfactor_plant5_car} {carright*1.02/smallerbyfactor_plant5_car},{carunder*0.88/smallerbyfactor_plant5_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car wheels -->
          <circle cx={(wideleft+1.05*housewidth)/smallerbyfactor_plant5_car} cy={carbottom/smallerbyfactor_plant5_car} r={23/smallerbyfactor_plant5_car} fill="white" stroke="black" stroke-width="3" />
          <circle cx={(wideleft+1.55*housewidth)/smallerbyfactor_plant5_car} cy={carbottom/smallerbyfactor_plant5_car} r={23/smallerbyfactor_plant5_car} fill="white" stroke="black" stroke-width="3" />
      
        </g>
      
        {smallerbyfactor_plant6_car=2}
        <g transform="translate({250}, {0})">
          
          <!-- Define car lengths -->
          <polygon points="
          {carleft/smallerbyfactor_plant6_car},{carunder/smallerbyfactor_plant6_car} {carright/smallerbyfactor_plant6_car},{carunder/smallerbyfactor_plant6_car} {carright/smallerbyfactor_plant6_car},{carfronttop/smallerbyfactor_plant6_car} {carfrontabove/smallerbyfactor_plant6_car},{carfronttop/smallerbyfactor_plant6_car} 
          {carfront/smallerbyfactor_plant6_car},{carunder/smallerbyfactor_plant6_car} {carfront/smallerbyfactor_plant6_car},{carbottom/smallerbyfactor_plant6_car} {carleft/smallerbyfactor_plant6_car},{carbottom/smallerbyfactor_plant6_car} {carleft/smallerbyfactor_plant6_car},{cartop/smallerbyfactor_plant6_car} {carright/smallerbyfactor_plant6_car},{cartop/smallerbyfactor_plant6_car}
          {carright/smallerbyfactor_plant6_car},{carbottom/smallerbyfactor_plant6_car} {carright/smallerbyfactor_plant6_car},{carunder/smallerbyfactor_plant6_car} {carleft/smallerbyfactor_plant6_car},{carunder/smallerbyfactor_plant6_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car window -->
          <polygon points=" 
          {carright*1.02/smallerbyfactor_plant6_car},{carfronttop*1.1/smallerbyfactor_plant6_car} {carfrontabove*0.99/smallerbyfactor_plant6_car},{carfronttop*1.1/smallerbyfactor_plant6_car} 
          {carfront*0.95/smallerbyfactor_plant6_car},{carunder*0.88/smallerbyfactor_plant6_car} {carright*1.02/smallerbyfactor_plant6_car},{carunder*0.88/smallerbyfactor_plant6_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car wheels -->
          <circle cx={(wideleft+1.05*housewidth)/smallerbyfactor_plant6_car} cy={carbottom/smallerbyfactor_plant6_car} r={23/smallerbyfactor_plant6_car} fill="white" stroke="black" stroke-width="3" />
          <circle cx={(wideleft+1.55*housewidth)/smallerbyfactor_plant6_car} cy={carbottom/smallerbyfactor_plant6_car} r={23/smallerbyfactor_plant6_car} fill="white" stroke="black" stroke-width="3" />
      
        </g>
      
        {smallerbyfactor_plant7_car=4}
        <g transform="translate({600}, {carbottom/smallerbyfactor_plant7_car})">
          
          <!-- Define car lengths -->
          <polygon points="
          {carleft/smallerbyfactor_plant7_car},{carunder/smallerbyfactor_plant7_car} {carright/smallerbyfactor_plant7_car},{carunder/smallerbyfactor_plant7_car} {carright/smallerbyfactor_plant7_car},{carfronttop/smallerbyfactor_plant7_car} {carfrontabove/smallerbyfactor_plant7_car},{carfronttop/smallerbyfactor_plant7_car} 
          {carfront/smallerbyfactor_plant7_car},{carunder/smallerbyfactor_plant7_car} {carfront/smallerbyfactor_plant7_car},{carbottom/smallerbyfactor_plant7_car} {carleft/smallerbyfactor_plant7_car},{carbottom/smallerbyfactor_plant7_car} {carleft/smallerbyfactor_plant7_car},{cartop/smallerbyfactor_plant7_car} {carright/smallerbyfactor_plant7_car},{cartop/smallerbyfactor_plant7_car}
          {carright/smallerbyfactor_plant7_car},{carbottom/smallerbyfactor_plant7_car} {carright/smallerbyfactor_plant7_car},{carunder/smallerbyfactor_plant7_car} {carleft/smallerbyfactor_plant7_car},{carunder/smallerbyfactor_plant7_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car window -->
          <polygon points=" 
          {carright*1.02/smallerbyfactor_plant7_car},{carfronttop*1.1/smallerbyfactor_plant7_car} {carfrontabove*0.99/smallerbyfactor_plant7_car},{carfronttop*1.1/smallerbyfactor_plant7_car} 
          {carfront*0.95/smallerbyfactor_plant7_car},{carunder*0.88/smallerbyfactor_plant7_car} {carright*1.02/smallerbyfactor_plant7_car},{carunder*0.88/smallerbyfactor_plant7_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car wheels -->
          <circle cx={(wideleft+1.05*housewidth)/smallerbyfactor_plant7_car} cy={carbottom/smallerbyfactor_plant7_car} r={23/smallerbyfactor_plant7_car} fill="white" stroke="black" stroke-width="3" />
          <circle cx={(wideleft+1.55*housewidth)/smallerbyfactor_plant7_car} cy={carbottom/smallerbyfactor_plant7_car} r={23/smallerbyfactor_plant7_car} fill="white" stroke="black" stroke-width="3" />
      
        </g>
        {smallerbyfactor_plant8_car=1.5}
        <g transform="translate({550}, {-50})">
          
          <!-- Define car lengths -->
          <polygon points="
          {carleft/smallerbyfactor_plant8_car},{carunder/smallerbyfactor_plant8_car} {carright/smallerbyfactor_plant8_car},{carunder/smallerbyfactor_plant8_car} {carright/smallerbyfactor_plant8_car},{carfronttop/smallerbyfactor_plant8_car} {carfrontabove/smallerbyfactor_plant8_car},{carfronttop/smallerbyfactor_plant8_car} 
          {carfront/smallerbyfactor_plant8_car},{carunder/smallerbyfactor_plant8_car} {carfront/smallerbyfactor_plant8_car},{carbottom/smallerbyfactor_plant8_car} {carleft/smallerbyfactor_plant8_car},{carbottom/smallerbyfactor_plant8_car} {carleft/smallerbyfactor_plant8_car},{cartop/smallerbyfactor_plant8_car} {carright/smallerbyfactor_plant8_car},{cartop/smallerbyfactor_plant8_car}
          {carright/smallerbyfactor_plant8_car},{carbottom/smallerbyfactor_plant8_car} {carright/smallerbyfactor_plant8_car},{carunder/smallerbyfactor_plant8_car} {carleft/smallerbyfactor_plant8_car},{carunder/smallerbyfactor_plant8_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car window -->
          <polygon points=" 
          {carright*1.02/smallerbyfactor_plant8_car},{carfronttop*1.1/smallerbyfactor_plant8_car} {carfrontabove*0.99/smallerbyfactor_plant8_car},{carfronttop*1.1/smallerbyfactor_plant8_car} 
          {carfront*0.95/smallerbyfactor_plant8_car},{carunder*0.88/smallerbyfactor_plant8_car} {carright*1.02/smallerbyfactor_plant8_car},{carunder*0.88/smallerbyfactor_plant8_car}
          " fill="white" stroke="black" stroke-width="3"   />
          <!-- Define car wheels -->
          <circle cx={(wideleft+1.05*housewidth)/smallerbyfactor_plant8_car} cy={carbottom/smallerbyfactor_plant8_car} r={23/smallerbyfactor_plant8_car} fill="white" stroke="black" stroke-width="3" />
          <circle cx={(wideleft+1.55*housewidth)/smallerbyfactor_plant8_car} cy={carbottom/smallerbyfactor_plant8_car} r={23/smallerbyfactor_plant8_car} fill="white" stroke="black" stroke-width="3" />
      
        </g>
      </svg> 
      
      <!--------------------------------------------------------------------------------------->
      
      <svg width="1300" height="200">
      
      
      
        <!-- Define house lengths -->
        <g transform="translate({0}, {0})">
      
          {smallerbyfactor_plant4_dc=2.5}
        <polygon points="
        {wideleft/smallerbyfactor_plant4_dc},{height/smallerbyfactor_plant4_dc} {roofmiddle/smallerbyfactor_plant4_dc},{rooftop/smallerbyfactor_plant4_dc} {wideright/smallerbyfactor_plant4_dc},{height/smallerbyfactor_plant4_dc} {wideright/smallerbyfactor_plant4_dc},{bottom/smallerbyfactor_plant4_dc} {widestright/smallerbyfactor_plant4_dc},{bottom/smallerbyfactor_plant4_dc} 
        {widestright/smallerbyfactor_plant4_dc},{floor/smallerbyfactor_plant4_dc}, {widestleft/smallerbyfactor_plant4_dc},{floor/smallerbyfactor_plant4_dc}, {widestleft/smallerbyfactor_plant4_dc},{bottom/smallerbyfactor_plant4_dc} {wideleft/smallerbyfactor_plant4_dc},{bottom/smallerbyfactor_plant4_dc} {wideleft/smallerbyfactor_plant4_dc},{height/smallerbyfactor_plant4_dc} 
        {wideleft/smallerbyfactor_plant4_dc},{bottom/smallerbyfactor_plant4_dc} {wideright/smallerbyfactor_plant4_dc},{bottom/smallerbyfactor_plant4_dc} 
        {garageright/smallerbyfactor_plant4_dc},{bottom/smallerbyfactor_plant4_dc} {garageright/smallerbyfactor_plant4_dc},{garagetop/smallerbyfactor_plant4_dc} {garageleft/smallerbyfactor_plant4_dc},{garagetop/smallerbyfactor_plant4_dc} 
        {garageleft/smallerbyfactor_plant4_dc},{garagedoor/smallerbyfactor_plant4_dc} {garageright/smallerbyfactor_plant4_dc},{garagedoor/smallerbyfactor_plant4_dc} {garageleft/smallerbyfactor_plant4_dc},{garagedoor/smallerbyfactor_plant4_dc} {garageleft/smallerbyfactor_plant4_dc},{bottom/smallerbyfactor_plant4_dc}
        {wideleft/smallerbyfactor_plant4_dc},{bottom/smallerbyfactor_plant4_dc}
        " fill="none" stroke="black" stroke-width="3"   />
      </g>
      <g transform="translate({250}, {0})">
        {smallerbyfactor_plant5_dc=2.5}
      <polygon points="
      {wideleft/smallerbyfactor_plant5_dc},{height/smallerbyfactor_plant5_dc} {roofmiddle/smallerbyfactor_plant5_dc},{rooftop/smallerbyfactor_plant5_dc} {wideright/smallerbyfactor_plant5_dc},{height/smallerbyfactor_plant5_dc} {wideright/smallerbyfactor_plant5_dc},{bottom/smallerbyfactor_plant5_dc} {widestright/smallerbyfactor_plant5_dc},{bottom/smallerbyfactor_plant5_dc} 
      {widestright/smallerbyfactor_plant5_dc},{floor/smallerbyfactor_plant5_dc}, {widestleft/smallerbyfactor_plant5_dc},{floor/smallerbyfactor_plant5_dc}, {widestleft/smallerbyfactor_plant5_dc},{bottom/smallerbyfactor_plant5_dc} {wideleft/smallerbyfactor_plant5_dc},{bottom/smallerbyfactor_plant5_dc} {wideleft/smallerbyfactor_plant5_dc},{height/smallerbyfactor_plant5_dc} 
      {wideleft/smallerbyfactor_plant5_dc},{bottom/smallerbyfactor_plant5_dc} {wideright/smallerbyfactor_plant5_dc},{bottom/smallerbyfactor_plant5_dc} 
      {garageright/smallerbyfactor_plant5_dc},{bottom/smallerbyfactor_plant5_dc} {garageright/smallerbyfactor_plant5_dc},{garagetop/smallerbyfactor_plant5_dc} {garageleft/smallerbyfactor_plant5_dc},{garagetop/smallerbyfactor_plant5_dc} 
      {garageleft/smallerbyfactor_plant5_dc},{garagedoor/smallerbyfactor_plant5_dc} {garageright/smallerbyfactor_plant5_dc},{garagedoor/smallerbyfactor_plant5_dc} {garageleft/smallerbyfactor_plant5_dc},{garagedoor/smallerbyfactor_plant5_dc} {garageleft/smallerbyfactor_plant5_dc},{bottom/smallerbyfactor_plant5_dc}
      {wideleft/smallerbyfactor_plant5_dc},{bottom/smallerbyfactor_plant5_dc}
      " fill="none" stroke="black" stroke-width="3"   />
      </g>
      <g transform="translate({470}, {0})">
      {smallerbyfactor_plant6_dc=2.5}
      <polygon points="
      {wideleft/smallerbyfactor_plant6_dc},{height/smallerbyfactor_plant6_dc} {roofmiddle/smallerbyfactor_plant6_dc},{rooftop/smallerbyfactor_plant6_dc} {wideright/smallerbyfactor_plant6_dc},{height/smallerbyfactor_plant6_dc} {wideright/smallerbyfactor_plant6_dc},{bottom/smallerbyfactor_plant6_dc} {widestright/smallerbyfactor_plant6_dc},{bottom/smallerbyfactor_plant6_dc} 
      {widestright/smallerbyfactor_plant6_dc},{floor/smallerbyfactor_plant6_dc}, {widestleft/smallerbyfactor_plant6_dc},{floor/smallerbyfactor_plant6_dc}, {widestleft/smallerbyfactor_plant6_dc},{bottom/smallerbyfactor_plant6_dc} {wideleft/smallerbyfactor_plant6_dc},{bottom/smallerbyfactor_plant6_dc} {wideleft/smallerbyfactor_plant6_dc},{height/smallerbyfactor_plant6_dc} 
      {wideleft/smallerbyfactor_plant6_dc},{bottom/smallerbyfactor_plant6_dc} {wideright/smallerbyfactor_plant6_dc},{bottom/smallerbyfactor_plant6_dc} 
      {garageright/smallerbyfactor_plant6_dc},{bottom/smallerbyfactor_plant6_dc} {garageright/smallerbyfactor_plant6_dc},{garagetop/smallerbyfactor_plant6_dc} {garageleft/smallerbyfactor_plant6_dc},{garagetop/smallerbyfactor_plant6_dc} 
      {garageleft/smallerbyfactor_plant6_dc},{garagedoor/smallerbyfactor_plant6_dc} {garageright/smallerbyfactor_plant6_dc},{garagedoor/smallerbyfactor_plant6_dc} {garageleft/smallerbyfactor_plant6_dc},{garagedoor/smallerbyfactor_plant6_dc} {garageleft/smallerbyfactor_plant6_dc},{bottom/smallerbyfactor_plant6_dc}
      {wideleft/smallerbyfactor_plant6_dc},{bottom/smallerbyfactor_plant6_dc}
      " fill="none" stroke="black" stroke-width="3"   />
      </g>
      {smallerbyfactor_plant7_dc=4}
      
      <g transform="translate({700}, {45})">
      <polygon points="
      {wideleft/smallerbyfactor_plant7_dc},{height/smallerbyfactor_plant7_dc} {roofmiddle/smallerbyfactor_plant7_dc},{rooftop/smallerbyfactor_plant7_dc} {wideright/smallerbyfactor_plant7_dc},{height/smallerbyfactor_plant7_dc} {wideright/smallerbyfactor_plant7_dc},{bottom/smallerbyfactor_plant7_dc} {widestright/smallerbyfactor_plant7_dc},{bottom/smallerbyfactor_plant7_dc} 
      {widestright/smallerbyfactor_plant7_dc},{floor/smallerbyfactor_plant7_dc}, {widestleft/smallerbyfactor_plant7_dc},{floor/smallerbyfactor_plant7_dc}, {widestleft/smallerbyfactor_plant7_dc},{bottom/smallerbyfactor_plant7_dc} {wideleft/smallerbyfactor_plant7_dc},{bottom/smallerbyfactor_plant7_dc} {wideleft/smallerbyfactor_plant7_dc},{height/smallerbyfactor_plant7_dc} 
      {wideleft/smallerbyfactor_plant7_dc},{bottom/smallerbyfactor_plant7_dc} {wideright/smallerbyfactor_plant7_dc},{bottom/smallerbyfactor_plant7_dc} 
      {garageright/smallerbyfactor_plant7_dc},{bottom/smallerbyfactor_plant7_dc} {garageright/smallerbyfactor_plant7_dc},{garagetop/smallerbyfactor_plant7_dc} {garageleft/smallerbyfactor_plant7_dc},{garagetop/smallerbyfactor_plant7_dc} 
      {garageleft/smallerbyfactor_plant7_dc},{garagedoor/smallerbyfactor_plant7_dc} {garageright/smallerbyfactor_plant7_dc},{garagedoor/smallerbyfactor_plant7_dc} {garageleft/smallerbyfactor_plant7_dc},{garagedoor/smallerbyfactor_plant7_dc} {garageleft/smallerbyfactor_plant7_dc},{bottom/smallerbyfactor_plant7_dc}
      {wideleft/smallerbyfactor_plant7_dc},{bottom/smallerbyfactor_plant7_dc}
      " fill="none" stroke="black" stroke-width="3"   />
      </g>
      
      <g transform="translate({850}, {0})">
      {smallerbyfactor_plant8_dc=2.5}
      <polygon points="
      {wideleft/smallerbyfactor_plant8_dc},{height/smallerbyfactor_plant8_dc} {roofmiddle/smallerbyfactor_plant8_dc},{rooftop/smallerbyfactor_plant8_dc} {wideright/smallerbyfactor_plant8_dc},{height/smallerbyfactor_plant8_dc} {wideright/smallerbyfactor_plant8_dc},{bottom/smallerbyfactor_plant8_dc} {widestright/smallerbyfactor_plant8_dc},{bottom/smallerbyfactor_plant8_dc} 
      {widestright/smallerbyfactor_plant8_dc},{floor/smallerbyfactor_plant8_dc}, {widestleft/smallerbyfactor_plant8_dc},{floor/smallerbyfactor_plant8_dc}, {widestleft/smallerbyfactor_plant8_dc},{bottom/smallerbyfactor_plant8_dc} {wideleft/smallerbyfactor_plant8_dc},{bottom/smallerbyfactor_plant8_dc} {wideleft/smallerbyfactor_plant8_dc},{height/smallerbyfactor_plant8_dc} 
      {wideleft/smallerbyfactor_plant8_dc},{bottom/smallerbyfactor_plant8_dc} {wideright/smallerbyfactor_plant8_dc},{bottom/smallerbyfactor_plant8_dc} 
      {garageright/smallerbyfactor_plant8_dc},{bottom/smallerbyfactor_plant8_dc} {garageright/smallerbyfactor_plant8_dc},{garagetop/smallerbyfactor_plant8_dc} {garageleft/smallerbyfactor_plant8_dc},{garagetop/smallerbyfactor_plant8_dc} 
      {garageleft/smallerbyfactor_plant8_dc},{garagedoor/smallerbyfactor_plant8_dc} {garageright/smallerbyfactor_plant8_dc},{garagedoor/smallerbyfactor_plant8_dc} {garageleft/smallerbyfactor_plant8_dc},{garagedoor/smallerbyfactor_plant8_dc} {garageleft/smallerbyfactor_plant8_dc},{bottom/smallerbyfactor_plant8_dc}
      {wideleft/smallerbyfactor_plant8_dc},{bottom/smallerbyfactor_plant8_dc}
      " fill="none" stroke="black" stroke-width="3"   />
      </g>
      
      
      
      </svg>
      <!--------------------------------------------------------------------------------------->
      
      
        {shopping_factor=30} 
        <svg width="1300" height="450">
        <g transform="translate({300}, {10})">
        <polygon points="
        {0*shopping_factor},{0*shopping_factor}
        {2*shopping_factor},{0*shopping_factor}
        {2.7*shopping_factor},{2*shopping_factor}
        {16*shopping_factor},{2*shopping_factor}
        {13*shopping_factor},{9*shopping_factor}
        {5*shopping_factor},{9*shopping_factor}
        {2*shopping_factor},{0*shopping_factor}
        {5*shopping_factor},{9*shopping_factor}
        {6*shopping_factor},{11*shopping_factor}
        {13*shopping_factor},{11*shopping_factor}
        {6*shopping_factor},{11*shopping_factor}
        {6*shopping_factor},{11*shopping_factor}
        {5*shopping_factor},{9*shopping_factor}
        {2*shopping_factor},{0*shopping_factor}
        
        " fill="none" stroke="black" stroke-width="3"   />
        
        <circle cx={7*shopping_factor} cy={12.5*shopping_factor} r={shopping_factor} fill="white" stroke="black" stroke-width="3" />
        <circle cx={11*shopping_factor} cy={12.5*shopping_factor} r={shopping_factor} fill="white" stroke="black" stroke-width="3" />
        
        </g>
      </svg>
      
      <svg width="1300" height="450">
        <g>
        <circle cx={500} cy={230} r={200} fill="white" stroke="black" stroke-width="3" />
        <text x={320} y={230} fill="black">Imagine a map of the costumers around Europe here!</text>
        </g>
        </svg>
        
      {:else}
        <!-- Default content when no option is selected -->
        <p>.</p>
      {/if}

      <p>If you just inspected the General Overview, don't forget to also have a look at the data Split by Distribution Centre via the drop down box at the top of the page.</p>

      <h2>Thank you for your attention!</h2>
