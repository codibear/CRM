package com.chinasofti.crm.domain;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by zxk on 2017/8/9 0009.
 */
//订单类
public class Orders implements Serializable {

    //订单编号
    private Integer  orderId;

    //客户编号
    private String orderCusNo;

    //客户名称
    private String orderCusName;

    //订单日期
    private Date orderTime;

    //订单地址
    private String orderAddr;

    //订单金额
    private double orderMoney;

    //订单状态
    private String orderStatic ;

    //订单商品关系表对象
    private Set<Goods> goodses = new HashSet<Goods>();


    @JSONField(serialize = false)
    private transient Customer customer;


    public Orders() {
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderCusNo() {
        return orderCusNo;
    }

    public void setOrderCusNo(String orderCusNo) {
        this.orderCusNo = orderCusNo;
    }

    public String getOrderCusName() {
        return orderCusName;
    }

    public void setOrderCusName(String orderCusName) {
        this.orderCusName = orderCusName;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderAddr() {
        return orderAddr;
    }

    public void setOrderAddr(String orderAddr) {
        this.orderAddr = orderAddr;
    }

    public double getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(double orderMoney) {
        this.orderMoney = orderMoney;
    }

    public String getOrderStatic() {
        return orderStatic;
    }

    public void setOrderStatic(String orderStatic) {
        this.orderStatic = orderStatic;
    }

    public Set<Goods> getGoodses() {
        return goodses;
    }

    public void setGoodses(Set<Goods> goodses) {
        this.goodses = goodses;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
