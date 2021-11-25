<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="Java" %>
<%@ include file="/common/taglib.jsp" %>

<jsp:useBean id="cs" class="com.ezcook.services.impls.FoodService" scope="request"
             type="com.ezcook.services.IFoodService"/>
<jsp:useBean id="food" class="com.ezcook.entities.Food" scope="request" type="com.ezcook.entities.Food"/>
<jsp:useBean id="foods" class="com.ezcook.daos.impls.FoodDao" type="com.ezcook.daos.impls.FoodDao"
             scope="application"></jsp:useBean>

<jsp:useBean id="foodType" class="com.ezcook.entities.FoodType" scope="request" type="com.ezcook.entities.FoodType"/>
<jsp:useBean id="foodTypes" class="com.ezcook.daos.impls.FoodTypeDao" type="com.ezcook.daos.impls.FoodTypeDao"
             scope="application"></jsp:useBean>

<header>

    <a href="<c:url value='#'/>" id="header-up" class="text-center rounded">
        <i class="fal fa-chevron-up text-white"></i>
    </a>
    <a id="close-sidebar-nav" class="header-1">
        <i class="fa fa-close"></i>
    </a>

    <c:set var="foodTypeList" value="${foodTypes.findAll()}" scope="application"></c:set>
    <!-- navigation control -->
    <nav id="navigation"
         class="header-layout-top menu-style-2 header-1 menu-item-padding penci-disable-sticky-nav">
        <div class="container">
            <div class="button-menu-mobile header-1"><i class="fa fa-bars"></i></div>
            <ul id="menu-main-menu-1" class="menu">
                <li
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-66 active">
                    <a href="<c:url value='/home'/>">Home</a>
                </li>
                <li
                        class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-1209">
                    <a href="<c:url value='/category'/>">Công Thức<i
                            class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-mega-child-categories">
                                    <c:forEach var="foodType" items="${foodTypeList}" varStatus="status">
                                        <a class="mega-cat-child"
                                           href="<c:url value='/category?id=${foodType.id}'/>"
                                           data-id="penci-mega-${foodType.id}"><span>${foodType.name}</span></a>
                                    </c:forEach>
                                    <a class="mega-cat-child cat-active all-style"
                                       href="<c:url value='/category'/>"
                                       data-id="penci-mega-138"><span>All</span></a>
                                </div>
                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-4 mega-row-1">
                                        <c:forEach var="foodType" items="${foodTypeList}" varStatus="status">
                                            <div class="penci-mega-row penci-mega-${foodType.id}">
                                                <c:forEach var="food" items="${foods.getListByFoodTypeIDAndLimit(foodType.id,4)}" varStatus="status">
                                                    <div class="penci-mega-post">
                                                        <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/category'/>">${foodType.name}</a>
                                                        </span>
                                                            <a class="penci-image-holder"
                                                               style="background-image: url('${food.image}')"
                                                               href="<c:url value='/blog'/>"
                                                               title="${food.name}">
                                                            </a>
                                                        </div>
                                                        <div class="penci-mega-meta">
                                                            <h3 class="post-mega-title">
                                                                <a href="<c:url value='/blog'/>"
                                                                   title="${food.name}">${food.name}&#8230;</a>
                                                            </h3>
                                                            <p class="penci-mega-date"><c:out value='${cs.formatTime(food.createdOn)}'/></p>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </c:forEach>
