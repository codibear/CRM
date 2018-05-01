package com.chinasofti.crm.domain;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2017/8/9.
 */
//客户联系人信息表
public class CstLinkman implements Serializable{
//    编号
    private int lkmId;
//    客户编号
    private String lkmCustNo;
//    客户名称
    private String lkmCustName;
//    联系人姓名
    private String lkmName;
//    联系人性别
    private String lkmSex;
//    联系人职位
    private String lkmPostion;
//    电话
    private String lkmTel;
//    备注
    private String lkmMemo;

    //联系人生日
    private Date lkmBirthday;

    //客户
@JSONField(serialize=false)
    private transient Customer customer;


    public int getLkmId() {
        return lkmId;
    }

    public void setLkmId(int lkmId) {
        this.lkmId = lkmId;
    }

    public String getLkmMemo() {
        return lkmMemo;
    }

    public void setLkmMemo(String lkmMemo) {
        this.lkmMemo = lkmMemo;
    }

    public String getLkmPostion() {
        return lkmPostion;
    }

    public void setLkmPostion(String lkmPostion) {
        this.lkmPostion = lkmPostion;
    }

    public String getLkmCustNo() {
        return lkmCustNo;
    }

    public void setLkmCustNo(String lkmCustNo) {
        this.lkmCustNo = lkmCustNo;
    }

    public String getLkmCustName() {
        return lkmCustName;
    }

    public void setLkmCustName(String lkmCustName) {
        this.lkmCustName = lkmCustName;
    }

    public String getLkmName() {
        return lkmName;
    }

    public void setLkmName(String lkmName) {
        this.lkmName = lkmName;
    }

    public String getLkmSex() {
        return lkmSex;
    }

    public void setLkmSex(String lkmSex) {
        this.lkmSex = lkmSex;
    }

    public String getLkmTel() {
        return lkmTel;
    }

    public void setLkmTel(String lkmTel) {
        this.lkmTel = lkmTel;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getLkmBirthday() {
        return lkmBirthday;
    }

    public void setLkmBirthday(Date lkmBirthday) {
        this.lkmBirthday = lkmBirthday;
    }
}