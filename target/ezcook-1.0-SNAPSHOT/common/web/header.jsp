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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script>
        document.addEventListener("touchstart", function(){}, true);
    </script>
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
                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-66 active">
                    <a href="<c:url value='/home'/>">Home</a>
                </li>
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-1209">
                    <a href="<c:url value="#"/>">Công Thức<i
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
                                </div>
                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-4 mega-row-1">
                                        <c:forEach var="foodType" items="${foodTypeList}" varStatus="status">
                                            <div class="penci-mega-row penci-mega-${foodType.id}">
                                                <c:forEach var="food"
                                                           items="${foods.getListByFoodTypeIDAndLimit(foodType.id,4)}"
                                                           varStatus="status">
                                                    <div class="penci-mega-post">
                                                        <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="<c:url value='/category?id=${foodType.id}'/>">${foodType.name}</a>
                                                        </span>
                                                            <a class="penci-image-holder"
                                                               style="background-image: url('${food.image}')"
                                                               href="<c:url value='/blog?id=${food.id}'/>"
                                                               title="${food.name}">
                                                            </a>
                                                        </div>
                                                        <div class="penci-mega-meta">
                                                            <h3 class="post-mega-title">
                                                                <a href="<c:url value='/blog?id=${food.id}'/>"
                                                                   title="${food.name}">${food.name}&#8230;</a>
                                                            </h3>
                                                            <p class="penci-mega-date"><c:out
                                                                    value='${cs.formatTime(food.createdOn)}'/></p>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-245">
                    <a href="https://www.esheepkitchen.com/category/inspiration/">Cảm hứng sống
                        <i class="fal fa-chevron-down"></i></a>
                    <ul class="sub-menu">
                        <li class="menu-item-0">
                            <div class="penci-megamenu">
                                <div class="penci-mega-child-categories">
                                    <a class="mega-cat-child"
                                       href="https://www.esheepkitchen.com/category/inspiration/goc-nho-esheep/"
                                       data-id="penci-mega-139"><span>Cảm hứng sống</span></a>
                                    <a class="mega-cat-child"
                                       href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/"
                                       data-id="penci-mega-17"><span>Ký ức Hà Nội</span></a>
                                    <a class="mega-cat-child"
                                       href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/"
                                       data-id="penci-mega-201"><span>Nhật kí xây mơ</span></a>
                                </div>

                                <div class="penci-content-megamenu">
                                    <div class="penci-mega-latest-posts col-mn-4 mega-row-1">
                                        <div class="penci-mega-row penci-mega-139 row-active">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/">
                                                                Cảm hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240620163_395383798623962_6691074099465274403_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ve-dep-cua-rau-cu/"
                                                       title="Vẻ đẹp của rau củ">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ve-dep-cua-rau-cu/"
                                                           title="Vẻ đẹp của rau củ">Vẻ đẹp của rau củ</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 7, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/">
                                                                Cảm hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/189533859_10158451207468531_4963756709241630047_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ghi-lai-mot-mua-sen/"
                                                       title="[Ghi lại một mùa sen]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ghi-lai-mot-mua-sen/"
                                                           title="[Ghi lại một mùa sen]">[Ghi lại một mùa sen]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 25, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/">
                                                                Cảm hứng sống</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240592596_10158698226213531_7156944578654639022_n.jpeg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/cong-bo-ket-qua-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi/"
                                                       title="CÔNG BỐ KẾT QUẢ THỬ THÁCH TUẦN “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI”">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/cong-bo-ket-qua-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi/"
                                                           title="CÔNG BỐ KẾT QUẢ THỬ THÁCH TUẦN “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI”">
                                                            CÔNG BỐ KẾT QUẢ THỬ THÁCH TUẦN “CUỘC&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 15, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/">
                                                                Cảm hứng sống</a> </span>
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
                                                            THÔNG BÁO SIÊU HOT✨🌿 Mời bạn tham&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">August 29, 2021</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="penci-mega-row penci-mega-17">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/">
                                                                Ký ức Hà Nội</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/08/z2662804551637_523767798e4a3811e43f1a29e09ff7c4.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ha-noi-di-an-sang/"
                                                       title="[Hà Nội đi ăn sáng]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ha-noi-di-an-sang/"
                                                           title="[Hà Nội đi ăn sáng]">[Hà Nội đi ăn sáng]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">August 4, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/">
                                                                Ký ức Hà Nội</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/189533859_10158451207468531_4963756709241630047_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ghi-lai-mot-mua-sen/"
                                                       title="[Ghi lại một mùa sen]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ghi-lai-mot-mua-sen/"
                                                           title="[Ghi lại một mùa sen]">[Ghi lại một mùa sen]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 25, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/">
                                                                Ký ức Hà Nội</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/05/186061311_4228730110504573_361081240528369684_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/dam-ba-thuc-qua-mua-he-ha-noi/"
                                                       title="[Dăm ba thức quà mùa hè Hà Nội]">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/dam-ba-thuc-qua-mua-he-ha-noi/"
                                                           title="[Dăm ba thức quà mùa hè Hà Nội]">
                                                            [Dăm ba thức quà mùa hè Hà Nội]</a>
                                                    </h3>
                                                    <p class="penci-mega-date">May 23, 2021</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/ky-uc-ha-noi/">Ký ức Hà Nội</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/04/158622995_4014891761888410_427431966533677550_n.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/ky-uc-ha-noi-x-thang-ba-hoa-gao-thu-lam-mon-nhuy-hoa-gao-xao-trong-truyen-thuyet/"
                                                       title="[Ký ức Hà Nội] x [Tháng Ba, hoa gạo]  THỬ LÀM MÓN &#8220;NHUỴ HOA GẠO XÀO&#8221; TRONG TRUYỀN THUYẾT">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/ky-uc-ha-noi-x-thang-ba-hoa-gao-thu-lam-mon-nhuy-hoa-gao-xao-trong-truyen-thuyet/"
                                                           title="[Ký ức Hà Nội] x [Tháng Ba, hoa gạo]  THỬ LÀM MÓN &#8220;NHUỴ HOA GẠO XÀO&#8221; TRONG TRUYỀN THUYẾT">
                                                            [Ký ức Hà Nội] x [Tháng Ba, hoa&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">March 12, 2021</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="penci-mega-row penci-mega-201">
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/">
                                                                Nhật kí xây mơ</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/09/50350387013_225b60accd_o.jpg?resize=477%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/bep-cua-nhung-ke-mong-mo/"
                                                       title="BẾP CỦA NHỮNG KẺ MỘNG MƠ">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/bep-cua-nhung-ke-mong-mo/"
                                                           title="BẾP CỦA NHỮNG KẺ MỘNG MƠ">BẾP CỦA NHỮNG KẺ MỘNG MƠ</a>
                                                    </h3>
                                                    <p class="penci-mega-date">September 16, 2020</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/">
                                                                Nhật kí xây mơ</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/01/phan-anh-1.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/qua-tang-giang-sinh/"
                                                       title="Quà tặng giáng sinh">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/qua-tang-giang-sinh/"
                                                           title="Quà tặng giáng sinh">Quà tặng giáng sinh</a>
                                                    </h3>
                                                    <p class="penci-mega-date">December 20, 2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/">
                                                                Nhậtkí xây mơ</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2020/01/phan-anh-2.jpg?resize=585%2C390&amp;ssl=1')"
                                                       href="https://www.esheepkitchen.com/giveaway-qua-hin-ru-hoi-san-sale/"
                                                       title="GIVEAWAY QUÀ HỊN &#038; RỦ HỘI SĂN SALE">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/giveaway-qua-hin-ru-hoi-san-sale/"
                                                           title="GIVEAWAY QUÀ HỊN &#038; RỦ HỘI SĂN SALE">
                                                            GIVEAWAY QUÀ HỊN &#038; RỦ HỘI SĂN SALE</a>
                                                    </h3>
                                                    <p class="penci-mega-date">December 5, 2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/inspiration/nhat-ki-xay-mo/">
                                                                Nhật kí xây mơ</a> </span>
                                                    <a class="penci-image-holder"
                                                       style="background-image: url('https://www.esheepkitchen.com/wp-content/themes/soledad/images/no-image.jpg')"
                                                       href="https://www.esheepkitchen.com/xin-chao-smeg/"
                                                       title="XIN CHÀO SMEG">
                                                    </a>
                                                </div>
                                                <div class="penci-mega-meta">
                                                    <h3 class="post-mega-title">
                                                        <a href="https://www.esheepkitchen.com/xin-chao-smeg/"
                                                           title="XIN CHÀO SMEG">XIN CHÀO SMEG</a>
                                                    </h3>
                                                    <p class="penci-mega-date">October 16, 2019</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-940">
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
                                                    <p class="penci-mega-date">March 13, 2021</p>
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
                                                           title="Chill out🌿">Chill out🌿</a>
                                                    </h3>
                                                    <p class="penci-mega-date">August 18, 2020</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/travel/">Travel </a>
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
                                                            CÁCH TỰ LÀM BÁNH ƯỚT LÒNG GÀ SIÊU&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">October 18, 2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/travel/">Travel </a>
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
                                                            24H HÒ HẸN VỚI MÙA THU HÀ NỘI</a>
                                                    </h3>
                                                    <p class="penci-mega-date">October 14, 2019</p>
                                                </div>
                                            </div>
                                            <div class="penci-mega-post">
                                                <div class="penci-mega-thumbnail">
                                                        <span class="mega-cat-name">
                                                            <a href="https://www.esheepkitchen.com/category/travel/">Travel </a>
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
                                                            Israel Culinary &#8211; XỨ SỞ DIỆU KỲ</a>
                                                    </h3>
                                                    <p class="penci-mega-date">July 5, 2019</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-taxonomy menu-item-object-category penci-mega-menu menu-item-2860">
                    <a href="https://www.esheepkitchen.com/category/goc-review/">Góc Review<i
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
                                                            <a href="https://www.esheepkitchen.com/category/goc-review/">
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
                                                            CÁCH TRÁNG TRỨNG LỤA CỰC DỄ&#038; MẸO&#8230;</a>
                                                    </h3>
                                                    <p class="penci-mega-date">July 7, 2021</p>
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
                                                            [Góc review] ROBOT HÚT BỤI&#038; LAU NHÀ&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">April 28, 2021</p>
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
                                                            CÁCH LÀM CHÂN GIÒ HẦM HÀN QUỐC SIÊU&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">April 13, 2021</p>
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
                                                            [GÓC SỜ TẬN TAY] &#8211; TẤT TẦN TẬT&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">February 20, 2021</p>
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
                                                           title="[GÓC REVIEW &#8211; SỜ TẬN TAY] LÀM NEM 5 PHÚT VỚI MÁY CHẾ BIẾN THỰC PHẨM ĐA NĂNG &#8211; TIN ĐƯỢC KHÔNG? �">
                                                            [GÓC REVIEW &#8211; SỜ TẬN TAY] LÀM NEM&#8230;
                                                        </a>
                                                    </h3>
                                                    <p class="penci-mega-date">February 4, 2021</p>
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
                    <a href="https://www.esheepkitchen.com/about-me/">About Ezcook</a>
                </li>

                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-54">
                    <form class="search-container" action="<c:url value="/search"/>" method="GET" style="padding-top: 10px">
                        <input id="search-box" type="text" class="search-box" name="key" value="${key}" placeholder="Tìm kiếm"  />
                        <label for="search-box"><span class="glyphicon glyphicon-search search-icon"></span></label>
                        <input type="submit" id="search-submit" />
                    </form>
                </li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-53">
                    <a href="<c:url value='/login'/>">Đăng nhập</a>
                </li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-53">
                    <a href="<c:url value='/login?action=logout'/>">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- navigation control -->
</header>