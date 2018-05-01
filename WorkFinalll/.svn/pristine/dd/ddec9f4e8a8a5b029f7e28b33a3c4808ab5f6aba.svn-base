package com.chinasofti.crm.action.quotation;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.OrderBiz;
import com.chinasofti.crm.biz.QuotationBiz;
import com.chinasofti.crm.biz.QuotationStatusBiz;
import com.chinasofti.crm.domain.*;
import com.chinasofti.crm.utils.QuotationExcelUtil;
import com.chinasofti.crm.utils.SendMailUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/8/12.
 */
public class QuotationProcessAction extends ActionSupport {
    private QuotationStatusBiz quotationStatusBiz;
    private QuotationBiz quotationBiz;
    private int currentPageNo=1;
    private PageBean<Quotation> pageBean=new PageBean();
    private int totalPageNo;
    private int pageSize;
    private Quotation quotation;
    private int  orderId;
    private String quotationStatus="";
    private List list;
    private int quotationId=0;
    private List<Quotation> l=new ArrayList<Quotation>();
    private String sql="";
    private String email;
    private OrderBiz orderBiz;
    private Orders order;
    private Set<Goods> goodses;
    private int quotationCreaterNo;
    public OrderBiz getOrderBiz() {
        return orderBiz;
    }

    public void setOrderBiz(OrderBiz orderBiz) {
        this.orderBiz = orderBiz;
    }

    //   分页
    public String partPage() throws IOException {
        System.out.println("进入分页方法"+pageSize+"-----"+currentPageNo);
        DetachedCriteria dc=findBySome();
        pageBean=quotationBiz.findAllData(dc,currentPageNo,pageSize,sql);
        sendJson();
        return NONE;
    }
    public String getPage() throws IOException {
        System.out.println("进入Page方法！！！！！");
        DetachedCriteria dc=findBySome();
        System.out.println(pageSize);
        System.out.println(currentPageNo);
        pageBean=quotationBiz.findAllData(dc,currentPageNo,pageSize,sql);
        sendJson();
        return NONE;
    }
    public String getPageNo() throws IOException {
        DetachedCriteria dc=findBySome();
        pageBean=quotationBiz.findAllData(dc,currentPageNo,pageSize,sql);
        sendJson();

        return NONE;
    }
    public String before() throws IOException {
        System.out.println("______________________"+quotationStatus);
        System.out.println("______________________"+quotationId);
        System.out.println(currentPageNo);
        pageBean.setCurrentPageNo(currentPageNo);
        pageBean.setCurrentPageNo(pageBean.getPreviewPageNo());
        System.out.println(pageBean.getCurrentPageNo());
        DetachedCriteria dc=findBySome();
        pageBean=quotationBiz.findAllData(dc,pageBean.getCurrentPageNo(),pageSize,sql);
        sendJson();
        return NONE;
    }
    public String after() throws IOException {
        System.out.println("______________________"+quotationStatus);
        System.out.println("______________________"+quotationId);
        pageBean.setCurrentPageNo(currentPageNo);
        pageBean.setTotalPageNo(totalPageNo);
        System.out.println("No>>>>>>>>>>>>>"+currentPageNo);
        System.out.println("total>>>>>>>>>>"+totalPageNo);
        pageBean.setCurrentPageNo(pageBean.getNextPageNo());
        DetachedCriteria dc=findBySome();
        pageBean=quotationBiz.findAllData(dc,pageBean.getCurrentPageNo(),pageSize,sql);
        sendJson();
        return NONE;
    }
    public void sendJson() throws IOException {
        System.out.println("json");
        HttpServletResponse response= ServletActionContext.getResponse();
        String jsonStr= JSON.toJSONString(pageBean);
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter pw=response.getWriter();
        pw.write(jsonStr);
    }
//    多条件查询
    public DetachedCriteria findBySome() throws IOException {
        DetachedCriteria dc=DetachedCriteria.forClass(Quotation.class);
        System.out.println(quotationId);
        System.out.println(">>>>>>>>>>>>>>>>>"+quotationStatus);
        System.out.println(quotationStatus);
        if(quotationId!=0&&quotationStatus.equals("全部")){
      dc=DetachedCriteria.forClass(Quotation.class);
            dc.add(Restrictions.eq("quotationId",quotationId)).add(Restrictions.eq("quotationCreaterNo",quotationCreaterNo));
       sql=" where quotationId="+quotationId+" and quotationCreaterNo="+quotationCreaterNo;
        }
        if(quotationId==0&&!quotationStatus.equals("全部")){
            System.out.println("本方法");
            dc=DetachedCriteria.forClass(Quotation.class);
            dc.add(Restrictions.eq("quotationStatus",quotationStatus)).add(Restrictions.eq("quotationCreaterNo",quotationCreaterNo));
            sql=" where quotationStatus="+"'"+quotationStatus+"' and quotationCreaterNo="+quotationCreaterNo;
        }
        if(quotationId!=0&&!quotationStatus.equals("全部")){
         dc=DetachedCriteria.forClass(Quotation.class);
            dc.add(Restrictions.eq("quotationId",quotationId)).add(Restrictions.eq("quotationStatus",quotationStatus)).add(Restrictions.eq("quotationCreaterNo",quotationCreaterNo));
      sql=" where quotationStatus="+"'"+quotationStatus+"'"+" and quotationId="+quotationId+" and quotationCreaterNo="+quotationCreaterNo;
        }
        if(quotationId==0&&quotationStatus.equals("全部")){
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>jinqu");
            System.out.println(quotationCreaterNo);
            dc=DetachedCriteria.forClass(Quotation.class);
            dc.add(Restrictions.eq("quotationCreaterNo",quotationCreaterNo));
            sql=" where quotationCreaterNo="+quotationCreaterNo;
        }
        return dc;
    }
//    获取全部状态
    public String getAllQuotationStruts() throws IOException {
       List<QuotationStatus> quotations=quotationStatusBiz.findAllQuotationStatus();
        HttpServletResponse response= ServletActionContext.getResponse();
        String jsonStr= JSON.toJSONString(quotations);
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter pw=response.getWriter();
        pw.write(jsonStr);
        return NONE;
    }
//    查询单个报价
    public String process(){
        System.out.println("进入处理方法......"+quotationId);
        System.out.println("订单编号>>>>>>>>>>>>"+orderId);

        quotation=quotationBiz.loadById(quotationId);
        System.out.println("》》》》》》》》》》》客户姓名"+quotation.getClientName());
        //根据前台传的orderId;
        order=orderBiz.loadbyid(orderId);
        goodses=order.getGoodses();
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>"+goodses.size());
        Iterator<Goods> i=goodses.iterator();
        while (i.hasNext()){
            Goods goods=new Goods();
            goods=i.next();
            System.out.println(goods.getGoodsName()+goods.getGoodsPrice());
        }
        return "success";
    }
//    修改报价
    public String update() throws IOException {
        System.out.println("进入本方法>>>>>>>>>>>>>>>>>>>>>.");
        Quotation quotation=new Quotation();
        quotation=quotationBiz.loadById(quotationId);
        quotation.setQuotationSales(this.quotation.getQuotationSales());
        quotation.setQuotationImplementation(this.quotation.getQuotationImplementation());
        quotation.setQuotationService(this.quotation.getQuotationService());
        quotation.setQuotationSpecialservice(this.quotation.getQuotationSpecialservice());
        quotation.setQuotationBudget(this.quotation.getQuotationBudget());
        quotation.setQuotationStatus("未审核");
        quotation.setQuotationTotal(this.quotation.getQuotationTotal());
        quotationBiz.update(quotation);
        HttpServletResponse response= ServletActionContext.getResponse();
        PrintWriter pw=response.getWriter();
        pw.write("修改成功!");
        return NONE;
    }
//    发送邮件
    public String submit() throws Exception {
      System.out.println("进入submit方法"+quotation.getQuotationId()+email);
        Quotation quotation=new Quotation();
    quotation=quotationBiz.loadById(this.quotation.getQuotationId());
     List<Quotation> quotations=new ArrayList<Quotation>();
        quotations.add(quotation);
        QuotationExcelUtil.Excel(quotations);
        SendMailUtil.send("596108929@qq.com",email);
        HttpServletResponse response= ServletActionContext.getResponse();
        PrintWriter pw=response.getWriter();
        pw.write("发送成功!");
        return NONE;
    }

