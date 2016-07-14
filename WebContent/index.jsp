<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<%=path %>/resources/css/Dashboard.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/resources/css/DataQuery.css" />

	<!-- 有空试试本地导jQuery包，先这样写着 -->	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
<%-- 	<script type="text/javascript" src="<%=path %>/resources/js/tabs.js" ></script> --%>
	
	<title>Dashboard</title>
	
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
	
	<!-- Strip -->
	<div id = "pictureStrip" class ="font_6"> 
		<span class = "color_3">Web-based Dashboard</span>
	</div>

	<div class = "div12">
	
 		<!-- body content -->
		<div class = "div13">
		
			<!-- introduce --> 
			<div class = "div16">
				<!-- text -->
				<div class ="div14">
					<p class="font_1">The dashboard is a data querying dashboard retrieving information from tables in clinical literature.</p>
					<p class="font_1">The dashboard will work on top of a PhD project conducted of the University of Manchester by Nikola Milosevic.</p>
					<p class="font_1">The dashboard is a part of postgraduate project in the University of Manchester.</p>
				</div>
				
				<!-- img -->
				<div class = "div15">
					<img id = "imgUniversityIcon" alt="" src="resources/img/universityIcon.jpg" />
				</div>
				
			</div><!-- introduce end -->
			
			<hr id = "indexHr"/>
			
			<!-- query area -->
			<!-- list of query -->
			
			<p class="font_7" >Query history:</p>
			<table id="queryTable" class = "tableBody">
    		<thead>
    			<tr>
    				<th width = "50px"></th>
        			<th width = "150px">select</th>
            		<th>Constraints</th>
            		<th width = "100px">Query</th>
        		</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td><img id = "deleteImg" alt="" src="resources/img/delete.png" /></td>
        			<td>Stephen C. Cox</td>
            		<td>$300</td>
            		<td><button id ="runQuery">Run</button></td>
        		</tr>
        		<tr>
        			<td><img id = "deleteImg" alt="" src="resources/img/delete.png" /></td>
        			<td>Josephin Tan</td>
            		<td>$150</td>
            		<td><button id="runQuery">Run</button></td>
        		</tr>
        		<tr>
        			<td><img id = "deleteImg" alt="" src="resources/img/delete.png" /></td>
        			<td>Josephin Tan</td>
            		<td>$150</td>
            		<td><button id="runQuery">Run</button></td>
        		</tr>
        		<tr>
        			<td><img id = "deleteImg" alt="" src="resources/img/delete.png" /></td>
        			<td>Josephin Tan</td>
            		<td>$150</td>
            		<td><button id="runQuery">Run</button></td>
        		</tr>
   			 </tbody>
			</table>
				
			<!-- Save/ Import -->
			<table>
				<tr>
					<td width="660px"></td>
					<td><button id="fileButton">Import</button></td>
					<td><button id="fileButton">Save</button></td>
				</tr>
			</table>
			
			<hr id = "indexHr"/> <!-- query history end -->
			
			<!-- retrieve -->
			<!-- input the constraints -->		
<%-- 			
			<table style="width:100%">
  			<tr>
    			<td>
<!-- 					select drop-down menu
					<div id = "dropholder" style="margin-left: 60px;">
  					<p class = "dropP">select</p>
						<div class="dropdown"> -->

							<form:select class="dropSelect" name="select" path="phone">
								<form:option value = "default" selected disabled hidden></form:option>
   								<form:option value="Table">Table</form:option>
   								<form:option value="Cell">Cell</form:option>
   								<form:option value="Number">Number</form:option>
							</form:select> 
					
<!-- 						</div> 

					</div> 	 -->				

    			</td>
    			<td>

 					<a href="<%=path %>/hello">Click Here</a> 
    			</td>
    			
    			<td>
    			
    			<div></div>
    			
    			</td>
    			<td>
    			</td>
  			</tr>
  			<!-- constraint 1-->
  			<tr>
   				<td>
   					<!-- field drop-down menu -->
					<div id = "dropholder" style="margin-left: 60px;">
  						<p class = "dropP">&nbsp;Field&nbsp;&nbsp;</p>
						<div class="dropdown">
						
  							<form:select class="dropSelect" name="select" path="phone">
								<form:option value = "default"  selected disabled hidden></form:option>
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
  							
  							<form:select class="dropSelect" name="select" path="phone">
								<form:option value = "default"  selected disabled hidden></form:option>
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
						<input type="text" placeholder=":constraints">
					</div> 
    			</td>
    			<td>
    				<!-- And/Or drop-down menu -->
					<div id = "dropholder" class = "inline" style="margin-right: 60px;">
  						<p class = "dropP">And/Or</p>
						<div class="dropdown">

  							<form:select class="dropSelect" name="select" path="phone">
								<form:option value = "default" selected disabled hidden></form:option>
   								<form:option value="And">And</form:option>
   								<form:option value="Or">Or</form:option>	
							</form:select> 

						</div>
					</div> 
    			</td>
  			</tr>
  			<tr>
  				<td></td>
  				<td></td>
  				<td></td>
  				<td>
  				<input  id="fileButton" style="margin-right:50px;" type="submit" name="submit" value="Submit& Run"></td>
  			</tr>
  			
			</table>
			 --%>

			
		</div> <!-- body content end -->
	
		<!-- footer -->
		<div class = "div4">
			<p class="font_3">Copyright © 2016 Grace Tang.&nbsp;All Rights Reserved.&nbsp;&nbsp; </p>
		</div> <!-- footer end -->
	
	</div>

</body>
</html>