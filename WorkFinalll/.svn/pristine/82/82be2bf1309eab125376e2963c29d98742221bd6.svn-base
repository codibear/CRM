package com.chinasofti.crm.action.quotation;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.OrderBiz;
import com.chinasofti.crm.biz.QuotationBiz;
import com.chinasofti.crm.biz.UserBiz;
import com.chinasofti.crm.domain.*;
import com.chinasofti.crm.utils.QuotationExcelUtil;
import com.chinasofti.crm.utils.pinyin4jUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/8/9.
 */
public class QuotationAction extends ActionSupport {
    private QuotationBiz quotationBiz;
    private int currentPageNo=1;
    private PageBean<Quotation> pageBean=new PageBean();
    private int totalPageNo;
    private int pageSize;
    private Quotation quotation;
    private int orderId;
    private String quotationStatus;
    private List list;
    private int quotationId;
    private String roleName;
    private String quotationCreater="";
    private OrderBiz orderBiz;
    private Orders order;
    private Set<Goods> goodses=new HashSet<Goods>();
    private UserBiz userBiz;
    //    模糊查询报价编号
    public String search2() throws Exception{
        System.out.println("11");
        List list= this.quotationBiz.search2(quotationId);
        HttpServletResponse response = ServletActionContext.getResponse() ;
        String jsonStr = JSON.toJSONString(list) ;
//        将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter() ;
        out.write(jsonStr);
        return NONE;
    }

    //导出excel
    public String export() throws Exception{
        System.out.println("   请求了action");
        System.out.println(quotationStatus);
        list=this.quotationBiz.findByStatus(quotationStatus);
        QuotationExcelUtil.Excel(list);
        HttpServletResponse response = ServletActionContext.getResponse() ;
        PrintWriter out = response.getWriter() ;
        out.write("导出成功");
        return NONE;
    }

    //    通过Id查询报价
    public String findById() throws Exception{
        quotation=this.quotationBiz.loadById(quotationId);
        System.out.println(quotation);
        return "quo";
    }

    //    查询order
    public String select() throws Exception{
        System.out.println("   请求了action");
        System.out.println(orderId);
        order= this.orderBiz.loadbyid(orderId);
        System.out.println(order.getOrderId());
        goodses=order.getGoodses();
        System.out.println(order);
        System.out.println(goodses);
        return "success";
    }

    //    通过状态查询报价
    public String findByStatus() throws Exception{
        System.out.println("   请求了action");
        System.out.println(quotationStatus);
        list=this.quotationBiz.findByStatus(quotationStatus);
        System.out.println(list);
        HttpServletResponse response = ServletActionContext.getResponse() ;
        String jsonStr = JSON.toJSONString(list) ;
//        将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter() ;
        out.write(jsonStr);
        return NONE;
    }

    //    模糊查询订单编号
    public String search() throws Exception{
        System.out.println("进入该方法！！！！！！！！！！！！！！！！");
        List<Quotation> quotations=new ArrayList<Quotation>();
        String sql="FROM Quotation q WHERE q.orderId=?";
        quotations=quotationBiz.find(sql,orderId);
        System.out.println("》》》》》》》》》》》》》"+quotations.size());
        if(quotations.size()!=0){
            List<String> flag=new ArrayList<String>();
            HttpServletResponse response = ServletActionContext.getResponse() ;
            String jsonStr = JSON.toJSONString(flag) ;
//        将文件的类型设置为json格式
            response.setContentType("text/json");
            PrintWriter out = response.getWriter() ;
            out.write(jsonStr);
        }else{
            List list= this.quotationBiz.search(orderId);
            HttpServletResponse response = ServletActionContext.getResponse() ;
            String jsonStr = JSON.toJSONString(list) ;
//        将文件的类型设置为json格式
            response.setContentType("text/json");
            PrintWriter out = response.getWriter() ;
            out.write(jsonStr);
        }
        return NONE;
    }

