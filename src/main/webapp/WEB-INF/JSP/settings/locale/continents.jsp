<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vdapp" uri="http://vdapp.com/core/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<!DOCTYPE html>
<html>

  <head>
    <vdapp:head title="Settings - Continents"></vdapp:head>
  </head>
  
<body>
  
    <c:choose>

    <c:when test="${not empty continents}">
    <div class="container-fluid">
      <h1>Continents</h1>
      <div class="list-group">
        <c:forEach var="continent" items="${continents}">
        <a href="<c:url value='/settings/locale/continents/${continent.id}'/>"
          class="list-group-item">${continent.name}</a>
        </c:forEach>
      </div>
    </div>
    </c:when>
    
    <c:otherwise>
      <div class="container-fluid">
        <h1>No continents found</h1>
      </div>
    </c:otherwise>
    </c:choose>
</body>
</html>