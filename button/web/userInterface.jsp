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
    <title>User界面</title>
</head>
<body>
<div style="background-color: #E0DEDC;width: 100%;height: 150px;float: top">
    欢迎您！&nbsp;&nbsp;<%=session.getAttribute("username")%>
    <h1>user</h1>
    <input type="button" value="退出" style="float: right">
    <script>
        document.write(Date());
    </script>
</div>
<div style="background-color: blanchedalmond;width: 150px;height:85%;float: left">
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
<div style="background-color: aqua;width: 85%;height: 85%;float: left">
    <table>
        <tr><th>用户名</th><th>密码</th></tr>
<%
    List<UserInfo> list = new ArrayList<>();
    ImplUserDB implUserDB = new ImplUserDB(new DataBaseConnection());
    list = implUserDB.findAll();
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
