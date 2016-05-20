<%@tag language="java" description="fa" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name='icon' required='true' type='java.lang.String'%>
<%@attribute name='style' required='false' type='java.lang.String'%>
<%@attribute name='size' required='false' type='java.lang.Integer'%>
<%@attribute name='fixedWidth' required='false' type='java.lang.Boolean'%>

<i class="fa fa-${icon}<c:if test='${not empty size}'> fa-${size}x</c:if><c:if test='${fixedWidth}'> fa-fw</c:if><c:if test='${not empty style}'> ${' '} ${style}</c:if>"></i>