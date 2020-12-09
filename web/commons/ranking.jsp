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
    <style>
        div#TableT a{
            display: block;
            width: 60px;
            height: 20px;
            float: left;
            margin: 0 auto;
            margin-left: 50px;
            border: #22B14C 1px dashed;
        }
        div#TableT a:hover{
            background: #22B14C;
            color: white;
        }
        div#TableT a:nth-child(3){
            margin-left: 550px;
        }
    </style>
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

<table id="ranking">
    <tr>
        <th witdh="10%">排名 </th>
        <th witdh="10%">书籍 </th>
        <th witdh="10%">书名 </th>
        <th witdh="10%">作者 </th>
        <th witdh="15%">价格 </th>
        <th witdh="15%">销量 </th>
    </tr>

    <c:forEach items="${requestScope.list}" var="list">
        <tr>
            <th witdh="10%"> ${requestScope.number=requestScope.number+1} </th>
            <th witdh="10%"><a href="${pageContext.request.contextPath}/BookServlet?method=show&amp;bookId=${list.bookId}">
                <img src="${list.url}" style="width:196px" height="196px"></a> </th>
            <th witdh="15%"><a href=""> ${list.bookName} </a></th>
            <th witdh="10%"><a href=""> ${list.writer} </a></th>
            <th witdh="15%">${list.price} </th>
            <th witdh="15%">${list.sellNumber} </th>
        </tr>
    </c:forEach>
</table>

<div id="page">
    <div id="TableT" align="center">
        当前${requestScope.pageBean.currentPage}/${requestScope.pageBean.totalPage}页 &nbsp;&nbsp;
        <br>
        <br>
        <a href="${pageContext.request.contextPath}/RankingServlet?currentPage=1">首页</a>
        <a href="${pageContext.request.contextPath}/RankingServlet?currentPage=${requestScope.pageBean.currentPage -1}">上一页 </a>
        <a href="${pageContext.request.contextPath}/RankingServlet?currentPage=${requestScope.pageBean.currentPage +1}">下一页 </a>
        <a href="${pageContext.request.contextPath}/RankingServlet?currentPage=${requestScope.pageBean.totalPage}">末页</a>
        <br>
    </div>
</div>

<%@ include file="/commons/public/footer.jsp"%>

</body>
</html>