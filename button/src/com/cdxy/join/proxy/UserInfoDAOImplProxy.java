package com.cdxy.join.proxy;

import com.cdxy.join.dbc.DataBaseConnection;
import com.cdxy.join.idao.IUserInfoDAO;
import com.cdxy.join.impl.UserInfoDAOImpl;
import com.cdxy.join.vo.UserInfo;

import java.util.List;

public class UserInfoDAOImplProxy implements IUserInfoDAO{
    private DataBaseConnection dataBaseConnection;
    private UserInfoDAOImpl userInfoDAOImpl;
    public UserInfoDAOImplProxy(){
        dataBaseConnection = new DataBaseConnection();
        userInfoDAOImpl = new UserInfoDAOImpl(dataBaseConnection.getConnection());
    }
    @Override
    public int addUser(UserInfo userInfo) {
        int flag = 0;
        flag = userInfoDAOImpl.addUser(userInfo);
        dataBaseConnection.close();
        return flag;
    }

    @Override
    public int addAdmin(UserInfo userInfo) {
        int flag = 0;
        flag = userInfoDAOImpl.addAdmin(userInfo);
        dataBaseConnection.close();
        return flag;
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
        boolean flag;
        flag = userInfoDAOImpl.checkUser(userInfo);
        dataBaseConnection.close();
        return flag;
    }

    @Override
    public boolean checkAdmin(UserInfo userInfo) {
        boolean flag;
        flag = userInfoDAOImpl.checkAdmin(userInfo);
        dataBaseConnection.close();
        return flag;
    }
}
