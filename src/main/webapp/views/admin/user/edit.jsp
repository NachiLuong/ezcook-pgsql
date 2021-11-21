<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="editUser" value="/admin-user-list/edit"/>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<ul class="breadcrumb">
    <li class="active" style="padding-top: -10px">Chỉnh sửa tài khoản người dùng</li>
</ul><!-- /.breadcrumb -->
<div class="row">
    <div class="col-md-12">
        <div class="form-body">
            <c:if test="${user != null}">
                <form action="${editUser}" method="post" style="max-width: 800px; margin: 0 auto">
                    <input type="hidden" value="${user.id_user}" name="pojo.id_user"/>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Tên: <span class="required">* </span></label>
                        <div class="col-md-10">
                            <input type="text" class=" form-control" value="${user.fullname}" name="pojo.fullname"
                                   required minlength="2" maxlength="45"/>
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Email:<span class="required">* </span></label>
                        <div class="col-md-10">
                            <input type="email" class=" form-control" value="${user.email}" name="pojo.email" required
                                   minlength="8" maxlength="128"/>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Username<span class="required"> * </span></label>
                        <div class="col-md-10">
                            <input type="text" class=" form-control" value="${user.username}" name="pojo.username"
                                   required minlength="2" maxlength="45"/>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Password: <span class="required">* </span></label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${user.password}"
                                   minlength="4" maxlenth="20" name="pojo.password"/>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label ">Vai trò</label>
                        <div class="col-md-10">
                            <block>
                                <c:forEach var="role" items="${roles}">
                                    <c:if test="${user.roleDto.name_role.equals(role.name_role)}">
                                        <input type="radio" value="${role.name_role}" id="role1" name="role" class="m-2" checked/>
                                        <label for="role1">${role.name_role}</label>
                                    </c:if>
                                    <c:if test="${!user.roleDto.name_role.equals(role.name_role)}">
                                        <input type="radio" value="${role.name_role}"id="role2" name="role" class="m-2" />
                                        <label for="role2">${role.name_role}</label>
                                    </c:if>
                                    <br/>
                                </c:forEach>
                            </block>
                        </div>
                    </div>
                    <div class="text-center m-3">
                        <input type="submit" value="Save" class="btn btn-primary m-3"/>
                        <input type="button" value="Cancel" class="btn btn-secondary" id="buttonCancel"/>
                    </div>
                </form>
            </c:if>
        </div>
    </div>
</div>
</div>
</body>
</html>
