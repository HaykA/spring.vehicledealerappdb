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
    <%-- Header --%>
    <header>
      <vdapp:header/>
    </header>
    
    <%-- Breadcrumb --%>
    <ol class="breadcrumb">
      <li><a href="<c:url value='/'/>" data-toggle="tooltip" title="Home"><bs:fa icon="home"/></a></li>
      <li><a href="<c:url value='/settings'/>" data-toggle="tooltip" title="Settings"><bs:fa icon="gear"/></a></li>
      <li><a href="<c:url value='/settings/locale'/>" data-toggle="tooltip" title="Locale Settings"><bs:fa icon="globe"/></a></li>
      <li class="active">Enable/Disable Countries</li>
    </ol>

    <div class="col-sm-12">
      <a href="<c:url value='/settings/locale'/>" class="btn btn-default">
        <i class="fa fa-arrow-circle-left"></i> Return</a>
    </div>
    
    <c:choose>

    <c:when test="${not empty continents}">
    <div class="col-sm-12"><h1>Enable / Disable Countries</h1></div>
    
    <div class="col-sm-6">
      <h3>Continents</h3>
      <div class="list-group">
        <c:forEach var="continent" items="${continents}">
        <a href="<c:url value='/settings/locale/continents/${continent.id}'/>" class="list-group-item">
          <i class="fa fa-arrow-circle-right fa-fw"></i> ${continent.name}</a>
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