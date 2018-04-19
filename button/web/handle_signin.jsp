<%--
  Created by IntelliJ IDEA.
  User: 伯明翰
  Date: 2018/4/7
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.cdxy.join.dbc.*" %>
<%@ page import="com.cdxy.join.vo.UserInfo" %>
<%@ page import="com.cdxy.join.factory.Factory" %>
<%
    UserInfo userInfo = new UserInfo();
    userInfo.setUsername(request.getParameter("name"));
    userInfo.setPassword(request.getParameter("password"));
    String passwordPlus = request.getParameter("password+");
    if(userInfo.getUsername()==null)userInfo.setUsername("");
    if(userInfo.getPassword()==null)userInfo.setPassword("");
    if(passwordPlus.equals(userInfo.getPassword())){
        if(Factory.getUserInfoDAOImplProxy().checkUser(userInfo)){
            response.sendRedirect("error3.jsp");
        }else{
            Factory.getUserInfoDAOImplProxy().add(userInfo);
            response.sendRedirect("success.jsp");
        }
    }else {
        response.sendRedirect("error2.jsp");
    }
%>


