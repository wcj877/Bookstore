<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/banner.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/ranking.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/footer.css" type="text/css" />
    <title>虫二书屋</title>

</head>
<body>

<%@ include file="/commons/public/banner.jsp"%>

<div id="nav">
    <ul>
        <li class="title1"><a href="${pageContext.request.contextPath}/commons/index.jsp" >首页</a></li>
        <li class="title2"><a href="${pageContext.request.contextPath}/RankingServlet">销售榜</a></li>
        <li class="title3"><a href="${pageContext.request.contextPath}/commons/classification.jsp">分类</a></li>
    </ul>
</div>

<table id="ranking">
    <tr>
        <th witdh="10%">排名 </th>
        <th witdh="10%">书籍 </th>
        <th witdh="10%">书名 </th>
        <th witdh="10%">作者 </th>
        <th witdh="15%">价格 </th>
        <th witdh="15%">销量 </th>
    </tr>

    <c:set scope="page" value="0" var="number"/>
    <c:forEach items="${requestScope.list}" var="list">
        <tr>
            <th witdh="10%"> ${number=number+1} </th>
            <th witdh="10%"><a href="${pageContext.request.contextPath}/BookServlet?method=show&amp;bookId=${putTime.bookId}">
                <img src="${list.url}" style="width:196px" height="196px"></a> </th>
            <th witdh="15%"><a href=""> ${list.bookName} </a></th>
            <th witdh="10%"><a href=""> ${list.writer} </a></th>
            <th witdh="15%">${list.price} </th>
            <th witdh="15%">${list.sellNumber} </th>
        </tr>
    </c:forEach>
</table>

<div id="page">

</div>

<%@ include file="/commons/public/footer.jsp"%>

</body>
</html>