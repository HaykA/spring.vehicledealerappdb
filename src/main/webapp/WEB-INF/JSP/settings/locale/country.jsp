<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vdapp" uri="http://vdapp.com/core/tags"%>
<%@taglib prefix="vform" uri="http://vdapp.com/vform/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<%-- Spring-taglibs --%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>

<!DOCTYPE html>
<html>

  <head>
    <vdapp:head title="Settings - Edit Country"></vdapp:head>
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
      <li><a href="<c:url value='/settings/locale/countries'/>">Edit Countries</a></li>
      <li><a href="<c:url value='/settings/locale/continents/${country.continent.id}/countries'/>">${country.continent.name}</a></li>
      <li class="active">${country.name}</li>
    </ol>
    
    <c:choose>

    <c:when test="${not empty country}">
    <div class="container-fluid">
      <h1>${country.name}<c:if test="${not empty country.nativeName}"><span class="small"> ${country.nativeName}</span></c:if></h1>
    </div>
    
    <vform:country/>
    
    </c:when>
    
    <c:otherwise>
      <div class="container-fluid">
        <h2>Country not found</h2>
      </div>
    </c:otherwise>
    </c:choose>
    
    
  </body>
  
</html>
