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
    userInfo.setUsername(request.getParameter("username"));
    userInfo.setPassword(request.getParameter("pwd"));
    String category = request.getParameter("sel");
    session.setAttribute("username",userInfo.getUsername());
    if(userInfo.getUsername()==null)userInfo.setUsername("");
    if(userInfo.getPassword()==null)userInfo.setPassword("");
    if(category.equals("stadiumUser")){
        ImplUserDB implUserDB = new ImplUserDB(new DataBaseConnection());
        if(implUserDB.checkUser(userInfo)){
            response.sendRedirect("userInterface.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }else {
        ImplAdminDB implAdminDB = new ImplAdminDB(new DataBaseConnection());
        if(implAdminDB.checkUser(userInfo)){
            response.sendRedirect("admin.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
%>

