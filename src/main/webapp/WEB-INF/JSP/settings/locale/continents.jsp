<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vdapp" uri="http://vdapp.com/core/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<!DOCTYPE html>
<html>

  <head>
    <vdapp:head title="Settings - Continents"></vdapp:head>
  </head>
  
<body>
  <c:forEach var="continent" items="${continents}">
    <c:choose>
      <c:when test="${continent.enabled}">
        <c:set var="enableBtnStyle" value='danger'/>
        <c:set var="enableBtnIcon" value='pause'/>
        <c:url var="continentUrl" value='/settings/locale/continents/${continent.id}'/>
      </c:when>
          
      <c:otherwise>
        <c:set var="enableBtnStyle" value="success"/>
        <c:set var="enableBtnIcon" value="play"/>
        <c:set var="showBtnHref" value=''/>
      </c:otherwise>
    </c:choose>
        
  <div class="row custom-row">
    <div class="col-lg-4">
      <div class="input-group">
        <span class="input-group-btn">
          <button type="submit" class="btn btn-lg btn-${enableBtnStyle}">
            <bs:gi icon="${enableBtnIcon}"/></button>
        </span>
        <a href="${continentUrl}" class="btn btn-lg btn-default form-control input-lg">
            ${continent.name}</a>
      </div>
    </div>
  </div>
  </c:forEach>
    

  

</body>
</html>