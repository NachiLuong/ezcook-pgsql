<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<jsp:useBean id="cs" class="com.ezcook.services.impls.FoodService" scope="request"
             type="com.ezcook.services.IFoodService"/>
<jsp:useBean id="food" class="com.ezcook.entities.Food" scope="request" type="com.ezcook.entities.Food"/>

<jsp:useBean id="foodType" class="com.ezcook.entities.FoodType" scope="request" type="com.ezcook.entities.FoodType"/>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>${nameListFood} &#8211; Ezcook</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/category/categoryy.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/category/category_responsive.css'/>">
    <script>
        window.onload = function()
        {
            jQuery('.loading').hide();
        };
    </script>
    <script>
        function loadMore() {
            var countFood = document.getElementsByClassName("food").length;
            jQuery('.loading').show();
            jQuery.ajax({
                url: "/loadMoreCategory",
                type: "get",
                data: {
                    count: countFood
                },
                beforeSend: function(){
                    // Có thể thực hiện công việc load hình ảnh quay quay trước khi đổ dữ liệu ra
                },
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                success: function (data) {
                    if(jQuery.trim(data).length == 0) {
                        jQuery('.button').hide();
                    }
                    var row = document.getElementById("content_new");
                    row.innerHTML += data;
                    jQuery('.loading').hide();
                },
                error: function (xhr) {
                    console.log("Failed to push transaction. -> " + xhr.responseText);
                }
            });
        }
    </script>
</head>

<body>
<div id="main" class="d-flex mx-auto">
    <%-- begin container --%>
    <div id="container">
        <header class="text-center">
            <h2><span style="color:#3d3d3d;">Category:&nbsp</span>${nameListFood}</h2>
        </header>
        <div class="food-content" id="content_new">
            <%--@elvariable id="listFood" type="java.util.List"--%>
            <c:forEach var='food' items="${listFood}" varStatus="status">
                <div class="food content">
                    <div class="image">
                        <a href="<c:url value='/blog?id=${food.id}'/>">
                            <img src="<c:url value='${food.image}'/>" alt="${food.name}"/>
                        </a>
                    </div>
                    <div class="item text-center">
                        <span>Ezcook <i class="fal fa-utensils-alt"></i> <c:out value='${food.foodtype.name}'/></span>
                        <a href="<c:url value='/blog?id=${food.id}'/>">
                            <h5><c:out value='${food.name}'/></h5>
                        </a>
                        <span class="author">written by <a href="<c:url value='/#'/>">Ezcook</a>
                            | <c:out value='${cs.formatTime(food.createdOn)}'/></span>
                        <p id="demo"></p>

                        <hr>
                        <p class="food-content">
                            <c:out value='${cs.getTextBetweenTags("p", food.content)}'/></p>
                        <span><a href="<c:url value='/blog?id=${food.id}'/>">Xem tiếp...</a></span>
                    </div>

                </div>
                <hr>
            </c:forEach>
        </div>
        <div class = "text-center">
            <button onclick="loadMore()" class="button" style="text-align: center"><i class="fa fa-refresh fa-spin loading"></i>Xem thêm</button>
            <br></br>
        </div>
    </div>
    <%-- end container --%>

    <%-- begin author --%>
    <div id="author" class="text-center">
        <div class="sticky-author">
            <h4><strong>AUTHOR</strong></h4>
            <img class="rounded-circle w-70"
                 src="https://github.com/NachiLuong/ezcook-pgsql/blob/trung-admin/src/main/webapp/templates/admin/images/logo.jpg?raw=true" alt="author">
            <p>Căn Bếp nhà Ezcook. Góc nhỏ mày mò chia sẻ công thức nấu ăn, làm bánh, review đồ bếp. Chia sẻ tình
                yêu gia đình, bếp, vườn, chụp ảnh, du lịch...</p>
            <h4>LIÊN HỆ VỚI TÔI</h4>
            <div class="social">
                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>" target="_blank"><i class="fab fa-instagram-square"></i></a>
                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>" target="_blank"><i class="fab fa-tiktok"></i></a>
                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>" target="_blank"><i class="fab fa-youtube"></i></a>
                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>" target="_blank"><i class="far fa-envelope"></i></a>
            </div>
        </div>
    </div>
    <%-- end author --%>
</div>


<script type='text/javascript' src="<c:url value='/templates/web/common/js/common.js'/>"></script>
</body>

</html>