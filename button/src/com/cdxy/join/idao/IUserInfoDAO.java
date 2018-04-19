package com.cdxy.join.idao;

import com.cdxy.join.vo.UserInfo;

import java.util.List;

public interface IUserInfoDAO {
    public int addUser(UserInfo userInfo);
    public int addAdmin(UserInfo userInfo);
    public UserInfo findByUserNo(String userno);
    public UserInfo findByAdminNo(String userno);
    public List<UserInfo> findUserAll();
    public List<UserInfo> findAdminAll();
    public boolean checkUser(UserInfo userInfo);
    public boolean checkAdmin(UserInfo userInfo);
}
