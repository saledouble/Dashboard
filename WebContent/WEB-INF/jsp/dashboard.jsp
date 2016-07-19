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
function selectDropdown() {
    loc = document.getElementById('select');
    
    if (loc.value == 'Table' || loc.value == 'Number') {
    	$("#cellConstraints").hide();
    }
    if (loc.value == 'Cell') {
    	$("#cellConstraints").show();
    }
}
</script>

<script>
$(document).ready(selectDropdown);
</script>

<script>
/* cell logic dropdown menu event*/
/* function logicCellDropdown() {
    loc = document.getElementById('logicCell');
    
    if (loc.value == 'And' || loc.value == 'Or') {
        var $table = $("#cellConstraints"),
        lastRow = $table.find("tr:last-child");

    	$table.append(lastRow.clone());
    }
}  */
</script>

<script>
/* table logic dropdown menu event*/
/* function logicTableDropdown() {
    loc = document.getElementById('logic');
    
    if (loc.value == 'And' || loc.value == 'Or') {
        var $table = $("#tableConstraints"),
        lastRow = $table.find("tr:last-child");

    	$table.append(lastRow.clone());
    }
}  */
</script>

<script type="text/javascript" src="<%=path %>/resources/js/tabs.js" ></script>
<script type="text/javascript" src="<%=path %>/resources/js/dynamic_list_helper.js" ></script>


<script>
/* tab action*/
$(document).ready(function(){
	$(".tableResult").click(function(e){
		var tab_id = $("#tab-2-li").attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$("#tab-2-li").addClass('current');
		$("#tab-2").addClass('current');
	});

});
</script>

<script>
$(document).ready(function() {
  $(".textResultTable tr:even").css("background-color", "#F0EEF1");
  $(".textResultTable tr:odd").css("background-color", "#fff");
/*   $(".textResultTable a").css("color", "#642EFE");
  $(".textResultTable a:visited").css("color", "#B07784"); */
})
</script>

<script>
/**get the article of the selected table and capture the table**/
function myFuncton(tableOrder,PMCID){
	
 	 /* alert(tableOrder + "  " +PMCID);  */

 	$.ajax({
		url: 'dashboardAjax',
		data: {
 	   		PMCID: PMCID
 	   	},
 	   	success: function(data) {
 	   		
 	   		/* alert("tableOrder: "+tableOrder); */
 	   		
 			$('#tab-2').html($(data).find("label:contains("+tableOrder+")").parent());
 		 
 	   },
 	   type: 'POST'
 	});

}
</script>

