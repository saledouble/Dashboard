<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script type="text/javascript" src="<%=path %>/resources/js/tabs.js" ></script>
	
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
        			<th width = "150px">Select</th>
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
			
			<table style="width:100%">
  			<tr>
    			<td>
					<!-- select drop-down menu -->
					<div id = "dropholder" style="margin-left: 60px;">
  					<p class = "dropP">Select</p>
						<div class="dropdown">
						
							<select class="dropSelect" name="select">
								<option selected disabled hidden></option>
   								<option value="Table">Table</option>
   								<option value="Cell">Cell</option>
   								<option value="Number">Number</option>
							</select> 
												
						</div> 

					</div> 					

    			</td>
    			<td>

 					<%-- <a href="<%=path %>/hello">Click Here</a>  --%>
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
  						<button class="dropbtn">&nbsp;&nbsp;</button>
 				 			<div class="dropdown-content">
						    	<a href="#">Cell</a>
    							<a href="#">Caption</a>
    							<a href="#">Stub</a>
    							<a href="#">Super-row</a>
    							<a href="#">Header</a>
    							<a href="#">Footer</a>
    							<a href="#">Row</a>
    							<a href="#">Column</a>   
  							</div>
						</div>
					</div>
   				</td>
    			<td>
    				<!-- operations drop-down menu -->
					<div id = "dropholder">
  						<p class = "dropP">OPS&nbsp;&nbsp;</p>
						<div class="dropdown">
  						<button class="dropbtn">&nbsp;&nbsp;</button>
 				 			<div class="dropdown-content">
 				 			    <a href="#">Contains</a>
    							<a href="#">&gt;</a>
    							<a href="#">&lt;</a>
    							<a href="#">Range</a>
    							<a href="#">Type</a>  	 							
  							</div>
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
  						<button class="dropbtn">&nbsp;&nbsp;</button>
 				 			<div class="dropdown-content">
 				 			    <a href="#">And</a>
    							<a href="#">Or</a> 							
  							</div>
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
			
			
			<!-- result -->
			<div class="container">

				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">Result</li>
					<li class="tab-link" data-tab ="tab-2">Text</li>
				</ul>

				<div id="tab-1" class="tab-content current">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
				</div>
				<div id="tab-2" class="tab-content">
		 			Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>

			</div> <!-- result tabs end -->
			
		</div> <!-- body content end -->
	
		<!-- footer -->
		<div class = "div4">
			<p class="font_3">Copyright © 2016 Grace Tang.&nbsp;All Rights Reserved.&nbsp;&nbsp; </p>
		</div> <!-- footer end -->
	
	</div>

</body>
</html>