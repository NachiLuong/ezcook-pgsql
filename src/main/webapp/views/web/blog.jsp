<%@ page contentType="text/html;charset=UTF-8" language="Java" %>
<%@ include file="/common/taglib.jsp" %>

<jsp:useBean id="food" scope="request" type="com.ezcook.entities.Food"/>
<jsp:useBean id="fService" scope="request" type="com.ezcook.services.IFoodService"/>
<jsp:useBean id="cservice" scope="request" type="com.ezcook.services.ICommonService"/>
<%--<jsp:useBean id="user" scope="session" type="com.ezcook.entities.User"/>--%>
<%--@elvariable id="user" type="com.ezcook.entities.User"--%>
<!DOCTYPE html>
<html lang="en-US">

<head>
    <title><c:out value='${food.name}'/></title>
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
                <a href="<c:url value='/#'/>">Công thức</a>
                <i class="fal fa-hat-chef"></i>
                <a href="<c:url value='/#'/>"><c:out value='${food.foodtype.name}'/></a>
            </div>
            <h1><c:out value='${food.name}'/></h1>
            <span>
                    written by
                    <a href="<c:url value='/#'/>">Ezcook</a>
                    | &nbsp; <c:out value='${cservice.formatTime(food.modifiedOn)}'/>
            </span>
        </header>
        <div class="content">
            <c:if test='${food.content != null}'>
                <c:out value='${food.content}' escapeXml="false"/>
            </c:if>
            <c:if test='${food.video != null && food.video != ""}'>
                <p>Video hướng dẫn:</p>
                <c:out value='${food.video}' escapeXml="false"/>
            </c:if>
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
                <div id="render-comments">
                    <c:if test='${food.comments.size() != 0}'>
                        <c:forEach var='comment' items='${food.comments}'>
                            <div class="comment d-flex">
                                <img src="<c:url value='${fService.randomImg()}'/>" alt="avatar">
                                <div>
                                    <h6><c:out value='${comment.user.name}'/></h6>
                                    <span>
                                    <i class="fal fa-clock"></i>
                                    <c:out value='${cservice.formatTime(comment.time)}'/>
                                </span>
                                    <div class="content">
                                        <p><c:out value='${comment.content}'/></p>
                                    </div>
                                </div>
                            </div>
                            <hr>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

            <%-- add comment --%>
            <div id="add-comment">
                <h4 class="text-center">ĐỂ LẠI BÌNH LUẬN</h4>
                <form class="text-center">
                    <label class="w-100 d-block">
                        <textarea class="w-100 fw-600" name="content" id="content-submit-comment" rows="5"
                                  placeholder="Bình luận của bạn"></textarea>
                    </label>
                    <label>
                        <input id="submit-comment" type="text" value="ĐỂ LẠI BÌNH LUẬN"
                               class="rounded text-center cursor-p"/>
                    </label>
                </form>
            </div>
            <%-- add comment --%>

            <%-- Related Posts --%>

            <hr>
            <c:if test='${fService.getRelatedFood(food).size() == 0 ? false : true}'>
                <div id="related-posts" class="text-center">
                    <h4 class="text-center">BÀI VIẾT LIÊN QUAN</h4>
                    <div>
                        <c:forEach var='item' items='${fService.getRelatedFood(food)}'>
                            <a href="<c:url value='/blog?id=${item.id}'/>" class="text-center">
                                <img src="<c:url value='${item.image}'/>" alt="">
                                <h6><c:out value='${item.name}'/></h6>
                                <span><c:out value='${cservice.formatTime(item.modifiedOn)}'/></span>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <%-- Related Posts --%>
        </div>
    </div>
    <%-- end container --%>

    <%-- begin author --%>
    <div id="author" class="text-center">
        <div class="sticky-author">
            <h4>AUTHOR</h4>
            <img class="rounded-circle w-70"
                 src="https://github.com/NachiLuong/ezcook-pgsql/blob/trung-admin/src/main/webapp/templates/admin/images/logo.jpg?raw=true" alt="author">
            <p>Căn Bếp nhà Ezcook. Góc nhỏ mày mò chia sẻ công thức nấu ăn, làm bánh, review đồ bếp. Chia sẻ tình
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

<script type="text/javascript" src="<c:url value='/templates/web/blog/blog.js'/>"></script>
<script>

    const urlAPI = {
        Comment: 'http://localhost:8080/api-comment'
    }

    const submitComment = function () {
        let btnSubmit = $('#submit-comment');
        let textArea = $('#content-submit-comment');
        btnSubmit.onclick = function () {
            let content = textArea.value;
            if (content) {

                // send api add comment
                callAPI(urlAPI.Comment, {
                    method: 'POST',
                    body: JSON.stringify({
                        content: content,
                        idFood: ${food.id}
                    })
                }).then((isSuccess) => {
                    if (!isSuccess) {
                        return false;
                    }
                });

                // render page
                let commentRender = $('#render-comments');
                commentRender.innerHTML = `
                        <div class="comment d-flex">
                            <img src="<c:url value='${fService.randomImg()}'/>" alt="avatar">
                            <div>
                                <h6>
                                <c:out value='${user.name}'/></h6>
                                <span>
                                    <i class="fal fa-clock"></i>
                                    <c:out value='Hôm nay'/>
                                </span>
                                <div class="content">
                                    <p>` + content + `</p>
                                </div>
                            </div>
                        </div>
                        <hr>
                ` + commentRender.innerHTML;

                // reset input
                textArea.value = '';
            }
        }
    }

    const callAPI = function (url, options) {
        return fetch(url, options)
            .then((resp) => {
                console.log(resp);
                return resp.json();
            })
            .then((valueOfResponse) => {
                console.log(valueOfResponse);
                return valueOfResponse;
            })
        // .catch((err) => {
        //     window.alert(err);
        // })
    }

    submitComment();

</script>
</body>
</html>
