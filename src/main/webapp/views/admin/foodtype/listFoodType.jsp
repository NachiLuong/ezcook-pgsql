<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="url" value="/admin/foodtype">
    <c:param name="urlType" value="url_edit"/>
</c:url>

<html>
<head>
    <title><fmt:message key="label.user.manage" bundle="${lang}"/></title>
</head>
<body>
<ul class="breadcrumb">
    <li class="active" style="padding-top: -10px">Danh sách loại món ăn</li>
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
            <form action="<c:url value="/admin/foodtype"/> " method="get" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input type="text" name="txt" class="form-control"placeholder="Nhập tên" >
                    <div class="input-group-append">
                        <button style="margin-left: 10px" type="submit" class="btn btn-secondary">
                            <i class="fa fa-search"></i>Tìm kiếm
                        </button>
                    </div>
                </div>
            </form>
            <a class="btn btn-secondary" id="addUser" style="float: right; margin-bottom: 5px"
               href="<c:url value="/admin/foodtype/edit"/> ">Thêm loại đồ ăn</a>
        </div>
        <table class="table table-striped table-bordered table-hover" id="sample_1">
            <thead>
            <tr>
                <th>Tên</th>
                <th>Chức năng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="foodtype" items="${foodtypes}">
                <tr>
                    <td>${foodtype.name}</td>
                    <td style="display: flex;height: 80% " class="suaxoacunghang">
                        <form id="frmDel" method="post"  onclick="return confirm('Do you want to delete?');">
                            <input type="hidden" name="idDelete" value="${foodtype.id}"/>
                            <button style="background-color: red" class="btn btn-secondary">Xóa</button>
                        </form>
                        <c:url value="/admin/foodtype/edit" var="editurl">
                            <c:param name="foodtypeId" value="${foodtype.id}"/>
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
<div style="text-align: center;">
    <nav aria-label="...">
        <ul class="pagination justify-content-center=">
            <li class="page-item ">
                <c:url var="urlPageBegin" value="/admin/foodtype">
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
                        <c:url var="urlPage" value="/admin/foodtype">
                            <c:param name="page" value="${i}"/>
                        </c:url>
                        <a class="page-link" href="${urlPage}">${i}</a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item">
                <c:url var="urlPageEnd" value="/admin/foodtype">
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
</script>
</body>

</html>
