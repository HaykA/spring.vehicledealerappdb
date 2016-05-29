<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vdapp" uri="http://vdapp.com/core/tags"%>
<%@taglib prefix="vform" uri="http://vdapp.com/vform/tags"%>
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
      <c:if test="${not empty country}">
      <li><a href="<c:url value='/settings/locale/countries/${country.id}/cities'/>">${country.name}</a></li></c:if>
      <li class="active">New City</li>
    </ol>
    
    <div class="container-fluid">
      <h1>New City<c:if test="${not empty country}"><span class="small"> in ${country.name}</span></c:if></h1>
    </div>
    
    <vform:city newForm="true"/>
 
  </body>
  
</html>
