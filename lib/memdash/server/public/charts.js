$(document).ready(function(){
  $.jqplot('gets-sets', [$("#gets-sets").data("gets"), $("#gets-sets").data("sets")], {
    title: 'Gets & Sets',
    grid: {
      drawBorder: false,
      shadow: false,
      background: '#fefefe'
    },
    axesDefaults: {
      labelRenderer: $.jqplot.CanvasAxisLabelRenderer
    },
    seriesDefaults: {
      rendererOptions: {
        smooth: true
      }
    },
    series: [
      {label: 'Gets'},
      {label: 'Sets'}
   ],
   legend: {
    show: true
   },
   seriesColors: ["rgb(36, 173, 227)", "rgb(227, 36, 132)"]
  });
  $.jqplot('hits-misses', [$("#hits-misses").data("hits"), $("#hits-misses").data("misses")], {
    title: 'Hits & Misses',
    grid: {
      drawBorder: false,
      shadow: false,
      background: '#fefefe'
    },
    axesDefaults: {
      labelRenderer: $.jqplot.CanvasAxisLabelRenderer
    },
    seriesDefaults: {
      rendererOptions: {
        smooth: true
      }
     },
     series: [
       {label: 'Hits'},
       {label: 'Misses'}
    ],
    legend: {
     show: true
    },
    seriesColors: ["rgb(227, 36, 132)", "rgb(227, 193, 36)"]
  });
});
