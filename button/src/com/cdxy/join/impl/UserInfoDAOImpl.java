package com.cdxy.join.impl;

import com.cdxy.join.idao.IUserInfoDAO;
import com.cdxy.join.vo.UserInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserInfoDAOImpl implements IUserInfoDAO{
    private Connection conn;
    private PreparedStatement ps;
    public UserInfoDAOImpl(Connection conn){
        this.conn = conn;
    }
    @Override
    public int addUser(UserInfo userInfo) {
        int flag = 0;
        String sql ="INSERT INTO tb_user (username,password) VALUES (?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,userInfo.getUsername());
            ps.setString(2,userInfo.getPassword());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    @Override
    public int addAdmin(UserInfo userInfo) {
        int flag = 0;
        String sql ="INSERT INTO tb_s_user (username,password) VALUES (?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,userInfo.getUsername());
            ps.setString(2,userInfo.getPassword());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    @Override
    public UserInfo findByUserNo(String userno) {
        return null;
    }

    @Override
    public UserInfo findByAdminNo(String userno) {
        return null;
    }

    @Override
    public List<UserInfo> findUserAll() {
        return null;
    }

    @Override
    public List<UserInfo> findAdminAll() {
        return null;
    }

    @Override
    public boolean checkUser(UserInfo userInfo) {
        boolean flag = false;
        String sql = "SELECT* FROM tb_user WHERE username=? AND password=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
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

    @Override
    public boolean checkAdmin(UserInfo userInfo) {
        boolean flag = false;
        String sql = "SELECT* FROM tb_s_user WHERE username=? AND password=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
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
}
