<%@ include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:url var="login" value="/login"/>
<html>
<head>
    <script src="https://fonts.googleapis.com/css?family=Montserrat:400,800"></script>
    <link rel="stylesheet" href="<c:url value='/templates/login/query.js' />"/>
    <title></title>
    <style>
        .buttonformat{
            border-radius: 20px;
            border: 1px solid #FF4B2B;
            background-color: #FF4B2B;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }
    </style>
</head>
<body>
<div class="container" id="container">

    <div class="form-container sign-in-container">
        <form action="${forgotpass}" method="post">
            <h1>Quên mật khẩu</h1>
            <c:if test="${message !=null}">
                <div id="thongbao" class="alert alert-dismissible alert-success ">
                    <h5 style="color: red">${message}</h5>
                </div>
            </c:if>
            <input type="text" placeholder="Tài khoản" name="username"/>
            <input type="text" placeholder="Email:" name="email"/>
            <br>
            <button type="submit">Gửi mật khẩu</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-right">
                <h1>Ezcook</h1>
                <h1>Xin chào</h1>
                <p>Điền tài khoản và email đăng kí chúng tôi sẽ gửi mật khẩu cho bạn</p>
                <a href="${login}" class="buttonformat">Đăng nhập</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
