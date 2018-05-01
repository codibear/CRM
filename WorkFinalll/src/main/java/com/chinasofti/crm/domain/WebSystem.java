package com.chinasofti.crm.domain;

import java.io.Serializable;

/**
 * Created by 杨广 on 2017/8/13.
 */
public class WebSystem implements Serializable {
    private String systemname;
    private String syslogoip;
    private int sysremid;
    private String title;
    private String copyright;

    public String getSystemname() {
        return systemname;
    }

    public void setSystemname(String systemname) {
        this.systemname = systemname;
    }

    public String getSyslogoip() {
        return syslogoip;
    }

    public void setSyslogoip(String syslogoip) {
        this.syslogoip = syslogoip;
    }

    public int getSysremid() {
        return sysremid;
    }

    public void setSysremid(int sysremid) {
        this.sysremid = sysremid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }
}
