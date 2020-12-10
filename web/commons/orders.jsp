<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 87608
  Date: 2020/12/4
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/banner.css" type="text/css"/>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/order.css" type="text/css"/>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/footer.css" type="text/css"/>
    <%--    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/orders.js"></script>--%>
    <title>虫二书屋-订单</title>
<style>
    #nav ul li.title2 a{
        background-color: #22B14C;
        color: white;
    }
    .ranking{
        border-top: 2px solid #22B14C;;
        margin: 0 auto;
        margin-bottom: 100px;
    }
    .ranking th{
        border-bottom: 2px solid #22B14C;
        padding: 10px 80px 10px 80px;
        color: grey;
    }
    .ranking a{
        color: grey;
    }
    .ranking a:hover{
        color: #22B14C;
    }

    #page{
        margin: 0 auto;
    }
</style>
</head>
<body>

<%@ include file="/commons/public/banner.jsp" %>

<div id="nav">
    <p style="font-size: 24px">&nbsp;&nbsp;&nbsp;我的订单</p>
    <ul>
        <li><a href="#" class="titleb" style="background-color: #22B14C;color: #FFFFFF">未发货</a></li>
        <li><a href="#" class="titleb">已发货</a></li>
        <li><a href="#" class="titleb">全部订单</a></li>
    </ul>
</div>


    <table class="ranking" style="display: block">
        <tr>
            <th witdh="10%">订单编号</th>
            <th witdh="10%">下单时间</th>
            <th witdh="10%">总价格</th>
            <th witdh="15%">购买数量</th>
            <th witdh="15%">物流状态</th>
        </tr>
        <c:forEach items="${requestScope.notShipped}" var="notShipped">
            <tr>
                <th witdh="15%">${notShipped.orderId}</th>
                <th witdh="20%">${notShipped.orderTime}</th>
                <th witdh="15%">${notShipped.totalAmount}</th>
                <th witdh="20%">${notShipped.total}</th>
                <th witdh="20%">${notShipped.orderStatus}</th>
            </tr>
        </c:forEach>
    </table>




    <table class="ranking" style="display: none">
        <tr>
            <th witdh="10%">订单编号</th>
            <th witdh="10%">下单时间</th>
            <th witdh="10%">总价格</th>
            <th witdh="15%">购买数量</th>
            <th witdh="15%">物流状态</th>
            <th witdh="15%">操作</th>
        </tr>
        <c:forEach items="${requestScope.shipped}" var="shipped">
            <tr>
                <th witdh="10%">${shipped.orderId}</th>
                <th witdh="10%">${shipped.orderTime}</th>
                <th witdh="10%">${shipped.totalAmount}</th>
                <th witdh="15%">${shipped.total}</th>
                <th witdh="15%">${shipped.orderStatus}</th>
                <th witdh="15%">
                    <a href="${pageContext.request.contextPath}/OrderServlet?method=orderReceipt&amp;orderId=${shipped.orderId}"
                                   onclick="return isReceipt();" class="FunctionButton">收货</a>
                </th>

            </tr>
        </c:forEach>
    </table>




    <table class="ranking" style="display: none">
        <tr>
            <th witdh="10%">订单编号</th>
            <th witdh="10%">下单时间</th>
            <th witdh="10%">总价格</th>
            <th witdh="15%">购买数量</th>
            <th witdh="15%">物流状态</th>
        </tr>
        <c:forEach items="${requestScope.userOrders}" var="userOrders">
            <tr>
                <th witdh="10%">${userOrders.orderId}</th>
                <th witdh="10%">${userOrders.orderTime}</th>
                <th witdh="10%">${userOrders.totalAmount}</th>
                <th witdh="15%">${userOrders.total}</th>
                <th witdh="15%">${userOrders.orderStatus}</th>
            </tr>
        </c:forEach>
    </table>


<div id="page">

</div>

<%@ include file="/commons/public/footer.jsp" %>

<script>
    lis = document.querySelectorAll(".titleb");
    ranking = document.querySelectorAll(".ranking");
    console.log(ranking)
    for (let i = 0; i < lis.length; i++) {
        lis[i].onclick = function () {
            for (let j = 0; j < lis.length; j++) {
                ranking[j].style.display = "none";
                lis[j].style.backgroundColor = "#ffffff";
                lis[j].style.color = "#22B14C"
            }

            lis[i].style.backgroundColor = "#22B14C";
            lis[i].style.color = "#fff"
            ranking[i].style.display = "block";
        }
    }
</script>

</body>
</html>