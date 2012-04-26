$(document).ready(function(){
  $.jqplot('gets-sets', [$("#gets-sets").data("gets"), $("#gets-sets").data("sets")], {
    title: 'Gets & Sets for the Past Day',
    grid: {
      drawBorder: false,
      shadow: false,
      background: '#fefefe'
    },
    axes:{
      xaxis:{
        renderer: $.jqplot.DateAxisRenderer,
        tickOptions: {
          formatString:'%#I %p'
        },
        min: $("#gets-sets").data("gets")[0][0],
        max: $("#gets-sets").data("gets")[$("#gets-sets").data("gets").length - 1][0],
        tickInterval: "2 hours",
      }
    },
    seriesDefaults: {
      rendererOptions: {
        smooth: true
      }
    },
    series: [
      {label: 'Gets', showMarker: false},
      {label: 'Sets', showMarker: false},
   ],
   legend: {
    show: true
   },
   seriesColors: ["rgb(36, 173, 227)", "rgb(227, 36, 132)"]
  });
  $.jqplot('hits-misses', [$("#hits-misses").data("hits"), $("#hits-misses").data("misses")], {
    title: 'Hits & Misses for the Past Day',
    grid: {
      drawBorder: false,
      shadow: false,
      background: '#fefefe'
    },
    axes:{
      xaxis:{
        renderer: $.jqplot.DateAxisRenderer,
        tickOptions: {
          formatString:'%#I %p'
        },
        min: $("#hits-misses").data("hits")[0][0],
        max: $("#hits-misses").data("hits")[$("#hits-misses").data("hits").length - 1][0],
        tickInterval: "2 hours",
      },
      yaxis: {
        rendererOptions: { forceTickAt0: true, forceTickAt100: true }
      }
      
    },
    seriesDefaults: {
      rendererOptions: {
        smooth: true
      }
    },
    series: [
       {label: 'Hits', showMarker: false},
       {label: 'Misses', showMarker: false}
    ],
    legend: {
     show: true
    },
    seriesColors: ["rgb(227, 36, 132)", "rgb(227, 193, 36)"]
  });
  $.jqplot('memory-usage', [$("#memory-usage").data("engine-maxbytes"), $("#memory-usage").data("bytes")], {
    title: 'Cache Memory for the Past Day',
    grid: {
      drawBorder: false,
      shadow: false,
      background: '#fefefe'
    },
    axes:{
      xaxis:{
        renderer: $.jqplot.DateAxisRenderer,
        tickOptions: {
          formatString:'%#I %p'
        },
        min: $("#memory-usage").data("engine-maxbytes")[0][0],
        max: $("#memory-usage").data("engine-maxbytes")[$("#memory-usage").data("engine-maxbytes").length - 1][0],
        tickInterval: "2 hours",
      }
    },
    seriesDefaults: {
      rendererOptions: {
        smooth: true
      }
    },
    series: [
       {label: 'Max Size (MB)', showMarker: false},
       {label: 'Used (MB)', showMarker: false}
    ],
    legend: {
     show: true
    },
    seriesColors: ["rgb(227, 193, 36)", "rgb(36, 173, 227)"]
  });
  $.jqplot('current-items', [$("#current-items").data("current-items")], {
    title: 'Items over the Past Day',
    grid: {
      drawBorder: false,
      shadow: false,
      background: '#fefefe'
    },
    axes:{
      xaxis:{
        renderer: $.jqplot.DateAxisRenderer,
        tickOptions: {
          formatString:'%#I %p'
        },
        min: $("#current-items").data("current-items")[0][0],
        max: $("#current-items").data("current-items")[$("#current-items").data("current-items").length - 1][0],
        tickInterval: "2 hours",
      },
      yaxis: {
        rendererOptions: { forceTickAt0: true, forceTickAt100: true }
      }
    },
    seriesDefaults: {
      rendererOptions: {
        smooth: true,
      }
    },
    series: [
       {label: 'Items', showMarker: false},
    ],
    legend: {
     show: true
    },
    seriesColors: ["rgb(227, 193, 36)"]
  });
});
