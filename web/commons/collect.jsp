<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 87608
  Date: 2020/12/4
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/banner.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/collect.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/footer.css" type="text/css" />
    <title>虫二书屋-收藏</title>
</head>
<body>

<%@ include file="/commons/public/banner.jsp"%>

<div id="nav">
    <p style="font-size: 24px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的收藏</p>
</div>

<table id="ranking">
    <tr>
        <th witdh="10%">书籍 </th>
        <th witdh="10%">书名 </th>
        <th witdh="10%">作者 </th>
        <th witdh="15%">价格 </th>
    </tr>

    <c:forEach items="${requestScope.favoritesBook}" var="favoritesBook">
        <tr>
            <th witdh="10%"><a href=""><img src="${pageContext.request.contextPath}/${favoritesBook.url}"></a> </th>
            <th witdh="15%"><a href=""> ${favoritesBook.bookName} </a></th>
            <th witdh="10%"><a href=""> ${favoritesBook.writer} </a></th>
            <th witdh="15%">${favoritesBook.price} </th>
        </tr>
    </c:forEach>

</table>

<div id="page">
</div>

<%@ include file="/commons/public/footer.jsp"%>

</body>
</html>