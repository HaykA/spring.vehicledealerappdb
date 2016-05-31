<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vdapp" uri="http://vdapp.com/core/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<!DOCTYPE html>
<html>

  <head>
    <vdapp:head title="Locale Settings"></vdapp:head>
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
      <li class="active"><i class="fa fa-globe"></i> Locale Settings</li>
    </ol>
    
    <div class="col-sm-12"><h1><i class="fa fa-globe"></i> Locale Settings</h1></div>
    <div class="col-sm-6"><vdapp:locale-settings showReturnButton="true"/></div>
    

  </body>
</html>