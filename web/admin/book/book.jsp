<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- saved from url=(0058)http://localhost:8080/hotel_war_exploded/table?method=list -->
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

<!-- 过滤条件 -->
<div id="QueryArea">
    <form action="${pageContext.request.contextPath}/table" method="post">
        <input type="hidden" name="method" value="search">
        <input type="text" name="keyword" title="请输入图书名">
        <input type="submit" value="搜索">
    </form>
</div>

<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
    <table class="MainArea_Content" cellspacing="0" cellpadding="0">
        <!-- 表头-->
        <thead>
        <tr align="center" valign="middle" id="TableTitle">
            <td>图书编号</td>
            <td>图书分类名</td>
            <td>图书名</td>
            <td>图书作者</td>
            <td>价格</td>
            <td>销售量</td>
            <td>操作</td>
        </tr>
        </thead>
        <!--显示数据列表 -->
        <tbody id="TableData">

        <c:forEach items="${requestScope.pageBean.pageData}" var="book" >
            <tr class="TableDetail1">
                <td align="center">${book.bookId}</td>
                <c:forEach items="${applicationScope.classificationList}" var="classification">
                    <c:if test="${book.classificationId == classification.classificationID}">
                        <c:set var="classificationId" value="${classification.classificationName}"/>
                    </c:if>
                </c:forEach>
                <td align="center">${classificationId} &nbsp;</td>
                <td align="center">${book.bookName}</td>
                <td align="center">${book.writer} &nbsp;</td>
                <td align="center">${book.price} &nbsp;</td>
                <td align="center">${book.sellNumber} &nbsp;</td>
                <td>
                    <a href="${pageContext.request.contextPath}/BookServlet?method=getBook&amp;bookId=${book.bookId}"
                       class="FunctionButton">修改</a>
                    <a href="${pageContext.request.contextPath}/BookServlet?method=delete&amp;bookId=${book.bookId}"
                       onclick="return delConfirm();" class="FunctionButton">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 其他功能超链接 -->
    <div id="TableTail" align="center">
        <div class="FunctionButton"><a href="${pageContext.request.contextPath}/admin/book/addbook.jsp">添加</a>
        </div>
            当前${requestScope.pageBean.currentPage}/${requestScope.pageBean.totalPage}页 &nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/BookServlet?method=querysAll&amp;currentPage=1">首页</a>
            <a href="${pageContext.request.contextPath}/BookServlet?method=querysAll&amp;currentPage=${requestScope.pageBean.currentPage -1}">上一页 </a>
            <a href="${pageContext.request.contextPath}/BookServlet?method=querysAll&amp;currentPage=${requestScope.pageBean.currentPage +1}">下一页 </a>
            <a href="${pageContext.request.contextPath}/BookServlet?method=querysAll&amp;currentPage=${requestScope.pageBean.totalPage}">末页</a>
    </div>
</div>


</body>
</html>