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
        <li><a href=""> 购物车</a></li>
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
        <li class="title1"><a href="${pageContext.request.contextPath}/commons/index.jsp" >首页</a></li>
        <li class="title2"><a href="${pageContext.request.contextPath}/RankingServlet">销售榜</a></li>
        <li class="title3"><a href="">分类</a></li>
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
            <th witdh="10%"><a href=""><img src="${list.url}"></a> </th>
            <th witdh="15%"><a href=""> ${list.bookName} </a></th>
            <th witdh="10%"><a href=""> ${list.writer} </a></th>
            <th witdh="15%">${list.price} </th>
            <th witdh="15%">${list.sellNumber} </th>
        </tr>
    </c:forEach>
</table>

<div id="page">

</div>

<div id="footer"></div>

</body>
</html>