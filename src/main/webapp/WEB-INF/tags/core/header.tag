<%@tag language="java" description="header" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav id="main-navigation" class="navbar-inverse">
<div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="<c:url value='/'/>" class="navbar-brand"><i class="fa fa-car fa-2x"></i></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#">Link</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="bigger-icon" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-gear fa-2x"></i></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value='/settings/locale'/>"><i class="fa fa-globe fa-fw"></i> Locale Settings</a></li>
            <li><a href="<c:url value='/settings/branch'/>"><i class="fa fa-building fa-fw"></i> Branch Settings</a></li>
            <li><a href="#"><i class="fa fa-users fa-fw"></i> Users</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#"><i class="fa fa-wrench fa-fw"></i> Maintenance</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#"><i class="fa fa-sliders fa-fw"></i> Preferences</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>