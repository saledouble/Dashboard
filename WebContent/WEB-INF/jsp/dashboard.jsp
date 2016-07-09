<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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


<title>Web-based Dashboard</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
 $(document).ready(function(){
    $("#select").click(function(){
       /*  $("#cellConstraints").hide(); */
    	$("p").hide();
    });
    
});
/* 
$(document).ready(function(){
    $("#hide").click(function(){
        $("p").hide();
    });
    $("#show").click(function(){
        $("p").show();
    });
}); */
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
		
			<form:form method="POST" commandName="queryValue" action="phone-result.html">
			<table style="width:100%">
  			<tr>
    			<td>
					<!-- select drop-down menu -->
					<div id = "dropholder" style="margin: 20px 0 0 60px;">
  					<p class = "dropP">Select&nbsp;&nbsp;</p>
						<div class="dropdown">

							<form:select id = "select" class="dropSelect" name="select" path="select">
   								<form:option value="Defalut">&nbsp;</form:option>
   								<form:option value="Table">Table</form:option>
   								<form:option id = "selectCell" value="Cell">Cell</form:option>
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
  			<td><p class = "font_8">Table contraints:</p></td>
  			<td></td>
  			<td></td>
  			<td></td>
  			</tr>
  			<tr>
   				<td>
   					<!-- field drop-down menu -->
					<div id = "dropholder" style="margin-left: 60px;">
  						<p class = "dropP">&nbsp;Field&nbsp;&nbsp;</p>
						<div class="dropdown">
						
   							<form:select class="dropSelect" name="select" path="field">
   								<form:option value="Defalut">&nbsp;</form:option>
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
  							
   							<form:select class="dropSelect" name="select" path="operations">
								<form:option value="Defalut">&nbsp;</form:option>
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

   							<form:select class="dropSelect" name="select" path="logic" >
   								<form:option value="Defalut">&nbsp;</form:option>
   								<form:option value="And">And</form:option>
   								<form:option value="Or">Or</form:option>	
							</form:select> 
 
						</div>
					</div> 
    			</td>
  			</tr><!-- constraint table end -->
  			
  			<!-- constriant cell -->
  			<tr id= "cellConstraints">
  			<td><p class = "font_9">Cell contraints:</p></td>
  			<td></td>
  			<td></td>
  			<td></td>
  			</tr>
  			<tr>
   				<td>
   					<!-- field drop-down menu -->
					<div id = "dropholder" style="margin-left: 60px;background-color: #ea808f;">
  						<p class = "dropP">&nbsp;Field&nbsp;&nbsp;</p>
						<div class="dropdown">
						
   							<form:select class="dropSelect backgroundDropdown" name="select" path="field">
   								<form:option value="Defalut">&nbsp;</form:option>
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
  							
   							<form:select class="dropSelect backgroundDropdown" name="select" path="operations">
								<form:option value="Defalut">&nbsp;</form:option>
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
					<div id = "dropholder" class = "inline" style="margin-right: 60px;background-color: #ea808f;">
  						<p class = "dropP">And/Or</p>
						<div class="dropdown">

   							<form:select class="dropSelect backgroundDropdown" name="select" path="logic" >
   								<form:option value="Defalut">&nbsp;</form:option>
   								<form:option value="And">And</form:option>
   								<form:option value="Or">Or</form:option>	
							</form:select> 
 
						</div>
					</div> 
    			</td>
  			</tr>
  			<!-- constraint cell end -->
  			
  			<tr>
  				<td></td>
  				<td></td>
  				<td></td>
  				<td>
  				<input  id="fileButton" style="margin-right:50px;" type="submit" name="submit" value="Submit& Run"></td>
  			</tr>
  			
			</table>
			
			</form:form>
		</div>
	</div>
</body>
</html>