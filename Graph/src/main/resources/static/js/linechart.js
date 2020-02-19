 $.ajax({
	/* for pie chart */
	//url: "piechartdata",
	/* for line chart */
     url: "linechartdata",
	/* for multiple line chart */
//	url: "multiplelinechartdata",
	success: function(result){
		/* line chart single starts here */
		var category = JSON.parse(result).categories;
		var series = JSON.parse(result).series;
    	drawLineChart(category, series);
		/* line chart single ends here */
		
	 	/* pie chart starts here */
		var series = [];
		var data = [];
		
		for(var i = 0; i < result.length; i++){
			var object = {};
			object.name = result[i].name.toUpperCase();
			object.y = result[i].yaxis;
			data.push(object);
		}
		var seriesObject = {
			name: 'Employees',
			colorByPoint: true,
			data: data
		};
		series.push(seriesObject);
		drawPieChart(series);
		
		/* pie chart ends here */
	}
});

/* for line chart */
function drawLineChart(category, series){
	Highcharts.chart('container', {
	    chart: {
	        type: 'line',
	        width: 500
	    },
	    
	    title: {
	        text: 'Width is set to 300px'
	    },
	
	    xAxis: {
	        categories: category
	    },
	    
	    tooltip: {
	        formatter: function() {
	          return '<strong>'+this.x+': </strong>'+ this.y;
	        }
	    },
	
	    series: [{
	        data: series
	    }]
	});
}

  