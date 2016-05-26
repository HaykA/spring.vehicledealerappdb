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
    <div class="container-fluid">
      <ol class="breadcrumb">
        <li><a href="<c:url value='/'/>" data-toggle="tooltip" title="Home"><bs:fa icon="home"/></a></li>
        <li><a href="<c:url value='/settings'/>" data-toggle="tooltip" title="Settings"><bs:fa icon="gear"/></a></li>
        <li><a href="<c:url value='/settings/locale'/>" data-toggle="tooltip" title="Locale Settings"><bs:fa icon="globe"/></a></li>
        <li><a href="<c:url value='/settings/locale/countries/cities'/>">Edit Cities</a></li>
        <li><a href="<c:url value='/settings/locale/countries/${city.country.id}/cities'/>">${city.country.name}</a></li>
        <li class="active">${city.postalCodeAndName}</li>
      </ol>
    </div>
    
    <div class="container-fluid">
      <h1>Streets
        <c:if test="${not empty city}">
        :<span class="small"> ${city.name} (${city.postalCode}, ${city.country.name})</span>
        </c:if>
        </h1>
    </div>
    
    
    <div class="container-fluid">
      <div class="toolset">
        <button type="button" class="btn btn-primary">Select All</button>
        <button type="button" class="btn btn-primary">Unselect All</button>
        <button type="submit" class="btn btn-danger"><bs:fa icon="remove"/> Remove selected</button>
        <a href="#" class="btn btn-success"><bs:fa icon="asterisk"/> New Street</a>
      </div>
    </div>
    
    <div class="container-fluid">
      <div class="frame-container">
        <c:choose>
        <c:when test="${not empty city.streets}">
        <c:forEach var="street" items="${city.streets}">
        <input type="checkbox" id="${street.id}" name="street" value="${street.id}" class="medium"/>
        <label for="${street.id}">
          <a href="<c:url value='/settings/locale/streets/${street.id}'/>">${street.name}</a></label>
        <br>
        </c:forEach>
        </c:when>
        
        <c:otherwise>
        <div class="well">No streets found</div>
        </c:otherwise>
        </c:choose>
      </div>
    </div>

  </body>
</html>