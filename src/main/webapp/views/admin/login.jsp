<%@ include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:url var="formUrl" value="/login"/>
<html>
<head>
    <script src="https://fonts.googleapis.com/css?family=Montserrat:400,800"></script>
    <link rel="stylesheet" href="<c:url value='/templates/login/query.js' />" />
    <link rel="stylesheet" href="<c:url value='/templates/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />
    <title></title>
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="#">
            <h1>Tạo tài khoản</h1>
            <br>
            <span>Nhập thông tin</span>
            <input type="text" placeholder="Họ và Tên" />
            <input type="text" placeholder="Tài khoản" />
            <input type="password" placeholder="Mật khẩu" />
            <input type="password" placeholder="Nhập lại mật khẩu" />
            <input type="email" placeholder="Email" />
            <button>Đăng kí</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="${formUrl}" method="post">
            <h1>Đăng Nhập</h1>
            <div class="social-container">
                <a href="#" class="social "><i class="fa fa-google iconGoogle"></i></a>
            </div>
            <span>Hoặc</span>

            <input type="text" placeholder="Tài khoản" name="pojo.username"/>
            <input type="password" placeholder="Mật khẩu" name="pojo.password_user"/>
            <a href="#">Quên mật khẩu</a>
            <button type="submit">Đăng Nhập</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Ezcook</h1>
                <h1>Xin chào</h1>
                <p>Đăng nhập để có những trải nghiệm về ẩm thực tốt nhất cùng chúng tôi</p>
                <p>Nếu đã có tài khoản, vui lòng chọn đăng nhập</p>
                <button class="ghost" id="signIn">Đăng Nhập</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Ezcook</h1>
                <h1>Xin chào</h1>
                <p>Đăng nhập để có những trải nghiệm tốt nhất về ẩm thực cùng chúng tôi</p>
                <p>Nếu chưa có tài khoản, vui lòng chọn đăng kí</p>
                <button class="ghost" id="signUp">Đăng kí</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
