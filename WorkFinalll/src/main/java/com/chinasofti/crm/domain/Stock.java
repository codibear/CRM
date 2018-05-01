package com.chinasofti.crm.domain;

import java.io.Serializable;

/**
 * Created by jlkj on 2017/8/9.
 */

//库存
public class Stock implements Serializable{
    private Integer stockId;//库存序号
    private String goodsName;//产品名称
    private String wareHouse;//仓库
    private String goodsLocal;//货位
    private Integer totalNum;//件数（库存）
    private String stockDesc;//库存备注

    //get/set方法
    public Integer getStockId() {
        return stockId;
    }

    public void setStockId(Integer stockId) {
        this.stockId = stockId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getWareHouse() {
        return wareHouse;
    }

    public void setWareHouse(String wareHouse) {
        this.wareHouse = wareHouse;
    }

    public String getGoodsLocal() {
        return goodsLocal;
    }

    public void setGoodsLocal(String goodsLocal) {
        this.goodsLocal = goodsLocal;
    }

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    public String getStockDesc() {
        return stockDesc;
    }

    public void setStockDesc(String stockDesc) {
        this.stockDesc = stockDesc;
    }
}
