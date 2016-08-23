<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path %>/resources/css/Dashboard.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/resources/css/DataQuery.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/resources/css/TextResult.css" />


<title>Web-based Dashboard</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		$('.radioSelect').click(function(){

			if($(this).val() == "Table" || $(this).val() == "CountTable" ){
				$("#cellConstraints").hide();		
			}
			
			if($(this).val() == "Cell" || $(this).val() == "CountCell" ){
				$("#cellConstraints").show();
			}
		});
		
	})
</script>

<script>
$(document).ready(function() {

	if ($('input[type="radio"]:checked').val() == "Cell" ||
			$('input[type="radio"]:checked').val() == "CountCell"){
		$("#cellConstraints").show();
	}
})
</script>



<script type="text/javascript" src="<%=path %>/resources/js/tabs.js" ></script>
<script type="text/javascript" src="<%=path %>/resources/js/dynamic_list_helper.js" ></script>


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
	
	
	/* remove a history in the table*/	
	  $(".removeHistory").click(function(){
	      $(this).closest('tr').remove();
	    });

});
</script>

<script>
/**get the article of the selected table and capture the table**/
function myFuncton(tableOrder,PMCID){

 	$.ajax({
		url: 'dashboardAjax',
		data: {
 	   		PMCID: PMCID,
 	   		tableOrder:tableOrder
 	   	},
 	   	success: function(data) {
 	   		
 			$('#tab-2').html($(data).find("label:contains("+tableOrder+")").parent());
 			
 	   },
 	   type: 'POST'
 	});

}
</script>

<script>
/* pass the query and select to controller,
 * query in the controller and
 * show the result in the div with id history
 */
function runHistory(select,query){
	
	/* alert(query); */
	
  	$.ajax({
		url: 'dashboardHistoryAjax',
		data: {
 	   		select: select,
 	   		query:query
 	   	},
 	   	success: function(data) {
 	   		
 	   		$('#queryResult').html($(data));
 			alert("Run success!");
 			
 	   },
 	   type: 'POST'
 	}); 

}
</script>

<script>
/* pass one selected history to controller
 * and controller will delete the row by DAO
 */
function deleteHistory(query){
	
	/* alert(query); */
	
  	$.ajax({
		url: 'dashboardDeleteHistoryAjax',
		data: {
 	   		query:query
 	   	},
 	   	success: function() {
 	   	
 			alert("Delete success!");	
 	   },
 	   type: 'POST'
 	}); 

}
</script>

<script>
/* clear all history
 */
function clearHistory(query){
	/* alert("enter success!"); */
	
  	$.ajax({
		url: 'clearHistory',
		data: {
 	   		query:query
 	   	},
 	   	success: function() {
 	   		alert("Clear success!");
 	   		$('#historyTableBody').empty();	
 	   },
 	   type: 'POST'
 	}); 

}
</script>

