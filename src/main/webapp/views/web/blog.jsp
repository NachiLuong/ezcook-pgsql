<%@ page contentType="text/html;charset=UTF-8" language="Java" %>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <title>Blog</title>
    <link rel="stylesheet" type='text/css' href="<c:url value='/templates/web/blog/css/blog.css'/>">
    <link rel="stylesheet" type='text/css' href="<c:url value='/templates/web/blog/css/blog_responsive.css'/>">
</head>

<body>

<%-- begin main --%>
<div id="main" class="d-flex mx-auto">
    <%-- begin container --%>
    <div id="container">
        <header class="text-center">
            <div class="category">
                <a href="<c:url value='/#'/>">Bánh ngọt</a>
                <i class="fal fa-hat-chef"></i>
                <a href="<c:url value='/#'/>">Đồ uống</a>
            </div>
            <h1>[SQUID GAME] Trò chơi con mực</h1>
            <span>
                    written by
                    <a href="<c:url value='/#'/>">Ezcook</a>
                    | &nbsp;September 25, 2021
                </span>
        </header>
        <div class="content">
            <p>[SQUID GAME] Trò chơi con mực</p>
            <p>Thì ra cái trò làm kẹo & tách kẹo Dalgona này lại thú vị như vậy! Bảo sao nó siêu hot! Phim mình chưa
                xem nhưng kẹo thì mình biết làm. Hồi sang Hàn thi vòng chung kết thế giới của The Global Taste Of
                Korea; cũng có một vòng thi nhỏ tìm
                hiểu về các loại bánh kẹo dân gian của Hàn Quốc và mình cũng biết đến loại kẹo này!</p>
            <p>Nhưng đến bây giờ mới là lần đầu tiên mình làm thử, và tách thử với lời thách trị giá 10 tỉ VND! Ok
                fine! Cùng xem cách làm kẹo Dalgona bất bại và xem cái kết tách kẹo trị giá 10 tỉ của mình tại
                Tiktok Yêu Bếp ha! Ha ha</p>
            <p>Link đây xem liền:</p>
            <a href="<c:url value='/#'/>">https://facebook.com/</a>
            <img src="https://i0.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/242768151_407692067393135_5100537142423214304_n.jpeg?resize=1170%2C1170&ssl=1"
                 alt="">
            <img src="https://i2.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/242858485_407692080726467_3821887621109054611_n.jpeg?resize=1170%2C1170&ssl=1"
                 alt="">
            <img src="https://i1.wp.com/www.esheepkitchen.com/wp-content/uploads/2021/09/242903881_407692074059801_7330616119444446629_n.jpeg?resize=1170%2C1170&ssl=1"
                 alt="">
            <p>Video hướng dẫn:</p>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/ndih2mTqyEM"
                    title="YouTube video player"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen>
            </iframe>
            <p>Share this:</p>
            <div class="share">
                <a href="<c:url value='/#'/>"><i class="fab fa-facebook-f"></i></a>
                <a href="<c:url value='/#'/>"><i class="fab fa-instagram-square"></i></a>
                <a href="<c:url value='/#'/>"><i class="fab fa-twitter"></i></a>
                <a href="<c:url value='/#'/>"><i class="fab fa-tiktok"></i></a>
                <a href="<c:url value='/#'/>"><i class="fab fa-google-plus-g"></i></a>
            </div>
            <hr>
            <div id="comments">
                <h4 class="text-center">BÌNH LUẬN</h4>
                <div class="comment d-flex">
                    <img src="<c:url value='/templates/web/blog/imgs/user1.png'/>" alt="">
                    <div>
                        <h6>Đỗ Quốc Việt</h6>
                        <span>
                                <i class="fal fa-clock"></i>
                                October 20, 2021 - 10:04 PM
                            </span>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam quisquam, in earum
                                incidunt cum quos illo fugit architecto vitae, ipsa quibusdam aliquam eaque saepe at
                                deleniti, amet repudiandae corrupti expedita!</p>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam obcaecati, eos pariatur
                                nihil natus facere porro. Perspiciatis neque, fugit reiciendis autem est molestias,
                                tenetur inventore sed iusto aperiam possimus! Animi.</p>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="comment d-flex">
                    <img src="<c:url value='/templates/web/blog/imgs/user2.png'/>" alt="">
                    <div>
                        <h6>John Smith</h6>
                        <span>
                                <i class="fal fa-clock"></i>
                                October 20, 2021 - 10:04 PM
                            </span>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam quisquam, in earum
                                incidunt cum quos illo fugit architecto vitae, ipsa quibusdam aliquam eaque saepe at
                                deleniti, amet repudiandae corrupti expedita!</p>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="comment d-flex">
                    <img src="<c:url value='/templates/web/blog/imgs/user3.png'/>" alt="">
                    <div>
                        <h6>Phan Thị Trà Vy</h6>
                        <span>
                                <i class="fal fa-clock"></i>
                                October 20, 2021 - 10:04 PM
                            </span>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam quisquam, in earum
                                incidunt cum quos illo fugit architecto vitae, ipsa quibusdam aliquam eaque saepe at
                                deleniti, amet repudiandae corrupti expedita!</p>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="comment d-flex">
                    <img src="<c:url value='/templates/web/blog/imgs/user1.png'/>" alt="">
                    <div>
                        <h6>Đỗ Quốc Việt</h6>
                        <span>
                                <i class="fal fa-clock"></i>
                                October 20, 2021 - 10:04 PM
                            </span>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam quisquam, in earum
                                incidunt cum quos illo fugit architecto vitae, ipsa quibusdam aliquam eaque saepe at
                                deleniti, amet repudiandae corrupti expedita!</p>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam obcaecati, eos pariatur
                                nihil natus facere porro. Perspiciatis neque, fugit reiciendis autem est molestias,
                                tenetur inventore sed iusto aperiam possimus! Animi.</p>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="comment d-flex">
                    <img src="<c:url value='/templates/web/blog/imgs/user2.png'/>" alt="">
                    <div>
                        <h6>John Smith</h6>
                        <span>
                                <i class="fal fa-clock"></i>
                                October 20, 2021 - 10:04 PM
                            </span>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam quisquam, in earum
                                incidunt cum quos illo fugit architecto vitae, ipsa quibusdam aliquam eaque saepe at
                                deleniti, amet repudiandae corrupti expedita!</p>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="comment d-flex">
                    <img src="<c:url value='/templates/web/blog/imgs/user3.png'/>" alt="">
                    <div>
                        <h6>Phan Thị Trà Vy</h6>
                        <span>
                                <i class="fal fa-clock"></i>
                                October 20, 2021 - 10:04 PM
                            </span>
                        <div class="content">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam quisquam, in earum
                                incidunt cum quos illo fugit architecto vitae, ipsa quibusdam aliquam eaque saepe at
                                deleniti, amet repudiandae corrupti expedita!</p>
                        </div>
                    </div>
                </div>
            </div>

            <%-- add comment --%>
            <div id="add-comment">
                <h4 class="text-center">ĐỂ LẠI BÌNH LUẬN</h4>
                <form class="text-center">
                    <label for="">
                    </label>
                    <textarea class="w-100" name="content" id="" rows="5" placeholder="Bình luận của bạn">
                    </textarea>
                    <input type="submit" value="GỬI BÌNH LUẬN" class="rounded">
                </form>
            </div>
            <%-- add comment --%>

            <%-- Related Posts --%>

            <hr>
            <div id="related-posts" class="text-center">
                <h4 class="text-center">BÀI VIẾT LIÊN QUAN</h4>
                <div>
                    <a href="<c:url value='/#'/>" class="text-center">
                        <img src="<c:url value='https://s1.img.yan.vn//YanNews/2167221/201406/20140616-0358-kitty-4.jpg'/>"
                             alt="">
                        <h6>CÁCH LÀM BIZCOCHO DE LIMON BÁNH TRUYỀN THỐNG TÂY...</h6>
                        <span>January 3, 2019</span>
                    </a>
                    <a href="<c:url value='/#'/>" class="text-center">
                        <img src="<c:url value='https://s1.img.yan.vn//YanNews/2167221/201406/20140616-0358-kitty-4.jpg'/>"
                             alt="">
                        <h6>CÁCH LÀM BIZCOCHO DE LIMON BÁNH TRUYỀN THỐNG TÂY...</h6>
                        <span>January 3, 2019</span>
                    </a>
                    <a href="<c:url value='/#'/>" class="text-center">
                        <img src="<c:url value='https://s1.img.yan.vn//YanNews/2167221/201406/20140616-0358-kitty-4.jpg'/>"
                             alt="">
                        <h6>CÁCH LÀM BIZCOCHO DE LIMON BÁNH TRUYỀN THỐNG TÂY...</h6>
                        <span>January 3, 2019</span>
                    </a>
                </div>
            </div>
            <%-- Related Posts --%>
        </div>
    </div>
    <%-- end container --%>

    <%-- begin author --%>
    <div id="author" class="text-center">
        <div class="sticky-author">
            <h4>AUTHOR</h4>
            <img class="rounded-circle w-70"
                 src="http://www.esheepkitchen.com/wp-content/uploads/2018/04/about-me.jpg" alt="author">
            <p>Căn Bếp nhà Esheep. Góc nhỏ mày mò chia sẻ công thức nấu ăn, làm bánh, review đồ bếp. Chia sẻ tình
                yêu gia đình, bếp, vườn, chụp ảnh, du lịch...</p>
            <h4>LIÊN HỆ VỚI TÔI</h4>
            <div class="social">
                <a href="<c:url value='/#'/>"><i class="fab fa-facebook-f"></i></a>
                <a href="<c:url value='/#'/>"><i class="fab fa-instagram-square"></i></a>
                <a href="<c:url value='/#'/>"><i class="fab fa-twitter"></i></a>
                <a href="<c:url value='/#'/>"><i class="fab fa-tiktok"></i></a>
                <a href="<c:url value='/#'/>"><i class="fab fa-youtube"></i></a>
                <a href="<c:url value='/#'/>"><i class="far fa-envelope"></i></a>
            </div>
        </div>
    </div>
    <%-- end author --%>
</div>
<%-- end main --%>

<script type="text/javascript" src="<c:url value='/templates/web/blog/js/blog.js'/>"></script>
</body>
</html>
