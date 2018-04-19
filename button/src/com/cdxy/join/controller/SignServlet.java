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

public class SignServlet extends HttpServlet {
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
        userInfo.setPassword (req.getParameter("password"));
        String passwordPlus = req.getParameter("password+");
        if (userInfo.getUsername() == null || "".equals(userInfo.getUsername()))
            list.add("用户名不能为空！");
        if (userInfo.getPassword() == null )
            list.add("密码不能为空! ");
        if (passwordPlus == null || "".equals(passwordPlus))
            list.add("确定密码不能为空! ");
        if (passwordPlus != userInfo.getPassword())
            list.add("两次输入的密码必须相同! ");
        if (list.size()>0){
            req.setAttribute("error",list);
            req.getRequestDispatcher("signError.jsp").forward(req,resp);
        }
        try {

                boolean flag = Factory.getUserInfoDAOImplProxy().checkAdmin(userInfo);
                if (flag){
                    list.add("账号已存在！！！");
                    req.setAttribute("error",list);
                    req.getRequestDispatcher("signError.jsp").forward(req,resp);
                }else{
                    list.add("注册成功!！！");
                    req.setAttribute("error",list);
                    req.getRequestDispatcher("success.jsp").forward(req,resp);

                }

        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
