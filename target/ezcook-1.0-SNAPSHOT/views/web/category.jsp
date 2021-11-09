<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<c:url value="/home" var="home"/>
<!DOCTYPE html>
<html lang="en-US">

<head>
    <title>Category &#8211; Ezcool</title>
    <link rel="stylesheet" href="<c:url value='' />"/>

</head>

<body>

<!-- input search -->
<div class="mb-3 w-50 mx-auto">
    <label for="input1" class="form-label">Tìm kiếm</label>
    <input type="text" class="form-control" id="input1" placeholder="Enter...">
    <button type="button" class="btn btn-outline-primary">Search</button>
</div>

<div id="main" class="d-flex mx-auto">
    <div id="container">
        <header class="text-center">
            <h1>Category: BÁNH NGỌT</h1>
        </header>
        <div class="content" style="display: grid; grid-template-columns: 1fr 1fr;padding-right: 20px">
            <div class="image" >
                <a href="${blog}"><img src="template/asset/userinterface/img/2.jpg" alt="" style="max-height: 300px" ></a>
            </div>
            <div class="decrip"  style="text-align: center;width:400px; height:400px">
                <h5>[SQUID GAME] Trò chơi con mực</h5>
                <span class="author">
                                by <a href="#">Ezcook</a> | September 25, 2021
                            </span>
                <hr>
                <p>[SQUID GAME] Trò chơi con mực Thì ra cái trò làm kẹo & tách kẹo Dalgona này lại thú vị
                    như vậy! Bảo sao nó siêu hot! Phim mình chưa xem nhưng kẹo thì mình biết làm. Hồi sang
                    Hàn…
                </p>
                <a href="${blog}">Xem tiếp...</a>
                <div class="social-icon">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="image" >
                <a href="${blog}"><img src="template/asset/userinterface/img/2.jpg" alt="" style="max-height: 300px" ></a>
            </div>
            <div class="decrip"  style="text-align: center;width:400px; height:400px">
                <h5>[SQUID GAME] Trò chơi con mực</h5>
                <span class="author">
                                by <a href="#">Ezcook</a> | September 25, 2021
                            </span>
                <hr>
                <p>[SQUID GAME] Trò chơi con mực Thì ra cái trò làm kẹo & tách kẹo Dalgona này lại thú vị
                    như vậy! Bảo sao nó siêu hot! Phim mình chưa xem nhưng kẹo thì mình biết làm. Hồi sang
                    Hàn…
                </p>
                <a href="${blog}">Xem tiếp...</a>
                <div class="social-icon">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div id="author" class="text-center">
        <div class="sticky-author">
            <h4>AUTHOR</h4>
            <img class="rounded-circle w-70"
                 src="http://www.esheepkitchen.com/wp-content/uploads/2018/04/about-me.jpg" alt="author">
            <p>Căn Bếp nhà Esheep. Góc nhỏ mày mò chia sẻ công thức nấu ăn, làm bánh, review đồ bếp. Chia sẻ tình
                yêu gia đình, bếp, vườn, chụp ảnh, du lịch...</p>
            <h4>LIÊN HỆ VỚI TÔI</h4>
            <div class="social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram-square"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-tiktok"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="far fa-envelope"></i></a>
            </div>
        </div>
    </div>
</div>


<script type='text/javascript' src="<c:url value='/templates/web/common/js/common.js'/>"></script>
</body>

</html>