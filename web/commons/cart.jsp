<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/cart.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/carts.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/index.css" type="text/css" />
    <title>虫二书屋-购物车</title>
    <input type="hidden" name="minPrice" value=""/>
    <input type="hidden" name="maxPrice" value=""/>

</head>
<body>
<%@ include file="/commons/public/banner.jsp"%>
<div class="container">
    <div class="jumbotron" style="margin-top:30px;">
        <p>购物车空空如也~</p>
        <p><a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/commons/index.jsp" role="button">返回</a></p>
    </div>
</div>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<hr>
<c:if test="${ empty sessionScope.shoppingCart}">
<footer class="footer">
    <div id="back-to-top">
        <a href="#">回到顶部</a>
    </div>
    <p class="text-muted">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &copy;2018 EStore Company, Inc.</p>
</footer>
</c:if>

<c:if test="${ !empty sessionScope.shoppingCart}">
    <br><br>
    <div class="container">
        <div class="container">
            <div class="alert alert-success tip-success" id="computerNumber">您的购物车中共有
                <b>${sessionScope.shoppingCart.computerNumber } </b>件商品
            </div>
            <table class="table table-striped">
                <tr>
                    <td class="col-md-6">商品名</td>
                    <td class="col-md-2 text-center">数量</td>
                    <td class="col-md-2 text-center">价格</td>
                    <td class="col-md-2 text-center">操作</td>
                </tr>
                <c:forEach items="${sessionScope.shoppingCart.items }" var="item">


                    <tr>
                        <td class="col-md-6 ">
                            <img alt="${item.computer.id }" src="${item.computer.url }"/
                            style="width:180px;height:180px;">
                                ${item.computer.brand } &nbsp; ${item.computer.model }
                        </td>
                        <td class="col-md-2 cartItem text-center" style="height:100px;line-height: 200px;">
                            <input class="cartItemNum" step="${item.quantity }" type="text" size="1"
                                   name="${item.computer.id }" value="${item.quantity }"
                                   style="width:50px;height:30px;"/>
                        </td>
                        <td class="col-md-2 text-center">￥ <b>${item.computer.price }</b></td>
                        <td class="col-md-2 text-center">
                            <a class="btn btn-danger delete"
                               href="computerServlet?method=remove&pageNo=${param.pageNo }&id=${item.computer.id }">删除</a>
                        </td>
                    </tr>


                </c:forEach>
            </table>


            <div id="totalMoney" style="font-weight:bold;">总金额：￥ ${sessionScope.shoppingCart.totalMoney }
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-6 col-md-8"></div>
                <div class="col-xs-12 col-md-4 text-right" style="padding-left:30px;">
                    <a href="computerServlet?method=getComputers&pageNo=${param.pageNo }" class="btn btn-default"
                       role="button">继续购物</a>


                    <a href="computerServlet?method=clear" class="btn btn-danger" role="button">清空购物车</a>


                    <a href="computerServlet?method=forwardPage&page=cash" class="btn btn-primary"
                       role="button">结账</a>
                </div>

            </div>


        </div>


    </div>


</c:if>





<%@ include file="/commons/public/footer.jsp"%>
</body>
</html>