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

  <form:form commandName='continent' id='continentform'>
    <div class="container-fluid">
      <h1>${continent.name}</h1>
      <div class="toolset">
        <button type="button" class="btn btn-primary">Select All</button>
        <button type="button" class="btn btn-primary">Unselect All</button>
	  </div>
    </div>
    
    <div class="container-fluid">
      <div class="frame-container"> 
        <c:forEach var="country" items="${continent.countries}" varStatus="loop">
        
        <!-- 
        <form:checkbox path="countries['${loop.index}'].enabled"/>
        <form:label path="countries['${loop.index}'].enabled">
          ${countries['${loop.index}'].name}
        </form:label>
 -->
        
        <input class="medium" id="${country.id}" type="checkbox"<c:if test="${country.enabled}"> checked</c:if>/>
        <label class="medium" for="${country.id}">${country.name}</label>
        <br/>      
        </c:forEach>
      </div>
  </div>
<div class="container-fluid">
  <div class="toolset">
    <button type="button" class="btn btn-lg btn-default"><i class="fa fa-reply"></i> Cancel</button>
    <button type="button" class="btn btn-lg btn-info"><i class="fa fa-save"></i> Save</button>
  </div>
</div>
  </form:form>
</body>
</html>