<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vdapp" uri="http://vdapp.com/core/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<!DOCTYPE html>
<html>

  <head>
    <vdapp:head title="Hello World"></vdapp:head>
  </head>
  
<body>
  <ul class="ul3">
    <li>Enabled Continents</li>
    <c:forEach var="continent" items="${enabledContinents}">
    <li>
      <ul>
        <li>${continent.name}</li>
        <li>
          <dl>
            <dt>Enabled Countries</dt>
            
            <c:forEach var="country" items="${continent.enabledCountries}">
            <dd>${country.name}</dd>
            </c:forEach>
            <c:if test="${empty continent.enabledCountries}">
            <dd>(empty)</dd>
            </c:if>
            <dt>Disabled Countries</dt>
            <c:forEach var="country" items="${continent.disabledCountries}">
            <dd>${country.name}</dd>
            </c:forEach>
            <c:if test="${empty continent.disabledCountries}">
            <dd>(empty)</dd>
            </c:if>
          </dl>
        </li>
      </ul>
    </li>
	</c:forEach>

    <li>Disabled Continents</li>
    <c:forEach var="continent" items="${disabledContinents}">
    <li>
      <ul>
        <li>${continent.name}</li>
        <li>
          <dl>
            <dt>Enabled Countries</dt>
            <c:forEach var="country" items="${continent.enabledCountries}">
            <dd>${country.name}</dd>
            </c:forEach>
            <c:if test="${empty continent.enabledCountries}">
            <dd>(empty)</dd>
            </c:if>
            <dt>Disabled Countries</dt>
            <c:forEach var="country" items="${continent.disabledCountries}">
            <dd>${country.name}</dd>
            </c:forEach>
            <c:if test="${empty continent.disabledCountries}">
            <dd>(empty)</dd>
            </c:if>
          </dl>
        </li>
      </ul>
    </li>
  </c:forEach>
  </ul>

</body>
</html>