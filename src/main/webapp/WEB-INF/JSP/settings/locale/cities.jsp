<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vdapp" uri="http://vdapp.com/core/tags"%>
<%@taglib prefix="vmod" uri="http://vdapp.com/vmod/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<%-- Spring-taglibs --%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>

<!DOCTYPE html>
<html>

  <head>
    <vdapp:head title="Locale Settings - Edit Cities"/>
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
        
      <c:choose>
      <c:when test="${not empty country}">
      <li><a href="<c:url value='/settings/locale/countries/cities'/>">Edit Cities</a></li>
      <li class="active">${country.name}</li>
      </c:when>
        
      <c:otherwise>
      <li class="active">Edit Cities</li>
      </c:otherwise>
      </c:choose>
    </ol>
    
    <c:choose>

    <c:when test="${not empty countries}">
    <div class="container-fluid">
      <h1>Cities in:
        <c:if test="${not empty country}">
        <span class="small"> ${country.name}</span>
        </c:if>
      </h1>
      
      <form action="<c:url value='/settings/locale/countries/cities'/>">
        <select id="select-country" name="country" class="form-control" onchange="this.form.submit();">
          <option value="">- Select country -</option>
          <c:forEach var="availableCountry" items="${countries}">
          <option value="${availableCountry.id}"<c:if test="${not empty country and availableCountry.id == country.id}"> selected</c:if>>
          	${availableCountry.name}<c:if test="${not availableCountry.enabled}"> (disabled)</c:if></option>
          </c:forEach>
        </select>
      </form>
    </div>
    
    <c:choose>
    
    <c:when test="${empty country}">
    <div class="container-fluid">
      <div class="toolset">
        <a href="<c:url value='/settings/locale'/>" class="btn btn-default">
          <i class="fa fa-arrow-circle-left"></i> Return</a>
        <a href="<c:url value='/settings/locale/cities/new'/>" class="btn btn-success"><bs:fa icon="asterisk"/> New City...</a>
      </div>
    </div>
    </c:when>
    
    <c:otherwise>
    <form method="post">
    <div class="container-fluid">
      <div class="toolset">
        <a href="<c:url value='/settings/locale'/>" class="btn btn-default">
          <i class="fa fa-arrow-circle-left"></i> Return</a>
        <button id="btn-selectAll" type="button" class="btn btn-default" role="selector">
          <i class="fa fa-square-o fa-fw"></i> Select All</button>
        <button id="btn-removeSelected" name="removeSelected" type="submit" class="btn btn-danger" disabled role="disableOnSubmit">
          <bs:fa icon="trash"/> Remove selected</button>
        <c:if test="${country.enabled}">
        <a href="<c:url value='/settings/locale/countries/${country.id}/cities/new'/>" class="btn btn-success"><bs:fa icon="plus"/> Add City</a></c:if>
        <c:if test="${not country.enabled}">
        <a class="btn btn-primary" data-toggle="modal" data-target="#countryDisabledModal">
            <bs:gi icon="info-sign"/></a>
            <vmod:country-disabled continentId="${country.continent.id}"/></c:if>

        <div class="btn-group pull-right">
          <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"><i class="fa fa-sort fa-fw"></i> Sort <span class="caret"></span></button>
          <ul class="dropdown-menu">
            <c:url var="sortUrl" value='/settings/locale/countries/${country.id}/cities'>
              <c:param name="sort" value="name"/>
            </c:url>
            <li><a href="${sortUrl}"><i class="fa fa-sort-alpha-asc fa-fw"></i> Sort by name</a></li>
            <c:url var="sortUrl" value='/settings/locale/countries/${country.id}/cities'>
              <c:param name="sort" value="postalCode"/>
            </c:url>
            <li><a href="${sortUrl}"><i class="fa fa-sort-numeric-asc fa-fw"></i> Sort by postal code</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="<c:url value='/settings/locale/countries/${country.id}/cities'/>"><i class="fa fa-unsorted fa-fw"></i> Unsorted</a></li>
          </ul>
</div>
      </div>
    </div>
    
    <div class="container-fluid">
      <div class="frame-container">
        <c:choose>
        <c:when test="${not empty cities}">
        <c:forEach var="city" items="${cities}" varStatus="loop">
        <input type="checkbox" id="${city.id}" name="city" value="${city.id}" class="medium"/>
        <label for="${city.id}">
          <a href="<c:url value='/settings/locale/cities/${city.id}'/>">(${city.postalCode}) ${city.name}</a></label>
        <br>
        </c:forEach>
        </c:when>
        
        <c:otherwise>
        <div class="well">No cities found</div>
        </c:otherwise>
        </c:choose>
      </div>
    </div>
    </form>
    </c:otherwise>
    
    </c:choose>
    
    
    <script type="text/javascript">
      handleSelectAllFunction('btn-selectAll', 'city', 'Select All', 'Unselect All', true, true);
      handleControlEnabled('btn-removeSelected', 'city', true);
    </script>
    </c:when>
    
    <c:otherwise>
      <div class="container-fluid">
        <h2>No countries found</h2>
      </div>
    </c:otherwise>
    </c:choose>
  </body>
</html>