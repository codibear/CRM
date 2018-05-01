package com.chinasofti.crm.vo;

import java.io.IOException;

/**
 * Created by fzm on 2017/8/14.
 */
public class JDBC {
    /**
     * @param dbUrl  数据库连接url
     * @param dbUsername  数据库连接用户名
     * @param dbPassword  数据库连接密码
     * @param dbname  数据库名
     * @param IP  IP地址
     *
     *

     */
    private String dbUrl;
    private String dbUsername;
    private String dbPassword;
    private  String dbname;
    private  String IP;

    @Override
    public String toString() {
        return "JDBC{" +
                "dbUrl='" + dbUrl + '\'' +
                ", dbUsername='" + dbUsername + '\'' +
                ", dbPassword='" + dbPassword + '\'' +
                ", dbname='" + dbname + '\'' +
                ", IP='" + IP + '\'' +
                '}';
    }

    public JDBC() {
    }

    public JDBC(String dbUrl, String dbUsername, String dbPassword, String dbname, String IP) {
        this.dbUrl = dbUrl;
        this.dbUsername = dbUsername;
        this.dbPassword = dbPassword;
        this.dbname = dbname;
        this.IP = IP;
    }




    public String getDbUrl() {
        return dbUrl;
    }

    public void setDbUrl(String dbUrl) {
        this.dbUrl = dbUrl;
    }

    public String getDbUsername() {
        return dbUsername;
    }

    public void setDbUsername(String dbUsername) {
        this.dbUsername = dbUsername;
    }

    public String getDbPassword() {
        return dbPassword;
    }

    public void setDbPassword(String dbPassword) {
        this.dbPassword = dbPassword;
    }

    public String getDbname() {
        return dbname;
    }

    public void setDbname(String dbname) {
        this.dbname = dbname;
    }

    public String getIP() {
        return IP;
    }

    public void setIP(String IP) {
        this.IP = IP;
    }
}
