<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/Dashboard.css" />
	<title>Dashboard</title>
</head>
<body class = "bodyBackground">

<div class = "div9">

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
	<div class = "div10">
	
	<!-- add text -->
	<div class = "div11">
		<p class="font_4"><span class="color_2">Select</span></p>
		<p class="font_5"><span class="color_2">1. Select tables</span></p>
		<p class="font_12">You can get tables from tables in clinic literatures through the following operations.</p>
		<p class="font_12">Select radio button with the value of "Tables"</p>
		<p class="font_12">Set the constraints of tables through selections of "Field", "Operation" drop-down menu. In addition, you also should input the value of the&nbsp;constraint&nbsp;in the text field. If there are more than one constriaints, you need to select in the "And/Or" drop-down menu.</p>
		
		<p class="font_5"><span class="color_2">2. Select cells</span></p>
		<p class="font_12">You can get cells from tables in&nbsp;clinic literatures through the following operations.</p>
		<p class="font_12">Select radio button with the value of "Cells"</p>
		
		<p class="font_12">1. Set the constriants of the table which contains the cell you need</p>
		<p class="font_12">The operations are same to above.</p>

		<p class="font_12">2. Set the constriants of the cell</p>
		<p class="font_12">Set the constraints of cells through selections of "Field", "Operation" drop-down menu. In addition, you also should input the value of the&nbsp;constraint&nbsp;in the text field. If there are more than one constriaints, you need to select in the "And/Or" drop-down menu.</p>

		<p class="font_5"><span class="color_2">3. Select count</span></p>
		<p class="font_12">You can get number of tables or cells</p>
		<p class="font_12">Select radio button with the value of "Count"</p>
		<p class="font_12">Set the constraints of tables through selections of "Field", "Operation" drop-down menu. In addition, you also should input the value of the&nbsp;constraint&nbsp;in the text field. If there are more than one constriaints, you need to select in the "And/Or" drop-down menu.</p>
		
		<p class="font_4"><span class="color_2">Query</span></p>
		<p class="font_12">Click "Submit" button or&nbsp;click a line in the list.</p>
		
		<p class="font_4"><span class="color_2">Clear</span></p>
		<p class="font_12">Click clear button the clear the list.</p>
		
		<p class="font_4"><span class="color_2">Clear history</span></p>
		<p class="font_12">Click the clear button to clear history</p>
		
		<p class="font_4"><span class="color_2">Run queries in the history list</span></p>
		<p class="font_12">Click the run button following the query you want to input</p>
	
	</div> <!-- body text end -->

	</div> <!-- body end -->
	
	<!-- footer -->
	<div class = "div4">
		<p class="font_3">Copyright © 2016 Grace Tang.&nbsp;All Rights Reserved.&nbsp;&nbsp; </p>
	</div> <!-- footer end -->
	
</div>

</body>
</html>