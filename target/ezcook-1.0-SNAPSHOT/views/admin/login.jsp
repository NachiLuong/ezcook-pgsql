<%@ include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:url var="login" value="/login"/>
<c:url var="register" value="/register"/>
<c:url var="forgotpass" value="/login/forgotpass"/>
<html>
<head>
    <script src="https://fonts.googleapis.com/css?family=Montserrat:400,800"></script>
    <link rel="stylesheet" href="<c:url value='/templates/login/query.js' />"/>
    <title></title>
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="${register}" method="post">
            <h1>Tạo tài khoản</h1>
            <br>
            <span>Nhập thông tin</span>
            <c:if test="${messexist !=null}">
                <div id="thongbao" class="alert alert-dismissible alert-success ">
                    <h5 style="color: red">${messexist}</h5>
                </div>
            </c:if>
            <input type="text" placeholder="Họ và Tên" name="pojo.fullname" />
            <input type="text" placeholder="Tài khoản" name="pojo.username"/>
            <input type="password" placeholder="Mật khẩu" name="pojo.password"/>
            <input type="password" placeholder="Nhập lại mật khẩu"/>
            <input type="email" placeholder="Email" name="pojo.email"/>
            <button type="submit">Đăng kí</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="${login}" method="post">
            <h1>Đăng Nhập</h1>
            <div class="social-container">
                <a href="<c:url value='https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/login-google&response_type=code
    &client_id=405005216042-pno7k9oitgqllnqr6to7tk36cnqn43g8.apps.googleusercontent.com&approval_prompt=force'/>"
                   class="social "><i class="fa fa-google iconGoogle"></i></a>
            </div>
            <span>Hoặc</span>
            <c:if test="${messageResponse !=null}">
                <div id="thongbao" class="alert alert-dismissible alert-success ">
                    <h5 style="color: red">${messageResponse}</h5>
                </div>
            </c:if>
            <input type="text" placeholder="Tài khoản" name="username"/>
            <input type="password" placeholder="Mật khẩu" name="password"/>
            <a href="${forgotpass}">Quên mật khẩu</a>
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
