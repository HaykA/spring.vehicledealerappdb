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
    
    <c:choose>

    <c:when test="${not empty city}">
    <div class="container-fluid">
      <h1>${city.country.name}
        <span class="small"> ${city.postalCodeAndName}</span>
        </h1>
    </div>
    
    <div class="container-fluid">
      <div class="toolset">
        <a href="<c:url value='/settings/locale/countries/${city.country.id}/cities'/>" class="btn btn-default"><i class="fa fa-reply"></i> Cancel</a>
        <a href="<c:url value='/settings/locale/cities/${city.id}/streets'/>" class="btn btn-primary"><bs:fa icon="edit"/> Edit Streets...</a>
      </div>
    </div>
    
    <div class="container-fluid">
      
      <select id="select-country" name="country" class="form-control">
        <option value="">- Select country -</option>
        <c:forEach var="availableCountry" items="${countries}">
        <option value="${availableCountry.id}"<c:if test="${not empty city.country and availableCountry.id == city.country.id}"> selected</c:if>>${availableCountry.name}</option>
        </c:forEach>
      </select>
      
      <input type="text" class="form-control" placeholder="Name" value="${city.name}"/>
      <input type="text" class="form-control" placeholder="Postal Code" value="${city.postalCode}"/>
    </div>

    <div class="container-fluid">
      <div class="toolset">
        <button type="submit" class="btn btn-lg btn-info"><i class="fa fa-save"></i> Save</button>
      </div>
    </div>
    
    </c:when>
    
    <c:otherwise>
      <div class="container-fluid">
        <h2>City not found</h2>
      </div>
    </c:otherwise>
    </c:choose>
  </body>
</html>