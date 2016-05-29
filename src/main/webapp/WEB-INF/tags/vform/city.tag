<%@tag language="java" description="city" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Spring-taglibs --%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vmod" uri="http://vdapp.com/vmod/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<%@attribute name='newForm' required='false' type='java.lang.Boolean'%>

<c:if test="${not newForm}">
  <c:set var="masterForHidableSlaves" value=' role="masterForHidableSlaves"'/>
  <c:set var="hidableSlave" value=' role="hidableSlave"'/>
</c:if>

  <form:form commandName="city" id="cityform">
    <c:if test="${not newForm}">
    <div class="container-fluid">
      <div class="toolset">
      	<a href="<c:url value='/settings/locale/countries/${city.country.id}/cities'/>" class="btn btn-default"><bs:fa icon="arrow-circle-left"/> Return</a>
        <a id="btn-remove" class="btn btn-danger" data-toggle="modal" data-target="#cityRemoveModal">
          <bs:fa icon="trash"/> Remove</a>
      </div>
    </div>
    </c:if>
    
    <div class="container-fluid">
      <c:if test="${isNewForm or empty country}">
      <div class="col-sm-12 row vertically-spaced">
        <div class="col-sm-6 row">
          <div class="input-group">
            <span class="input-group-addon" id="sizing-addon2" data-toggle="tooltip" title="Mandatory"><i class="fa fa-asterisk"></i></span>
            <select id="select-country" name="country" class="form-control"${masterForHidableSlaves}>
              <option value="">- Select country -</option>
              <c:forEach var="availableCountry" items="${countries}">
              <option value="${availableCountry.id}"<c:if test="${not empty city.country and availableCountry.id == city.country.id}"> selected</c:if>>${availableCountry.name}<c:if test="${not availableCountry.enabled}"> (disabled)</c:if></option>
              </c:forEach>
            </select>
          </div>
        </div>
      </div>
      </c:if>
      
      <c:if test="${not newForm and not city.country.enabled}">
        <c:set var="readOnly" value="true"/>
      </c:if>
      
      <div class="col-sm-12 row vertically-spaced">
        <div class="col-sm-6 row">
          <div class="input-group">
  			<span class="input-group-addon" id="sizing-addon2" data-toggle="tooltip" title="Mandatory"><i class="fa fa-asterisk"></i></span>
  			<form:input path="name" placeholder="Name" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
		  </div>
        </div>
      </div>

      <div class="col-sm-12 row vertically-spaced">
        <div class="col-sm-6 row">
          <div class="input-group">
        <span class="input-group-addon" id="sizing-addon2" data-toggle="tooltip" title="Mandatory"><i class="fa fa-asterisk"></i></span>
        <form:input path="postalCode" placeHolder="Postal Code" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
      </div>
        </div>
      </div>
    </div>

    <div class="container-fluid"${hidableSlave}>
      <div class="toolset">
        <button type="submit" class="btn btn-lg btn-info"><i class="fa fa-save" role="disableOnSubmit"></i> Save</button>
        <a href="<c:url value='/settings/locale/countries/${city.country.id}/cities'/>" class="btn btn-lg btn-default"><i class="fa fa-remove"></i> Cancel</a>
      </div>
    </div>
    </form:form>
    
    <vmod:city-remove/>
    
    <script type="text/javascript">
      changeValue('select-country', 'country');
    </script>