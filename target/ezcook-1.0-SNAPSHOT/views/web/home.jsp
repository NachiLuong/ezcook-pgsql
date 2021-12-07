<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="Java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="cs" class="com.ezcook.services.impls.FoodService" scope="request"
             type="com.ezcook.services.IFoodService"/>
<jsp:useBean id="food" class="com.ezcook.entities.Food" scope="request" type="com.ezcook.entities.Food"/>
<jsp:useBean id="foods" class="com.ezcook.daos.impls.FoodDao" type="com.ezcook.daos.impls.FoodDao"
             scope="application"></jsp:useBean>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/home/home.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/home/css/home_responsive.css'/>">
    <script>
        window.onload = function () {
            jQuery('.loading').hide();
        };
    </script>
    <script>
        function loadMore() {
            var countFood = document.getElementsByClassName("food").length;
            jQuery('.loading').show();
            jQuery.ajax({
                url: "/loadMoreHome",
                type: "get",
                data: {
                    count: countFood
                },

                beforeSend: function () {
                    // Có thể thực hiện công việc load hình ảnh quay quay trước khi đổ dữ liệu ra
                },
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                success: function (data) {
                    if (jQuery.trim(data).length == 0) {
                        jQuery('.btn').hide();
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

<!-- Container -->
<div id="container">
    <!-- slider -->
    <div class="featured-area featured-style-9" id="slider">
        <div class="penci-owl-carousel penci-owl-featured-area" data-item="3" data-desktop="3" data-tablet="2"
             data-tabsmall="1" data-style="style-9" data-auto="false" data-autotime="4000" data-speed="400"
             data-loop="true">
            <c:forEach var='food' items="${listFood1}" varStatus="status">
                <div class="item text-center">
                    <div class="wrapper-item wrapper-item-classess">
                        <div class="penci-item-mag penci-item-1">
                            <a class="penci-image-holder"
                               style="background-image: url('${food.image}');"
                               href="<c:url value='/blog?id=${food.id}'/>"
                               title="${food.name}"></a>
                            <div class="penci-slide-overlay penci-slider7-overlay">
                                <a class="overlay-link"
                                   href="#"></a>
                                <div class="penci-mag-featured-content">
                                    <div class="feat-text">
                                        <h3><a title="${food.name}"
                                               href="<c:url value='/blog?id=${food.id}'/>">${food.name}</a></h3>
                                        <div class="feat-meta">
                                            <span class="feat-time"><c:out
                                                    value='${cs.formatTime(food.createdOn)}'/></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- search -->
    <c:if test='${isSearch}'>
        <div class="session" aria-checked="true">
            <h4>KẾT QUẢ TÌM KIẾM</h4>
            <c:choose>
                <c:when test="${foodsResult.size() == 0}">
                    <p id="result">Không tìm thấy kêt quả phù hợp</p>
                </c:when>
                <c:otherwise>
                    <div class="food-content">
                        <c:forEach var='food' items="${foodsResult}" varStatus="status">
                            <div class="food item text-center">
                                <a href="<c:url value='/blog?id=${food.id}'/>">
                                    <img src="<c:url value='${food.image}'/>" alt="${food.name}"/></a>
                                <div>
                                    <span>Ezcook <i class="fal fa-utensils-alt"></i> <c:out
                                            value='${food.foodtype.name}'/></span>
                                    <a href="<c:url value='/#'/>">
                                        <h5><c:out value='${food.name}'/></h5>
                                    </a>
                                    <span class="author">written by <a href="<c:url value='/#'/>">Ezcook</a>
                                        |  <c:out value='${cs.formatTime(food.createdOn)}'/></span>
                                    <hr>
                                    <p class="content-food"><c:out
                                            value='${cs.getTextBetweenTags("p", food.content)}'/></p>
                                    <a href="<c:url value='/blog?id=${food.id}'/>">Xem tiếp...</a>
                                    <div class="social-icon">
                                        <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/> " target="_blank"><i class="fab fa-facebook-f"></i></a>
                                        <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-google-plus-g"></i></a>
                                        <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-twitter"></i></a>
                                        <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </c:if>
    <!-- search -->
    <!-- content -->
    <div id="content" class="mx-auto">
        <div class="session">
            <h4>BÀI ĐĂNG MỚI NHẤT</h4>
            <div class="food-content" id="content_new">
                <c:forEach var='food' items="${listFoodNew}" varStatus="status">
                    <div class="food item text-center">
                        <a href="<c:url value='/blog?id=${food.id}'/>">
                            <img src="<c:url value='${food.image}'/>" alt="${food.name}"/></a>
                        <div>
                            <span>Ezcook <i class="fal fa-utensils-alt"></i> <c:out
                                    value='${food.foodtype.name}'/></span>
                            <a href="<c:url value='/blog?id=${food.id}'/>">
                                <h5><c:out value='${food.name}'/></h5>
                            </a>
                            <span class="author">written by <a href="<c:url value='/#'/>">Ezcook</a>
                                |  <c:out value='${cs.formatTime(food.createdOn)}'/></span>
                            <p id="demo"></p>

                            <hr>
                            <p class="content-food"><c:out value='${cs.getTextBetweenTags("p", food.content)}'/></p>
                            <a href="<c:url value='/#'/>">Xem tiếp...</a>

                            <div class="social-icon">
                                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-facebook-f"></i></a>
                                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-google-plus-g"></i></a>
                                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-twitter"></i></a>
                                <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="wrapper">
            <button onclick="loadMore()" class="btn btn-primary" style="text-align: center"><i
                    class="fa fa-refresh fa-spin loading"></i>Xem tiếp...
            </button>
        </div>
        <hr>
        <div id="content1" class="mx-auto">
            <div class="session">
                <h4>${nameListFood1}</h4>
                <div class="food-content">
                    <c:forEach var='food' items="${listFood1}" varStatus="status">
                        <div class="item text-center">
                            <a href="<c:url value='/blog?id=${food.id}'/>">
                                <img src="<c:url value='${food.image}'/>" alt="${food.name}"/></a>
                            <div>
                                <span>Ezcook <i class="fal fa-utensils-alt"></i> <c:out value='${food.foodtype.name}'/></span>
                                <a href="<c:url value='/blog?id=${food.id}'/>">
                                    <h5><c:out value='${food.name}'/></h5>
                                </a>
                                <span class="author">written by <a href="<c:url value='/#'/>">Ezcook</a>
                                    |  <c:out value='${cs.formatTime(food.createdOn)}'/></span>
                                <hr>
                                <p class="content-food"><c:out
                                        value='${cs.getTextBetweenTags("p", food.content)}'/></p>
                                <a href="<c:url value='/blog?id=${food.id}'/>">Xem tiếp...</a>
                                <div class="social-icon">
                                    <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-facebook-f"></i></a>
                                    <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-google-plus-g"></i></a>
                                    <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-twitter"></i></a>
                                    <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <hr>
        <div id="content2" class="mx-auto">
            <div class="session">
                <h4>${nameListFood2}</h4>
                <div class="food-content">
                    <c:forEach var='food' items="${listFood2}" varStatus="status">
                        <div class="item text-center">
                            <a href="<c:url value='/blog?id=${food.id}'/>">
                                <img src="<c:url value='${food.image}'/>" alt="${food.name}"/></a>
                            <div>
                                <span>Ezcook <i class="fal fa-utensils-alt"></i> <c:out value='${food.foodtype.name}'/></span>
                                <a href="<c:url value='/blog?id=${food.id}'/>">
                                    <h5><c:out value='${food.name}'/></h5>
                                </a>
                                <span class="author">written by <a href="<c:url value='/#'/>">Ezcook</a>
                                    |  <c:out value='${cs.formatTime(food.createdOn)}'/></span>
                                <hr>
                                <p class="content-food"><c:out
                                        value='${cs.getTextBetweenTags("p", food.content)}'/></p>
                                <a href="<c:url value='/blog?id=${food.id}'/>">Xem tiếp...</a>
                                <div class="social-icon">
                                    <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-facebook-f"></i></a>
                                    <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-google-plus-g"></i></a>
                                    <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-twitter"></i></a>
                                    <a href="<c:url value='https://www.facebook.com/lqtrung.01/'/>"target="_blank"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <hr>
        </div>
        <!-- content -->
    </div>
    <!-- Container -->
</div>
</body>
</html>