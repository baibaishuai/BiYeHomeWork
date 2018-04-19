<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="sun.rmi.runtime.Log" %>
<%--
  Created by IntelliJ IDEA.
  User: 伯明翰
  Date: 2018/3/28
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String DBDRIVER="com.mysql.jdbc.Driver";//驱动程序名
    //URL指向要访问的数据库名mydata
    String DBURL="jdbc:mysql://localhost:3306/myfirstsql?"+
            "useUnicode=true&characterEncoding=utf-8&useSSL=false";
    String DBUSER="root";//MySQL配置时的用户名
    String DBPASSWORD="bm123123";//MySQL配置时的密码
%>
<%
    Connection conn = null;//声明Connection对象
    PreparedStatement ps = null;
    ResultSet rs = null;
    String username = request.getParameter("username");
    String pwd = request.getParameter("pwd");
    session.setAttribute("username",username);
    boolean flag = false;
%>
<%
    //遍历查询结果集
    try{
        //加载驱动程序
        Class.forName(DBDRIVER);
        //1.getConnection()方法，连接MySQL数据库！！
        conn= DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
        String sql="SELECT * FROM tb_user WHERE username=? AND password=?";
        ps=conn.prepareStatement(sql);
        ps.setString(1,username);
        ps.setString(2,pwd);
        rs=ps.executeQuery();
        while(rs.next()){
//            String c = rs.getString(1);
//            String a = rs.getString(2);
//            String b = rs.getString(3);
//            System.out.print("username and pwd:"+" "+c+" "+a+" "+b);
            flag = true;
        }
    }catch (Exception e){
        e.printStackTrace();
    }
%>
<%
    if(flag){
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<%
}else {
%>
<jsp:forward page="error.jsp"></jsp:forward>
<%
    }
%>

