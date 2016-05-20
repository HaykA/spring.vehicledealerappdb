<%@tag language="java" description="head" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name='title' required='true' type='java.lang.String'%>
<%@attribute name='showBrandname' required='false' type='java.lang.Boolean'%>
<%@attribute name='ignoreDefaultCss' required='false' type='java.lang.Boolean'%>

<link rel="shortcut icon" href="<c:url value='/images/core/favicon.png'/>" type="image/png"/>

<title><c:if test="${showBrandname}">SimpleInvoice - </c:if>${title}</title>

<script type="text/javascript" src='<c:url value='/browser/3p/bootstrap/js/jquery.min.js'/>'></script>
<script type="text/javascript" src='<c:url value='/browser/3p/bootstrap/js/bootstrap.min.js'/>'></script>
<link rel="stylesheet" href="<c:url value='/browser/3p/bootstrap/css/bootstrap.min.css' />" type="text/css"/>

<link rel="stylesheet" href="<c:url value='/browser/3p/fa/css/font-awesome.min.css'/>">

<script type="text/javascript" src='<c:url value='/browser/core/js/default.js'/>'></script>
<c:if test="${not ignoreDefaultCss}">
<link rel="stylesheet" href="<c:url value='/browser/core/css/default.css' />" type="text/css"/>
</c:if>