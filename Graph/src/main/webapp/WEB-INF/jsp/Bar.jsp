<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Dynamic Column Chart in Codeigniter using Ajax</title>
    
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
 <div class="container">
  <br />
  <h3 align="center">Dynamic Column Chart in Codeigniter using Ajax</h3>
  <br />
  <div class="panel panel-default">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-9">
                        <h3 class="panel-title">Month Wise Profit Data</h3>
                    </div>
                    <div class="col-md-3">
                        <select name="category" id="category" class="form-control">
                            <option value="">Select Year</option>
                        <?php
                        foreach($year_list->result_array() as $row)
                        {
                            echo '<option value="'.$row["category"].'">'.$row["category"].'</option>';
                        }
                        ?>

                        </select>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div id="chart_area" style="width: 1000px; height: 620px;"></div>
            </div>
        </div>
 </div>
</body>
</html>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

google.charts.load('current', {packages:['corechart', 'bar']});
google.charts.setOnLoadCallback();

function load_monthwise_data(year, title)
{
    var temp_title = title + ' ' + mapedData;
    $.ajax({
        url:"barchartdata",
        method:"POST",
        data:{mapedData:mapedData},
        dataType:"JSON",
        success:function(data)
        {
            drawMonthwiseChart(data, temp_title);
        }
    })
}

function drawMonthwiseChart(chart_data, chart_main_title)
{
    var jsonData = chart_data;
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Category');
    data.addColumn('string', 'Series');

    $.each(jsonData, function(i, jsonData){
        var category = jsonData.category;
        var series = parseFloat($.trim(jsonData.profit));
        data.addRows([[category, series]]);
    });

    var options = {
        title:chart_main_title,
        hAxis: {
            title: "Months"
        },
        vAxis: {
            title: 'Profit'
        },
        chartArea:{width:'80%',height:'85%'}
    }

    var chart = new google.visualization.ColumnChart(document.getElementById('chart_area'));

    chart.draw(data, options);
}

</script>

<script>
    
$(document).ready(function(){
    $('#year').change(function(){
        var mapedData = $(this).val();
        if(mapedData != '')
        {
            load_monthwise_data(mapedData, 'Month Wise Profit Data For');
        }
    });
});

</script>