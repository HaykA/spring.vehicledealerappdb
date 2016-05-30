<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vdapp" uri="http://vdapp.com/core/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<!DOCTYPE html>
<html>

  <head>
    <vdapp:head title="Branch Settings - Edit Branches"></vdapp:head>
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
      <li class="active">Edit Branches</li>
    </ol>
    
    <div class="col-sm-12"><h1>Edit Branches</h1></div>
    
    <div class="container-fluid">
      <div class="toolset">
        <a href="<c:url value='/settings/branch'/>" class="btn btn-default">
          <i class="fa fa-arrow-circle-left"></i> Return</a>
      </div>
    </div>

    <div class="col-sm-6">
      <c:choose>
      <c:when test="${not empty page.content}">
      <div class="list-group">
        <c:forEach var="branch" items="${page.content}">
        <pre>
        ${branch.name} /
        ${branch.address.streetAndHouse} /
        ${branch.address.city.postalCodeAndName}
        </pre>
        </c:forEach>
      </div>
      </c:when>
    
      <c:otherwise>
      <h3>No Branches Found</h3>
      </c:otherwise>
      </c:choose>
    </div>

  </body>
</html>