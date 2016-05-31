<%@tag language="java" description="branch" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%-- JSTL-taglibs --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Spring-taglibs --%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>

<%-- Custom-taglibs --%>
<%@taglib prefix="vmod" uri="http://vdapp.com/vmod/tags"%>
<%@taglib prefix="bs" uri="http://bootstrap.com/tags"%>

<%@attribute name='newForm' required='false' type='java.lang.Boolean'%>

<c:choose>
  <c:when test="${empty branch.country}">
    <c:url var="cancelUrl" value='/settings/branch'/>
  </c:when>
  <c:otherwise>
    <c:url var="cancelUrl" value='/settings/branch/branches'>
      <c:param name="country" value="${branch.country.id}"/>
    </c:url>
  </c:otherwise>
</c:choose>

<c:if test="${not newForm}">
  <c:set var="hidableSlave" value=' role="hidableSlave"'/>  
</c:if>

  <form:form commandName="branch" id="form-branch">
    <c:if test="${not newForm}">
    <div class="container-fluid">
      <div class="toolset">
      	<a href="${cancelUrl}" class="btn btn-default"><bs:fa icon="arrow-circle-left"/> Return</a>
        <a id="btn-remove" class="btn btn-danger" data-toggle="modal" data-target="#branchRemoveModal">
          <bs:fa icon="trash"/> Remove</a>
      </div>
    </div>
    </c:if>
    
    <div class="container-fluid row">
      <c:if test="${newForm or empty branch}">
      <div class="col-sm-12 row">
        <div class="col-sm-6 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" id="sizing-addon2" data-toggle="tooltip" title="Mandatory" role="mandatory"><i class="fa fa-asterisk fa-fw"></i></span>
            <select id="select-country" name="country" class="form-control"${masterForHidableSlaves}>
              <option value="">- Select country -</option>
              <c:forEach var="availableCountry" items="${countries}">
              <option value="${availableCountry.id}"<c:if test="${not empty branch.country and availableCountry.id == branch.country.id}"> selected</c:if>>${availableCountry.name}<c:if test="${not availableCountry.enabled}"> (disabled)</c:if></option>
              </c:forEach>
            </select>
          </div>
          
          <c:if test="${countryErr}">
          <div class="alert alert-danger alert-dismissible field-error" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong><i class="fa fa-warning"></i> Warning</strong>
            <p><i class="fa fa-caret-right"></i> <form:errors path="country"/></p>
          </div>
          </c:if>          
        </div>
      </div>
      </c:if>
      
      <c:if test="${not newForm and not branch.country.enabled}">
        <c:set var="readOnly" value="true"/>
      </c:if>
      
      <div class="col-sm-12 row">
        <div class="col-sm-6 vertically-spaced">
          <div class="input-group">
  			<span class="input-group-addon" data-toggle="tooltip" title="Mandatory" role="mandatory"><i class="fa fa-asterisk fa-fw"></i></span>
            <form:input path="name" placeholder="Name" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
		  </div>
          <c:if test="${nameErr}">
          <div class="alert alert-danger alert-dismissible field-error" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong><i class="fa fa-warning"></i> Warning</strong>
            <p><i class="fa fa-caret-right"></i> <form:errors path="name"/></p>
          </div>
          </c:if> 
        </div>
      </div>

      <div class="col-sm-12 row">
        <div class="col-sm-4 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Mandatory" role="mandatory"><i class="fa fa-asterisk fa-fw"></i></span>
            <form:input path="address.street" placeHolder="Street" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
          </div>
          <c:if test="${address_streetErr}">
          <div class="alert alert-danger alert-dismissible field-error" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong><i class="fa fa-warning"></i> Warning</strong>
            <p><i class="fa fa-caret-right"></i> <form:errors path="address.street"/></p>
          </div>
          </c:if> 
        </div>
        <div class="col-sm-2 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Mandatory" role="mandatory"><i class="fa fa-asterisk fa-fw"></i></span>
            <form:input path="address.house" placeHolder="House Number" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
          </div>
          <c:if test="${address_houseErr}">
          <div class="alert alert-danger alert-dismissible field-error" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong><i class="fa fa-warning"></i> Warning</strong>
            <p><i class="fa fa-caret-right"></i> <form:errors path="address.house"/></p>
          </div>
          </c:if> 
        </div>
      </div>
      
      <div class="col-sm-12 row">
        <div class="col-sm-2 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Mandatory" role="mandatory"><i class="fa fa-asterisk fa-fw"></i></span>
            <form:input path="address.city.postalCode" placeHolder="Postal Code" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
          </div>
          <c:if test="${address_city_postalCodeErr or postalCodeMatcherErr}">
          <div class="alert alert-danger alert-dismissible field-error" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong><i class="fa fa-warning"></i> Warinng</strong>
            <c:if test="${address_city_postalCodeErr}"><p><i class="fa fa-caret-right"></i> <form:errors path="address.city.postalCode"/></p></c:if>
            <c:if test="${postalCodeMatcherErr}"><p><i class="fa fa-caret-right"></i> postal code does not match with current country postal code pattern</p></c:if>
          </div>
          </c:if>
          
        </div>
        <div class="col-sm-4 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Mandatory" role="mandatory"><i class="fa fa-asterisk fa-fw"></i></span>
            <form:input path="address.city.name" placeHolder="City" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
          </div>
          <c:if test="${address_city_nameErr}">
          <div class="alert alert-danger alert-dismissible field-error" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong><i class="fa fa-warning"></i> Warning</strong>
            <p><i class="fa fa-caret-right"></i> <form:errors path="address.city.name"/></p>
          </div>
          </c:if>
        </div>
      </div>
      
      <div class="col-sm-12 row">
        <div class="col-sm-6 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="E-Mail"><i class="fa fa-envelope fa-fw"></i></span>
            <form:input path="email" placeholder="E-mail" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
          </div>
          <c:if test="${emailErr}">
          <div class="alert alert-danger alert-dismissible field-error" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong><i class="fa fa-warning"></i> Warning</strong>
            <p><i class="fa fa-caret-right"></i> <form:errors path="email"/></p>
          </div>
          </c:if>
        </div>
      </div>
      
      <div class="col-sm-12 row">
        <div class="col-sm-6 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Phone"><i class="fa fa-phone fa-fw"></i></span>
            <form:input path="phone" placeholder="Phone" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
          </div>
        </div>
      </div>

      <div class="col-sm-12 row">
        <div class="col-sm-6 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Fax"><i class="fa fa-fax fa-fw"></i></span>
            <form:input path="fax" placeholder="Fax" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
          </div>
        </div>
      </div>
      
      <div class="col-sm-12 row">
        <div class="col-sm-6 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Extra"><i class="fa fa-info fa-fw"></i></span>
            <form:textarea rows="5" cols="5" path="extra" placeholder="Extra" role="masterForHidableSlaves" cssClass="form-control fixed-textarea" readonly="${readOnly}"/>
          </div>
        </div>
      </div>
      
      <div class="col-sm-12">
          <form:checkbox id="enabled" path="enabled" cssClass="medium" role="masterForHidableSlaves"/>
          <label for="enabled" class="medium">Enabled</label>
      </div>      
    </div>


    <div class="container-fluid"${hidableSlave}>
      <div class="toolset">
        <button type="submit" class="btn btn-lg btn-info"><i class="fa fa-save" role="disableOnSubmit"></i> Save</button>
        <a href="${cancelUrl}" class="btn btn-lg btn-default"><i class="fa fa-remove"></i> Cancel</a>
      </div>
    </div>
    
    
    </form:form>
    
    <vmod:city-remove/>
    
    <script type="text/javascript">
      changeValue('select-country', 'country');
    </script>