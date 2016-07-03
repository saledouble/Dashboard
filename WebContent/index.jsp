<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/Dashboard.css" />
	<link rel="stylesheet" type="text/css" href="resources/DataQuery.css" />
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
			<!-- retrieve -->
			<!-- input the constraints -->
			
			<table style="width:100%">
  			<tr>
    			<td>
    				<!-- select drop-down menu -->
					<div id = "dropholder" style="margin-left: 60px;">
  					<p class = "dropP">Select</p>
						<div class="dropdown">
  						<button class="dropbtn">&nbsp;&nbsp;</button>
 				 		<div class="dropdown-content">
    						<a href="#">Table</a>
    						<a href="#">Cell</a>
    						<a href="#">Number</a>
  						</div>
						</div>
					</div>
    			</td>
    			<td></td> 
    			<td></td>
    			<td></td>
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
			</table>
	
			<!-- list of query -->
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
			
			<hr id = "indexHr"/>
			
			<!-- result -->
			<div>
			</div>

			


		</div> <!-- body content end -->
	
		<!-- footer -->
		<div class = "div4">
			<p class="font_3">Copyright © 2016 Grace Tang.&nbsp;All Rights Reserved.&nbsp;&nbsp; </p>
		</div> <!-- footer end -->
	
	</div>

</body>
</html>