</head>
<body id="indexBackground">

	<!-- header -->
	<div class = "div2" >
		<div class = "div6">
		<a href="index.jsp" ><div class = "div51">Dashboard</div></a>
		<a href="use.jsp" ><div class = "div5">Use</div></a>
		<a href="author.jsp" ><div class = "div5">Author</div></a>
		</div>
	</div>

	<div class = "div12">
	
 		<!-- body content -->
		<div class = "div13">
		
		<form:form modelAttribute="queryItem" method="post" id="queryItemForm">
            <table>
                <thead>
                </thead>
                <tbody id="queryItem">
                	<tr>
                		
                		<td>
                		<div class = "dropholder"  style="margin: 20px 0 0 60px;" >
  						<p class = "dropP">Select&nbsp;&nbsp;</p>
							<div class="dropdown">
							
								<form:select class="dropSelect" id="select" path="select" onchange="selectDropdown()">
   									<form:option value="default">&nbsp;</form:option>
   									<form:option value="Table">Table</form:option>
   									<form:option value="Cell">Cell</form:option>
   									<form:option value="Number">Number</form:option> 
								</form:select> 
							
							</div> 

						</div> 
						</td>
						<td></td>
						<td></td>
						<td></td>	
						<td></td> 		
                		
                	</tr>
                	
                	<tr>
  						<td><p class = "font_8">Table constraints:</p></td>
  						<td></td>
  						<td></td>
  						<td></td>
  						<td></td>
  					</tr>
                	
                	
                    <c:forEach items="${queryItem.tableList}" var="QueryItemTable" varStatus="i" begin="0" >
                        <tr class="queryItemTable">    
                            <td>
                            
                            	 <!-- field drop-down menu -->
								<div class = "dropholder" style="margin-left: 60px;" >
  									<p class = "dropP">&nbsp;Field&nbsp;&nbsp;</p>
										<div class="dropdown">

   										<form:select class="dropSelect" path="tableList[${i.index}].field" id="field${i.index}" >
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
								</div>
							
                            </td><!-- field dropdown menu end-->                        
                            
                            <td>
                            
                                <!-- operations drop-down menu -->
								<div class = "dropholder">
  									<p class = "dropP">OPS&nbsp;&nbsp;&nbsp;&nbsp;</p>
									<div class="dropdown">
  							
   									<form:select class="dropSelect" path="tableList[${i.index}].operations" id="operations${i.index}" >
										<form:option value="default">&nbsp;</form:option>
   										<form:option value="Contains">Contains</form:option>
   										<form:option value="Greater">&gt;</form:option>
   										<form:option value="Samller">&lt;</form:option>
   										<form:option value="Range">Range</form:option>
   										<form:option value="Type">Type</form:option>  	
									</form:select>  
							
									</div>
								</div>
                            
                            </td><!-- operations dropdown menu end-->
                            
                            
                            <td>
                            	<div id = "inputField">
                            	<form:input path="tableList[${i.index}].constraintValue" id="constraintValue${i.index}" />
								</div>
                            </td>
                      
                            <td>
                            	  <!-- And/Or drop-down menu -->
								<div class = "dropholder" class = "inline" style="margin-right: 10px;">
  									<p class = "dropP">And/Or</p>
									<div class="dropdown">

   									<form:select class="dropSelect"  path="tableList[${i.index}].logic" id="logic${i.index}" >
   										<form:option value="default">&nbsp;</form:option>
   										<form:option value="And">And</form:option>
   										<form:option value="Or">Or</form:option>	
									</form:select> 
 
									</div>
								</div> 
                            </td>
                           
                            
                            <td>
                            	<a href="#" class="removeQueryItem">
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
            
            <a href="#" id="addQueryItem">Add test</a>
            
            
  			<!-- constraint cell -->
  		
	 		<table style="display: none;" id = "cellConstraints" > 
	 		<thead>
            </thead>
            
            <tbody id="queryItemCell">
  			<tr>
  			<td><p class = "font_9">Cell contraints:</p></td>
  			<td></td>
  			<td></td>
  			<td></td>
  			</tr>
  			
  			<c:forEach items="${queryItem.cellList}" var="QueryItemCell" varStatus="i" begin="0" >                      
  			<tr id = "cellConstraintOption" class="queryItemCell">
   				<td>
   					<!-- field drop-down menu -->
					<div class = "dropholder" style="margin-left: 60px;background-color: #ea808f;">
  						<p class = "dropP">&nbsp;Field&nbsp;&nbsp;</p>
						<div class="dropdown">
						
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
					</div>
   				</td>
    			<td>
    				<!-- operations drop-down menu -->
					<div class = "dropholder" style="background-color: #ea808f;">
  						<p class = "dropP">OPS&nbsp;&nbsp;&nbsp;&nbsp;</p>
						<div class="dropdown">
  							
   							<form:select class="dropSelect backgroundDropdown" path="cellList[${i.index}].operations" id="operations${i.index}" >
								<form:option value="default">&nbsp;</form:option>
   								<form:option value="Contains">Contains</form:option>
   								<form:option value="Greater">&gt;</form:option>
   								<form:option value="Samller">&lt;</form:option>
   								<form:option value="Range">Range</form:option>
   								<form:option value="Type">Type</form:option>  	
							</form:select>  
							
						</div>
					</div>
    			</td> 
    			<td>
    				<!--input the value  -->
					<div id = "inputField">
						
						<form:input path="cellList[${i.index}].constraintValue" id="constraintValue${i.index}"/>
						
					</div> 
    			</td>
    			<td>
    				<!-- And/Or drop-down menu -->
					<div class = "dropholder" class = "inline" style="margin-right: 10px;background-color: #ea808f;">
  						<p class = "dropP">And/Or</p>
						<div class="dropdown">

   							<form:select class="dropSelect backgroundDropdown"  path="cellList[${i.index}].logic" id="logic${i.index}" >
   								<form:option value="default">&nbsp;</form:option>
   								<form:option value="And">And</form:option>
   								<form:option value="Or">Or</form:option>	
							</form:select> 
 
						</div>
					</div> 
    			</td>
    			
    			<td>
                	<a href="#" class="removeQueryItemCell">
						<img class = "queryItemDelete" alt="" src="resources/img/delete.png" />
					</a>
                </td>
    			
  			</tr>
  			</c:forEach>
  			
  			<tr>
  				<td>
  					<a href="#" id="addQueryItemCell">test add</a>
  				</td>
  			</tr>
  			
  			</tbody>
  			</table> <!-- constraint cell end -->
            
            <!-- <input type="submit" value="Save" id="submit" />&nbsp;&nbsp;
            <a href="#" id="addQueryItem">Add Person</a>&nbsp;&nbsp;
            <a href="?f=">Reset List</a> -->
            
            
            
            
            <table>
  			<tr>
  				<td>
  				<a class="fileButton" style="margin-left:565px;" href="${pageContext.request.contextPath}/dashboardPage" class="button">Clear</a>
				</td>
				
  				<td>
  				<input  class="fileButton" style="margin-left:20px;" type="submit" value="Submit& Run"></td>
  				
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
                     addRowId : 'addQueryItem',
                     removeRowClass : 'removeQueryItem',
                     formId : 'queryItemForm',
                     rowContainerId : 'queryItem',
                     indexedPropertyName : 'tableList',
                     indexedPropertyMemberNames : 'field,operations,constraintValue,logic',
                     rowAddedListener : rowAdded,
                     rowRemovedListener : rowRemoved,
                     beforeSubmit : beforeSubmit
                 };
                 new DynamicListHelper(config);
             });
 
