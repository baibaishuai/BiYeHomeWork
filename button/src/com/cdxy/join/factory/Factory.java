package com.cdxy.join.factory;

import com.cdxy.join.proxy.UserInfoDAOImplProxy;

public class Factory {
    public static UserInfoDAOImplProxy getUserInfoDAOImplProxy(){
        return new UserInfoDAOImplProxy();
    }
}
