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
      <li><a href="<c:url value='/settings/locale/countries/cities'/>">Edit Cities</a></li>
      <li><a href="<c:url value='/settings/locale/countries/${street.city.country.id}/cities'/>">${street.city.country.name}</a></li>
      <li><a href="<c:url value='/settings/locale/cities/${street.city.id}/streets'/>">${street.city.postalCodeAndName}</a></li>
      <li class="active">${street.name}</li>
    </ol>

    
    <c:choose>

    <c:when test="${not empty street}">
    <div class="container-fluid">
      <h1>${street.name}
        <span class="small"> (${street.city.postalCodeNameAndCountry})</span>
        </h1>
    </div>
    
    <div class="container-fluid">
      
      <div class="col-sm-12 row">
        <div class="col-sm-6 row">
          <select id="select-country" name="country" class="form-control">
            <option value="">- Select country -</option>
            <c:forEach var="availableCountry" items="${countries}">
            <option value="${availableCountry.id}"<c:if test="${not empty city.country and availableCountry.id == city.country.id}"> selected</c:if>>${availableCountry.name}</option>
            </c:forEach>
          </select><br>
        </div>
      </div>
      
      <div class="col-sm-12 row">
        <div class="col-sm-6 row">
          <select id="select-city" name="city" class="form-control">
            <option value="">- Select city -</option>
            <c:forEach var="city" items="${cities}">
            </c:forEach>
          </select><br>
        </div>
      </div>
      
      <div class="col-sm-12 row">
        <div class="col-sm-6 row">
          <input type="text" class="form-control" placeholder="Name" value="${street.name}"/><br>
        </div>
      </div>
      
      <div class="col-sm-12 row">
        <div class="col-sm-6 row">
          <input type="text" class="form-control" placeholder="Postal Code Prefix" value="${street.postalCodePrefix}"/><br>
        </div>
      </div>
      
      <div class="col-sm-12 row">
        <div class="col-sm-6 row">
          <input type="text" class="form-control" placeholder="Postal Code Suffix" value="${street.postalCodeSuffix}"/>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="toolset">
        <button type="submit" class="btn btn-lg btn-info"><i class="fa fa-save"></i> Save</button>
        <a href="<c:url value='/settings/locale/cities/${street.city.id}/streets'/>" class="btn btn-lg btn-default"><i class="fa fa-remove"></i> Cancel</a>
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