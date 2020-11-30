<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- saved from url=(0058)http://localhost:8080/hotel_war_exploded/table?method=list -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 包含公共的JSP代码片段 -->

    <title>无线点餐平台</title>
    <script type="text/javascript" src="../public/style/js/jquery.js"></script>
    <script type="text/javascript" src="../public/style/js/page_common.js"></script>
    <link href="../public/style/css/common_style_blue.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../public/style/css/index_1.css">
</head>
<body>
<!-- 页面标题 -->
<div id="TitleArea">
    <div id="TitleArea_Head"></div>
    <div id="TitleArea_Title">
        <div id="TitleArea_Title_Content">
            <img border="0" width="13" height="13" src="../public/style/images/title_arrow.gif"> 分类列表
        </div>
    </div>
    <div id="TitleArea_End"></div>
</div>

<!-- 过滤条件 -->
<div id="QueryArea">
    <form action="http://localhost:8080/hotel_war_exploded/table" method="post">
        <input type="hidden" name="method" value="search">
        <input type="text" name="keyword" title="请输入分类名">
        <input type="submit" value="搜索">
    </form>
</div>

<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
    <table class="MainArea_Content" cellspacing="0" cellpadding="0">
        <!-- 表头-->
        <thead>
        <tr align="center" valign="middle" id="TableTitle">
            <td>图书分类编号</td>
            <td>图书分类名</td>
            <td>操作</td>
        </tr>
        </thead>
        <!--显示数据列表 -->
        <tbody id="TableData">

        <tr class="TableDetail1">
            <td align="center">1</td>
            <td align="center">1号桌 &nbsp;</td>
            <td>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=up1&amp;id=1"
                   class="FunctionButton">修改</a>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=delete&amp;id=1"
                   onclick="return delConfirm();" class="FunctionButton">删除</a>
            </td>
        </tr>

        <tr class="TableDetail1">
            <td align="center">2</td>
            <td align="center">2号桌 &nbsp;</td>
            <td>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=up1&amp;id=2"
                   class="FunctionButton">修改</a>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=delete&amp;id=2"
                   onclick="return delConfirm();" class="FunctionButton">删除</a>
            </td>
        </tr>

        <tr class="TableDetail1">
            <td align="center">3</td>
            <td align="center">3号桌 &nbsp;</td>
            <td>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=up1&amp;id=3"
                   class="FunctionButton">修改</a>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=delete&amp;id=3"
                   onclick="return delConfirm();" class="FunctionButton">删除</a>
            </td>
        </tr>

        <tr class="TableDetail1">
            <td align="center">4</td>
            <td align="center">4号桌 &nbsp;</td>
            <td>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=up1&amp;id=4"
                   class="FunctionButton">修改</a>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=delete&amp;id=4"
                   onclick="return delConfirm();" class="FunctionButton">删除</a>
            </td>
        </tr>

        <tr class="TableDetail1">
            <td align="center">5</td>
            <td align="center">5号桌 &nbsp;</td>
            <td>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=up1&amp;id=5"
                   class="FunctionButton">修改</a>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=delete&amp;id=5"
                   onclick="return delConfirm();" class="FunctionButton">删除</a>
            </td>
        </tr>

        <tr class="TableDetail1">
            <td align="center">6</td>
            <td align="center">大包间 &nbsp;</td>
            <td>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=up1&amp;id=6"
                   class="FunctionButton">修改</a>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=delete&amp;id=6"
                   onclick="return delConfirm();" class="FunctionButton">删除</a>
            </td>
        </tr>

        <tr class="TableDetail1">
            <td align="center">7</td>
            <td align="center">小包间1 &nbsp;</td>
            <td>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=up1&amp;id=7"
                   class="FunctionButton">修改</a>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=delete&amp;id=7"
                   onclick="return delConfirm();" class="FunctionButton">删除</a>
            </td>
        </tr>

        <tr class="TableDetail1">
            <td align="center">8</td>
            <td align="center">小包间2 &nbsp;</td>
            <td>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=up1&amp;id=8"
                   class="FunctionButton">修改</a>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=delete&amp;id=8"
                   onclick="return delConfirm();" class="FunctionButton">删除</a>
            </td>
        </tr>

        <tr class="TableDetail1">
            <td align="center">9</td>
            <td align="center">小包间3 &nbsp;</td>
            <td>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=up1&amp;id=9"
                   class="FunctionButton">修改</a>
                <a href="http://localhost:8080/hotel_war_exploded/table?method=delete&amp;id=9"
                   onclick="return delConfirm();" class="FunctionButton">删除</a>
            </td>
        </tr>
        </tbody>
    </table>

    <!-- 其他功能超链接 -->
    <div id="TableTail" align="center">
        <div class="FunctionButton"><a href="http://localhost:8080/hotel_war_exploded/sys/board/saveBoard.jsp">添加</a>
        </div>
        当前1/2页 &nbsp;&nbsp;
        <a href="http://localhost:8080/hotel_war_exploded/food?method=list&amp;currentPage=1">首页</a>
        <a href="http://localhost:8080/hotel_war_exploded/food?method=list&amp;currentPage=0">上一页 </a>
        <a href="http://localhost:8080/hotel_war_exploded/food?method=list&amp;currentPage=2">下一页 </a>
        <a href="http://localhost:8080/hotel_war_exploded/food?method=list&amp;currentPage=2">末页</a>
    </div>
</div>


</body>
</html>