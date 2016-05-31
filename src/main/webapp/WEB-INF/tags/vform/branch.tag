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
  <c:when test="${newForm}">
    <c:url var="cancelUrl" value='/settings/branch'/>
  </c:when>
  <c:otherwise>
    <c:url var="cancelUrl" value='/settings/branch/branches/${branch.id}'/>
  </c:otherwise>
</c:choose>

<c:if test="${not newForm}">
  <c:set var="hidableSlave" value=' role="hidableSlave"'/>  
</c:if>

  <form:form commandName="branch" id="form-branch">
    <div class="container-fluid">
    <c:if test="${not newForm}">
    
    
      <div class="toolset">
      	<a href="<c:url value='/settings/branch/branches'/>" class="btn btn-default"><bs:fa icon="arrow-circle-left"/> Return</a>
        <a href="<c:url value='/settings/branch/branches/${branch.id}/opening'/>" class="btn btn-primary">
          <i class="fa fa-clock-o"></i> Opening Hours</a>
        <a id="btn-remove" class="btn btn-danger" data-toggle="modal" data-target="#branchRemoveModal">
          <bs:fa icon="trash"/> Remove</a>
        <c:choose>
        <c:when test="${branch.enabled}">
        <button id="btn-enabled" name="enabled" class="btn btn-danger" role="disablingSlave" value="false">
          <bs:fa icon="check-square-o"/> Disable</button>
        </c:when>
        <c:otherwise>
        <button id="btn-enabled" name="enabled" class="btn btn-success" role="disablingSlave" value="true">
          <bs:fa icon="square-o"/> Enable</button>
        </c:otherwise>
        </c:choose>
      </div>
    
    </c:if>
    
    <c:if test="${not newForm and not branch.enabled}">
      <c:set var="readOnly" value="true"/>
      <c:set var="disabled" value=" disabled"/>
    </c:if>
    
    <div class="container-fluid container-sm">
      <div class="well clearfix no-h_padding">
      <div class="col-sm-12 no-h_padding">
        <div class="col-sm-12 vertically-spaced">
        <label for="select-country" class="input-label">Country</label>
          <div class="input-group">
            <span class="input-group-addon" id="sizing-addon2" data-toggle="tooltip" title="Mandatory" role="mandatory"><i class="fa fa-asterisk fa-fw"></i></span>
            <select id="select-country" name="country" class="form-control" role="masterForHidableSlaves"${disabled}>
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
      
      <div class="col-sm-12 no-h_padding">
        <div class="col-sm-12 vertically-spaced">
          <form:label path="name" cssClass="input-label">Name</form:label>
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

      <div class="col-sm-12 no-h_padding">
        <div class="col-sm-8 vertically-spaced">
          <form:label path="address.street" cssClass="input-label">Street</form:label>
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
        <div class="col-sm-4 vertically-spaced">
          <form:label path="address.house" cssClass="input-label">House Number</form:label>
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
      
      <div class="col-sm-12 no-h_padding">
        <div class="col-sm-12 vertically-spaced">
          <form:label path="name" cssClass="input-label">Address Line</form:label>
          <div class="input-group">
        <span class="input-group-addon" data-toggle="tooltip" title="Optional"><i class="fa fa-home fa-fw"></i></span>
            <form:input path="address.addressLine" placeholder="Address Line" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
      </div>
        </div>
      </div>
      
      <div class="col-sm-12 no-h_padding">
        <div class="col-sm-4 vertically-spaced">
          <form:label path="address.city.postalCode" cssClass="input-label">Postal Code</form:label>
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
        <div class="col-sm-8 vertically-spaced">
          <form:label path="address.city.name" cssClass="input-label">City</form:label>
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
      
      <div class="col-sm-12 no-h_padding">
        <div class="col-sm-8 vertically-spaced">
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
      
      <div class="col-sm-12 no-h_padding">
        <div class="col-sm-8 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Phone"><i class="fa fa-phone fa-fw"></i></span>
            <form:input path="phone" placeholder="Phone" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
          </div>
        </div>
      </div>

      <div class="col-sm-12 no-h_padding">
        <div class="col-sm-8 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Fax"><i class="fa fa-fax fa-fw"></i></span>
            <form:input path="fax" placeholder="Fax" role="masterForHidableSlaves" cssClass="form-control" readonly="${readOnly}"/>
          </div>
        </div>
      </div>
      
      <div class="col-sm-12 no-h_padding">
        <div class="col-sm-12 vertically-spaced">
          <div class="input-group">
            <span class="input-group-addon" data-toggle="tooltip" title="Extra"><i class="fa fa-info fa-fw"></i></span>
            <form:textarea rows="5" cols="5" path="extra" placeholder="Extra" role="masterForHidableSlaves" cssClass="form-control fixed-textarea" readonly="${readOnly}"/>
          </div>
        </div>
      </div>
      
      <c:if test="${newForm}">
      <div class="col-sm-12">
          <form:checkbox id="enabled" path="enabled" cssClass="medium" role="masterForHidableSlaves"/>
          <label for="enabled" class="medium">Enabled</label>
      </div>
      </c:if>  
      </div>    
    </div>


    <div class="container-fluid"${hidableSlave}>
      <div class="toolset">
        <button type="submit" class="btn btn-lg btn-info"><i class="fa fa-save" role="disableOnSubmit"></i> Save</button>
        <a href="${cancelUrl}" class="btn btn-lg btn-default"><i class="fa fa-remove"></i> Cancel</a>
      </div>
    </div>
    </div>
    </form:form>
    
    <vmod:city-remove/>
    
    <script type="text/javascript">
      changeValue('select-country', 'country');
    </script>