</head>
<body id="indexBackground">

	<!-- header -->
	<div class = "div2" style = "width: 980px;">
		<div class = "div6">
		<table>
			<tr>
				<td>
					<img id = "imgUniversityIcon" alt="" src="resources/img/universityIcon.png" />
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/"><img id = "homeIcon"  alt="" src="resources/img/home.png" /></a>
				</td>
				<td>
					<a class = "div5" href="dashboardPage" >Dashboard</a>
				</td>
				<td>
					<a class = "div5" href="use.jsp" >Use</a>
				</td>
				<td>
					<a class = "div5" href="author.jsp" >Author</a>
				</td>
			</tr>
		</table>
		</div>
	</div>

	<div class = "div17">
	
 		<!-- body content -->
		<div class = "div18">

		
		<form:form modelAttribute="queryItem" method="post" id="queryItemForm">
		
			<div id ="radioButtonDiv">
				Select:&nbsp;&nbsp;
				<form:radiobutton class= "radioSelect" path="select" value="Table" />Table&nbsp;
				<form:radiobutton class= "radioSelect" path="select" value="Cell" />Cell&nbsp;
				<form:radiobutton class= "radioSelect" path="select" value="CountTable" />Count (<font color = "#F7819F">Table</font>)&nbsp;
				<form:radiobutton class= "radioSelect" path="select" value="CountCell" />Count (<font color = "#F7819F">Cell</font>)&nbsp;
			</div>

			<table>
				<tr>
  					<td><p class = "font_8">Table constraints:</p></td>
  					<td></td>
  					<td></td>
  					<td></td>
  					<td></td>
  				</tr>
			</table>
	
			
            <table class = "consTable">
                <thead>
					<tr>
						<th>
							Field
						</th>
						<th>
							Operations
						</th>
						<th>
							Value
						</th>
						<th>
							And/Or
						</th>
						<th>
						</th>
					</tr>
                	
                </thead>
                <tbody id="queryItem">
           	
                    <c:forEach items="${queryItem.tableList}" var="QueryItemTable" varStatus="i" begin="0" >
                        <tr class="queryItemTable">    
                            <td>
                            
                            	 <!-- field drop-down menu -->
										<div class="dropdown">

   										<form:select class="dropSelect" path="tableList[${i.index}].field" id="field${i.index}" >
   											<form:option value="default">&nbsp;</form:option>
   											<form:option value="Cell">Cell</form:option>
   											<form:option value="Caption">Caption</form:option>
   											<form:option value="Stub">Stub</form:option>
   											<form:option value="Super-row">Super-row</form:option>
   											<form:option value="Header">Header</form:option>
   											<form:option value="Footer">Footer</form:option>
										</form:select> 

										</div>
							
                            </td><!-- field dropdown menu end-->                        
                            
                            <td>
                            
                                <!-- operations drop-down menu -->

									<div class="dropdown">
  							 
   									<form:select class="dropSelect" path="tableList[${i.index}].operations" id="operations${i.index}" >
										<form:option value="default">&nbsp;</form:option>
   										<form:option value="Contains">Contains</form:option>
   										<form:option value="Greater">&gt;</form:option>
   										<form:option value="Smaller">&lt;</form:option>
   										<form:option value="Type">Type</form:option>  	
									</form:select>  
							
									</div>
                            
                            </td><!-- operations dropdown menu end-->
                            
                            
                            <td>
                            	<div id = "inputField">
                            	<form:input path="tableList[${i.index}].constraintValue" id="constraintValue${i.index}" />
								</div>
                            </td>
                      
                            <td>
                            	  <!-- And/Or drop-down menu -->
<!-- 								<div class = "dropholder" class = "inline" style="margin-right: 10px;">
  									<p class = "dropP">And/Or</p> -->
									<div class="dropdown">

   									<form:select class="dropSelect logicSelect"  path="tableList[${i.index}].logic" id="logic${i.index}"  used = "false">
   										<form:option value="default">&nbsp;</form:option>
   										<form:option value="And">And</form:option>
   										<form:option value="Or">Or</form:option>	
									</form:select> 
 
									</div>
				<!-- 				</div>  -->
                            </td>
                           
                            
                            <td>
                            	<a class="removeQueryItem">
									<img class = "queryItemDelete" alt="" src="resources/img/delete.png" />
								</a>
                            </td>
                            
                        </tr>
                    </c:forEach>
                    <%-- 
                        IMPORTANT 
                        There must always be one row.
                        This is to allow the JavaScript to clone the row.
                        If there is no row at all, it cannot possibly add a new row.
 
                        If this 'default row' is undesirable 
                            remove it by adding the class 'defaultRow' to the row
                        I.e. in this case, class="person" represents the row.
                        Add the class 'defaultRow' to have the row removed.
                        This may seem weird but it's necessary because 
                        a row (at least one) must exist in order for the JS to be able clone it.
                        <tr class="person"> : The row will be present
                        <tr class="person defaultRow"> : The row will not be present
                    --%>
