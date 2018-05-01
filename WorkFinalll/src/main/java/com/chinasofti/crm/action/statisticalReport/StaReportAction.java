package com.chinasofti.crm.action.statisticalReport;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.StaReportBiz;
import com.chinasofti.crm.domain.CstLost;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by fzm on 2017/8/10.
 */
public class StaReportAction extends ActionSupport {

    private StaReportBiz staReportBiz;


    private String rank;//等级
    private String tez;//客户分析的年份值

    //定义的 客户名称和客户经理 的属性
    private String customerName;
    private String customerManager;

    //客户贡献分析
    public String findSumMoney() throws Exception {
        List list = this.staReportBiz.findSumMoney();

        HttpServletResponse response = ServletActionContext.getResponse();
        String jsonStr = null;
        if (list.size() == 0) {
            jsonStr = "0";

        } else {
            jsonStr = JSON.toJSONString(list);
        }
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        out.write(jsonStr);


        return NONE;
    }

    //客户名称和年份
    public String findCustAndYear() throws Exception {
        List list = this.staReportBiz.findCustAndYear();

        HttpServletResponse response = ServletActionContext.getResponse();

        String jsonStr = null;
        if (list.size() == 0) {
            jsonStr = "0";

        } else {
            jsonStr = JSON.toJSONString(list);
        }

        response.setContentType("text/json");

        PrintWriter out = response.getWriter();
        out.write(jsonStr);

        return NONE;
    }

    ;


    //客户流失分析

    /**
     * 查看流失原因及其对应的数量
     */
    public String findLstReason() throws Exception {
        List list = this.staReportBiz.findLstReason();

        HttpServletResponse response = ServletActionContext.getResponse();
        String jsonStr = null;
        if (list.size() == 0) {
            jsonStr = "0";

        } else {
            jsonStr = JSON.toJSONString(list);
        }
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        out.write(jsonStr);


        return NONE;
    }


    /**
     * 客户流失数量按年份显示
     */

    public String findByYear() throws IOException {

        List list = this.staReportBiz.findByYear();

        HttpServletResponse response = ServletActionContext.getResponse();

        String jsonStr = null;
        if (list.size() == 0) {
            jsonStr = "0";

        } else {
            jsonStr = JSON.toJSONString(list);
        }

        response.setContentType("text/json");

        PrintWriter out = response.getWriter();
        out.write(jsonStr);


        return NONE;
    }

    /**
     * 客户流失年份
     */
    public String findYear() throws IOException {
        List list = this.staReportBiz.findYear();
        HttpServletResponse response = ServletActionContext.getResponse();
        String jsonStr = null;
        if (list.size() == 0) {
            jsonStr = "0";
            System.out.println("text::::"+jsonStr);
        } else {
            jsonStr = JSON.toJSONString(list);
        }
        response.setContentType("text/json");

        PrintWriter out = response.getWriter();

        out.write(jsonStr);

        return NONE;
    }

    /**
     * 客户流失页按条件查询
     */
    public String findByAsk() throws Exception {

        String cusName = getCustomerName();
        String cusManagerName = getCustomerManager();

        List<CstLost> list = this.staReportBiz.findByAsk(cusName, cusManagerName);

        HttpServletResponse response = ServletActionContext.getResponse();

        String jsonStr = null;


        if (list.size() == 0) {
            CstLost c = new CstLost();

            c.setLstId(0);

            list.add(c);
        }else{
            //mySql取日期数据去掉结尾“ .0 ”
            for(int i=0;i<list.size();i++){
                CstLost cstLost=list.get(i);
                String  lostDate=cstLost.getLstLostDate();
                Date newdate= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(lostDate);
                String lastOrder = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(newdate);

                String lost=cstLost.getLstLostDate();
                Date  newlost= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(lost);
                String losstime= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(newlost);


                cstLost.setLstLastOrderDate( lastOrder);
                cstLost.setLstLostDate(losstime);
                list.set(i,cstLost);
            }
        }



        jsonStr = JSON.toJSONString(list);

        response.setContentType("text/json");

        PrintWriter out = response.getWriter();

        out.write(jsonStr);


        return NONE;
    }


    //客户构成
    /*查询所有客户*/
    public String find() throws IOException {

        List list = staReportBiz.findAll();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");

        String jsonStr=null;
        if (list.size() == 0) {
            jsonStr = "0";

        } else {
            jsonStr = JSON.toJSONString(list);
        }

        response.getWriter().write(jsonStr);

        return NONE;
    }

    /*通过等级查询*/
    public String findByRank() throws Exception {

        List list = staReportBiz.findByRank(rank);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        String jsonStr=null;
        if (list.size() == 0) {
            jsonStr = "0";

        } else {
            jsonStr = JSON.toJSONString(list);
        }
        response.getWriter().write(jsonStr);

        return NONE;
    }

    /*通过满意度查询*/
    public String findBySatisfy() throws IOException {

        List list = staReportBiz.findBySatisfy();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        String jsonStr=null;
        if (list.size() == 0) {
            jsonStr = "0";

        } else {
            jsonStr = JSON.toJSONString(list);
        }
        response.getWriter().write(jsonStr);
//


        return NONE;
    }


    /*通过信誉度查询*/
    public String findByCredit() throws IOException {

        List list = staReportBiz.findByCredit();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        String jsonStr=null;
        if (list.size() == 0) {
            jsonStr = "0";

        } else {
            jsonStr = JSON.toJSONString(list);
        }
        response.getWriter().write(jsonStr);

        return NONE;
    }
    /*客户服务分析*/
    public String list() throws  Exception{
        List list=null;

        if (tez.equals("所有")) {

            list = this.staReportBiz.cfindAll();
        }else {

            list=this.staReportBiz.findByDate(new Integer(Integer.valueOf(tez)));
        }

        HttpServletResponse response = ServletActionContext.getResponse() ;
        String jsonStr= JSON.toJSONString(list);
        //将文件转换成json文件
        response.setContentType("text/json");
        PrintWriter out=response.getWriter();
        out.write(jsonStr);

        return NONE;

    }
    public String list2() throws Exception{

        List list2=this.staReportBiz.findByDateTwo();
        HttpServletResponse response = ServletActionContext.getResponse() ;
        String jsonStr= JSON.toJSONString(list2);
        //将文件转换成json文件
        response.setContentType("text/json");
        PrintWriter out=response.getWriter();
        out.write(jsonStr);

        return NONE;
    }


    //属性的get，set方法
    public StaReportBiz getStaReportBiz() {
        return staReportBiz;
    }

    public void setStaReportBiz(StaReportBiz staReportBiz) {
        this.staReportBiz = staReportBiz;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerManager() {
        return customerManager;
    }

    public void setCustomerManager(String customerManager) {
        this.customerManager = customerManager;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getTez() {
        return tez;
    }

    public void setTez(String tez) {
        this.tez = tez;
    }
}

