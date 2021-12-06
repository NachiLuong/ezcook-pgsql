<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="url" value="/admin/food">
    <c:param name="urlType" value="url_edit"/>
</c:url>

<html>
<head>
    <title><fmt:message key="label.user.manage" bundle="${lang}"/></title>
    <style>
        .rutgon{
            /*max-width: 90%;*/
            max-width: 100px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            font-weight: bold;
            background-color: #000000;
            color: #f0f0f0;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            /*padding: 20px 20px 20px 20px;*/
            text-align: center;
        }
        table.auto {
            table-layout: auto;
        }
    </style>
</head>
<body>
<ul class="breadcrumb">
    <li class="active" style="padding-top: -10px">Danh sách món  ăn</li>
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
            <form action="<c:url value="/admin/food"/> " method="get" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input type="text" name="txt" class="form-control" placeholder="Nhập tên món ăn">
                    <div class="input-group-append">
                        <button style="margin-left: 10px" type="submit" class="btn btn-secondary">
                            <i class="fa fa-search"></i>Tìm kiếm
                        </button>
                    </div>
                </div>
            </form>
            <a class="btn btn-secondary" id="addUser" style="float: right; margin-bottom: 5px"
               href="<c:url value="/admin/food/edit"/> ">Thêm món ăn</a>
        </div>
        <table class="table table-striped table-bordered  auto" style="table-layout: auto;background-color: #cccccc; color: black" id="sample_1">
            <thead>
            <tr>
                <th style=" max-width: 90%; width: 60%;  display: table-cell">Tên</th>
<%--                <th>Tiêu đề</th>--%>
                <th style="width: 15%">Loại món ăn</th>
                <th style="width: 15%">Chức năng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="food" items="${foods}">
                <tr >
                    <td class="rutgon" style="display: table-cell;color: black">${food.name}</td>
                    <%--<td>huhuhuh</td>
                    <td class="rutgon">${food.content}</td>--%>

                    <td>${food.foodTypeDto.name}</td>
                    <td style="display: flex;height: 80% " class="suaxoacunghang">
                        <form id="frmDel" method="post"  onclick="return confirm('Do you want to delete?');">
                            <input type="hidden" name="idDelete" value="${food.id}"/>
                            <button style="background-color: red" class="btn btn-secondary">Xóa</button>
                        </form>
                        <c:url value="/admin/food/edit" var="editurl">
                            <c:param name="foodId" value="${food.id}"/>
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
                <c:url var="urlPageBegin" value="/admin/food">
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
                        <c:url var="urlPage" value="/admin/food">
                            <c:param name="page" value="${i}"/>
                        </c:url>
                        <a class="page-link" href="${urlPage}">${i}</a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item">
                <c:url var="urlPageEnd" value="/admin/food">
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
