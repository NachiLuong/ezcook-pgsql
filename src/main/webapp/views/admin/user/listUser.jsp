<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="url" value="/admin/user">
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
    <c:if test="${messageResponse != null}">
        <div id="thongbao" class="alert alert-dismissible alert-success ">
            <button type="button" class="close" id="btnClose">
                <i class="fa fa-times"></i>
            </button>
            <c:out value="${messageResponse}"></c:out>
        </div>
    </c:if>
    <div class="col-xs-12">
        <div style="display: flex; justify-content: space-between">
            <form action="<c:url value="/admin/user"/> " method="get" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input type="text" name="txt" class="form-control" placeholder="Nhập tài khoản">
                    <div class="input-group-append">
                        <button style="margin-left: 10px" type="submit" class="btn btn-secondary">
                            <i class="fa fa-search"></i>Tìm kiếm
                        </button>
                    </div>
                </div>
            </form>
            <a class="btn btn-secondary" id="addUser" style="float: right; margin-bottom: 5px"
               href="<c:url value="/admin/user/edit"/> ">Thêm
                Tài khoản</a>
        </div>
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
                        <form id="frmDel" method="post"  onclick="return confirm('Do you want to delete?');">
                            <input type="hidden" name="idDelete" value="${user.id_user}"/>
                            <button style="background-color: red" class="btn btn-secondary">Xóa</button>
                        </form>
                        <c:url value="/admin/user/edit" var="editurl">
                            <c:param name="userId" value="${user.id_user}"/>
                            <c:param name="page" value="1"/>
                        </c:url>
                        <a class="btn btn-secondary " href="${editurl}"
                           style="height: 80%; margin-left: 5px; background-color: green">Sửa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade text-center" id="confirmModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalTitle">Delete Confirmation</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <span id="confirmText"></span>
            </div>
            <div class="modal-footer">
                <a class="btn btn-success" href="" id="yesButton">Yes</a>
                <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>
<div style="text-align: center;">
    <nav aria-label="...">
        <ul class="pagination justify-content-center=">
            <li class="page-item ">
                <c:url var="urlPageBegin" value="/admin/user">
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
                        <c:url var="urlPage" value="/admin/user">
                            <c:param name="page" value="${i}"/>
                        </c:url>
                        <a class="page-link" href="${urlPage}">${i}</a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item">
                <c:url var="urlPageEnd" value="/admin/user">
                    <c:param name="page" value="${(pojo.page+1)> pojo.totalItems ? pojo.totalItems : (pojo.page+1) }"/>
                </c:url>
                <a class="page-link" href="${urlPageEnd}">Next</a>
            </li>
        </ul>
    </nav>
</div>
<script>
    $(document).ready(function (){
       closeallow();
    });
    function closeallow(){
        document.getElementById("btnClose").onclick = function () {
            document.getElementById("thongbao").style.display = "none";
        };
    };
    function showAlertBeforeDelete() {
        swal({
            title: "Xác nhận xóa",
            text: "Bạn có chắc chắn xóa không, một khi xóa sẽ không khôi phục lại",
            type: "warning",
            buttons: true,
            dangerMode: true,
        }).then(function (isConfirm) {
            e.preventDefault();
            if (isConfirm) {
                document.getElementById("link-delete").submit();
                swal("Bạn đã xóa thành công", {
                    icon: "success"
                });
            } else {
            }
        });
    };


</script>
</body>

</html>
