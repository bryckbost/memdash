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
    }
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
    }
  });
});
