<%--
  Created by IntelliJ IDEA.
  User: 伯明翰
  Date: 2018/4/11
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <%--<script>--%>
        <%--$(document).ready(function () {--%>
            <%--$("#sub").click(function () {--%>

                   <%--alert($("#pwd").val()+"请重新输入。"+$("#pwdP").val());--%>

            <%--});--%>
        <%--});--%>
    <%--</script>--%>
</head>
<body>
<form action="/SignServlet" method="post">
<table>
    <tr>
    <td>姓名：</td>
    <td><input type="input" name="username"></td>
    </tr>
    <tr>
        <td>密码：</td>
        <td><input id="pwd" type="password" name="password"></td>
    </tr>
    <tr>
        <td>确认密码：</td>
        <td><input id="pwdP" type="password" name="password+"></td>
    </tr>
    <tr>
        <td><input id="sub" type="submit" value="注册"></td>
        <td><input type="reset" value="重置"></td>
    </tr>
</table>
</form>
</body>
</html>
