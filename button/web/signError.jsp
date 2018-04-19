<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 伯明翰
  Date: 2018/3/28
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("refresh","3,URL=signin.jsp");
%>
<h2><a href="signin.jsp" style="color: red" >请点击这里！！</a>三秒后，自动跳转到注册界面 </h2>
<%
    List<String> list = (List<String>) request.getAttribute("error");
    for(int i = 0;i<list.size();i++){
%>
<%=list.get(i)%>
<%
    }
%>
