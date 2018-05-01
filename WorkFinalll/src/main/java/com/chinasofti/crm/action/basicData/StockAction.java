package com.chinasofti.crm.action.basicData;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.StockBiz;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Stock;
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
 * Created by jlkj on 2017/8/9.
 */
public class StockAction extends ActionSupport{
    private StockBiz stockBiz;
    private Stock stock;
    private int currentPage;

    private String goodsName;
    private String wareHouse;
    private static org.apache.log4j.Logger logger= org.apache.log4j.Logger.getLogger(StockAction.class);

    public String find()throws Exception{


        List<String> list=new ArrayList();
         List<Stock> stocks=null;
        String sql="from Stock where 1=1 ";
        if (goodsName!=""){
            sql+=" and goodsName="+"?";
            list.add(goodsName);
            System.out.println(goodsName);
        }if (wareHouse!=""){
            sql+=" and wareHouse=?";
            list.add(wareHouse);
            System.out.println(wareHouse);
        }
        System.out.println(sql);

        String[] p = new String[list.size()];

        list.toArray(p);//将转化后的数组放入已经创建好的对象中

//            System.out.println(sql);

            stocks=stockBiz.find(sql,p);

           System.out.println(stocks);
       HttpServletResponse response = ServletActionContext.getResponse();
       response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
       PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(stocks);
       pw.write(json);

//        //日志记录
//        logger.info("动态查询");

        return NONE;

    }


//    查询所有
    public String list()throws Exception {
        List<Stock> stocks=this.stockBiz.findAll();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(stocks);
        pw.write(json);
//        //日志记录
//        logger.info("查询所有");
        return NONE;
    }
//分页查询
    public String pageList() throws Exception {
        System.out.print(currentPage);
        //第一步先获取DetachedCriteria对象
        DetachedCriteria dc = DetachedCriteria.forClass(Stock.class);

        //第二步：调用biz层find方法，获取page对象
        Page page = stockBiz.find(dc, currentPage, 1);

        //第三步：将page对象进行json转换
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        String jsonStr = JSON.toJSONString(page);
        out.write(jsonStr);
//        //日志记录
//        logger.info("分页查询");
        return NONE;
    }


    //模糊查询
    public String select()throws Exception{

        //查询商品
        List<Stock> stocks=this.stockBiz.select(goodsName);
        Set<String> stockses=new HashSet<String>();
        for (Stock v:stocks){
            stockses.add(v.getGoodsName());
        }
        System.out.println("<<<<<<<"+goodsName);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(stockses);
        pw.write(json);
        return NONE;
    }
    public String findWare() throws Exception{
        //查询仓库
       List<Stock> stocks2=  this.stockBiz.selectware(wareHouse);
        Set<String> stockses=new HashSet<String>();
        for (Stock v:stocks2){
            stockses.add(v.getWareHouse());
        }

        System.out.println("<<<<<<<"+wareHouse);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(stockses);
        pw.write(json);
        return NONE;
    }

//
//    //    查询后分页
//    public String page() throws Exception{
//        DetachedCriteria dc = DetachedCriteria.forClass(Stock.class);
//        String goodsName=getGoodsName();
//        String  wareHouse = getWareHouse();
//        Page page =null;
//        if(goodsName!=null&&wareHouse==null){
//            String sql="goodsName='"+goodsName+"'";
//            dc.add(Restrictions.eq("goodsName",goodsName));
//            System.out.println(sql);
//            page = stockBiz.find(dc,currentPage,2,sql);
//            //日志记录
//            logger.info("查询商品名下库存内容");
//        }else if(goodsName==null&&wareHouse!=null){
//            String sql="wareHouse='"+wareHouse+"'";
//            dc.add(Restrictions.eq("wareHouse",wareHouse));
//            System.out.println(sql);
//            page = stockBiz.find(dc,currentPage,2,sql);
//            //日志记录
//            logger.info("查询仓库名下库存内容");
//        }else if (goodsName!=null&&wareHouse!=null){
//            String sql="goodsName='"+goodsName+"'and wareHouse='"+wareHouse+"'";
//            dc.add(Restrictions.eq("goodsName",goodsName));
//            dc.add(Restrictions.eq("wareHouse",wareHouse));
//            System.out.println(sql);
//            page = stockBiz.find(dc,currentPage,2,sql);
//            //日志记录
//            logger.info("查询商品名和仓库名下具体库存内容");
//        }
//        HttpServletResponse response = ServletActionContext.getResponse();
//        response.setCharacterEncoding("UTF-8");
//        //将文件的类型设置为json格式
//        response.setContentType("text/json");
//        PrintWriter out = response.getWriter();
//        String jsonStr = JSON.toJSONString(page);
//        out.write(jsonStr);
//
//        return NONE;
//    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public StockBiz getStockBiz() {
        return stockBiz;
    }

    public void setStockBiz(StockBiz stockBiz) {
        this.stockBiz = stockBiz;
    }

    public Stock getStock() {
        return stock;
}

public void setStock(Stock stock) {
        this.stock = stock;
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
}
