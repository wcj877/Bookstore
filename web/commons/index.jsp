<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/banner.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/index.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/footer.css" type="text/css" />
    <title>虫二书屋</title>

</head>
<body>

<%@ include file="/commons/public/banner.jsp"%>

<div id="nav">
    <ul>
        <li class="title1"><a href="${pageContext.request.contextPath}/commons/index.jsp" >首页</a></li>
        <li class="title2"><a href="${pageContext.request.contextPath}/RankingServlet">销售榜</a></li>
        <li class="title3"><a href="${pageContext.request.contextPath}/BookServlet?method=querysAll&condition=${applicationScope.classification}">分类</a></li>
    </ul>
</div>

<div id="main">
    <div class="js">
        <div id="divpic"></div>
        <script language="javascript">
            pic=new Array();
            pic[0]="<img src=${pageContext.request.contextPath}/style/img/01.jpg border=0>";
            pic[1]="<img src=${pageContext.request.contextPath}/style/img/02.jpg border=0>";
            pic[2]="<img src=${pageContext.request.contextPath}/style/img/03.jpg border=0>";
            pic[3]="<img src=${pageContext.request.contextPath}/style/img/04.jpg border=0>";
            var page;
            function turnpic()
            {
                page=Math.round(Math.random()*3)
                divpic.innerHTML=pic[page];
                setTimeout("turnpic()",1000);
            }
            turnpic();
        </script>
    </div>
</div>

<div id="content">
    <div class="title">
        <ul>
            <li>主编推荐</li>
        </ul>
    </div>

    <c:forEach items="${applicationScope.recommendList}" var="recommend">
        <div class="tuijian">
            <ul>
                <li><a href="${pageContext.request.contextPath}/BookServlet?method=show&amp;bookId=${recommend.bookId}">
                    <img src="${pageContext.request.contextPath}/${recommend.url}" style="width:196px" height="196px"> </a></li>
                <li class="name1"><a href="#">${recommend.bookName}</a> </li>
                <li class="name2"><a href="#" title="小泉八云">${recommend.writer}</a> </li>
                <li class="name3">￥${recommend.price} </li>
            </ul>
        </div>
    </c:forEach>

    <div class="title">
        <ul>
            <li>新书推荐</li>
        </ul>
    </div>
    <c:forEach items="${applicationScope.putTimeList}" var="putTime">

        <div class="tuijian">
            <ul>
                <li><a href="${pageContext.request.contextPath}/BookServlet?method=show&amp;bookId=${putTime.bookId}">
                    <img src="${pageContext.request.contextPath}/${putTime.url}" style="width:196px" height="196px">
                </a>
                </li>
                <li class="name1"><a href="#">${putTime.bookName}</a> </li>
                <li class="name2"><a href="#" title="小泉八云">${putTime.writer}</a> </li>
                <li class="name3">￥${putTime.price} </li>
            </ul>
        </div>
    </c:forEach>
</div>

<%@ include file="/commons/public/footer.jsp"%>


</body>
</html>
