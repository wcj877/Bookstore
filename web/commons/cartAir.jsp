<%--
  Created by IntelliJ IDEA.
  User: 87608
  Date: 2020/12/7
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="/commons/public/banner.jsp"%>
<div class="container">
    <div class="jumbotron" style="margin-top:30px;">

        <p>购物车空空如也~</p>
        <p><a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/commons/index.jsp" role="button">返回</a></p>
    </div>
</div>
<%@ include file="/commons/public/footer.jsp"%>
</body>
</html>
