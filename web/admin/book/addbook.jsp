<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
            <img border="0" width="13" height="13" src="../public/style/images/title_arrow.gif"> 添加新图书
        </div>
    </div>
    <div id="TitleArea_End"></div>
</div>

<!-- 主内容区域（数据列表或表单显示） -->
<div id="MainArea">
    <!-- 表单内容 -->
    <form action="http://localhost:8080/hotel_war_exploded/food?method=add" method="post" enctype="multipart/form-data">
        <!-- 本段标题（分段标题） -->
        <div class="ItemBlock_Title">
            <img width="4" height="7" border="0" src="../public/style/images/item_point.gif"> 图书信息&nbsp;
        </div>
        <!-- 本段表单字段 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <div class="ItemBlock2">
                    <table cellpadding="0" cellspacing="0" class="mainForm">
                        <tbody>
                        <tr>
                            <td width="80px">图书分类</td>
                            <td>
                                <select name="bookType_id" style="width:80px">
                                    <option value="1">主食</option>
                                    <option value="2">热菜</option>
                                    <option value="3">凉菜</option>
                                    <option value="4">汤</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td width="80px">图书名</td>
                            <td><input type="text" name="bookName" class="InputStyle" value=""> *</td>
                        </tr>
                        <tr>
                            <td>价格</td>
                            <td><input type="text" name="price" class="InputStyle" value=""> *</td>
                        </tr>
                        <tr>
                            <td>作者</td>
                            <td><input type="text" name="author" class="InputStyle" value=""> *</td>
                        </tr>

                        <tr>
                            <td>出版时间</td>
                            <td><input name="dateOfPublish" class="InputStyle"/> *</td>
                        </tr>

                        <tr>
                            <td>简介</td>
                            <td><textarea name="remark" class="TextareaStyle"></textarea></td>
                        </tr>
                        <tr>
                            <td width="80px">图书图片</td>
                            <td>
                                <input type="file" name="img"> *
                            </td>
                        </tr>
                        </tbody>
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