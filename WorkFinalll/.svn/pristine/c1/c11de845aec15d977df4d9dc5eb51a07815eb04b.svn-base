package com.chinasofti.crm.action.customer;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.GoodsBiz;
import com.chinasofti.crm.domain.Goods;
import com.chinasofti.crm.domain.Page;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/8/9.
 */
public class GoodsAction extends ActionSupport {
    private Goods goods;
    private GoodsBiz goodsBiz;
    private int currentPage;//商品名称
    private String goodsName;

    //商品型号
    private String goodsModel;
    //等级批次
    private String goodsLevel;
    private static org.apache.log4j.Logger logger= org.apache.log4j.Logger.getLogger(GoodsAction.class);


    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
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

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public GoodsBiz getGoodsBiz() {
        return goodsBiz;
    }

    public void setGoodsBiz(GoodsBiz goodsBiz) {
        this.goodsBiz = goodsBiz;
    }

    public String save() {
        this.goodsBiz.save(goods);
        return "success";
    }

    public String modify() {
        this.goodsBiz.modify(goods);
        return "success";
    }

    public String delete() {
        this.goodsBiz.delete(goods);
        return "success";
    }

    public String list() throws Exception {
        List<Goods> goodss = this.goodsBiz.findAll();
        for (int i = 0; i < goodss.size(); i++) {
            Goods goods = goodss.get(i);
            System.out.println("商品名称是：" + goods.getGoodsName());
        }
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(goodss);
        System.out.println(json);
        pw.write(json);
//        //日志记录
//        logger.info("查询所有");
        return NONE;
    }
    //动态查询
    public String find() throws Exception{
        List<String> list = new ArrayList();
        List<Goods> goodses = null;
        String sql = "from Goods where 1=1";
        if ( goodsName!= "") {
            sql += " and goodsName=" + "?";
            list.add(goodsName);
        }
        if (goodsModel!=""){
            sql +="and goodsModel="+"?";
            list.add(goodsModel);
        }
        if (goodsLevel!=""){
            sql +="and goodsLevel="+"?";
            list.add(goodsLevel);
        }
        System.out.println(sql);

        String[] p = new String[list.size()];

        list.toArray(p);//将转化后的数组放入已经创建好的对象中

//            System.out.println(sql);
            goodses=goodsBiz.find(sql,p);
            System.out.println(goodses);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(goodses);
        pw.write(json);
//        //日志记录
//        logger.info("产品动态查询");
        return NONE;
    }

    //分页查询
    public String pageList() throws Exception {
        System.out.print(currentPage);
        //第一步先获取DetachedCriteria对象
        DetachedCriteria dc = DetachedCriteria.forClass(Goods.class);

        //第二步：调用biz层find方法，获取page对象
        Page page = goodsBiz.find(dc, currentPage, 2);

        //第三步：将page对象进行json转换
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        String jsonStr = JSON.toJSONString(page);
        out.write(jsonStr);
//        //日志记录
//        logger.info("产品分页查询");
        return NONE;
    }

    //模糊查询
    public String selectName()throws Exception{

        //查询商品
        List<Goods> goodses=this.goodsBiz.selectName(goodsName);
        Set<String> goods=new HashSet<String>();
        for (Goods v:goodses){
            goods.add(v.getGoodsName());
        }
        System.out.println("<<<<<<<"+goodsName);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(goods);
        pw.write(json);
        return NONE;
    }
    public String findModel() throws Exception{
        List<Goods> goodses2=this.goodsBiz.selectModel(goodsModel);

        Set<String> goods=new HashSet<String>();
        for (Goods v:goodses2){
            goods.add(v.getGoodsModel());
        }
        System.out.println("<<<<<<<"+goodsModel);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(goods);
        pw.write(json);
        return NONE;
    }
    public String findLevel() throws Exception{
        List<Goods> goodses3=this.goodsBiz.selectLevel(goodsLevel);
        Set<String> goods=new HashSet<String>();
        for (Goods v:goodses3){
            goods.add(v.getGoodsLevel());
        }
        System.out.println("<<<<<<<"+goodsLevel);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(goods);
        pw.write(json);
        return NONE;
    }



}