    public void setQuotationBiz(QuotationBiz quotationBiz) {
        this.quotationBiz = quotationBiz;
    }

    public int getCurrentPageNo() {
        return currentPageNo;
    }

    public void setCurrentPageNo(int currentPageNo) {
        this.currentPageNo = currentPageNo;
    }

    public PageBean<Quotation> getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean<Quotation> pageBean) {
        this.pageBean = pageBean;
    }

    public int getTotalPageNo() {
        return totalPageNo;
    }

    public void setTotalPageNo(int totalPageNo) {
        this.totalPageNo = totalPageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public Quotation getQuotation() {
        return quotation;
    }

    public void setQuotation(Quotation quotation) {
        this.quotation = quotation;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getQuotationStatus() {
        return quotationStatus;
    }

    public void setQuotationStatus(String quotationStatus) {
        this.quotationStatus = quotationStatus;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getQuotationId() {
        return quotationId;
    }

    public void setQuotationId(int quotationId) {
        this.quotationId = quotationId;
    }

    public List<Quotation> getL() {
        return l;
    }

    public void setQuotationStatusBiz(QuotationStatusBiz quotationStatusBiz) {
        this.quotationStatusBiz = quotationStatusBiz;
    }

    public void setL(List<Quotation> l) {
        this.l = l;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public Set<Goods> getGoodses() {
        return goodses;
    }

    public void setGoodses(Set<Goods> goodses) {
        this.goodses = goodses;
    }

    public int getQuotationCreaterNo() {
        return quotationCreaterNo;
    }

    public void setQuotationCreaterNo(int quotationCreaterNo) {
        this.quotationCreaterNo = quotationCreaterNo;
    }
}

