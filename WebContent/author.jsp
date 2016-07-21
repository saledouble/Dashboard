<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/Dashboard.css" />
	<title>Dashboard</title>
</head>
<body class = "bodyBackground">

<div class = "div1">

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
	
 	<!-- body  -->
	<div class = "div3"> 
		<!-- add header -->
		<div>
			<h2 class="font_2">Grace Tang</h2>
		</div>
		
		<hr id ="authorHr"/>
		
		<table id = "authorTable">
			<tr>
				<td>
					<img id = "imgAuthor" alt="" src="resources/img/photo.jpg" />
				</td>
				<td>
					<p class="font_13">Hi, I am Grace Tang, also called&nbsp;Yiming Tang which is my Chinese name. <br/><br/>
					I am a Chinese programmer and a student in&nbsp;the University of Manchester. <br/><br/>
					If you have any advice about this dashboard, please sent an e-mail to saledouble@qq.com.</p>
				</td>
			</tr>
		</table>

		
		<hr id ="authorHr"/>
	</div> <!-- body end -->
	
	<!-- footer -->
	<div class = "div4">
		<p class="font_3">Copyright © 2016 Grace Tang.&nbsp;All Rights Reserved.&nbsp;&nbsp; </p>
	</div> <!-- footer end -->
	
</div>
</body>
</html>