<%--                                        <div class="penci-mega-row penci-mega-138 row-active">--%>
<%--                                            <div class="penci-mega-post">--%>
<%--                                                <div class="penci-mega-thumbnail">--%>
<%--                                                        <span class="mega-cat-name">--%>
<%--                                                            <a href="https://www.esheepkitchen.com/category/recipe/">Công--%>
<%--                                                                Thức</a> </span>--%>
<%--                                                    <a class="penci-image-holder"--%>
<%--                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/242768151_407692067393135_5100537142423214304_n.jpeg?resize=585%2C390&amp;ssl=1')"--%>
<%--                                                       href="https://www.esheepkitchen.com/squid-game-tro-choi-con-muc/"--%>
<%--                                                       title="[SQUID GAME] Trò chơi con mực">--%>
<%--                                                    </a>--%>
<%--                                                </div>--%>
<%--                                                <div class="penci-mega-meta">--%>
<%--                                                    <h3 class="post-mega-title">--%>
<%--                                                        <a href="https://www.esheepkitchen.com/squid-game-tro-choi-con-muc/"--%>
<%--                                                           title="[SQUID GAME] Trò chơi con mực">[SQUID--%>
<%--                                                            GAME] Trò--%>
<%--                                                            chơi con mực</a>--%>
<%--                                                    </h3>--%>
<%--                                                    <p class="penci-mega-date">September 25,--%>
<%--                                                        2021</p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="penci-mega-post">--%>
<%--                                                <div class="penci-mega-thumbnail">--%>
<%--                                                        <span class="mega-cat-name">--%>
<%--                                                            <a href="https://www.esheepkitchen.com/category/recipe/">Công--%>
<%--                                                                Thức</a> </span>--%>
<%--                                                    <a class="penci-image-holder"--%>
<%--                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/242296130_407064584122550_6841722089028900184_n.jpeg?resize=585%2C390&amp;ssl=1')"--%>
<%--                                                       href="https://www.esheepkitchen.com/cach-lam-rose-roll-cake-banh-cuon-kem-phomai-bang-chao/"--%>
<%--                                                       title="CÁCH LÀM “ROSÉ ROLL CAKE” – BÁNH CUỘN KEM PHOMAI BẰNG… CHẢO">--%>
<%--                                                        <i class="fa fa-play"></i>--%>
<%--                                                    </a>--%>
<%--                                                </div>--%>
<%--                                                <div class="penci-mega-meta">--%>
<%--                                                    <h3 class="post-mega-title">--%>
<%--                                                        <a href="https://www.esheepkitchen.com/cach-lam-rose-roll-cake-banh-cuon-kem-phomai-bang-chao/"--%>
<%--                                                           title="CÁCH LÀM “ROSÉ ROLL CAKE” – BÁNH CUỘN KEM PHOMAI BẰNG… CHẢO">CÁCH--%>
<%--                                                            LÀM “ROSÉ ROLL CAKE” – BÁNH CUỘN&#8230;</a>--%>
<%--                                                    </h3>--%>
<%--                                                    <p class="penci-mega-date">September 24,--%>
<%--                                                        2021</p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="penci-mega-post">--%>
<%--                                                <div class="penci-mega-thumbnail">--%>
<%--                                                        <span class="mega-cat-name">--%>
<%--                                                            <a href="https://www.esheepkitchen.com/category/recipe/">Công--%>
<%--                                                                Thức</a> </span>--%>
<%--                                                    <a class="penci-image-holder"--%>
<%--                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240705233_398022765026732_813286415368641027_n.jpeg?resize=585%2C390&amp;ssl=1')"--%>
<%--                                                       href="https://www.esheepkitchen.com/yeu-bep-feedback-thit-kho-trong-trang-kho-trung-ca-vo/"--%>
<%--                                                       title="[Yêu Bếp feedback] THỊT KHO &#8220;TRONG TRẮNG&#8221; &#038; KHO TRỨNG CẢ VỎ">--%>
<%--                                                    </a>--%>
<%--                                                </div>--%>
<%--                                                <div class="penci-mega-meta">--%>
<%--                                                    <h3 class="post-mega-title">--%>
<%--                                                        <a href="https://www.esheepkitchen.com/yeu-bep-feedback-thit-kho-trong-trang-kho-trung-ca-vo/"--%>
<%--                                                           title="[Yêu Bếp feedback] THỊT KHO &#8220;TRONG TRẮNG&#8221; &#038; KHO TRỨNG CẢ VỎ">[Yêu--%>
<%--                                                            Bếp feedback] THỊT KHO &#8220;TRONG--%>
<%--                                                            TRẮNG&#8221;--%>
<%--                                                            &#038;&#8230;</a>--%>
<%--                                                    </h3>--%>
<%--                                                    <p class="penci-mega-date">September 11,--%>
<%--                                                        2021</p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="penci-mega-post">--%>
<%--                                                <div class="penci-mega-thumbnail">--%>
<%--                                                        <span class="mega-cat-name">--%>
<%--                                                            <a href="https://www.esheepkitchen.com/category/recipe/">Công--%>
<%--                                                                Thức</a> </span>--%>
<%--                                                    <a class="penci-image-holder"--%>
<%--                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240998779_393022565526752_8772231243327937768_n.jpeg?resize=585%2C390&amp;ssl=1')"--%>
<%--                                                       href="https://www.esheepkitchen.com/cach-lam-cha-ca-ha-noi-cha-ca-la-vong-bang-noi-chien-khong-dau/"--%>
<%--                                                       title="CÁCH LÀM CHẢ CÁ HÀ NỘI – CHẢ CÁ LÃ VỌNG BẰNG NỒI CHIÊN KHÔNG DẦU">--%>
<%--                                                    </a>--%>
<%--                                                </div>--%>
<%--                                                <div class="penci-mega-meta">--%>
<%--                                                    <h3 class="post-mega-title">--%>
<%--                                                        <a href="https://www.esheepkitchen.com/cach-lam-cha-ca-ha-noi-cha-ca-la-vong-bang-noi-chien-khong-dau/"--%>
<%--                                                           title="CÁCH LÀM CHẢ CÁ HÀ NỘI – CHẢ CÁ LÃ VỌNG BẰNG NỒI CHIÊN KHÔNG DẦU">CÁCH--%>
<%--                                                            LÀM CHẢ CÁ HÀ NỘI –--%>
<%--                                                            CHẢ&#8230;</a>--%>
<%--                                                    </h3>--%>
<%--                                                    <p class="penci-mega-date">September 3,--%>
<%--                                                        2021</p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
                <li
                        class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-245">
                    <a href="https://www.esheepkitchen.com/category/inspiration/">Cảm hứng
                        sống<i
                                class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-mega-child-categories">
                                    <a class="mega-cat-child"
                                       href="https://www.esheepkitchen.com/category/inspiration/goc-nho-esheep/"
                                       data-id="penci-mega-139"><span>Góc nhỏ Esheep</span></a>
                                    <a class="mega-cat-child"
                                       href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/"
                                       data-id="penci-mega-17"><span>Ký ức Hà Nội</span></a>
                                    <a class="mega-cat-child"
                                       href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/"
                                       data-id="penci-mega-201"><span>Nhật kí xây mơ</span></a>
                                    <a class="mega-cat-child cat-active all-style"
                                       href="https://www.esheepkitchen.com/category/inspiration/"
                                       data-id="penci-mega-15"><span>All</span></a>
                                </div>

                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-4 mega-row-1">
                                        <div class="penci-mega-row penci-mega-139">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/">Cảm
                                                                hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240620163_395383798623962_6691074099465274403_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ve-dep-cua-rau-cu/"
                                                       title="Vẻ đẹp của rau củ">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ve-dep-cua-rau-cu/"
                                                           title="Vẻ đẹp của rau củ">Vẻ đẹp
                                                            của rau củ</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 7,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/">Cảm
                                                                hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/189533859_10158451207468531_4963756709241630047_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ghi-lai-mot-mua-sen/"
                                                       title="[Ghi lại một mùa sen]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ghi-lai-mot-mua-sen/"
                                                           title="[Ghi lại một mùa sen]">[Ghi
                                                            lại một mùa sen]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 25,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/recipe/breakfast/">Breakfast</a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/185465114_4226487464062171_7982178195753264884_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/cuoi-tuan-vao-bep-cung-con-banh-ngo-mua-he-sieu-ngon-sieu-de/"
                                                       title="[Cuối tuần vào bếp cùng con] BÁNH NGÔ MÙA HÈ &#8211; SIÊU NGON SIÊU DỄ">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/cuoi-tuan-vao-bep-cung-con-banh-ngo-mua-he-sieu-ngon-sieu-de/"
                                                           title="[Cuối tuần vào bếp cùng con] BÁNH NGÔ MÙA HÈ &#8211; SIÊU NGON SIÊU DỄ">[Cuối
                                                            tuần vào bếp cùng con] BÁNH NGÔ&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 22,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/">Cảm
                                                                hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/183895449_10158424302883531_4964299410344686214_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/cung-con-vao-bep-x-mon-ngon-de-lam-cuoi-tuan-cach-tu-lam-ca-ri-bo-sieu-don-gian-bang-noi-com-dien-da-nang-tre-con-dua-nao-cung-me-tit/"
                                                       title="CÙNG CON VÀO BẾP X MÓN NGON DỄ LÀM CUỐI TUẦN [Cách tự làm cà ri bò siêu đơn giản bằng Nồi cơm điện đa năng – trẻ con đứa nào cũng mê tít]">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/cung-con-vao-bep-x-mon-ngon-de-lam-cuoi-tuan-cach-tu-lam-ca-ri-bo-sieu-don-gian-bang-noi-com-dien-da-nang-tre-con-dua-nao-cung-me-tit/"
                                                           title="CÙNG CON VÀO BẾP X MÓN NGON DỄ LÀM CUỐI TUẦN [Cách tự làm cà ri bò siêu đơn giản bằng Nồi cơm điện đa năng – trẻ con đứa nào cũng mê tít]">CÙNG
                                                            CON VÀO BẾP X MÓN NGON
                                                            DỄ&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 14,
                                                        2021</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="penci-mega-row penci-mega-17">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/">Ký
                                                                ức Hà Nội</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/08/z2662804551637_523767798e4a3811e43f1a29e09ff7c4.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ha-noi-di-an-sang/"
                                                       title="[Hà Nội đi ăn sáng]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ha-noi-di-an-sang/"
                                                           title="[Hà Nội đi ăn sáng]">[Hà
                                                            Nội đi ăn sáng]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">August 4,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/">Ký
                                                                ức Hà Nội</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/189533859_10158451207468531_4963756709241630047_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ghi-lai-mot-mua-sen/"
                                                       title="[Ghi lại một mùa sen]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ghi-lai-mot-mua-sen/"
                                                           title="[Ghi lại một mùa sen]">[Ghi
                                                            lại một mùa sen]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 25,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/">Ký
                                                                ức Hà Nội</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/186061311_4228730110504573_361081240528369684_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/dam-ba-thuc-qua-mua-he-ha-noi/"
                                                       title="[Dăm ba thức quà mùa hè Hà Nội]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/dam-ba-thuc-qua-mua-he-ha-noi/"
                                                           title="[Dăm ba thức quà mùa hè Hà Nội]">[Dăm
                                                            ba thức quà
                                                            mùa hè Hà Nội]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 23,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/">Ký
                                                                ức Hà Nội</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/158622995_4014891761888410_427431966533677550_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ky-uc-ha-noi-x-thang-ba-hoa-gao-thu-lam-mon-nhuy-hoa-gao-xao-trong-truyen-thuyet/"
                                                       title="[Ký ức Hà Nội] x [Tháng Ba, hoa gạo]  THỬ LÀM MÓN &#8220;NHUỴ HOA GẠO XÀO&#8221; TRONG TRUYỀN THUYẾT">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ky-uc-ha-noi-x-thang-ba-hoa-gao-thu-lam-mon-nhuy-hoa-gao-xao-trong-truyen-thuyet/"
                                                           title="[Ký ức Hà Nội] x [Tháng Ba, hoa gạo]  THỬ LÀM MÓN &#8220;NHUỴ HOA GẠO XÀO&#8221; TRONG TRUYỀN THUYẾT">[Ký
                                                            ức Hà Nội] x [Tháng Ba, hoa&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">March 12,
                                                        2021</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="penci-mega-row penci-mega-201">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/">Nhật
                                                                kí xây mơ</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/09/50350387013_225b60accd_o.jpg?resize=477%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/bep-cua-nhung-ke-mong-mo/"
                                                       title="BẾP CỦA NHỮNG KẺ MỘNG MƠ">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/bep-cua-nhung-ke-mong-mo/"
                                                           title="BẾP CỦA NHỮNG KẺ MỘNG MƠ">BẾP
                                                            CỦA NHỮNG KẺ MỘNG
                                                            MƠ</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 16,
                                                        2020</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/">Nhật
                                                                kí xây mơ</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/01/phan-anh-1.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/qua-tang-giang-sinh/"
                                                       title="Quà tặng giáng sinh">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/qua-tang-giang-sinh/"
                                                           title="Quà tặng giáng sinh">Quà
                                                            tặng giáng sinh</a>
                                                    </h3>
                                                    <p class="penci-mega-date">December 20,
                                                        2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/">Nhật
                                                                kí xây mơ</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/01/phan-anh-2.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/giveaway-qua-hin-ru-hoi-san-sale/"
                                                       title="GIVEAWAY QUÀ HỊN &#038; RỦ HỘI SĂN SALE">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/giveaway-qua-hin-ru-hoi-san-sale/"
                                                           title="GIVEAWAY QUÀ HỊN &#038; RỦ HỘI SĂN SALE">GIVEAWAY
                                                            QUÀ HỊN &#038; RỦ HỘI SĂN
                                                            SALE</a>
                                                    </h3>
                                                    <p class="penci-mega-date">December 5,
                                                        2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/">Nhật
                                                                kí xây mơ</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://www.esheepkitchen.com/wp-content/themes/soledad/images/no-image.jpg')"
                                                       href="https://www.esheepkitchen.com/xin-chao-smeg/"
                                                       title="XIN CHÀO SMEG">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/xin-chao-smeg/"
                                                           title="XIN CHÀO SMEG">XIN CHÀO
                                                            SMEG</a>
                                                    </h3>
                                                    <p class="penci-mega-date">October 16,
                                                        2019</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="penci-mega-row penci-mega-15 row-active">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/">Cảm
                                                                hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/241443067_402732721222403_8263454304472512944_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/tat-tat-tu-a-z-cach-tu-lam-gia-luoi-ai-cung-lam-duoc-khong-so-me-mang/"
                                                       title="TẤT TẬT TỪ A-Z CÁCH TỰ LÀM GIÁ LƯỜI, AI CŨNG LÀM ĐƯỢC KHÔNG SỢ MẸ MẮNG">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/tat-tat-tu-a-z-cach-tu-lam-gia-luoi-ai-cung-lam-duoc-khong-so-me-mang/"
                                                           title="TẤT TẬT TỪ A-Z CÁCH TỰ LÀM GIÁ LƯỜI, AI CŨNG LÀM ĐƯỢC KHÔNG SỢ MẸ MẮNG">TẤT
                                                            TẬT TỪ A-Z CÁCH TỰ LÀM GIÁ&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 18,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/">Cảm
                                                                hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240592596_10158698226213531_7156944578654639022_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/cong-bo-ket-qua-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi/"
                                                       title="CÔNG BỐ KẾT QUẢ THỬ THÁCH TUẦN “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI”">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/cong-bo-ket-qua-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi/"
                                                           title="CÔNG BỐ KẾT QUẢ THỬ THÁCH TUẦN “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI”">CÔNG
                                                            BỐ KẾT QUẢ THỬ THÁCH TUẦN “CUỘC&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 15,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/">Cảm
                                                                hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240620163_395383798623962_6691074099465274403_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ve-dep-cua-rau-cu/"
                                                       title="Vẻ đẹp của rau củ">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ve-dep-cua-rau-cu/"
                                                           title="Vẻ đẹp của rau củ">Vẻ đẹp
                                                            của rau củ</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 7,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/inspiration/">Cảm
                                                                hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240592549_10158665120308531_1151239136467453639_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/%f0%9f%8d%91-thong-bao-sieu-hot%e2%9c%a8%f0%9f%8c%bf-moi-ban-tham-gia-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi-va-kham-pha-kho-bau-giai-thuong-do-bep/"
                                                       title="🍑 THÔNG BÁO SIÊU HOT✨🌿 Mời bạn tham gia Thử thách tuần “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI” và khám phá “kho báu giải thưởng đồ bếp”">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/%f0%9f%8d%91-thong-bao-sieu-hot%e2%9c%a8%f0%9f%8c%bf-moi-ban-tham-gia-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi-va-kham-pha-kho-bau-giai-thuong-do-bep/"
                                                           title="🍑 THÔNG BÁO SIÊU HOT✨🌿 Mời bạn tham gia Thử thách tuần “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI” và khám phá “kho báu giải thưởng đồ bếp”">🍑
                                                            THÔNG BÁO SIÊU HOT✨🌿 Mời bạn
                                                            tham&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">August 29,
                                                        2021</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
                <li
                        class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-1240">
                    <a href="https://www.esheepkitchen.com/category/biblelicious/">Biblelicious<i
                            class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-mega-child-categories">
                                    <a class="mega-cat-child"
                                       href="https://www.esheepkitchen.com/category/biblelicious/kitchen-tips-tricks/"
                                       data-id="penci-mega-8"><span>Mẹo vặt</span></a>
                                    <a class="mega-cat-child cat-active all-style"
                                       href="https://www.esheepkitchen.com/category/biblelicious/"
                                       data-id="penci-mega-19"><span>All</span></a>
                                </div>

                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-4 mega-row-1">
                                        <div class="penci-mega-row penci-mega-8">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/group-yeu-bep/">Group
                                                                Yêu Bếp</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/51200291779_c8eda160ef_k.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/hoc-cach-cat-dua-thom-2-kieu-cuc-de/"
                                                       title="HỌC CÁCH CẮT DỨA (THƠM) 2 KIỂU CỰC DỄ">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/hoc-cach-cat-dua-thom-2-kieu-cuc-de/"
                                                           title="HỌC CÁCH CẮT DỨA (THƠM) 2 KIỂU CỰC DỄ">HỌC
                                                            CÁCH
                                                            CẮT DỨA (THƠM) 2 KIỂU
                                                            CỰC&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 24,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/group-yeu-bep/">Group
                                                                Yêu Bếp</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/Anh-1-e1620879773621.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/yeu-bep-don-gon-co-sach-x-kinh-nghiem-tu-admin-kinh-nghiem-don-dep-sap-xep-tu-do-kho-gon-sach-va-khoa-hoc/"
                                                       title="|Yêu Bếp: Dọn gọn – cọ sạch| x |Kinh nghiệm từ admin| KINH NGHIỆM DỌN DẸP, SẮP XẾP TỦ ĐỒ KHÔ GỌN, SẠCH VÀ KHOA HỌC">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/yeu-bep-don-gon-co-sach-x-kinh-nghiem-tu-admin-kinh-nghiem-don-dep-sap-xep-tu-do-kho-gon-sach-va-khoa-hoc/"
                                                           title="|Yêu Bếp: Dọn gọn – cọ sạch| x |Kinh nghiệm từ admin| KINH NGHIỆM DỌN DẸP, SẮP XẾP TỦ ĐỒ KHÔ GỌN, SẠCH VÀ KHOA HỌC">|Yêu
                                                            Bếp: Dọn gọn – cọ sạch|
                                                            x&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 12,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/biblelicious/">Biblelicious</a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/182803659_4186667874710797_652232850306242177_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/meo-hay-yeu-bep-x-chuyen-tam-linh-trong-bep-cach-lam-vien-hanh-toi-ot-tien-dung-moi-lan-xao-nau-tiet-kiem-ca-dong-thoi-gian-nau-nuong/"
                                                       title="[MẸO HAY YÊU BẾP] x [CHUYỆN TÂM LINH TRONG BẾP] Cách làm &#8220;viên hành tỏi ớt&#8221; tiện dụng mỗi lần xào nấu, tiết kiệm cả đống thời gian nấu nướng!">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/meo-hay-yeu-bep-x-chuyen-tam-linh-trong-bep-cach-lam-vien-hanh-toi-ot-tien-dung-moi-lan-xao-nau-tiet-kiem-ca-dong-thoi-gian-nau-nuong/"
                                                           title="[MẸO HAY YÊU BẾP] x [CHUYỆN TÂM LINH TRONG BẾP] Cách làm &#8220;viên hành tỏi ớt&#8221; tiện dụng mỗi lần xào nấu, tiết kiệm cả đống thời gian nấu nướng!">[MẸO
                                                            HAY YÊU BẾP] x [CHUYỆN TÂM LINH&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 9,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/group-yeu-bep/">Group
                                                                Yêu Bếp</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/181483519_10158408026988531_4420611567847435591_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/vai-meo-nho-voi-nckd/"
                                                       title="[Vài mẹo nhỏ với NCKD]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/vai-meo-nho-voi-nckd/"
                                                           title="[Vài mẹo nhỏ với NCKD]">[Vài
                                                            mẹo nhỏ với
                                                            NCKD]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 7,
                                                        2021</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="penci-mega-row penci-mega-19 row-active">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/biblelicious/">Biblelicious</a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/51200291779_c8eda160ef_k.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/hoc-cach-cat-dua-thom-2-kieu-cuc-de/"
                                                       title="HỌC CÁCH CẮT DỨA (THƠM) 2 KIỂU CỰC DỄ">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/hoc-cach-cat-dua-thom-2-kieu-cuc-de/"
                                                           title="HỌC CÁCH CẮT DỨA (THƠM) 2 KIỂU CỰC DỄ">
                                                            HỌC CÁCH CẮT DỨA (THƠM) 2 KIỂU
                                                            CỰC&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 24,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/biblelicious/">Biblelicious</a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/Anh-1-e1620879773621.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/yeu-bep-don-gon-co-sach-x-kinh-nghiem-tu-admin-kinh-nghiem-don-dep-sap-xep-tu-do-kho-gon-sach-va-khoa-hoc/"
                                                       title="|Yêu Bếp: Dọn gọn – cọ sạch| x |Kinh nghiệm từ admin| KINH NGHIỆM DỌN DẸP, SẮP XẾP TỦ ĐỒ KHÔ GỌN, SẠCH VÀ KHOA HỌC">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/yeu-bep-don-gon-co-sach-x-kinh-nghiem-tu-admin-kinh-nghiem-don-dep-sap-xep-tu-do-kho-gon-sach-va-khoa-hoc/"
                                                           title="|Yêu Bếp: Dọn gọn – cọ sạch| x |Kinh nghiệm từ admin| KINH NGHIỆM DỌN DẸP, SẮP XẾP TỦ ĐỒ KHÔ GỌN, SẠCH VÀ KHOA HỌC">
                                                            |Yêu Bếp: Dọn gọn – cọ sạch| x&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 12,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/biblelicious/">Biblelicious</a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/182803659_4186667874710797_652232850306242177_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/meo-hay-yeu-bep-x-chuyen-tam-linh-trong-bep-cach-lam-vien-hanh-toi-ot-tien-dung-moi-lan-xao-nau-tiet-kiem-ca-dong-thoi-gian-nau-nuong/"
                                                       title="[MẸO HAY YÊU BẾP] x [CHUYỆN TÂM LINH TRONG BẾP] Cách làm &#8220;viên hành tỏi ớt&#8221; tiện dụng mỗi lần xào nấu, tiết kiệm cả đống thời gian nấu nướng!">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/meo-hay-yeu-bep-x-chuyen-tam-linh-trong-bep-cach-lam-vien-hanh-toi-ot-tien-dung-moi-lan-xao-nau-tiet-kiem-ca-dong-thoi-gian-nau-nuong/"
                                                           title="[MẸO HAY YÊU BẾP] x [CHUYỆN TÂM LINH TRONG BẾP] Cách làm &#8220;viên hành tỏi ớt&#8221; tiện dụng mỗi lần xào nấu, tiết kiệm cả đống thời gian nấu nướng!">
                                                            [MẸO HAY YÊU BẾP] x [CHUYỆN TÂM
                                                            LINH&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 9,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/biblelicious/">Biblelicious</a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/181483519_10158408026988531_4420611567847435591_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/vai-meo-nho-voi-nckd/"
                                                       title="[Vài mẹo nhỏ với NCKD]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/vai-meo-nho-voi-nckd/"
                                                           title="[Vài mẹo nhỏ với NCKD]">
                                                            [Vài mẹo nhỏ với NCKD]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 7,
                                                        2021</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
                <li
                        class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-940">
                    <a href="https://www.esheepkitchen.com/category/travel/">Travel<i
                            class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-5 mega-row-1">
                                        <div class="penci-mega-row penci-mega-106 row-active">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/travel/">
                                                                Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/159892207_10158275163273531_4146992086500668909_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/yeu-bep-goc-di-choi-tang-nhau-mot-ngay-trong-rong/"
                                                       title="[Yêu Bếp: Góc đi chơi] TẶNG NHAU MỘT NGÀY-TRỐNG-RỖNG">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/yeu-bep-goc-di-choi-tang-nhau-mot-ngay-trong-rong/"
                                                           title="[Yêu Bếp: Góc đi chơi] TẶNG NHAU MỘT NGÀY-TRỐNG-RỖNG">
                                                            [Yêu Bếp: Góc đi chơi] TẶNG NHAU
                                                            MỘT&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">March 13,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/travel/">
                                                                Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/03/117952152_3436659683044957_3070254024884009601_o.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/chill-out%f0%9f%8c%bf/"
                                                       title="Chill out🌿">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/chill-out%f0%9f%8c%bf/"
                                                           title="Chill out🌿">Chill
                                                            out🌿</a>
                                                    </h3>
                                                    <p class="penci-mega-date">August 18,
                                                        2020</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/travel/">
                                                                Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2019/10/48895982903_7f081f00fa_k.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/cach-tu-lam-banh-uot-long-ga/"
                                                       title="CÁCH TỰ LÀM BÁNH ƯỚT LÒNG GÀ SIÊU NGON">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/cach-tu-lam-banh-uot-long-ga/"
                                                           title="CÁCH TỰ LÀM BÁNH ƯỚT LÒNG GÀ SIÊU NGON">
                                                            CÁCH TỰ LÀM BÁNH ƯỚT LÒNG GÀ
                                                            SIÊU&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">October 18,
                                                        2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/travel/">
                                                                Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2019/10/6.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/24h-ho-hen-voi-mua-thu-ha-noi/"
                                                       title="24H HÒ HẸN VỚI MÙA THU HÀ NỘI">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/24h-ho-hen-voi-mua-thu-ha-noi/"
                                                           title="24H HÒ HẸN VỚI MÙA THU HÀ NỘI">
                                                            24H HÒ HẸN VỚI MÙA THU HÀ
                                                            NỘI</a>
                                                    </h3>
                                                    <p class="penci-mega-date">October 14,
                                                        2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/travel/">
                                                                Travel </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2019/08/israel.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/israel-culinary/"
                                                       title="Israel Culinary &#8211; XỨ SỞ DIỆU KỲ">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/israel-culinary/"
                                                           title="Israel Culinary &#8211; XỨ SỞ DIỆU KỲ">
                                                            Israel Culinary &#8211; XỨ SỞ
                                                            DIỆU KỲ</a>
                                                    </h3>
                                                    <p class="penci-mega-date">July 5,
                                                        2019</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
                <li
                        class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-2860">
                    <a href="https://www.esheepkitchen.com/category/goc-review/">Góc
                        Review<i
                                class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-5 mega-row-1">
                                        <div class="penci-mega-row penci-mega-129 row-active">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a
                                                                    href="https://www.esheepkitchen.com/category/goc-review/">
                                                                Góc Review </a>
                                                            <i class="fal fa-chevron-down"></i>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/08/51293429106_e35060dd48_k.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/cach-trang-trung-lua-cuc-de-meo-thuan-hoa-chao-chong-dinh-kem-luon-cach-lam-com-chien-ca-ri-boc-trung-ngon-nuc-no/"
                                                       title="CÁCH TRÁNG TRỨNG LỤA CỰC DỄ &#038; MẸO “THUẦN HÓA” CHẢO CHỐNG DÍNH /Kèm luôn cách làm cơm chiên cà ri bọc trứng ngon nức nở/">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/cach-trang-trung-lua-cuc-de-meo-thuan-hoa-chao-chong-dinh-kem-luon-cach-lam-com-chien-ca-ri-boc-trung-ngon-nuc-no/"
                                                           title="CÁCH TRÁNG TRỨNG LỤA CỰC DỄ &#038; MẸO “THUẦN HÓA” CHẢO CHỐNG DÍNH /Kèm luôn cách làm cơm chiên cà ri bọc trứng ngon nức nở/">
                                                            CÁCH TRÁNG TRỨNG LỤA CỰC DỄ
                                                            &#038; MẸO&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">July 7,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/goc-review/">
                                                                Góc Review
                                                            </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/178437315_10158387436163531_5990620767901999227_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="<c:url value='/#'/>"
                                                       title="[Góc review] ROBOT HÚT BỤI &#038; LAU NHÀ 20 CỦ CÓ THỰC SỰ THẦN THÁNH NHƯ LỜI ĐỒN? &#038; MẸO SỬ DỤNG ROBOT BỀN LÂU">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="<c:url value='/#'/>"
                                                           title="[Góc review] ROBOT HÚT BỤI &#038; LAU NHÀ 20 CỦ CÓ THỰC SỰ THẦN THÁNH NHƯ LỜI ĐỒN? &#038; MẸO SỬ DỤNG ROBOT BỀN LÂU">
                                                            [Góc review] ROBOT HÚT BỤI
                                                            &#038; LAU NHÀ&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">April 28,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/#'/>">
                                                                Góc Review
                                                            </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/51142169204_a8ea2a8ed5_b.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="<c:url value='/#'/>"
                                                       title="CÁCH LÀM CHÂN GIÒ HẦM HÀN QUỐC SIÊU BỔ DƯỠNG CỰC RẢNH TAY BẰNG NỒI ÁP SUẤT ĐA NĂNG">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="<c:url value='/#'/>"
                                                           title="CÁCH LÀM CHÂN GIÒ HẦM HÀN QUỐC SIÊU BỔ DƯỠNG CỰC RẢNH TAY BẰNG NỒI ÁP SUẤT ĐA NĂNG">
                                                            CÁCH LÀM CHÂN GIÒ HẦM HÀN QUỐC
                                                            SIÊU&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">April 13,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/#'/>">
                                                                Góc Review </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/my-lc-kk_51104342431_o.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="<c:url value='/#'/>"
                                                       title="[GÓC SỜ TẬN TAY]  &#8211; TẤT TẦN TẬT VỀ EM MÁY LỌC KHÔNG KHÍ THÔNG MINH CỦA NHÀ MÌNH">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="<c:url value='/#'/>"
                                                           title="[GÓC SỜ TẬN TAY]  &#8211; TẤT TẦN TẬT VỀ EM MÁY LỌC KHÔNG KHÍ THÔNG MINH CỦA NHÀ MÌNH">
                                                            [GÓC SỜ TẬN TAY] &#8211; TẤT TẦN
                                                            TẬT&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">February 20,
                                                        2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/#'/>">
                                                                Góc Review
                                                            </a>
                                                        </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/thumbnail-may-che-bien-tp-copy_51105453410_o-2.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="<c:url value='/#'/>"
                                                       title="[GÓC REVIEW &#8211; SỜ TẬN TAY] LÀM NEM 5 PHÚT VỚI MÁY CHẾ BIẾN THỰC PHẨM ĐA NĂNG &#8211; TIN ĐƯỢC KHÔNG? �">
                                                        <i class="fa fa-play"></i>
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="<c:url value='/#'/>"
                                                           title="[GÓC REVIEW &#8211; SỜ TẬN TAY] LÀM NEM 5 PHÚT VỚI MÁY CHẾ BIẾN THỰC PHẨM ĐA NĂNG &#8211; TIN ĐƯỢC KHÔNG? �">[GÓC
                                                            REVIEW &#8211; SỜ TẬN TAY] LÀM
                                                            NEM&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">February 4,
                                                        2021</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-52">
                    <a href="https://www.esheepkitchen.com/about-me/">Về Esheep Kitchen</a>
                </li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-52">
                    <a href="<c:url value='/login-google?action=logout'/>">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- navigation control -->
</header>