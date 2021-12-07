<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="editFood" value="/admin/food/edit"/>
<c:url var="home" value="/admin/food"/>
<html>
<head>
    <title>Edit Food</title>
</head>
<body>
<%--------------------------Sửa------------------%>
<c:if test="${food != null}">
    <ul class="breadcrumb">
        <li class="active" style="padding-top: -10px">Chỉnh sửa món ăn</li>
    </ul>
    <div class="row">

        <div class="col-md-12">
            <div class="form-body">
                <form action="${editFood}" method="post" style="max-width: 800px; margin: 0 auto">
                    <input type="hidden" value="${food.id}" name="pojo.id"/>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Tên: <span class="required">* </span></label>
                        <div class="col-md-10">
                            <input type="text" class=" form-control" value="${food.name}" name="pojo.name"
                                   required minlength="2" />
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Tiêu đề:<span class="required">* </span></label>
                        <div class="col-md-10" >
                            <textarea type="text" class=" form-control" <%--value="${food.content}"--%> name="pojo.content"
                                      id="foodcontent"   required>${food.content}</textarea>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Hình ảnh<span class="required"> * </span></label>
                        <div class="col-md-10">
                            <textarea type="text" class=" form-control" <%--value="${food.image}"--%> name="pojo.image"
                                      required minlength="2" >${food.image}</textarea>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Video </label>
                        <div class="col-md-10">
                            <textarea type="text" class="form-control"<%-- value="${food.video}"--%>
                                      minlength="4" maxlenth="20" name="pojo.video">${food.video}</textarea>
                        </div>
                    </div>

                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label ">Loại món ăn</label>
                        <div class="col-md-10">
                            <block>
                                <c:forEach var="foodtype" items="${foodtypes}">
                                    <c:if test="${food.foodTypeDto.name.equals(foodtype.name)}">
                                        <input type="radio" value="${foodtype.name}" id="role1" name="foodtype"
                                               class="m-2"
                                               checked/>
                                        <label for="role1">${foodtype.name}</label>
                                    </c:if>
                                    <c:if test="${!food.foodTypeDto.name.equals(foodtype.name)}">
                                        <input type="radio" value="${foodtype.name}" id="role2" name="foodtype"
                                               class="m-2"/>
                                        <label for="role2">${foodtype.name}</label>
                                    </c:if>
                                    <br/>
                                </c:forEach>
                            </block>
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
<c:if test="${food == null}">
    <ul class="breadcrumb">
        <li class="active" style="padding-top: -10px">Thêm tài khoản người dùng</li>
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
                <form action="${editFood}" method="post" style="max-width: 800px; margin: 0 auto" name="frminput">
                    <input type="hidden" name="pojo.id"/>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Tên: <span class="required">* </span></label>
                        <div class="col-md-10">
                            <input type="text" class=" form-control" name="pojo.name"
                                   required minlength="2" />
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Tiêu đề:<span class="required">* </span></label>
                        <div class="col-md-10">
                            <textarea type="text" class=" form-control" name="pojo.content" required
                                   id="foodcontent"   minlength="8"></textarea>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Hình ảnh: <span class="required"> * </span></label>
                        <div class="col-md-10">
                            <textarea type="text" class=" form-control" name="pojo.image"
                                      required minlength="2"></textarea>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label">Video: </label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" minlength="4" maxlenth="20" name="pojo.video"/>
                        </div>
                    </div>
                    <div class="form-group margin-bottom-10">
                        <label class="col-md-2 control-label ">Loại món ăn</label>
                        <div class="col-md-10">
                            <block>
                                <c:forEach var="foodtype" items="${foodtypes}">
                                    <input type="radio" value="${foodtype.name}" name="foodtype" class="m-2" checked/>
                                    <label>${foodtype.name}</label>
                                </c:forEach>
                            </block>
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
    var edittor= '';
    $(document).ready(function () {
        edittor= CKEDITOR.replace('foodcontent');
        closeallow();
    });

    function closeallow() {
        document.getElementById("btnClose").onclick = function () {
            document.getElementById("thongbao").style.display = "none";
        };
    };
</script>
</body>
</html>
