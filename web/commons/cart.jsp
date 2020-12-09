<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/carts.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/cartn.css" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/cartValidate.js"></script>
    <title>虫二书屋-购物车</title>
    <input type="hidden" name="minPrice" value=""/>
    <input type="hidden" name="maxPrice" value=""/>
</head>
<body>
<%@ include file="/commons/public/banner.jsp"%>
<br><br>
<div class="container">
    <div class="container">
        <div class="alert alert-success tip-success" id="computerNumber">您的购物车中共有
            <b>${sessionScope.shoppingCart.bookTotal} </b>件图书
        </div>
        <br>
        <table class="table table-striped" style="margin-left: 530px">
            <tr>
                <td class="col-md-6">图书名</td>
                <td class="col-md-2 text-center" style="width: 100px">数量</td>
                <td class="col-md-2 text-center" style="width: 100px">单价</td>
                <td class="col-md-2 text-center" style="width: 100px">操作</td>
            </tr>
            <c:forEach items="${sessionScope.shoppingCart.items }" var="item">
                <tr>
                    <td class="col-md-6 ">
                        <img alt="${item.book.bookId }" src="${pageContext.request.contextPath}/${item.book.url }"
                             style="width:200px;height:200px;">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.book.bookName } &nbsp;
                    </td>
                    <td class="col-md-2 cartItem text-center" style="height:100px;line-height: 200px;">
                        <input class="cartItemNum"  type="text" size="1"
                               name="${item.book.bookId }" value="${item.num }"
                               style="width:60px;height:30px;"/>
                    </td>
                    <td class="col-md-2 text-center">￥ <b>${item.book.price}</b></td>
                    <td class="col-md-2 text-center">
                        <a class="btn btn-danger delete" style="display: block;width: 50px;height: 20px;border: #22B14C 1px dashed;text-align: center;"
                           href="${pageContext.request.contextPath}/BookServlet?method=deleteShoppingCartBook&amp;bookId=${item.book.bookId }">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <div id="totalMoney" style="font-weight:bold;">总金额：￥ ${sessionScope.shoppingCart.bookSum }
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-md-8"></div>
            <br>
            <div class="col-xs-12 col-md-4 text-right" style="padding-left:30px;">
                <a href="${pageContext.request.contextPath}/commons/index.jsp" class="btn btn-default"
                   role="button" style="display: block;width: 100px;height: 25px;border: #22B14C 1px dashed;text-align: center">继续购物</a>
                <a href="${pageContext.request.contextPath}/BookServlet?method=clear" class="btn btn-danger" role="button" style="display: block;width: 100px;height: 25px;border: #22B14C 1px dashed;text-align: center">清空购物车</a>
                <a href="${pageContext.request.contextPath}/OrderServlet?method=add" class="btn btn-primary"
                   role="button" style="display: block;width: 100px;height: 25px;border: #22B14C 1px dashed;text-align: center">结账</a>
            </div>
            <br>
        </div>
    </div>
</div>
<%@ include file="/commons/public/footer.jsp"%>
</body>
</html>