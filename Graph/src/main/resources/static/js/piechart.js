$.ajax({
	/* for pie chart */
	url: "piechartdata",
	/* for line chart */
	//url: "linechartdata",
	/* for multiple line chart */
//	url: "multiplelinechartdata",
	success: function(result){
 		
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
 
/* for multiple line chart */
 /* for pie chart */
function drawPieChart(series){
	Highcharts.chart('container', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: 'Browser market shares in January, 2018'
	    },
	    tooltip: {
	    	formatter: function() {
	    		return '<strong>'+this.key+': </strong>'+ this.y;
		    }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.y}'
	            }
	        }
	    },
	    series: series
	});
}