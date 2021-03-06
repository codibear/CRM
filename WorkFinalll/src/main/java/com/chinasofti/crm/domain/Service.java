package com.chinasofti.crm.domain;

import java.io.Serializable;
import java.util.Date;

public class Service implements Serializable{
    //  服务编号
    private String serviceId ;
    //  服务类型
    private String serviceType ;
    //  服务概要
    private String serviceOutline ;
    //  客户名称
    private String cusName ;
    //  服务状态
    private String serviceState ;
    //  服务请求
    private String serviceRequest ;
    //  服务创建人
    private String serviceCreateUser ;
    //  服务创建时间
    private Date serviceCreateTime ;
    //  服务分配时间
    private Date serviceAlloTime ;
    //  服务分配者
    private String serviceAlloUser ;
    //  服务处理人
    private String serviceDealUser ;
    //  服务处理时间
     private Date serviceDealTime ;
    //  服务处理
     private String serviceDealContent ;
    //  服务处理结果
     private String serviceDealResult ;
    //  服务满意度
    private String serviceSatisfy ;
    //  客户拼音
    private String pinyin ;
    //  客户经理id
    private Integer managerId;

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getServiceOutline() {
        return serviceOutline;
    }

    public void setServiceOutline(String serviceOutline) {
        this.serviceOutline = serviceOutline;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getServiceState() {
        return serviceState;
    }

    public void setServiceState(String serviceState) {
        this.serviceState = serviceState;
    }

    public String getServiceRequest() {
        return serviceRequest;
    }

    public void setServiceRequest(String serviceRequest) {
        this.serviceRequest = serviceRequest;
    }

    public String getServiceCreateUser() {
        return serviceCreateUser;
    }

    public void setServiceCreateUser(String serviceCreateUser) {
        this.serviceCreateUser = serviceCreateUser;
    }

    public Date getServiceCreateTime() {
        return serviceCreateTime;
    }

    public Date setServiceCreateTime(Date serviceCreateTime) {
        this.serviceCreateTime = serviceCreateTime;
        return serviceCreateTime;
    }

    public String getServiceDealUser() {
        return serviceDealUser;
    }

    public void setServiceDealUser(String serviceDealUser) {
        this.serviceDealUser = serviceDealUser;
    }

    public Date getServiceDealTime() {
        return serviceDealTime;
    }

    public void setServiceDealTime(Date serviceDealTime) {
        this.serviceDealTime = serviceDealTime;
    }

    public String getServiceDealContent() {
        return serviceDealContent;
    }

    public void setServiceDealContent(String serviceDealContent) {
        this.serviceDealContent = serviceDealContent;
    }

    public String getServiceDealResult() {
        return serviceDealResult;
    }

    public void setServiceDealResult(String serviceDealResult) {
        this.serviceDealResult = serviceDealResult;
    }

    public String getServiceSatisfy() {
        return serviceSatisfy;
    }

    public void setServiceSatisfy(String serviceSatisfy) {
        this.serviceSatisfy = serviceSatisfy;
    }

    public Date getServiceAlloTime() {
        return serviceAlloTime;
    }

    public void setServiceAlloTime(Date serviceAlloTime) {
        this.serviceAlloTime = serviceAlloTime;
    }

    public String getServiceAlloUser() {
        return serviceAlloUser;
    }

    public void setServiceAlloUser(String serviceAlloUser) {
        this.serviceAlloUser = serviceAlloUser;
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }
}
