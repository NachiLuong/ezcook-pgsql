<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <link rel="stylesheet" href="<c:url value='/templates/web/css/myweb.css' />" />
    <link rel="stylesheet" href="<c:url value='/templates/web/css/bootstrap-theme.min.css' />" />
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Title</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Link</a></li>
                            <li><a href="#">Link</a></li>
                        </ul>
                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search">
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#">Link</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="carousel-id" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-id" data-slide-to="0" class=""></li>
                    <li data-target="#carousel-id" data-slide-to="1" class=""></li>
                    <li data-target="#carousel-id" data-slide-to="2" class="active"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item">
                        <img alt="First slide" src="images/1.jfif" width="500px" height="100px">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>Example headline.</h1>
                                <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img alt="Second slide" src="images/2.jfif" width="500px" height="100px">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>Another example headline.</h1>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="item active">
                        <img alt="Third slide" src="images/3.jfif" width="500px" height="100px">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>One more for good measure.</h1>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon alyphicon-chevron-left"></span></a>
                <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-2">
            <img src="images/item1.jfif" alt="" class="thumbnail" width="100%"></img>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-2">
            <img src="images/item2.jfif" alt="" class="thumbnail" width="100%"></img>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-2">
            <img src="images/item3.jfif" alt="" class="thumbnail" width="100%"></img>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-2">
            <img src="images/item4.jfif" alt="" class="thumbnail" width="100%"></img>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-2">
            <img src="images/item5.jfif" alt="" class="thumbnail" width="100%"></img>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-2">
            <img src="images/item6.jfif" alt="" class="thumbnail" width="100%"></img>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <footer class="clearfix">
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <h4>ABOUT EZCOOK</h4>
                    <p>
                        Welcome to our Cooking Website. We’ve got loads of ideas to keep you entertained, including recipes and top tips to share.
                    </p>
                    <p>
                        Whether you’re just starting out, looking for some food inspiration or are an experienced chef, please do join us and get involved.
                    </p>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <h4>WHAT'S INVOLVED</h4>
                    <p>
                        Share your favourite recipes and inspiration with others
                    </p>
                    <p>
                        Exchange tips and advice with fellow cooking and baking enthusiasts
                    </p>
                    <p>
                        Have a go at our foodie quizzes and take part in our themed giveaways
                    </p>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <h4>CONTACT US</h4>
                    <h3>Hotline: 09090909</h3>
                    <p>Email: group3@gmail.com</p>
                    <ul>
                        <li><a href="#"><img src="images/facebook.png" height="30px" width="30px"></a></li>
                        <li><a href="#"><img src="images/twitter.png" height="30px" width="30px"></a></li>
                        <li><a href="#"><img src="images/instagram.png" height="30px" width="30px"></a></li>

                    </ul>
                </div>
            </footer>
        </div>
    </div>
</div>
</body>
</html>