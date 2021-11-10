<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url value="/admin-user-list" var="userlist"/>
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <a href="#" class="img logo rounded-circle mb-5"
               style="background-image: url(/templates/admin/images/logo.jpg);"></a>
            <ul class="list-unstyled components mb-5">
                <li class="active">
                    <a href="${userlist}">Tài khoản</a>
                </li>
                <li>
                    <a href="#">Loại thức ăn</a>
                </li>
                <li>
                    <a href="#">Món ăn</a>
                </li>
                <li>
                    <a href="#">Thống kê</a>
                </li>
            </ul>
            <div class="footer">
                Ezcook
                <br>
                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
            </div>
        </div>
    </nav>