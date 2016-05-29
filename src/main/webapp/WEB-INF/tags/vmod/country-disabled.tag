<%@tag language="java" description="country-disabled" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name='modalId' required='false' type='java.lang.String'%>
<%@attribute name='continentId' required='false' type='java.lang.String'%>

<c:if test="${not empty continentId}">
  <c:set var="continentPattern" value='/${continentId}'/>
</c:if>

<c:if test="${empty modalId}">
  <c:set var="modalId" value='countryDisabledModal'/>
</c:if>

    <!-- Modal -->
    <div class="modal fade" id="${modalId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"><i class="fa fa-info-circle"></i> Country disabled</h4>
          </div>
          
          <div class="modal-body">
            You can only remove cities/streets from a disabled country. To enable countries go to
              <a href="<c:url value='/settings/locale/continents${continentPattern}'/>">Enable/Disable countries</a>.
          </div>
          
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-check"></i> OK</button>
          </div>
        </div>
      </div>
    </div>