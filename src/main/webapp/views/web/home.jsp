<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="Java" %>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="cs" class="com.ezcook.services.impls.FoodService" scope="request"
             type="com.ezcook.services.IFoodService"/>
<jsp:useBean id="food" class="com.ezcook.entities.Food" scope="request" type="com.ezcook.entities.Food"/>
<jsp:useBean id="foods" class="com.ezcook.daos.impls.FoodDao" type="com.ezcook.daos.impls.FoodDao"
             scope="application"></jsp:useBean>
<!DOCTYPE html>
<html lang="en-US">

<head>
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/home/home.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/home/home_responsive.css'/>">
    <script>
        function getTextBetweenTags(string) {
            var str = "<p>hh</p> <a href='hhshhs'/>";
            var result = str.match(/<p>(.*?)<\/p>/g).map(function (val) {
                console.log(val.replace(/<\/?p>/g, ''));
                return val.replace(/<\/?p>/g, '');
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
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-1">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/242768151_407692067393135_5100537142423214304_n.jpeg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/squid-game-tro-choi-con-muc/"
                           title="[SQUID GAME] Trò chơi con mực"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link"
                               href="https://www.esheepkitchen.com/squid-game-tro-choi-con-muc/"></a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3><a title="[SQUID GAME] Trò chơi con mực"
                                           href="https://www.esheepkitchen.com/squid-game-tro-choi-con-muc/">
                                        [SQUID GAME] Trò chơi con mực</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">September 25, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-2">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/242296130_407064584122550_6841722089028900184_n.jpeg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/cach-lam-rose-roll-cake-banh-cuon-kem-phomai-bang-chao/"
                           title="CÁCH LÀM “ROSÉ ROLL CAKE” – BÁNH CUỘN KEM PHOMAI BẰNG… CHẢO"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link"
                               href="https://www.esheepkitchen.com/cach-lam-rose-roll-cake-banh-cuon-kem-phomai-bang-chao/"></a>
                            <a href="https://www.esheepkitchen.com/cach-lam-rose-roll-cake-banh-cuon-kem-phomai-bang-chao/"
                               class="overlay-icon-format lager-size-icon">
                                <i class="fa fa-play"></i>
                            </a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3><a title="CÁCH LÀM “ROSÉ ROLL CAKE” – BÁNH CUỘN KEM PHOMAI BẰNG… CHẢO"
                                           href="https://www.esheepkitchen.com/cach-lam-rose-roll-cake-banh-cuon-kem-phomai-bang-chao/">CÁCH
                                        LÀM “ROSÉ ROLL CAKE” – BÁNH CUỘN KEM PHOMAI BẰNG… CHẢO</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">September 24, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-0">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/241443067_402732721222403_8263454304472512944_n.jpeg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/tat-tat-tu-a-z-cach-tu-lam-gia-luoi-ai-cung-lam-duoc-khong-so-me-mang/"
                           title="TẤT TẬT TỪ A-Z CÁCH TỰ LÀM GIÁ LƯỜI, AI CŨNG LÀM ĐƯỢC KHÔNG SỢ MẸ MẮNG"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link"
                               href="https://www.esheepkitchen.com/tat-tat-tu-a-z-cach-tu-lam-gia-luoi-ai-cung-lam-duoc-khong-so-me-mang/"></a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3>
                                        <a title="TẤT TẬT TỪ A-Z CÁCH TỰ LÀM GIÁ LƯỜI, AI CŨNG LÀM ĐƯỢC KHÔNG SỢ MẸ MẮNG"
                                           href="https://www.esheepkitchen.com/tat-tat-tu-a-z-cach-tu-lam-gia-luoi-ai-cung-lam-duoc-khong-so-me-mang/">TẤT
                                            TẬT TỪ A-Z CÁCH TỰ LÀM GIÁ LƯỜI, AI CŨNG LÀM...</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">September 18, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-1">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240592596_10158698226213531_7156944578654639022_n.jpeg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/cong-bo-ket-qua-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi/"
                           title="CÔNG BỐ KẾT QUẢ THỬ THÁCH TUẦN “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI”"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link"
                               href="https://www.esheepkitchen.com/cong-bo-ket-qua-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi/"></a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3>
                                        <a title="CÔNG BỐ KẾT QUẢ THỬ THÁCH TUẦN “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI”"
                                           href="https://www.esheepkitchen.com/cong-bo-ket-qua-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi/">CÔNG
                                            BỐ KẾT QUẢ THỬ THÁCH TUẦN “CUỘC PHIÊU LƯU 80 NGÀY...</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">September 15, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-2">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240705233_398022765026732_813286415368641027_n.jpeg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/yeu-bep-feedback-thit-kho-trong-trang-kho-trung-ca-vo/"
                           title="[Yêu Bếp feedback] THỊT KHO &#8220;TRONG TRẮNG&#8221; &#038; KHO TRỨNG CẢ VỎ"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link"
                               href="https://www.esheepkitchen.com/yeu-bep-feedback-thit-kho-trong-trang-kho-trung-ca-vo/"></a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3>
                                        <a title="[Yêu Bếp feedback] THỊT KHO &#8220;TRONG TRẮNG&#8221; &#038; KHO TRỨNG CẢ VỎ"
                                           href="https://www.esheepkitchen.com/yeu-bep-feedback-thit-kho-trong-trang-kho-trung-ca-vo/">[Yêu
                                            Bếp feedback] THỊT KHO &#8220;TRONG TRẮNG&#8221; &#038; KHO TRỨNG CẢ
                                            VỎ</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">September 11, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-0">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240620163_395383798623962_6691074099465274403_n.jpeg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/ve-dep-cua-rau-cu/" title="Vẻ đẹp của rau củ"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link" href="https://www.esheepkitchen.com/ve-dep-cua-rau-cu/"></a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3><a title="Vẻ đẹp của rau củ"
                                           href="https://www.esheepkitchen.com/ve-dep-cua-rau-cu/">Vẻ đẹp của rau
                                        củ</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">September 7, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-1">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240533572_10158676818998531_8316501353332400521_n.jpeg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/top-10-thu-vi-yeu-bep-bang-xep-hang-top-10-cay-but-than-yeu-bep-thang-8/"
                           title="[TOP 10 THÚ VỊ YÊU BẾP] &#8220;BẢNG XẾP HẠNG&#8221; TOP 10 CÂY BÚT THẦN YÊU BẾP THÁNG 8"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link"
                               href="https://www.esheepkitchen.com/top-10-thu-vi-yeu-bep-bang-xep-hang-top-10-cay-but-than-yeu-bep-thang-8/"></a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3>
                                        <a title="[TOP 10 THÚ VỊ YÊU BẾP] &#8220;BẢNG XẾP HẠNG&#8221; TOP 10 CÂY BÚT THẦN YÊU BẾP THÁNG 8"
                                           href="https://www.esheepkitchen.com/top-10-thu-vi-yeu-bep-bang-xep-hang-top-10-cay-but-than-yeu-bep-thang-8/">[TOP
                                            10 THÚ VỊ YÊU BẾP] &#8220;BẢNG XẾP HẠNG&#8221; TOP 10 CÂY...</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">September 4, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-2">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240998779_393022565526752_8772231243327937768_n.jpeg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/cach-lam-cha-ca-ha-noi-cha-ca-la-vong-bang-noi-chien-khong-dau/"
                           title="CÁCH LÀM CHẢ CÁ HÀ NỘI – CHẢ CÁ LÃ VỌNG BẰNG NỒI CHIÊN KHÔNG DẦU"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link"
                               href="https://www.esheepkitchen.com/cach-lam-cha-ca-ha-noi-cha-ca-la-vong-bang-noi-chien-khong-dau/"></a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3><a title="CÁCH LÀM CHẢ CÁ HÀ NỘI – CHẢ CÁ LÃ VỌNG BẰNG NỒI CHIÊN KHÔNG DẦU"
                                           href="https://www.esheepkitchen.com/cach-lam-cha-ca-ha-noi-cha-ca-la-vong-bang-noi-chien-khong-dau/">CÁCH
                                        LÀM CHẢ CÁ HÀ NỘI – CHẢ CÁ LÃ VỌNG BẰNG...</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">September 3, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-0">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/240592549_10158665120308531_1151239136467453639_n.jpeg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/%f0%9f%8d%91-thong-bao-sieu-hot%e2%9c%a8%f0%9f%8c%bf-moi-ban-tham-gia-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi-va-kham-pha-kho-bau-giai-thuong-do-bep/"
                           title="🍑 THÔNG BÁO SIÊU HOT✨🌿 Mời bạn tham gia Thử thách tuần “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI” và khám phá “kho báu giải thưởng đồ bếp”"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link"
                               href="https://www.esheepkitchen.com/%f0%9f%8d%91-thong-bao-sieu-hot%e2%9c%a8%f0%9f%8c%bf-moi-ban-tham-gia-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi-va-kham-pha-kho-bau-giai-thuong-do-bep/"></a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3>
                                        <a title="🍑 THÔNG BÁO SIÊU HOT✨🌿 Mời bạn tham gia Thử thách tuần “CUỘC PHIÊU LƯU 80 NGÀY ĂN KHẮP THẾ GIỚI” và khám phá “kho báu giải thưởng đồ bếp”"
                                           href="https://www.esheepkitchen.com/%f0%9f%8d%91-thong-bao-sieu-hot%e2%9c%a8%f0%9f%8c%bf-moi-ban-tham-gia-thu-thach-tuan-cuoc-phieu-luu-80-ngay-an-khap-the-gioi-va-kham-pha-kho-bau-giai-thuong-do-bep/">🍑
                                            THÔNG BÁO SIÊU HOT✨🌿 Mời bạn tham gia Thử thách tuần...</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">August 29, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item text-center">
                <div class="wrapper-item wrapper-item-classess">
                    <div class="penci-item-mag penci-item-1">
                        <a class="penci-image-holder"
                           style="background-image: url('https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/08/51400891257_5c2f379d66_k.jpg?resize=585%2C585&amp;ssl=1');"
                           href="https://www.esheepkitchen.com/kham-pha-sach-80-ngay-an-khap-the-gioi-cach-lam-lassi-sua-chua-lac-kieu-an/"
                           title="[Khám phá sách 80 Ngày Ăn Khắp Thế Giới] &#8211; CÁCH LÀM LASSI &#8220;SỮA CHUA LẮC KIỂU ẤN&#8221;"></a>
                        <div class="penci-slide-overlay penci-slider7-overlay">
                            <a class="overlay-link"
                               href="https://www.esheepkitchen.com/kham-pha-sach-80-ngay-an-khap-the-gioi-cach-lam-lassi-sua-chua-lac-kieu-an/"></a>
                            <div class="penci-mag-featured-content">
                                <div class="feat-text">
                                    <h3>
                                        <a title="[Khám phá sách 80 Ngày Ăn Khắp Thế Giới] &#8211; CÁCH LÀM LASSI &#8220;SỮA CHUA LẮC KIỂU ẤN&#8221;"
                                           href="https://www.esheepkitchen.com/kham-pha-sach-80-ngay-an-khap-the-gioi-cach-lam-lassi-sua-chua-lac-kieu-an/">[Khám
                                            phá sách 80 Ngày Ăn Khắp Thế Giới] &#8211; CÁCH LÀM...</a></h3>
                                    <div class="feat-meta">
                                        <span class="feat-time">August 25, 2021</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- content -->
    <div id="content" class="mx-auto">
        <div class="session">
            <h4>BÀI ĐĂNG MỚI NHẤT</h4>
            <div class="food-content" >
                <c:forEach var='food' items="${foods.findAll()}" varStatus="status">
                    <div class="item text-center" style="padding-left: 10px;padding-right: 10px">
                        <a href="<c:url value='/#'/>">
                            <img src="<c:url value='${food.image}'/>" alt="${food.nameFood}"/></a>
                        <div>
                            <span>Ezook <i class="fal fa-utensils-alt"></i> Đồ uống</span>
                            <a href="<c:url value='/#'/>">
                                <h5><c:out value='${food.nameFood}'/></h5>
                            </a>
                            <span class="author">by <a href="<c:url value='/#'/>">Ezcook</a></span>
                            <p id="demo"></p>

                            <hr>
                            <p><c:out value='${cs.getTextBetweenTags("p", food.contentFood)}'/></p>
                            <a href="<c:url value='/#'/>">Xem tiếp...</a>
                            <div class="social-icon">
                                <a href="<c:url value='/#'/>"><i class="fab fa-facebook-f"></i></a>
                                <a href="<c:url value='/#'/>"><i class="fab fa-google-plus-g"></i></a>
                                <a href="<c:url value='/#'/>"><i class="fab fa-twitter"></i></a>
                                <a href="<c:url value='/#'/>"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <p class="text-center"><a href="<c:url value='/#'/>" class="rounded">xem tiếp</a></p>
        <hr>

    </div>
    <!-- content -->
</div>
<!-- Container -->
</body>

</html>
