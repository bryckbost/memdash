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
  $.jqplot ('chart3', [[3,7,9,1,5,3,8,2,5]], {
    title: 'Chart 3',
    grid: {
      drawBorder: false,
      shadow: false,
      background: '#fff'
    },
    axesDefaults: {
      labelRenderer: $.jqplot.CanvasAxisLabelRenderer
    },
    seriesDefaults: {
        rendererOptions: {
            smooth: true
        }
    },
    axes: {
      xaxis: {
        label: "X Axis",
        pad: 0
      },
      yaxis: {
        label: "Y Axis"
      }
    }
  });    
  $.jqplot ('chart4', [[3,7,9,1,5,3,8,2,5]], {
    title: 'Chart 4',
    grid: {
      drawBorder: false,
      shadow: false,
      background: '#fff'
    },
    axesDefaults: {
      labelRenderer: $.jqplot.CanvasAxisLabelRenderer
    },
    seriesDefaults: {
        rendererOptions: {
            smooth: true
        }
    },
    axes: {
      xaxis: {
        label: "X Axis",
        pad: 0
      },
      yaxis: {
        label: "Y Axis"
      }
    }
  });    
  
});
