<%--
  Created by IntelliJ IDEA.
  User: 伯明翰
  Date: 2018/3/28
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.cdxy.join.dbc.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cdxy.join.vo.UserInfo" %>
<html>
<head>
    <title>admin界面</title>
</head>
<body>
<div style="background-color: #E0DEDC;width: 100%;height: 250px;float: top">
    欢迎您！&nbsp;&nbsp;<%=session.getAttribute("username")%>
    <h1>admin</h1>
    <script>
        document.write(Date());
    </script>
</div>
<div style="background-color: blanchedalmond;width: 20%;height:250px;float: left">
    <P>menu1</P>
    <P>menu2</P>
    <P>menu3</P>
    <P>menu4</P>
    <script>
        a = 5;
        b = 6;
        c = a + b;
        console.log(c);
    </script>
</div>
<div style="background-color: aqua;width: 80%;height: 250px;float: right">
    <table>
        <tr><th>用户名</th><th>密码</th></tr>
        <%
            List<UserInfo> list = new ArrayList<>();
            ImplAdminDB implAdminDB = new ImplAdminDB(new DataBaseConnection());
            list = implAdminDB.findAll();
            if(list!=null){
                for(UserInfo u:list){
        %>
        <tr><td><%=u.getUsername()%></td></tr>
        <tr><td><%=u.getPassword()%></td></tr>
        <%
                }
            }
        %>
    </table>
</div>
</body>
</html>
