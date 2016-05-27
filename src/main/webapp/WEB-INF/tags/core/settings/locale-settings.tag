<%@tag language="java" description="locale-settings" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@attribute name='showReturnButton' required='false' type='java.lang.Boolean'%>

    <div class="panel panel-default">
        <c:if test="${not showReturnButton}">
        <div class="panel-heading">
          <h3 class="panel-title">Locale Settings</h3>
        </div>
        </c:if>
      <div class="panel-body">
        <div class="list-group">
          <a href="<c:url value='/settings/locale/continents'/>" class="list-group-item">
            <i class="fa fa-arrow-circle-right fa-fw"></i> Enable/Disable Countries</a>
          <a href="<c:url value='/settings/locale/countries/cities'/>" class="list-group-item">
            <i class="fa fa-arrow-circle-right fa-fw"></i> Edit Cities</a>
        </div>
        
        <c:if test="${showReturnButton}">
        <a href="<c:url value='/settings'/>" class="btn btn-lg btn-default" data-toggle="tooltip" title="Return">
          <i class="fa fa-arrow-circle-left"></i></a>
        </c:if>
      </div>
    </div>