<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vdapp" uri="http://vdapp.com/core/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<%-- Spring-taglibs --%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>

<!DOCTYPE html>
<html>

  <head>
    <vdapp:head title="Settings - Continents"></vdapp:head>
  </head>
  
<body>

  <c:choose>
  <c:when test="${not empty continent}">
  <form:form commandName='continent' id='continentform'>
    
    <div class="container-fluid">
      <h1>${continent.name}</h1>
      <div class="toolset">
        <a href="<c:url value='/settings/locale/continents'/>" class="btn btn-default"><i class="fa fa-reply"></i> Cancel</a>
        <button type="button" class="btn btn-primary">Select All</button>
        <button type="button" class="btn btn-primary">Unselect All</button>
	  </div>
    </div>
    
    <div class="container-fluid">
      <div class="frame-container"> 
        <c:forEach var="country" items="${continent.countries}" varStatus="loop">
        <form:checkbox path="countries['${loop.index}'].enabled"
          cssClass="medium" label="${country.name}"/><br/>      
        </c:forEach>
      </div>
    </div>
  
    <div class="container-fluid">
      <div class="toolset">
        <button type="submit" class="btn btn-lg btn-info"><i class="fa fa-save"></i> Save</button>
      </div>
    </div>
    
  </form:form>
  </c:when>
  <c:otherwise>
    <div class="container-fluid">
      <h1>No such continent</h1>
    </div>
  </c:otherwise>
  </c:choose>
  
</body>
</html>