<%--                     <c:if test="${queryItem.tableList.size() == 0}">
                        <tr class="queryItemTable defaultRow">    
                            <td><input type="text" name="tableList[].field" value="" /></td>
                            <td><input type="text" name="tableList[].operations" value="" /></td>
                            <td><input type="text" name="tableList[].constraintValue" value="" /></td>
                            <td><input type="text" name="tableList[].logic" value="" /></td>
 
                            <td><a href="#" class="removeQueryItem">Remove Person</a></td>
                        </tr>
                    </c:if> --%>
                    
                    
                </tbody>
            </table>
            
            <!-- <a href="#" id="addQueryItem">Add test</a> -->
            
            
  			<!-- constraint cell -->
  			<div style="display: none;" id = "cellConstraints" >
  			<table>
  				<tr>
  					<td><p class = "font_9">Cell contraints:</p></td>
  				</tr>
  			</table>
  		
	 		<table class = "consTable consTableCell"> 
	 		<thead>
	 			<tr>
	 				<th>Field</th>
	 				<th>Operations</th>
	 				<th>Value</th>
	 				<th>And/Or</th>
	 				<th></th>
	 			</tr>
            </thead>
            
            <tbody id="queryItemCellContainer">

  			<c:forEach items="${queryItem.cellList}" var="QueryItemCell" varStatus="i" begin="0" >                      
  			<tr id = "cellConstraintOption" class="queryItemCell">
   				<td>
   					<!-- field drop-down menu -->

						<div class="dropdown dropdownCell">
						
   							<form:select class="dropSelect backgroundDropdown" path="cellList[${i.index}].field" id="field${i.index}">
   								<form:option value="default">&nbsp;</form:option>
   								<form:option value="Cell">Cell</form:option>
   								<form:option value="Caption">Caption</form:option>
   								<form:option value="Stub">Stub</form:option>
   								<form:option value="Super-row">Super-row</form:option>
   								<form:option value="Header">Header</form:option>
   								<form:option value="Footer">Footer</form:option>
   								<form:option value="Row">Row</form:option>
   								<form:option value="Column">Column</form:option>
							</form:select> 

						</div>

   				</td>
    			<td>
    				<!-- operations drop-down menu -->

						<div class="dropdown dropdownCell">
  							
   							<form:select class="dropSelect backgroundDropdown" path="cellList[${i.index}].operations" id="operations${i.index}" >
								<form:option value="default">&nbsp;</form:option>
   								<form:option value="Contains">Contains</form:option>
   								<form:option value="Greater">&gt;</form:option>
   								<form:option value="Smaller">&lt;</form:option>
   								<%-- <form:option value="Range">Range</form:option> --%>
   								<form:option value="Type">Type</form:option>  	
							</form:select>  
							
						</div>

    			</td> 
    			<td>
    				<!--input the value  -->
					<div id = "inputField">
						
						<form:input path="cellList[${i.index}].constraintValue" id="constraintValue${i.index}" />
						
					</div> 
    			</td>
    			<td>
    				<!-- And/Or drop-down menu -->

						<div class="dropdown dropdownCell">

   							<form:select class="dropSelect backgroundDropdown logicSelectCell"  path="cellList[${i.index}].logic" id="logic${i.index}" used ="false">
   								<form:option value="default">&nbsp;</form:option>
   								<form:option value="And">And</form:option>
   								<form:option value="Or">Or</form:option>	
							</form:select> 
 
						</div>

    			</td>
    			
    			<td>
                	<a class="removeQueryItemCell">
						<img class = "queryItemDelete" alt="" src="resources/img/delete.png" />
					</a>
                </td>
    			
  			</tr>
  			</c:forEach>
  			
