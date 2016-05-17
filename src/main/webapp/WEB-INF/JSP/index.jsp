<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello World!</h1>
	
	<h2>Countries</h2>
	<ul>
	<c:forEach var="country" items="${countries}">
	<li>${country.name}</li>	
	</c:forEach>
	</ul>
</body>
</html>