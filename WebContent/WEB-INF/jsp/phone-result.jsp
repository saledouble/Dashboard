<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Phone result page</title>
</head>
<body>
<h1>Phone result page</h1>
Selected phone:
<br/>

${queryValue.select}
${queryValue.field}
${queryValue.constraintValue}
${queryValue.logic}

<%-- ${smartphone.phone} --%>
<br/>
<a href="${pageContext.request.contextPath}/">Main page</a>
</body>
</html>