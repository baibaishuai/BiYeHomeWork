package com.cdxy.join.controller;

import com.cdxy.join.factory.Factory;
import com.cdxy.join.vo.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> list = new ArrayList<>();
        req.setCharacterEncoding("UTF-8");
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(req.getParameter("username"));
        userInfo.setPassword (req.getParameter("pwd"));
        String category = req.getParameter("sel");
        if (userInfo.getUsername() == null || "".equals(userInfo.getUsername()))
            list.add("用户名不能为空！");
        if (userInfo.getPassword() == null || "".equals(userInfo.getPassword()))
            list.add("密码不能为空! ");
        if (list.size()>0){
            req.setAttribute("error",list);
            req.getRequestDispatcher("error.jsp").forward(req,resp);
        }
        try {
            if(category.equals("stadiumUser")){
                boolean flag = Factory.getUserInfoDAOImplProxy().checkUser(userInfo);
                if (flag){
                    req.getSession().setAttribute("USER",userInfo.getUsername());
                    resp.sendRedirect("userInterface.jsp");
                }else{
                    list.add("用户名或密码有误!");
                    req.setAttribute("error",list);
                    req.getRequestDispatcher("error.jsp").forward(req,resp);
                }
            }else {
                boolean flag = Factory.getUserInfoDAOImplProxy().checkAdmin(userInfo);
                if (flag){
                    req.getSession().setAttribute("USER",userInfo.getUsername());
                    resp.sendRedirect("admin.jsp");
                }else{
                    list.add("用户名或密码有误!");
                    req.setAttribute("error",list);
                    req.getRequestDispatcher("error.jsp").forward(req,resp);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
