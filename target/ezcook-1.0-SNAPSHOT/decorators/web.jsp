<%@ page contentType="text/html;charset=UTF-8" language="Java" %>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><dec:title default='Home &#8211; Esheep Kitchen'/></title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/common/vendor/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/common/font/awesome/css/all.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/common/css/penci.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/common/css/base.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/common/common.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/header/header.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/web/header/css/header_responsive.css'/>">
    <script type='text/javascript'
            src="<c:url value='/templates/web/common/js/common.js'/>">
    </script>
    <dec:head/>
</head>

<body>

<%-- Begin: header --%>
<%@ include file="/common/web/header.jsp" %>
<%-- End: header --%>

<%-- Begin: contrainer --%>
<dec:body/>
<%-- End: contrainer --%>

<%-- Begin: footer --%>
<%@ include file="/common/web/footer.jsp" %>
<%-- End: footer --%>

<script type='text/javascript'
        src="<c:url value='/templates/common/vendor/jquery/jquery.min.js'/>">
</script>
<script type='text/javascript'
        src="<c:url value='/templates/common/vendor/bootstrap/js/bootstrap.min.js'/>">
</script>
<script type='text/javascript'
        src="<c:url value='https://www.esheepkitchen.com/wp-includes/js/jquery/jquery.min.js?ver=3.6.0'/>"
        id='jquery-core-js'>
</script>
<script type='text/javascript'
        src="<c:url value='https://www.esheepkitchen.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.3.2'/>"
        id='jquery-migrate-js'>
</script>
<script type='text/javascript'
        src="<c:url value='https://www.esheepkitchen.com/wp-content/plugins/penci-review/js/review.js?ver=1.0'/>"
        id='jquery-penci-review-js'>
</script>
<script type='text/javascript'
        src="<c:url value='https://www.esheepkitchen.com/wp-content/themes/soledad/js/libs-script.min.js?ver=5.1'/>"
        id='penci-libs-js-js'>
</script>
<script type='text/javascript'
        src="<c:url value='https://www.esheepkitchen.com/wp-content/themes/soledad/js/main.js?ver=5.1'/>"
        id='main-scripts-js'>
</script>
<script type='text/javascript'
        src="<c:url value='/templates/web/header/js/header.js'/>">
</script>
</body>

</html>
