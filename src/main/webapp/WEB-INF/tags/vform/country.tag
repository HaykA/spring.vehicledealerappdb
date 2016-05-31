<%@tag language="java" description="city" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Spring-taglibs --%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vmod" uri="http://vdapp.com/vmod/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

  <form:form commandName="country" id="countryform">
    <div class="container-fluid">
      <div class="toolset">
      	<a href="<c:url value='/settings/locale/continents/${country.continent.id}/countries'/>" class="btn btn-default"><bs:fa icon="arrow-circle-left"/> Return</a>
        <c:choose>
        <c:when test="${country.enabled}">
        <button id="btn-enabled" name="enabled" class="btn btn-danger" role="disablingSlave" value="false">
          <bs:fa icon="check-square-o"/> Disable</button>
        </c:when>
        <c:otherwise>
        <button id="btn-enabled" name="enabled" class="btn btn-success" role="disablingSlave" value="true">
          <bs:fa icon="square-o"/> Enable</button>
        </c:otherwise>
        </c:choose>
        
      </div>
    </div>
    
    <div class="container-fluid">
      
      <form:hidden path="enabled"/>
      
      <div class="col-sm-12 row vertically-spaced">
        <div class="col-sm-6 row">
          <form:input path="nativeName" placeholder="Native Name" role="masterForHidableSlaves" cssClass="form-control"/>
        </div>
      </div>
      
      <div class="col-sm-12 row vertically-spaced">
        <div class="col-sm-6 row">
          <form:input path="postalCodePattern" placeholder="Postal Code Pattern" role="masterForHidableSlaves" cssClass="form-control"/>
        </div>
      </div>
    </div>

    <div class="container-fluid" role="hidableSlave">
      <div class="toolset">
        <button type="submit" class="btn btn-lg btn-info"><i class="fa fa-save" role="disableOnSubmit"></i> Save</button>
        <a href="<c:url value='/settings/locale/countries/${country.id}'/>" class="btn btn-lg btn-default"><i class="fa fa-remove"></i> Cancel</a>
      </div>
    </div>
    </form:form>
