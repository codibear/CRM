package com.chinasofti.crm.action.quotation;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.QuotationBiz;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Quotation;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Wang Bin on 2017/8/13.
 */
public class QuotationPageAction extends ActionSupport {

    private Page<Quotation> page;
    private String quotationStatus;
    private QuotationBiz quotationBiz;
    private int currentPageNo=1;
    private int totalPageNo;
    private int pageSize;
    private Quotation quotation;
    private List list;
    private int quotationId;
    private String quotationCreater="";
    private String sql="";

    public DetachedCriteria addDc() throws Exception{
        System.out.println(quotationId+">>>>>>>>>>>>>>"+quotationCreater+"?>>>>>>>>>>>>>"+quotationStatus);
        DetachedCriteria dc=DetachedCriteria.forClass(Quotation.class);
        if(quotationId!=0&&quotationCreater.equals("")){
            dc=DetachedCriteria.forClass(Quotation.class);
            dc.add(Restrictions.eq("quotationId",quotationId)).add(Restrictions.eq("quotationStatus",quotationStatus));
            sql="WHERE quotationId="+quotationId+" AND quotationStatus="+"'"+quotationStatus+"'";
        }
        if(quotationId==0&&!quotationCreater.equals("")){
            dc=DetachedCriteria.forClass(Quotation.class);
            dc.add(Restrictions.eq("quotationCreater",quotationCreater)).add(Restrictions.eq("quotationStatus",quotationStatus));
            sql="WHERE quotationCreater="+"'"+quotationCreater+"'"+" AND quotationStatus="+"'"+quotationStatus+"'";
        }
        if(quotationId!=0&&!quotationCreater.equals("")){
            dc=DetachedCriteria.forClass(Quotation.class);
            dc.add(Restrictions.eq("quotationId",quotationId)).add(Restrictions.eq("quotationCreater",quotationCreater)).add(Restrictions.eq("quotationStatus",quotationStatus));
            sql="WHERE quotationId="+quotationId+"and quotationCreater="+"'"+quotationCreater+"'"+" AND quotationStatus="+"'"+quotationStatus+"'";
        }
        if(quotationId==0&&quotationCreater.equals("")){

            dc=DetachedCriteria.forClass(Quotation.class);
            dc.add(Restrictions.eq("quotationStatus",quotationStatus));
            sql="WHERE  quotationStatus="+"'"+quotationStatus+"'";

        }
        return dc;
    }
    //分页
    public String page() throws Exception{

        System.out.println("请求了分页方法");
        DetachedCriteria dc= addDc();
        System.out.println(dc);
        page=this.quotationBiz.findAllDatas(dc,currentPageNo,4,sql);
        HttpServletResponse response = ServletActionContext.getResponse() ;
        String json = JSON.toJSONString(page);
        System.out.println(json);
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        pw.write(json);
        return NONE;
    }

    public void setQuotationBiz(QuotationBiz quotationBiz) {
        this.quotationBiz = quotationBiz;
    }

    public Page<Quotation> getPage() {
        return page;
    }

    public void setPage(Page<Quotation> page) {
        this.page = page;
    }

    public String getQuotationStatus() {
        return quotationStatus;
    }

    public void setQuotationStatus(String quotationStatus) {
        this.quotationStatus = quotationStatus;
    }

    public int getCurrentPageNo() {
        return currentPageNo;
    }

    public void setCurrentPageNo(int currentPageNo) {
        this.currentPageNo = currentPageNo;
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

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public String getQuotationCreater() {
        return quotationCreater;
    }

    public void setQuotationCreater(String quotationCreater) {
        this.quotationCreater = quotationCreater;
    }
}
