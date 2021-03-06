<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<spring:url value="/static/js/jquery.min.js" var="jqueryJs" />
<spring:url value="/static/css/bootstrap.min.css" var="bootstrap" />
<script src="${jqueryJs}"></script>
<link href="${bootstrap}" rel="stylesheet" />
 <title>Telusko InterShip</title>
</head>
<body>

<div class="panel panel-default">
  <div class="panel-body">
   <div id="table-data"></div>
  </div>
</div>
</body>

<script>
$.ajax({
	url:'./student-list',
	method:'POST'
}).done(function(response){
	$("#table-data").html(generateTable(response));
}).fail(function(){
	console.log("Server Connection Error");
})

function generateTable(data){
	
	var textToAppend ="";
	
	$.each(data, function(key,value){
		textToAppend +="<h3>"+key + "</h3>";
		textToAppend +="<hr />";
		$.each(value, function(k,v){
			textToAppend +="<h4>"+k + "</h4>";
			textToAppend += makeTable(v);
		});
		
	})	
	
	return textToAppend; 
}

function makeTable(data){
	var textToAppend ="";
	 textToAppend = '<table class="table table-bordered">';
    var header = "<thead><tr>";
    for (var k in data[0]){
    	header += "<th>" + k.toUpperCase() + "</th>";
    }
    header += "</tr></thead>";
    textToAppend+=header;
    $.each(data, function (index, value) {
        var row = "<tr>";
        $.each(value, function (key, val) {
            row += "<td>" + val + "</td>";
        });
        row += "</tr>";
        textToAppend+=row;
    });
    textToAppend+="</table>"
    
    return textToAppend;
}

</script>

</html>