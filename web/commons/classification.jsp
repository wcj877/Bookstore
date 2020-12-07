<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/banner.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/classify.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/footer.css" type="text/css"/>
    <title>虫二书屋</title>
</head>
<body>

<%@ include file="/commons/public/banner.jsp"%>

<div id="nav">
    <ul>
        <li class="title1"><a href="${pageContext.request.contextPath}/commons/index.jsp">首页</a></li>
        <li class="title2"><a href="${pageContext.request.contextPath}/commons/ranking.jsp">销售榜</a></li>
        <li class="title3"><a href="${pageContext.request.contextPath}/commons/classification.jsp">分类</a></li>
    </ul>
</div>

<div class="type">
    <ul>
        <li>图书分类</li>

        <c:forEach items="${applicationScope.classificationList}" var="classification">
            <li>
                <a href="${pageContext.request.contextPath}/BookServlet?method=querysAll&amp;condition=classificationId=${classification.classificationID}">
                        ${classification.classificationName}
                </a>
            </li>

        </c:forEach>
    </ul>
</div>

<div id="content">
    <c:forEach items="${requestScope.pageBean.pageData}" var="book">
        <div class="shu">
            <ul>
                <li><a href=""><img src="${book.url}" style="width:196px" height="196px"> </a></li>
                <li class="name1"><a href="#">${book.bookName}</a></li>
                <li class="name2"><a href="#" title="小泉八云">${book.writer}</a></li>
                <li class="name3">￥${book.price}</li>
            </ul>
        </div>
    </c:forEach>
</div>

<%@ include file="/commons/public/footer.jsp"%>


</body>
</html>