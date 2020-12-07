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

<div id="banner">
    <ul>
        <li><a href="regist.jsp"> 注册</a></li>
        <li><a href="login.jsp"> 登陆</a></li>
        <li class="dropdown">
            <a href="" class="dropbtn"> 个人中心</a>
            <ul class="dropdown-content">
                <li><a href="#">我的账号</a></li>
                <li><a href="#">我的订单</a></li>
                <li><a href="#">账号余额</a></li>
                <li><a href="#">帮助</a></li>
                <li><a href="#">关于</a></li>
                <li><a href="#">退出</a></li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/commons/cart.jsp"> 购物车</a></li>
        <li><a href=""> 退出</a></li>
    </ul>
</div>

<div id="find">
    <a href="index.jsp" title="虫二书屋"><img src="${pageContext.request.contextPath}/style/img/logo2.png"></a>
    <a href="index.jsp" title="虫二书屋"><img src="${pageContext.request.contextPath}/style/img/logo1.png"></a>
    <form>
        <input type="text" name="serch_text" size="30" maxlength="20" class="serch_text">
        <input type="button" value="搜索" name="serch" class="serch">
    </form>
</div>

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
                <li><a href="${pageContext.request.contextPath}/BookServlet?method=show&amp;bookId=${putTime.bookId}">
                    <img src="${book.url}" style="width:196px" height="196px"> </a></li>
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