<%--
  Created by IntelliJ IDEA.
  User: 87608
  Date: 2020/12/4
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <!-- 包含公共的JSP代码片段 -->
    <title>虫二书屋平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/public/style/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/public/style/js/page_common.js"></script>
    <link href="${pageContext.request.contextPath }/admin/public/style/css/common_style_blue.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/public/style/css/index_1.css"/>
</head>
<body>


<!-- 页面标题 -->
<div id="TitleArea">
    <div id="TitleArea_Head"></div>
    <div id="TitleArea_Title">
        <div id="TitleArea_Title_Content">


            <img border="0" width="13" height="13"
                 src="${pageContext.request.contextPath }/admin/public/style/images/title_arrow.gif"/> 添加分类
        </div>
    </div>
    <div id="TitleArea_End"></div>
</div>


<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
    <!-- 表单内容 -->
    <form action="${pageContext.request.contextPath }/ClassificationServlet?method=add" method="post">

        <!-- 本段标题（分段标题） -->
        <div class="ItemBlock_Title">
            <img width="4" height="7" border="0"
                 src="${pageContext.request.contextPath }/admin/public/style/images/item_point.gif"> 分类信息&nbsp;
        </div>
        <!-- 本段表单字段 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <div class="ItemBlock2">
                    <table cellpadding="0" cellspacing="0" class="mainForm">
                        <tr>
                            <td width="80px">分类名称</td>
                            <td>
                                <input type="text" name="classificationName" class="InputStyle" value=""/> *
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input type="submit" value="添加" class="FunctionButtonInput">
            <a href="javascript:history.go(-1);" class="FunctionButton">返回</a>
        </div>
    </form>

</div>


</body>
</html>

