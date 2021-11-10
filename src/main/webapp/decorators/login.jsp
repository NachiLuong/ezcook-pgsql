<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title><dec:title default="Login page"></dec:title> </title>
    <script src="https://fonts.googleapis.com/css?family=Montserrat:400,800"></script>
    <link rel="stylesheet" href="<c:url value='/templates/login/style.css' />" />
    <dec:head/>
</head>
<body>
    <%@ include file="/common/login/header.jsp" %>
     <dec:body/>

<script type='text/javascript' src="<c:url value='/templates/login/query.js'/>"></script>
</body>
</html>
