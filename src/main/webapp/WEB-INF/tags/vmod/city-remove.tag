<%@tag language="java" description="branch-remove" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name='modalId' required='false' type='java.lang.String'%>

<c:if test="${empty modalId}">
  <c:set var="modalId" value='branchRemoveModal'/>
</c:if>

    <!-- Modal -->
    <div class="modal fade" id="${modalId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"><i class="fa fa-warning"></i> Remove Branch</h4>
          </div>
          
          <div class="modal-body">
            You are about to remove Branch <strong>${branch.name}</strong> from database. Please confirm removal. 
          </div>
          
          <div class="modal-footer">
            <form action="<c:url value='/settings/branch/branches/${branch.id}'/>" method="post">
              <button type="submit" class="btn btn-danger" name="remove"><i class="fa fa-trash-o"></i> Remove</button>
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-remove"></i> Cancel</button>
            </form>
          </div>
        </div>
      </div>
    </div>