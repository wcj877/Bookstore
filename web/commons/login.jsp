<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head lang="en">
    <link rel="stylesheet" href="../style/css/login.css" type="text/css" />
    <link rel="stylesheet" href="../style/css/footer.css" type="text/css" />
    <meta charset="UTF-8">
    <title></title>
</head>

<body>
<div id="logo">
    <a href="index.jsp" title="虫二书屋"><img src="../style/img/logo2.png"></a>
    <a href="index.jsp" title="虫二书屋"><img src="../style/img/logo1.png"></a>
</div>

<div id="login">
    <h3>登陆 </h3>
    <form>
        <table>
            <tbody>
            <tr>
                <td>账号：</td>
                <td><input style="width: 160px; height: 26px" name=account ></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input style="width: 160px; height: 26px" type=password name=password></td>
            </tr>
            <tr>
                <td></td>
                <td><input type=submit value=登陆> <input type=reset value=重置> </td>
            </tr>
            </tbody>
        </table>
        <tr><a href="index.jsp">返回</a></tr>
    </form>
</div>


</body>
</html>