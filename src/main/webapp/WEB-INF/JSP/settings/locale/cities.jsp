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
    </div>
    
    <c:choose>

    <c:when test="${not empty countries}">
    <div class="container-fluid">
      <h1>Cities
        <c:if test="${not empty country}">
        :<span class="small"> ${country.name}</span>
        </c:if>
        </h1>
      
      <form action="<c:url value='/settings/locale/countries/cities'/>">
        <select id="select-country" name="country" class="form-control" onchange="this.form.submit();">
          <option value="">- Select country -</option>
          <c:forEach var="availableCountry" items="${countries}">
          <option value="${availableCountry.id}"<c:if test="${not empty country and availableCountry.id == country.id}"> selected</c:if>>${availableCountry.name}</option>
          </c:forEach>
        </select>
      </form>
    </div>
    
    
    <c:if test="${not empty country}">
    <div class="container-fluid">
      <div class="toolset">
        <button type="button" class="btn btn-primary">Select All</button>
        <button type="button" class="btn btn-primary">Unselect All</button>
        <button type="submit" class="btn btn-danger"><bs:fa icon="remove"/> Remove selected</button>
        <a href="#" class="btn btn-success"><bs:fa icon="asterisk"/> New City</a>
      </div>
    </div>
    
    <div class="container-fluid">
      <div class="frame-container">
        <c:choose>
        <c:when test="${not empty country.cities}">
        <c:forEach var="city" items="${country.cities}">
        <input type="checkbox" id="${city.id}" name="city" value="${city.id}" class="medium"/>
        <label for="${city.id}">
          <a href="<c:url value='/settings/locale/cities/${city.id}'/>">${city.postalCodeAndName}</a></label>
        <br>
        </c:forEach>
        </c:when>
        
        <c:otherwise>
        <div class="well">No cities found</div>
        </c:otherwise>
        </c:choose>
      </div>
    </div>
    </c:if>
    </c:when>
    
    <c:otherwise>
      <div class="container-fluid">
        <h2>No countries found</h2>
      </div>
    </c:otherwise>
    </c:choose>
    <script type="text/javascript">
    $(document).ready(function () {
        $("select").each(function () {
            $(this).val($(this).find('option[selected]').val());
        });
    })
    </script>
  </body>
</html>