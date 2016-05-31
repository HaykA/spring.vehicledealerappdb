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
    <vdapp:head title="Settings - Branch"></vdapp:head>
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
      <li><a href="<c:url value='/settings/branch'/>" data-toggle="tooltip" title="Branch Settings"><bs:fa icon="building"/></a></li>
      <li><a href="<c:url value='/settings/branch/branches'/>">Edit Branches</a></li>
      <li class="active">${branch.name}</li>
    </ol>
    
    <c:choose>

    <c:when test="${not empty branch}">
    <div class="container-fluid">
      <h1>${branch.name}</h1>
    </div>
    
    <div class="container-fluid">
      <div class="toolset">
        <a href="<c:url value='/settings/branch'/>" class="btn btn-default">
          <i class="fa fa-arrow-circle-left"></i> Return</a>
        <a href="<c:url value='/settings/branch/branches/2/edit'/>" class="btn btn-primary">
          <i class="fa fa-edit"></i> Edit</a>
      </div>
    </div>
    
    <div class="container-fluid">
      ${branch.address.streetAndHouse}<br>
      ${branch.address.city.postalCodeAndName}<br>
    </div>
    
    </c:when>
    
    <c:otherwise>
      <div class="container-fluid">
        <h2>Branch not found</h2>
      </div>
    </c:otherwise>
    </c:choose>
    
    
  </body>
  
</html>
