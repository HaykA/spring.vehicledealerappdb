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

    <c:when test="${not empty countries}">
    <div class="container-fluid">
      <h1>Cities</h1>

      <select id="select-country" name="country" class="form-control" onchange="this.form.submit();">
        <option value="">- Select country -</option>
        <c:forEach var="availableCountry" items="${countries}">
        <option value="${availableCountry.id}"<c:if test="${not empty country and availableCountry.id == country.id}"> selected</c:if>>${availableCountry.name}</option>
        </c:forEach>
      </select>
    </div>
    
    <c:if test="${not empty country and not empty country.cities}">
    <div class="container-fluid">
      <pre>
        <c:forEach var="city" items="${country.cities}">
        ${city.postalCode}&nbsp;${city.name}<br>
        </c:forEach>
      </pre>
    </div>
    </c:if>
    </c:when>
    
    <c:otherwise>
      <div class="container-fluid">
        <h1>No countries found</h1>
      </div>
    </c:otherwise>
    </c:choose>

  <script type="text/javascript">
  	var action = "<c:url value='/settings/locale/countries/'/>"; 
  	var $selectCountry = $('#select-country');
  	$selectCountry.change(function() {
  		action += $selectCountry.val() + '/cities';
  		location.href = action;
  	});
  </script>
</body>
</html>

