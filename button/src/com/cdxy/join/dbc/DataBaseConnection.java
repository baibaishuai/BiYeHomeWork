package com.cdxy.join.dbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseConnection {

    private String DBDRIVER = "com.mysql.jdbc.Driver";
    private String DBURL = "jdbc:mysql://localhost:3306/myfirstsql?useUnicode=true&characterEncoding=utf-8&userSSL=false";
    private String DBUSR ="root";
    private String DBPASSWORD = "bm123123";
    private Connection conn;

    public DataBaseConnection(){
        try{
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL,DBUSR,DBPASSWORD);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return conn;
    }

    public void close(){
        if(conn!=null){
            try{
                conn.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

}
