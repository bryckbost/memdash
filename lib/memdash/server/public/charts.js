$(document).ready(function(){
  $.jqplot ('chart1', [[3,7,9,1,5,3,8,2,5]], {
    title: 'Chart 1',
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
  $.jqplot ('chart2', [[3,7,9,1,5,3,8,2,5]], {
    title: 'Chart 2',
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