<!--   			<tr>
  				<td>
  					<a href="#" id="addQueryItemCell">test add</a>
  				</td>
  			</tr> -->
  			
  			</tbody>
  			</table> <!-- constraint cell end -->
            </div>
            
            <table>
  			<tr>
  				<td width= "590">
  				</td>
  				<td>
  					<a class="fileButton" style="background-color: #fdb221; " href="${pageContext.request.contextPath}/dashboardPage" class="button">Clear</a>
				</td>
				
  				<td>
  					<input  class="fileButton" style="margin-left:20px;" type="submit" value="Submit">
				</td>
  				
  			</tr>
  			
			</table>
            
        </form:form>
        
        
        <script type="text/javascript">
            function rowAdded(rowElement) {
                //clear the imput fields for the row
                $(rowElement).find("input").val('');
                //may want to reset <select> options etc
 
                //in fact you may want to submit the form
                saveNeeded();
            }
            function rowRemoved(rowElement) {
                saveNeeded();
            }
 
            function saveNeeded() {
                if( $('#submit').val().indexOf('!') != 0 ) {
                    $('#submit').val( '!' + $('#submit').val() );
                }
            }
 
             function beforeSubmit() {
                return true;
            } 
             
             $(document).ready( function() {
                 var config = {
                     rowClass : 'queryItemTable',
                     rowClassCell : 'queryItemCell',
                     
                     addRowId : 'addQueryItem',
                     addRowIdCell : 'addQueryItemCell', 
                     
                     removeRowClass : 'removeQueryItem',
                     removeRowClassCell : 'removeQueryItemCell',
                     
                     formId : 'queryItemForm',
                     rowContainerId : 'queryItem',
                     rowContainerIdCell : 'queryItemCellContainer',
                     
                     indexedPropertyName : 'tableList',
                     indexedPropertyNameCell : 'cellList',
                     indexedPropertyMemberNames : 'field,operations,constraintValue,logic',
                     rowAddedListener : rowAdded,
                     rowRemovedListener : rowRemoved,
                     beforeSubmit : beforeSubmit
                 };
                 new DynamicListHelper(config);
             });
            
        </script>		
						
			<div id ="queryResult"> <!-- query result -->
			
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
					
			</div> <!-- query result end -->
			
			
			<c:if test="${errorInput}">
			<script>
  				alert("Sorry. You should accomplish and check your input.");        
			</script>
			</c:if>
			
		<!-- 	<hr id ="indexHr"/> -->
				
			<p class="font_7" >Query history:</p>

			<div id = "historyTable">
			<table id="queryTable" class = "tableBody">
    		<thead>
    			<tr>
    				<th width = "50px"></th>
        			<th width = "150px">select</th>
            		<th>Table Constraints</th>
            		<th>Cell Constraints</th>
            		<th width = "100px">Query</th>
        		</tr>
    		</thead>
    		<tbody id = "historyTableBody">
    		
    			<c:forEach var="history" items="${histroies}">
    				<tr>
    					<td><a class = "removeHistory" onclick="deleteHistory('${history.query}');"><img id = "deleteImg" alt="" src="resources/img/delete.png" /></a></td>
        				<td>${history.select}</td>
            			<td>${history.queryToUser}</td>
            			<td>${history.queryToUserCell}</td>
            			
            			<td>
            				<button id ="runQuery" onclick="runHistory('${history.select}','${history.query}');">Run</button>
            			</td>
        			</tr>
        		
        		</c:forEach>
        		
   			 </tbody>
			</table>
			</div>
			
			<table id = "historyButton">
				<tr>
					<td width="765"></td>
					
						<td><button class ="fileButton" onclick="clearHistory();">Clear</button></td>
						
				</tr>
			</table>
		
			
			
		</div> <!-- body content end -->
		
		<!-- footer -->
		<div class = "div4">
			<p class="font_3">Copyright © 2016 Grace Tang.&nbsp;All Rights Reserved.&nbsp;&nbsp; </p>
		</div> <!-- footer end -->
	
		
	</div> <!-- div17 end -->
	
</body>
</html>