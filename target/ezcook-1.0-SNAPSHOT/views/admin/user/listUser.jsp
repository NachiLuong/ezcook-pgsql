<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="url" value="/admin-user-list">
    <c:param name="urlType" value="url_edit"/>
</c:url>
<html>
<head>
    <title><fmt:message key="label.user.manage" bundle="${lang}"/></title>
</head>
<body>
<ul class="breadcrumb">
    <li class="active" style="padding-top: -10px"><fmt:message key="label.user.list" bundle="${lang}"/></li>
</ul><!-- /.breadcrumb -->
<div class="row">
    <div class="col-xs-12">
        <a class="btn" style="float: right; background-color:#cccccc; margin-bottom: 5px" href="<c:url value='#'/>">Thêm User</a>
        <table class="table table-striped table-bordered table-hover" id="sample_1">
            <thead>
            <tr>
                <th>Tên</th>
                <th>Tài khoản</th>
                <th>Email</th>
                <th>Mật khẩu</th>
                <th>Vai trò</th>
                <th>Chức năng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.fullname}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.password}</td>
                    <td>${user.roleDto.name_role}</td>
                    <td style="display: flex;height: 80% " class="suaxoacunghang">
                        <form action="<c:url value="#"/>" method="post">
                            <input type="hidden" name="idDelete" value="${user.id_user}"/>
                            <button style="background-color: red" type="submit" class="btn btn-secondary">Xóa</button>
                        </form>
                        <a class="btn btn-secondary" style="height: 80%; margin-left: 5px; background-color: green"
                           href="${updateURL}">Sửa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div style="text-align: center;">
    <nav aria-label="...">
        <ul class="pagination justify-content-center=">
            <li class="page-item ">
                <c:url var="urlPageBegin" value="/admin-user-list">
                    <c:param name="page" value="${(pojo.page-1) < 1 ? 1 : (pojo.page-1) }"/>
                </c:url>
                <a class="page-link" href="${urlPageBegin}">Previous</a>
            </li>
            <c:forEach var="i" begin="1" end="${pojo.totalItems}">
                <c:if test="${i==pojo.page}">
                    <li class="page-item active">
                        <a class="page-link" href="${i==pojo.page}">${i} <span class="sr-only"></span></a>
                    </li>
                </c:if>
                <c:if test="${i!=pojo.page}">
                    <li class="page-item">
                        <c:url var="urlPage" value="/admin-user-list">
                            <c:param name="page" value="${i}"/>
                        </c:url>
                        <a class="page-link" href="${urlPage}">${i}</a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item">
                <c:url var="urlPageEnd" value="/admin-user-list">
                    <c:param name="page" value="${(pojo.page+1)> pojo.totalItems ? pojo.totalItems : (pojo.page+1) }"/>
                </c:url>
                <a class="page-link" href="${urlPageEnd}">Next</a>
            </li>
        </ul>
    </nav>
</div>
</body>
</html>
