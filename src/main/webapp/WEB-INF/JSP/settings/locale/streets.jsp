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
      <li><a href="<c:url value='/settings/locale/countries/${city.country.id}/cities'/>">${city.country.name}</a></li>
      <li class="active">${city.postalCodeAndName}</li>
    </ol>
    
        
    <div class="container-fluid">
      <a href="<c:url value='/settings/locale/cities/${city.id}'/>" class="btn btn-default">
        <i class="fa fa-arrow-circle-left"></i> Return</a>
    </div>
    
    <div class="container-fluid">
      <h1>Streets
        <c:if test="${not empty city}">
        :<span class="small"> ${city.name} (${city.postalCode}, ${city.country.name})</span>
        </c:if>
        </h1>
    </div>
    
    <form method="post">
    <div class="container-fluid">
      <div class="toolset">
        <button id="btn-selectAll" type="button" class="btn btn-default" role="selector">
          <i class="fa fa-square-o fa-fw"></i> Select All</button>
        <button id="btn-removeSelected" type="submit" class="btn btn-danger" disabled role="disableOnSubmit">
          <bs:fa icon="trash"/> Remove selected</button>
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
    </form>
    
    <script type="text/javascript">
      handleSelectAllFunction('btn-selectAll', 'street', 'Select All', 'Unselect All', true, true);
      handleControlEnabled('btn-removeSelected', 'street', true);
    </script>
    
  </body>
</html>