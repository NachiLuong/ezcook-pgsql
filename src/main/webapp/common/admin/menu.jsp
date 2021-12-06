<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url value="/admin/user" var="userlist"/>
<c:url value="/admin/food" var="foodlist"/>
<c:url value="/admin/foodtype" var="foodtypelist"/>
<c:url value="/admin/statistics" var="statisticslist"/>
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <a href="#" class="img logo rounded-circle mb-5"
               style="background-image: url(/templates/admin/images/logo.jpg);"></a>
            <ul class="list-unstyled components mb-5">
                <li>
                    <a href="${userlist}">Tài khoản</a>
                </li>
                <li>
                    <a href="${foodtypelist}">Loại thức ăn</a>
                </li>
                <li>
                    <a href="${foodlist}">Món ăn</a>
                </li>
                <li>
                    <a href="${statisticslist}">Thống kê</a>
                </li>
            </ul>
            <div class="footer">
                Ezcook
                <br>
                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
            </div>
        </div>
    </nav>