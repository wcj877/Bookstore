<%--
  Created by IntelliJ IDEA.
  User: 87608
  Date: 2020/12/7
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/public/style/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/public/style/js/page_common.js"></script>
    <title>商品详情 </title>
</head>

<body>
<%--<%@ include file="/commons/header.jsp"%>--%>
<%@ include file="/commons/public/banner.jsp"%>
<center>
    <div class="thumbnail">
        <img src="${pageContext.request.contextPath}/${requestScope.book.url }" style="width:200px;height:200px;"/>
    </div>
    <div class="caption">
            <br><br>
            书名：${requestScope.book.bookName}
            <br><br>
            作者：${requestScope.book.writer}
            <br><br>
            价格: ￥ ${requestScope.book.price }
            <br><br>
            上架时间: ${requestScope.book.putTime }
            <br><br>
            出版时间: ${requestScope.book.outTime }
            <br><br>
            简介: ${requestScope.book.intro }
            <br><br>

        <a href="javascript: window.history.back()" class="btn btn-default">继续购物</a>
<%--        href="computerServlet?method=addToCartInside&pageNo=${computerpage.pageNo }&id=${computer.id}&model=${computer.model}&brand=${computer.brand}"--%>
        <a
           class="btn btn-primary addToCart" role="button"
            onclick="showAlter('加入购物车')">
            <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 加入购物车</a>
        <a
                class="btn btn-primary addToCart" role="button"
                onclick="showAlter('收藏')">
            <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 收藏 </a>
    </div>

</center>
<%--<%@ include file="/commons/footer.jsp"%>--%>
</body>
</html>