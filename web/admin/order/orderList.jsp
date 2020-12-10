<%--
  Created by IntelliJ IDEA.
  User: 87608
  Date: 2020/11/29
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
<!-- 页面标题 -->
<div id="TitleArea">
    <div id="TitleArea_Head"></div>
    <div id="TitleArea_Title">
        <div id="TitleArea_Title_Content">
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/admin/public/style/images/title_arrow.gif"> 图书列表
        </div>
    </div>
    <div id="TitleArea_End"></div>
</div>

<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
    <table class="MainArea_Content" cellspacing="0" cellpadding="0">
        <!-- 表头-->
        <thead>
        <tr align="center" valign="middle" id="TableTitle">
            <td>订单编号</td>
            <td>订单总金额</td>
            <td>下单时间</td>
            <td>订单状态</td>
            <td>操作</td>

        </tr>
        </thead>
        <!--显示数据列表 -->
        <tbody id="TableData">

        <c:forEach items="${requestScope.pageBean.pageData}" var="orders" >
            <tr class="TableDetail1">
                <td align="center">${orders.orderId}</td>
                <td align="center">${orders.totalAmount}</td>
                <td align="center">${orders.orderTime} &nbsp;</td>
                <td align="center">${orders.orderStatus} &nbsp;</td>
                <td>
                    <a href="${pageContext.request.contextPath}/OrderDetailServlet?method=queryAll&amp;orderId=${orders.orderId}"
                       class="FunctionButton">详情</a>
                    <a href="${pageContext.request.contextPath}/OrderServlet?method=orderShipping&amp;orderId=${orders.orderId}"
                       onclick="return isSihp();" class="FunctionButton">发货</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 其他功能超链接 -->
    <div id="TableTail" align="center">
            当前${requestScope.pageBean.currentPage}/${requestScope.pageBean.totalPage}页 &nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/OrderServlet?method=showAll&amp;currentPage=1">首页</a>
            <a href="${pageContext.request.contextPath}/OrderServlet?method=showAll&amp;currentPage=${requestScope.pageBean.currentPage -1}">上一页 </a>
            <a href="${pageContext.request.contextPath}/OrderServlet?method=showAll&amp;currentPage=${requestScope.pageBean.currentPage +1}">下一页 </a>
            <a href="${pageContext.request.contextPath}/OrderServlet?method=showAll&amp;currentPage=${requestScope.pageBean.totalPage}">末页</a>
        </div>
    </div>


</body>
</html>