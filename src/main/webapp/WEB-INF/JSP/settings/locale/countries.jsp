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
    <vdapp:head title="Locale Settings - Edit Countries"/>
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
      <c:when test="${not empty continent}">
      <li><a href="<c:url value='/settings/locale/countries'/>" data-toggle="tooltip" title="Edit Countries"><i class="fa fa-edit"></i></a></li>
      <li class="active">${continent.name}</li>
      </c:when>
        
      <c:otherwise>
      <li class="active"><i class="fa fa-edit"></i> Edit Countries</li>
      </c:otherwise>
      </c:choose>
    </ol>
    
    <c:choose>

    <c:when test="${not empty continents}">
    <div class="container-fluid">
      <h1><i class="fa fa-search"></i> Countries in:
        <c:if test="${not empty continent}">
        <span class="small"> ${continent.name}</span>
        </c:if>
      </h1>
      
      <form action="<c:url value='/settings/locale/countries'/>">
        <select id="select-continent" name="continent" class="form-control" onchange="this.form.submit();">
          <option value="">- Select continent -</option>
          <!-- <option value="-1"<c:if test="${empty continent}"> selected</c:if>>- Select continent -</option> -->
          <c:forEach var="selectedContinent" items="${continents}">
          <option value="${selectedContinent.id}"<c:if test="${not empty continent and selectedContinent.id == continent.id}"> selected</c:if>>
          	${selectedContinent.name}</option>
          </c:forEach>
        </select>
      </form>
    </div>

    <div class="container-fluid">
      <div class="toolset">
        <a href="<c:url value='/settings/locale'/>" class="btn btn-default">
          <i class="fa fa-arrow-circle-left"></i> Return</a>
      </div>
    </div>
    
    <c:if test="${not empty continent}">

    <form method="post">
    
    
    <div class="container-fluid">
      <div class="frame-container">
        <c:choose>
        <c:when test="${not empty countries}">
        <c:forEach var="country" items="${countries}">
        <a href="<c:url value='/settings/locale/countries/${country.id}'/>" class="medium" <c:if test="${not empty country.nativeName}"> data-toggle="tooltip" title="${country.nativeName}"</c:if>>${country.name}<c:if test="${not country.enabled}"> (disabled)</c:if></a>
        <br>
        </c:forEach>
        </c:when>
        
        <c:otherwise>
        <div class="well">No countries found</div>
        </c:otherwise>
        </c:choose>
      </div>
    </div>
    </form>
    </c:if>
    

    </c:when>
    
    <c:otherwise>
      <div class="container-fluid">
        <h2>No continents found</h2>
      </div>
    </c:otherwise>
    </c:choose>
  </body>
</html>