<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="editft" value="/admin/foodtype/edit"/>
<c:url var="home" value="/admin/foodtype"/>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<%--------------------------Sửa------------------%>
<c:if test="${foodtype != null}">
    <ul class="breadcrumb">
        <li class="active" style="padding-top: -10px">Chỉnh sửa loại đồ ăn</li>
    </ul>
    <div class="row">

        <div class="col-md-12">
            <div class="form-body">
                <form action="${editft}" method="post" style="max-width: 800px; margin: 0 auto">
                    <input type="hidden" value="${foodtype.id}" name="pojo.id"/>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Tên: <span class="required">* </span></label>
                        <div class="col-md-10">
                            <input type="text" class=" form-control" value="${foodtype.name}" name="pojo.name"
                                   required minlength="2" maxlength="45"/>
                            <span></span>
                        </div>
                    </div>
                    <div class="text-center m-3">
                        <input type="submit" value="Save" class="btn btn-primary m-3"/>
                        <a href="${home}" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</c:if>
<%-- -----------------------Thêm---------------%>
<c:if test="${foodtype == null}">
    <ul class="breadcrumb">
        <li class="active" style="padding-top: -10px">Thêm loại đồ ăn</li>
    </ul>
    <div class="row">
        <c:if test="${ not empty messexist}">
            <div id="thongbao" class="alert alert-warning alert-danger ">
                <button type="button" class="close" id="btnClose">
                    <i class="fa fa-times"></i>
                </button>
                <c:out value="${messexist}"></c:out>
            </div>
        </c:if>
        <div class="col-md-12">
            <div class="form-body">
                <form action="${editft}" method="post" style="max-width: 800px; margin: 0 auto" name="frminput">
                    <input type="hidden" name="foodtype.id"/>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Tên: <span class="required">* </span></label>
                        <div class="col-md-10">
                            <input type="text" class=" form-control" name="pojo.name"
                                   required minlength="2" maxlength="45"/>
                            <span></span>
                        </div>
                    </div>
                    <div class="text-center m-3">
                        <input type="submit" value="Save" class="btn btn-primary m-3"/>
                        <a href="${home}" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</c:if>
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
