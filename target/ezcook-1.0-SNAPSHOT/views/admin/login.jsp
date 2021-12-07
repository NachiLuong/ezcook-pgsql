<%@ include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:url var="login" value="/login"/>
<c:url var="register" value="/register"/>
<c:url var="forgotpass" value="/login/forgotpass"/>
<html>
<head>
    <script src="https://fonts.googleapis.com/css?family=Montserrat:400,800"></script>
    <link rel="stylesheet" href="<c:url value='/templates/login/query.js' />"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type='text/javascript'>
        function check(input) {
            if (input.value != document.getElementById('password').value) {
                input.setCustomValidity('Nhập lại mật khẩu không khơp !');
            } else {
                // input is valid -- reset the error message
                input.setCustomValidity('');
            }
        }
    </script>
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="${register}" method="post">
            <h1>Tạo tài khoản</h1>
            <br>
            <span>Nhập thông tin</span>
            <c:if test="${message !=null}">
                <div id="thongbao" class="alert alert-dismissible">
                    <h5 style="color: red">${message}</h5>
                </div>
            </c:if>
            <input type="text" placeholder="Họ và Tên" name="pojo.fullname" required />
            <input type="text" placeholder="Tài khoản"  name="pojo.username" required minlength="6" maxlength="20" pattern="[a-z][6-20]"/>
            <input type="text" placeholder="Mật khẩu" id="password" name="pojo.password" required minlength="6" maxlength="20"/>
            <input type="text" placeholder="Nhập lại mật khẩu" required oninput="check(this)"/>
            <input type="email" placeholder="Email" name="pojo.email" required/>
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
            <c:if test="${messexist !=null}">
                <div id="thongbao" class="alert alert-dismissible">
                    <h5 style="color: red">${messexist}</h5>
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
