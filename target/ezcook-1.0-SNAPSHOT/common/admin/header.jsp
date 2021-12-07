<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button type="button" id="sidebarCollapse" class="btn btn-primary">
                <i class="fa fa-bars"></i>
                <span class="sr-only">Toggle Menu</span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="nav navbar-nav ml-auto">
                   <%-- <li class="nav-item">
                        <a class="nav-link" href="#">Chào Trung</a>
                    </li>--%>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/login?action=logout'/>">Thoát</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- end navbar. begin code -->
