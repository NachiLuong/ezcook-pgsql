<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="url" value="/admin-user-list"/>
<html>
<head>
    <title><fmt:message key="label.user.manage" bundle="${lang}"/></title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
                <li class="active"><fmt:message key="label.user.list" bundle="${lang}"/></li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <fmt:bundle basename="ApplicationResources">
                            <display:table id="tableList" name="items.listResult" partialList="true" requestURI="${url}"
                                           size="${items.totalItems}" pagesize="${items.maxPageItems}" sort="external"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;">
                                <display:column property="name" titleKey="label.user.fullname" sortable="true" sortName="name"/>
                                <display:column property="username" titleKey="label.user.username" sortable="true" sortName="username"/>
                                <display:column property="password" titleKey="labeb.user.password" />
                            </display:table>
                        </fmt:bundle>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
