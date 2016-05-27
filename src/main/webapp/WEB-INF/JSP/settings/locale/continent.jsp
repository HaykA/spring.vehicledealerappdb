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
    <%-- Header --%>
    <header>
      <vdapp:header/>
    </header>
    
    <%-- Breadcrumb --%>
    <ol class="breadcrumb">
      <li><a href="<c:url value='/'/>" data-toggle="tooltip" title="Home"><bs:fa icon="home"/></a></li>
      <li><a href="<c:url value='/settings'/>" data-toggle="tooltip" title="Settings"><bs:fa icon="gear"/></a></li>
      <li><a href="<c:url value='/settings/locale'/>" data-toggle="tooltip" title="Locale Settings"><bs:fa icon="globe"/></a></li>
      <li><a href="<c:url value='/settings/locale/continents'/>" data-toggle="tooltip" title="Continents">Enable/Disable Countries</a></li>
      <li class="active">${continent.name}</li>
    </ol>

    <c:choose>
    
    <c:when test="${not empty continent}">
    <form:form commandName='continent' id='continentform'>
      <div class="container-fluid">
        <h1>${continent.name}</h1>
        <div class="toolset">
          <button id="btn-selectAll" type="button" class="btn btn-default" role="selector">
            <i class="fa fa-square-o fa-fw"></i> Select All</button>
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
          <button type="submit" class="btn btn-lg btn-info" role="disableOnSubmit"><i class="fa fa-save"></i> Save</button>
          <a href="/vehicledealerapp/settings/locale/continents" class="btn btn-lg btn-default">
            <i class="fa fa-remove"></i> Cancel</a>
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
  
    <script type="text/javascript">
    	handleSelectAllFunctionForSlaveContainingName('btn-selectAll', 'countries', 'Select All', 'Unselect All', true, true);
    </script>
    
  </body>
</html>