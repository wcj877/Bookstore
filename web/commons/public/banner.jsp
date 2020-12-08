<%--
  Created by IntelliJ IDEA.
  User: 86133
  Date: 2020/12/7
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>

        ul{
            list-style: none;
        }
        #banner{
            width: 1500px;
            height: 30px;
            margin: 0 auto;
            border-bottom: 2px solid #F2F1EA;
        }
        #banner ul{
            margin-left: 900px;
        }
        #banner ul li{
            float: left;
            font-size: 16px;
            padding-left: 50px;
        }
        a{
            display: block;
            text-decoration: none;
            color: #22B14C;
        }
        #banner ul li a:hover{
            text-decoration: underline;
            color: #22B14C;
        }
        #find{
            margin: 0 auto;
            width: 1500px;
            height: 110px;
        }
        #find img{
            margin-left: 200px;
            margin-right: -180px;
            float: left;
        }
        form{
            float: left;
            margin-left: 600px;
            margin-top: 30px;
        }
        #nav{
            border-top: 2px solid #F2F1EA;
            width: 1500px;
            height: 60px;
            margin: 0 auto;
        }
        #nav ul{
            margin-left: 100px;
        }
        #nav ul li{
            float: left;
            text-align: center;
        }
        #nav ul li a{
            padding-top: 18px;
            margin-top: -14px;
            display: block;
            width: 160px;
            height: 40px;
        }

        #nav ul li a:link{
            background-color: white;
            color: #22B14C;
        }
        #nav ul li a:hover{
            background-color: #22B14C;
            color: white;
        }


        /* 容器 <div> - 需要定位下拉内容 */
        .dropdown {
            position: relative;
            display: inline-block;
        }
        /* 下拉内容 (默认隐藏) */
        .dropdown-content {
            background-color: white;
            display: none;
            position: absolute;
        }
        /* 下拉菜单的链接 */
        .dropdown-content a {
            text-decoration: none;
            display: block;
            width: 80px;
        }
        /* 鼠标移上去后修改下拉菜单链接颜色 */
        /*.dropdown-content a:hover {*/
        /*background-color: #f1f1f1*/
        /*}*/
        /* 在鼠标移上去后显示下拉菜单 */
        .dropdown:hover .dropdown-content {
            display: block;
        }
        /* 当下拉内容显示后修改下拉按钮的背景颜色 */
        /*.dropdown:hover .dropbtn {*/
        /*background-color: #22B14C;*/
        /*color: white;*/
        /*}*/
        .dropdown-content li{
            float: right;
            padding-top: 20px;
        }
        /* 下拉内容对齐方式 */
        .dropdown-content {
            right: 0;
        }

    </style>
</head>
<body>

<div id="banner">
    <ul>
        <li><a href="#"> 注册</a></li>
        <li><a href="#"> 登陆</a></li>
        <li class="dropdown">
            <a href="" class="dropbtn"> 个人中心</a>
            <ul class="dropdown-content">
                <li><a href="#">我的账号</a></li>
                <li><a href="${pageContext.request.contextPath}/commons/orders.jsp">我的订单</a></li>
                <li><a href="#">账号余额</a></li>
                <li><a href="#">帮助</a></li>
                <li><a href="#">关于</a></li>
                <li><a href="#">退出</a></li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/BookServlet?method=showCart"> 购物车</a></li>
        <li><a href=""> 退出</a></li>
    </ul>
</div>

<div id="find">
    <a href="${pageContext.request.contextPath}/commons/index.jsp" title="虫二书屋"><img src="${pageContext.request.contextPath}/style/img/logo2.png"></a>
    <a href="${pageContext.request.contextPath}/commons/index.jsp" title="虫二书屋"><img src="${pageContext.request.contextPath}/style/img/logo1.png"></a>
    <form>
        <input type="text" name="serch_text" size="30" maxlength="20" class="serch_text">
        <input type="button" value="搜索" name="serch" class="serch">
    </form>
</div>
</body>
</html>
