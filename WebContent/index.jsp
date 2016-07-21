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
	
	<!-- Strip -->
	<div id = "pictureStrip" class ="font_6"> 
		<span class = "color_3">Web-based Dashboard</span>
	</div>

	<div class = "div12">
	
 		<!-- body content -->
		<div class = "div13">
		
			<!-- content --> 
			<div class = "div16">
			
				<table> <!-- hyper link to dashboard page -->
					<tr>
						<td>
							<p class="font_10">Introduction</p>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td>
							<div class ="div141">
								<h3>The University of Manchester</h3>
								<p class="font_1">The The University of Manchester (UoM) is a public research university in the city of Manchester, England. </p>
								<a class="font_1" href="http://www.manchester.ac.uk/" >Read more ></a>
							</div>
						</td>
						<td>
						
							<!-- text -->
							<div class ="div14">
								<h3>Dashboard</h3>
								<p class="font_1">The dashboard is a data querying web-application retrieving information from tables in clinical literature and is an postgraduate project in the University of Manchester.</p>
								<a class="font_1" href="dashboardPage" >Try it ></a>
							
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<p class="font_11">Guide</p>
						</td>
						<td>
						</td>
					</tr>
					
				</table>
				
				<table>
					<tr>
						<td>
						
							<!-- text -->
							<div class ="div143">
								<h3>How to use</h3>
								<p class="font_1">Three steps to finish the query!<br/>
								1. select the retrieve type: Table, Cell, Number<br/>
								2. select and input the constraints<br/>
								3. run it</p>
								<a class="font_1" href="use.jsp" >Read more ></a>
							
							</div>
						</td>
						
						<td>
							<div class ="div142">
								<h3>About author</h3>
								<p class="font_1">The author is a Chinese programmer. She is really interested in the development of web application. </p>
								<a class="font_1" href="author.jsp" >Read more ></a>
							</div>
						</td>
						
					</tr>
				</table>
				
			</div><!-- content end -->

		</div> <!-- body content end -->
	
		<!-- footer -->
		<div class = "div4">
			<p class="font_3">Copyright © 2016 Grace Tang.&nbsp;All Rights Reserved.&nbsp;&nbsp; </p>
		</div> <!-- footer end -->
	
	</div>

</body>
</html>