    //    保存
    public String save() throws Exception{
        System.out.println(quotation.getQuotationCreaterNo());
        User user=userBiz.loadbyid(quotation.getQuotationCreaterNo());
        quotation.setProcessorNo(0);
        quotation.setQuotationCreater(user.getUserName());
        System.out.println(quotation.getQuotationCreater());
        String pinyin=pinyin4jUtil.convertLower(quotation.getQuotationCreater()) ;
        quotation.setPinyin(pinyin);
        boolean b;
        System.out.println("2222");
        b=this.quotationBiz.saveb(quotation);
        System.out.println(b);
        HttpServletResponse response = ServletActionContext.getResponse() ;
        if(b){
            PrintWriter out = response.getWriter() ;
            out.write("保存成功");
        }else{
            PrintWriter out = response.getWriter() ;
            out.write("保存失败");
        }
        return NONE;
    }
//    分页
    public String partPage() throws IOException {
        System.out.println("进入分页方法"+pageSize+"-----"+currentPageNo);
        DetachedCriteria dc=DetachedCriteria.forClass(Quotation.class);
        dc.add(Restrictions.eq("quotationStatus","未审核"));
        pageBean=quotationBiz.findAllData(dc,currentPageNo,pageSize," where quotationStatus='未审核'");
        sendJson();
        return NONE;
    }
    public String getPage() throws IOException {
        System.out.println("进入Page方法！！！！！");
        DetachedCriteria dc=DetachedCriteria.forClass(Quotation.class);
        dc.add(Restrictions.eq("quotationStatus","未审核"));
        System.out.println(pageSize);
        System.out.println(currentPageNo);
        pageBean=quotationBiz.findAllData(dc,currentPageNo,pageSize," where quotationStatus='未审核'");
        sendJson();
        return NONE;
    }
    public String getPageNo() throws IOException {
        DetachedCriteria dc=DetachedCriteria.forClass(Quotation.class);
        dc.add(Restrictions.eq("quotationStatus","未审核"));
        pageBean=quotationBiz.findAllData(dc,currentPageNo,pageSize," where quotationStatus='未审核'");
        sendJson();

        return NONE;
    }
    public String before() throws IOException {
        System.out.println(currentPageNo);
        pageBean.setCurrentPageNo(currentPageNo);
        pageBean.setCurrentPageNo(pageBean.getPreviewPageNo());
        System.out.println(pageBean.getCurrentPageNo());
        DetachedCriteria dc=DetachedCriteria.forClass(Quotation.class);
        dc.add(Restrictions.eq("quotationStatus","未审核"));
        pageBean=quotationBiz.findAllData(dc,pageBean.getCurrentPageNo(),pageSize," where quotationStatus='未审核'");
        sendJson();
        return NONE;
    }
    public String after() throws IOException {
        pageBean.setCurrentPageNo(currentPageNo);
        pageBean.setTotalPageNo(totalPageNo);
        System.out.println("No>>>>>>>>>>>>>"+currentPageNo);
        System.out.println("total>>>>>>>>>>"+totalPageNo);
        pageBean.setCurrentPageNo(pageBean.getNextPageNo());
        DetachedCriteria dc=DetachedCriteria.forClass(Quotation.class);
        dc.add(Restrictions.eq("quotationStatus","未审核"));
        pageBean=quotationBiz.findAllData(dc,pageBean.getCurrentPageNo(),pageSize," where quotationStatus='未审核'");
        sendJson();
        return NONE;
    }
    public void sendJson() throws IOException {
        HttpServletResponse response= ServletActionContext.getResponse();
        String jsonStr= JSON.toJSONString(pageBean);
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter pw=response.getWriter();
        pw.write(jsonStr);
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

    public void setL(List<Quotation> l) {
        this.l = l;
    }

    private List<Quotation> l=new ArrayList<Quotation>();

    public String getQuotationCreater() {
        return quotationCreater;
    }

    public void setQuotationCreater(String quotationCreater) {
        this.quotationCreater = quotationCreater;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public void setOrderBiz(OrderBiz orderBiz) {
        this.orderBiz = orderBiz;
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

    public void setUserBiz(UserBiz userBiz) {
        this.userBiz = userBiz;
    }
}
