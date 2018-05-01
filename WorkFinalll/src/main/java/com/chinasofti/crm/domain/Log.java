package com.chinasofti.crm.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by  Li min  on 2017/8/14.
 */
public class Log implements Serializable{
    private Integer id;
    private  Integer userId;
    private String userName;
    private Date createtime;
    private String meothod;
    private String IP;
    private String msg;

    public Log() {
    }

    public Log(Integer id, Integer userId, String userName, Date createtime, String meothod, String IP, String msg) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.createtime = createtime;
        this.meothod = meothod;
        this.IP = IP;
        this.msg = msg;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getMeothod() {
        return meothod;
    }

    public void setMeothod(String meothod) {
        this.meothod = meothod;
    }

    public String getIP() {
        return IP;
    }

    public void setIP(String IP) {
        this.IP = IP;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", createtime=" + createtime +
                ", meothod='" + meothod + '\'' +
                ", IP='" + IP + '\'' +
                ", msg='" + msg + '\'' +
                '}';
    }
}
