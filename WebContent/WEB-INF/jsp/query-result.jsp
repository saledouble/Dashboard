<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query result</title>
</head>
<body>
<h1>Query result</h1>
Options:
<br/>
 
select: ${queryValue.select}
<br/>
field: ${queryValue.field}
<br/>
ops: ${queryValue.operations }
<br/>
constraints: ${queryValue.constraintValue}
<br/>
logic: ${queryValue.logic}
<br/> 
<br/>

 	<c:if test="${not empty tables}">

		<table>
			<c:forEach var="table" items="${tables}">
				<tr>
				<td>${table.pmcid}</td>
                <td>${table.tableCaption}</td>
                <td>${table.tableOrder}</td> 
				</tr>
			</c:forEach>
		</table>

	</c:if>

<a href="${pageContext.request.contextPath}/">Main page</a>
</body>
</html>