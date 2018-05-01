package com.chinasofti.crm.domain;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by zxk on 2017/8/9 0009.
 */

//商品类
public class Goods implements Serializable {

    //编号
    private Integer goodsNo;

    //商品编号
    private String goodsId;

    //商品名称
    private String goodsName;

    //商品型号
    private String goodsModel;

    //等级批次
    private String goodsLevel;

    //商品数量
    private int goodsNum;

    //商品单位
    private  String goodsCom;

    //商品单价
    private double goodsPrice;

    //备注
    private String goodsMeno;

//订单集合
    @JSONField(serialize = false)
    private transient  Set<Orders> orderses=new HashSet<Orders>();

    public Set<Orders> getOrderses() {
        return orderses;
    }

    public void setOrderses(Set<Orders> orderses) {
        this.orderses = orderses;
    }

    public Goods() {
    }

    public Integer getGoodsNo() {
        return goodsNo;
    }

    public void setGoodsNo(Integer goodsNo) {
        this.goodsNo = goodsNo;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public int getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(int goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getGoodsCom() {
        return goodsCom;
    }

    public void setGoodsCom(String goodsCom) {
        this.goodsCom = goodsCom;
    }

    public double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsModel() {
        return goodsModel;
    }

    public void setGoodsModel(String goodsModel) {
        this.goodsModel = goodsModel;
    }

    public String getGoodsLevel() {
        return goodsLevel;
    }

    public void setGoodsLevel(String goodsLevel) {
        this.goodsLevel = goodsLevel;
    }

    public String getGoodsMeno() {
        return goodsMeno;
    }

    public void setGoodsMeno(String goodsMeno) {
        this.goodsMeno = goodsMeno;
    }

}