/*             $(document).ready( function() {
                var config = {
                    rowClass : 'queryItemTable',
                    rowClassCell : 'queryItemCell', 
                    
                    addRowId : 'addQueryItem',
                    addRowIdCell : 'addQueryItemCell', 
                    
                    removeRowClass : 'removeQueryItem',
                    formId : 'queryItemForm',
                    rowContainerId : 'queryItem',
                    
                    indexedPropertyName : 'tableList',
                    indexedPropertyNameCell : 'cellList',
                    
                    indexedPropertyMemberNames : 'field,operations,constraintValue,logic',
                    rowAddedListener : rowAdded,
                    rowRemovedListener : rowRemoved,
                    beforeSubmit : beforeSubmit
                };
                new DynamicListHelper(config);
            }); */
            
        </script>
        
        
		
		
		
		<%-- 
			<form:form commandName="queryItem">
			<table style="width:100%;" id="tableConstraints">
  			<tr>
    			<td>
					<!-- select drop-down menu -->
					<div id = "dropholder" style="margin: 20px 0 0 60px;">
  					<p class = "dropP">Select&nbsp;&nbsp;</p>
						<div class="dropdown">
							
								<form:select class="dropSelect" id="select" path="select" onchange="selectDropdown()">
   									<form:option value="default">&nbsp;</form:option>
   									<form:option value="Table">Table</form:option>
   									<form:option value="Cell">Cell</form:option>
   									<form:option value="Number">Number</form:option> 
								</form:select> 
							
						</div> 

					</div> 	 		

    			</td>
    			<td>
    			</td>
    			
    			<td>	
    			</td>
    			<td>
    			</td>
  			</tr>
  			
  			<!-- constraint Table-->
  			<tr>
  			<td><p class = "font_8">Table constraints:</p></td>
  			<td></td>
  			<td></td>
  			<td></td>
  			</tr>
  			<tr id = "tableConstraintOption">
 
   				<td>
   					<!-- field drop-down menu -->
					<div id = "dropholder" style="margin-left: 60px;">
  						<p class = "dropP">&nbsp;Field&nbsp;&nbsp;</p>
						<div class="dropdown">

   							<form:select class="dropSelect" path="field">
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
					</div>
   				</td>
   				
    			<td>
    				<!-- operations drop-down menu -->
					<div id = "dropholder">
  						<p class = "dropP">OPS&nbsp;&nbsp;&nbsp;&nbsp;</p>
						<div class="dropdown">
  							
   							<form:select class="dropSelect" path="operations">
								<form:option value="default">&nbsp;</form:option>
   								<form:option value="Contains">Contains</form:option>
   								<form:option value="Greater">&gt;</form:option>
   								<form:option value="Samller">&lt;</form:option>
   								<form:option value="Range">Range</form:option>
   								<form:option value="Type">Type</form:option>  	
							</form:select>  
							
						</div>
					</div>
    			</td> 
    			<td>
    				<!--input the value  -->
					<div id = "inputField">
						<!-- <input type="text" placeholder=":constraints"> -->
						<form:input path="constraintValue" />
					</div> 
    			</td>
    			<td>
    				<!-- And/Or drop-down menu -->
					<div id = "dropholder" class = "inline" style="margin-right: 60px;">
  						<p class = "dropP">And/Or</p>
						<div class="dropdown">

   							 <form:select class="dropSelect"  path="logic" id="logic" onchange="logicTableDropdown()">
   								<form:option value="default">&nbsp;</form:option>
   								<form:option value="And">And</form:option>
   								<form:option value="Or">Or</form:option>	
							</form:select> 
 
						</div>
					</div> 

    			</td> 
  			</tr>

  			</table><!-- constraint table end -->
  			
  			
  			<!-- constraint cell -->
  		
	 		<table style="display: none;" id = "cellConstraints" > 
  			<tr>
  			<td><p class = "font_9">Cell contraints:</p></td>
  			<td></td>
  			<td></td>
  			<td></td>
  			</tr>
  			<tr id = "cellConstraintOption">
   				<td>
   					<!-- field drop-down menu -->
					<div id = "dropholder" style="margin-left: 60px;background-color: #ea808f;">
  						<p class = "dropP">&nbsp;Field&nbsp;&nbsp;</p>
						<div class="dropdown">
						
   							<form:select class="dropSelect backgroundDropdown" path="cellField">
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
					</div>
   				</td>
    			<td>
    				<!-- operations drop-down menu -->
					<div id = "dropholder" style="background-color: #ea808f;">
  						<p class = "dropP">OPS&nbsp;&nbsp;&nbsp;&nbsp;</p>
						<div class="dropdown">
  							
   							<form:select class="dropSelect backgroundDropdown" path="cellOperations">
								<form:option value="default">&nbsp;</form:option>
   								<form:option value="Contains">Contains</form:option>
   								<form:option value="Greater">&gt;</form:option>
   								<form:option value="Samller">&lt;</form:option>
   								<form:option value="Range">Range</form:option>
   								<form:option value="Type">Type</form:option>  	
							</form:select>  
							
						</div>
					</div>
    			</td> 
    			<td>
    				<!--input the value  -->
					<div id = "inputField">
						<!-- <input type="text" placeholder=":constraints"> -->
						<form:input path="cellConstraintValue" />
					</div> 
    			</td>
    			<td>
    				<!-- And/Or drop-down menu -->
					<div id = "dropholder" class = "inline" style="margin-right: 60px;background-color: #ea808f;">
  						<p class = "dropP">And/Or</p>
						<div class="dropdown">

   							<form:select class="dropSelect backgroundDropdown" path="cellLogic" id="logicCell" onchange="logicCellDropdown()">
   								<form:option value="default">&nbsp;</form:option>
   								<form:option value="And">And</form:option>
   								<form:option value="Or">Or</form:option>	
							</form:select> 
 
						</div>
					</div> 
    			</td>
  			</tr>
  			</table> <!-- constraint cell end -->
  		
  			
  			<table>
  			<tr>
  				<td>
  				<a class="fileButton" style="margin-left:635px;" href="${pageContext.request.contextPath}/dashboardPage" class="button">Clear</a>

  				<td>
  				<input  class="fileButton" style="margin-left:20px;" type="submit" value="Submit& Run"></td>
  			</tr>
  			
			</table>
			
			</form:form> --%>
			
			
			
			
			<div> <!-- query result -->
			
			<div class="container">

				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">Result</li>
					<li class="tab-link" data-tab ="tab-2" id="tab-2-li">Text</li>
				</ul>

				<div id="tab-1" class="tab-content current"> <!-- table result -->
					
					<c:if test="${not empty tables}">
					

					<table class= "textResultTable">

						<c:forEach var="table" items="${tables}">
						<tr>
							<td><a href= "http://www.ncbi.nlm.nih.gov/pmc/articles/PMC${table.pmcid}" target="_blank">${table.pmcid}</a></td>
                			<td>${table.tableCaption}</td>
                			<td>
                				<a onclick="myFuncton('${table.tableOrder}','${table.pmcid}');" class="tableResult">${table.tableOrder}</a>
                			</td> 
						</tr>
						</c:forEach>
						
					</table>

					</c:if> 
						
					
				</div>
				<div id="tab-2" class="tab-content">

		 		</div>

			</div> <!-- result tabs end -->				
					
			</div> <!-- query result end -->
			
		</div> <!-- body content end -->
		
		<!-- footer -->
		<div class = "div4">
			<p class="font_3">Copyright © 2016 Grace Tang.&nbsp;All Rights Reserved.&nbsp;&nbsp; </p>
		</div> <!-- footer end -->
	
		
	</div> <!-- div12 end -->
</body>
</html>