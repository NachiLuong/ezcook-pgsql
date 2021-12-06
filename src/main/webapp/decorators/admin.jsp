<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Admin</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script type='text/javascript' src="<c:url value='/templates/admin/js/jquery.2.1.1.min.js'/>"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/common/vendor/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/templates/admin/css/style.css' />"/>

    <dec:head/>
</head>
<body>
<div class="wrapper d-flex align-items-stretch">
    <%@ include file="/common/admin/menu.jsp" %>
    <div id="content" class="p-4 p-md-5">
        <%@ include file="/common/admin/header.jsp" %>
        <dec:body/>
    </div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type='text/javascript' src="<c:url value='/templates/admin/js/bootstrap.min.js'/>"></script>
<script type='text/javascript' src="<c:url value='/templates/admin/js/popper.js'/>"></script>
<script type='text/javascript' src="<c:url value='/templates/admin/js/jquery.min.js'/>"></script>
<script type='text/javascript' src="<c:url value='/templates/admin/js/main.js'/>"></script>
<script type='text/javascript' src="<c:url value='/templates/admin/js/jquery.validate.min.js'/>"></script>
<script type='text/javascript' src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
</body>
</html>