package com.chinasofti.crm.action.customer;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.GoodsAndOrderBiz;
import com.chinasofti.crm.domain.GoodsAndOrder;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class GoodsAndOrderAction extends ActionSupport {
    private GoodsAndOrder goodsAndOrder;
    private GoodsAndOrderBiz goodsAndOrderBiz;

    public GoodsAndOrder getGoodsAndOrder() {
        return goodsAndOrder;
    }

    public void setGoodsAndOrder(GoodsAndOrder goodsAndOrder) {
        this.goodsAndOrder = goodsAndOrder;
    }

    public GoodsAndOrderBiz getGoodsAndOrderBiz() {
        return goodsAndOrderBiz;
    }

    public void setGoodsAndOrderBiz(GoodsAndOrderBiz goodsAndOrderBiz) {
        this.goodsAndOrderBiz = goodsAndOrderBiz;
    }

    public String save() {
        this.goodsAndOrderBiz.save(goodsAndOrder);
        return "success";
    }

    public String modify() {
        this.goodsAndOrderBiz.modify(goodsAndOrder);
        return "success";
    }

    public String delete() {
        this.goodsAndOrderBiz.delete(goodsAndOrder);
        return "success";
    }

    public String list() throws Exception {
        List<GoodsAndOrder> goodsAndOrders = this.goodsAndOrderBiz.findAll();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(goodsAndOrders);
        pw.write(json);
        return NONE;
    }
}
