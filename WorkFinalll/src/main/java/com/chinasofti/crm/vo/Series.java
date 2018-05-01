package com.chinasofti.crm.vo;

import java.util.List;

/**
 * Created by Tingyu
 * Time : 2017/8/10
 */
public class Series{
    private String serName;  //临时对象名称
    private List serList;    //临时对象对应list

    //构造方法
    public Series() {
    }

    public Series(String serName, List serList) {
        this.serName = serName;
        this.serList = serList;
    }

    //get和set方法
    public String getSerName() {
        return serName;
    }

    public void setSerName(String serName) {
        this.serName = serName;
    }

    public List getSerList() {
        return serList;
    }

    public void setSerList(List serList) {
        this.serList = serList;
    }

    //toString方法
    @Override
    public String toString() {
        return "{" + "name:'" + serName +"', data:" + serList + "},";
    }
}
