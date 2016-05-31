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
    
    <c:if test="${not newForm and not country.enabled}">
      <c:set var="readOnly" value="true"/>
    </c:if>
       
    <form:hidden path="enabled"/>
      <div class="container-fluid container-sm">
        <div class="well clearfix no-h_padding">
          <div class="col-sm-12 no-h_padding">
            <div class="col-sm-12 vertically-spaced">
              <form:label path="nativeName" cssClass="input-label">Native Name</form:label>
              <div class="input-group">
                <span class="input-group-addon" data-toggle="tooltip" title="Native Name"><i class="fa fa-font fa-fw"></i></span>
                  <form:input path="nativeName" placeholder="Native Name" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
              </div>
            </div>
          </div>
      
          <div class="col-sm-12 no-h_padding">
            <div class="col-sm-8 vertically-spaced">
              <form:label path="postalCodePattern" cssClass="input-label">Postal Code Pattern</form:label>
              <div class="input-group">
                <span class="input-group-addon" data-toggle="tooltip" title="Postal Code Pattern"><i class="fa fa-terminal fa-fw"></i></span>
                <form:input path="postalCodePattern" placeholder="Postal Code Pattern" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="container-fluid" role="hidableSlave">
        <div class="toolset">
          <button type="submit" class="btn btn-lg btn-info"><i class="fa fa-save" role="disableOnSubmit"></i> Save</button>
          <a href="<c:url value='/settings/locale/countries/${country.id}'/>" class="btn btn-lg btn-default"><i class="fa fa-remove"></i> Cancel</a>
        </div>
      </div>
      </div>
    </form:form>
