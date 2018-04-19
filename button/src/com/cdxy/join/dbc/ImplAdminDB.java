package com.cdxy.join.dbc;

import com.cdxy.join.vo.UserInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ImplAdminDB {
    private Connection connection;
    private DataBaseConnection dbc;
    public ImplAdminDB(DataBaseConnection dataBaseConnection){
        this.dbc = dataBaseConnection;
        connection = dataBaseConnection.getConnection();
    }

    public boolean checkUser(UserInfo  userInfo){
        boolean flag = false;
        String sql = "SELECT* FROM tb_s_user WHERE username=? AND password=?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,userInfo.getUsername());
            ps.setString(2,userInfo.getPassword());
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                flag = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    public List<UserInfo> findAll(){
        List<UserInfo> list = new ArrayList<>();
        String sql = "SELECT* FROM tb_s_user";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                UserInfo userInfo = new UserInfo();
                userInfo.setUsername(rs.getString("username"));
                userInfo.setPassword(rs.getString("password"));
                list.add(userInfo);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public void addUser(UserInfo userInfo){
        String sql = "INSERT INTO tb_s_user(username,password) VALUES (?,?)";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,userInfo.getUsername());
            ps.setString(2,userInfo.getPassword());
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void deleteUser(int id){
        String sql = "DELETE* FORM tb_s_user WHERE id=?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
