<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 包含公共的JSP代码片段 -->

    <title>无线点餐平台</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/public/style/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/public/style/js/page_common.js"></script>
    <link href="${pageContext.request.contextPath}/admin/public/style/css/common_style_blue.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/public/style/css/index_1.css">
    <script type="text/javascript">
        /* setInterval(function() {
            window.location.href = "/wirelessplatform/client.html?method=list";
        }, 1000 * 50); */
    </script>
</head>
<body>
<!-- 页面标题 -->
<div id="TitleArea">
    <div id="TitleArea_Head"></div>
    <div id="TitleArea_Title">
        <div id="TitleArea_Title_Content">
            <img border="0" width="11" height="11" src="${pageContext.request.contextPath}/admin/public/style/images/title_arrow.gif" alt="">
            餐厅订单列表
        </div>
    </div>
    <div id="TitleArea_End"></div>
</div>

<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
    <table class="MainArea_Content" align="center" cellspacing="0" cellpadding="0">
        <!-- 表头-->
        <thead>
        <tr align="center" valign="middle" id="TableTitle">
            <td>订单编号</td>
            <td>餐桌名</td>
            <td>下单日期</td>
            <td>总金额</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
        </thead>
        <!--显示数据列表 -->
        <tbody id="TableData">

        <tr height="60">
            <td>1</td>
            <td>1号桌</td>
            <td>2018-10-10 22:36:27.0</td>
            <td>37.0</td>
            <td>未结账</td>
            <td><a href="http://localhost:8080/hotel_war_exploded/order?method=getOrderDetail&amp;orderId=1"
                   class="FunctionButton">详细</a>
                <a href="http://localhost:8080/hotel_war_exploded/order?method=pay&amp;tableId=1&amp;orderId=1"
                   class="FunctionButton">结账</a></td>
        </tr>

        <tr height="60">
            <td>2</td>
            <td>2号桌</td>
            <td>2020-11-13 11:53:10.0</td>
            <td>39.0</td>
            <td>已结账</td>
            <td><a href="http://localhost:8080/hotel_war_exploded/order?method=getOrderDetail&amp;orderId=2"
                   class="FunctionButton">详细</a>
                <a href="http://localhost:8080/hotel_war_exploded/order?method=pay&amp;tableId=2&amp;orderId=2"
                   class="FunctionButton">结账</a></td>
        </tr>

        <tr height="60">
            <td>3</td>
            <td>2号桌</td>
            <td>2020-11-14 16:46:02.0</td>
            <td>36.0</td>
            <td>未结账</td>
            <td><a href="http://localhost:8080/hotel_war_exploded/order?method=getOrderDetail&amp;orderId=3"
                   class="FunctionButton">详细</a>
                <a href="http://localhost:8080/hotel_war_exploded/order?method=pay&amp;tableId=2&amp;orderId=3"
                   class="FunctionButton">结账</a></td>
        </tr>
        </tbody>
    </table>
    <!-- 其他功能超链接 -->
    <div id="TableTail" align="center">
        当前1/1页 &nbsp;&nbsp;
        <a href="http://localhost:8080/hotel_war_exploded/order?method=getOrderList&amp;currentPage=1">首页</a>
        <a href="http://localhost:8080/hotel_war_exploded/order?method=getOrderList&amp;currentPage=0">上一页 </a>
        <a href="http://localhost:8080/hotel_war_exploded/order?method=getOrderList&amp;currentPage=2">下一页 </a>
        <a href="http://localhost:8080/hotel_war_exploded/order?method=getOrderList&amp;currentPage=1">末页</a>
    </div>
</div>
</body>
</html>