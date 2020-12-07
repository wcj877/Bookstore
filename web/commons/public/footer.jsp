<%--
  Created by IntelliJ IDEA.
  User: 86133
  Date: 2020/12/7
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/footer.css" type="text/css" />
    <style>
        #footer{
            width: 100%;
            height: 250px;
            background-color: #BDBEB9;
            text-align: center;
        }
        #lianjie ul li{
            list-style: none;
        }

        #lianjie ul li.footer1 {
            padding-top: 20px ;
            float: left;
            font-size: 13px;
        }
        #lianjie ul li.footer1 a{

            margin: 0 10px 0 8px;
            color: gray;
            text-decoration: none;
        }
        #lianjie ul li.footer1 a:hover{
            color: gray;
            text-decoration: underline;
        }
        #lianjie{
            width: 1000px;
            height: 220px;
            margin: 0 auto;
        }
        #footer ul li.footer2 {
            padding-top: 50px ;
            font-size: 13px;
            list-style-type: none;
        }
        #footer ul li.footer3 {
            padding-top: 10px ;
            font-size: 13px;
            list-style-type: none;
        }
        #footer ul li.footer3 a{
            margin: 0 5px 0 5px;
            color: black;
            text-decoration: none;
        }
        #footer ul li.footer3 a:hover{
            color: black;
            text-decoration: underline;
        }

    </style>
</head>
<body>

<div id="footer">
    <div id="lianjie">
        <ul>
            <li class="footer1"><a href="#">服务条款|</a> </li>
            <li class="footer1"><a href="#">监督举报|</a> </li>
            <li class="footer1"><a href="#">隐私政策|</a> </li>
            <li class="footer1"><a href="#">儿童隐私政策|</a> </li>
            <li class="footer1"><a href="#">版权投诉指引|</a> </li>
            <li class="footer1"><a href="#">关于谛听|</a> </li>
            <li class="footer1"><a href="#">用户服务协议|</a> </li>
            <li class="footer1"><a href="#">虫二书屋|</a> </li>
            <li class="footer1"><a href="#">招聘信息|</a> </li>
            <li class="footer1"><a href="#">客服中心|</a> </li>
            <li class="footer1"><a href="#">用户体验提升计划|</a> </li>

            <li class="footer2">虫二公司版权所有1999-2020  杭州乐读科技有限公司运营：浙网文【2018】3506-263号</li>
            <li class="footer3">违法不良信息举报电话：<a href="#">0571-3695542</a> 举报邮箱：<a href="#">cnm5566@456.com</a></li>
            <li class="footer3">粤B2-20090191-18  <a href="#">工业和信息化部备案管理系统网站</a> </li>
        </ul>
    </div>


</div>
</body>
</html>
