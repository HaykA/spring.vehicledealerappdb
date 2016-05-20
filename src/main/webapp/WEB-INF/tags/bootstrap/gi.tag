<%@tag language="java" description="gi" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name='icon' required='true' type='java.lang.String'%>
<%@attribute name='size' required='false' type='java.lang.Integer'%>

<span class="glyphicon glyphicon-${icon}<c:if test='${not empty size}'> gi-${size}x</c:if>" aria-hidden="true"></span>