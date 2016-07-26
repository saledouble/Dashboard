<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=path %>/resources/js/tabs.js" ></script>
<script>

$(document).ready(function(){
	/* tab action*/
	$(".tableResult").click(function(){
		var tab_id = $("#tab-2-li").attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$("#tab-2-li").addClass('current');
		$("#tab-2").addClass('current');
	});

});
</script>

<script>
/**get the article of the selected table and capture the table**/
function myFuncton(tableOrder,PMCID){

 	$.ajax({
		url: 'dashboardAjax',
		data: {
 	   		PMCID: PMCID
 	   	},
 	   	success: function(data) {
 	   		
 			$('#tab-2').html($(data).find("label:contains("+tableOrder+")").parent());
 		 
 	   },
 	   type: 'POST'
 	});

}
</script>


</head>
<body id="indexBackground">
			
			<div class="container">

				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">Result</li>
					<li class="tab-link" data-tab ="tab-2" id="tab-2-li">Text</li>
				</ul>

				<div id="tab-1" class="tab-content current"> <!-- table result -->
					
					<c:if test="${not empty tables}">
					

					<table class= "textResultTable">
						<thead>
							<tr>
							<th class = "tableResultTd0">PMCID</th>
							<th class = "tableResultTd3">Table caption</th>
							<th class = "tableResultTd">Table order</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="table" items="${tables}">
						<tr>
							<td><a href= "http://www.ncbi.nlm.nih.gov/pmc/articles/PMC${table.pmcid}" target="_blank" class="pmcidResult">${table.pmcid}</a></td>
                			<td>${table.tableCaption}</td>
                			<td>
                				<a class="tableResult" onclick="myFuncton('${table.tableOrder}','${table.pmcid}');">${table.tableOrder}</a>
                			</td> 
						</tr>
						</c:forEach>
						</tbody>
					</table>

					</c:if> 
					
					<!-- number result -->
					<c:if test="${not empty number}">
						<p>${number}</p>
					</c:if>  
					
					<!-- cell result -->
					<c:if test="${not empty cells}">					

					<table id = "cellResultTable" class= "textResultTable">
						<thead>
							<tr>
							<th class = "tableResultTd0">PMCID</th>
							<th class = "tableResultTd">Table order</th>
							<th class = "tableResultTd0">Row No.</th>
							<th class = "tableResultTd">Column No.</th>
							<th class = "tableResultTd1">Header</th>
							<th class = "tableResultTd1">Stub</th>
							<th class = "tableResultTd1">Super-row</th>
							<th class = "tableResultTd2">Content</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="cell" items="${cells}">
						<tr>
							<td><a href= "http://www.ncbi.nlm.nih.gov/pmc/articles/PMC${cell.pmcid}" target="_blank" class="pmcidResult">${cell.pmcid}</a></td>
                			<td class = "tableResultTd">
                				<a onclick="myFuncton('${cell.tableOrder}','${cell.pmcid}');" class="tableResult">${cell.tableOrder}</a>
                			</td> 
                			<td>
                				${cell.rowN}
                			</td>
                			<td>
                				${cell.columnN}
                			</td>
                			<td>
                				${cell.wholeHeader}
                			</td>
                			<td>
                				${cell.wholeStub}
                			</td>
                			<td>
                				${cell.wholeSuperRow}
                			</td>
                			<td>
                				${cell.content}
                			</td>
                			
						</tr>
						</c:forEach>
						</tbody>
					</table>

					</c:if> 
					
				</div>
				<div id="tab-2" class="tab-content">

		 		</div>

			</div> <!-- result tabs end -->				

</body>
</html>