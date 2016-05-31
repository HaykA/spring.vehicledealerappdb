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
    <vdapp:head title="Settings - Edit City"></vdapp:head>
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
      <li><a href="<c:url value='/settings/locale/countries/cities'/>">Edit Cities</a></li>
      <li><a href="<c:url value='/settings/locale/countries/${city.country.id}/cities'/>">${city.country.name}</a></li>
      <li class="active">(${city.postalCode}) ${city.name}</li>
    </ol>
    
    <c:choose>

    <c:when test="${not empty city}">
    <div class="container-fluid">
      <h1>${city.name}
        <span class="small"> (${city.postalCode})
        	<span class="small"> ${city.country.name}</span>
       	</span>
        </h1>
    </div>
    
    <vform:city/>
    
    </c:when>
    
    <c:otherwise>
      <div class="container-fluid">
        <h2>City not found</h2>
      </div>
    </c:otherwise>
    </c:choose>
    
    
  </body>
  
</html>
