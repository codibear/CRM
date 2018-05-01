package com.chinasofti.crm.action.customer;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.CstConBiz;
import com.chinasofti.crm.biz.CustomerBiz;
import com.chinasofti.crm.domain.CstCon;
import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.utils.ExportExcel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Collection;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class CstConAction extends ActionSupport {
    private CstCon cstCon;
    private CstConBiz cstConBiz;
    private Customer customer;
    private int cstConId;
    private int id;
    private int currentPage;
    private ExportExcel<CstCon> exportExcel;
    private InputStream inputStream;
    private String pathName;
    private String fileName;
    private long contentLength;

    private int paixu;
    private CustomerBiz customerBiz;

    public CstCon getCstCon() {
        return cstCon;
    }

    public void setCstCon(CstCon cstCon) {
        this.cstCon = cstCon;
    }

    public CstConBiz getCstConBiz() {
        return cstConBiz;
    }

    public void setCstConBiz(CstConBiz cstConBiz) {
        this.cstConBiz = cstConBiz;
    }


    //导出Excel表格的方法
    public String exportExcel() throws FileNotFoundException {
        String path = ServletActionContext.getServletContext().getRealPath("/upload");
        System.out.println(path);

        File filePath = new File(path);

        //如果上传保存路径不存在，则创建
        if (!filePath.exists()) {
            filePath.mkdirs();
        }
        path = path + "\\";
        List<CstCon> cstCons = this.cstConBiz.find("from CstCon where custId=?", id);
        Collection<CstCon> c = cstCons;
        String[] headers = {"编号", "客户编号", "客户名称", "交往时间", "交往地点", "概要", "备注", "详细信息"};
        OutputStream out = new FileOutputStream(path + "交往记录表.xls");
        this.exportExcel.exportExcel("交往记录表", headers, c, out, "yyyy-MM-dd");
        pathName = path + "交往记录表.xls";
        File file = new File(pathName);
        fileName = file.getName();
        System.out.println(fileName);
        inputStream = new FileInputStream(file);
        return SUCCESS;
    }

    public String save() {
        customer = this.customerBiz.loadbyid(id);
        cstCon.setCustomer(customer);
        this.cstConBiz.save(cstCon);
        ActionContext.getContext().getValueStack().set("id", id);
        ActionContext.getContext().getValueStack().set("customer", customer);
        return "save";
    }

    public String modify() {
        customer = this.customerBiz.loadbyid(id);
        cstCon.setCustomer(customer);
        this.cstConBiz.modify(cstCon);
        ActionContext.getContext().getValueStack().set("id", id);
        ActionContext.getContext().getValueStack().set("customer", customer);
        ActionContext.getContext().getValueStack().set("cstCon", cstCon);
        return "modify";
    }

    //通过修改跳页面的    action
    public String loadById() {
        //通过
        cstCon = this.cstConBiz.loadbyid(cstConId);
        ActionContext.getContext().getValueStack().set("cstCon", cstCon);
        ActionContext.getContext().getValueStack().set("id", id);
        return "look";
    }

    public String delete() {
        cstCon = this.cstConBiz.loadbyid(cstConId);
        System.out.println("aaaaaaaaaaaaaa" + cstConId);
        System.out.println(cstCon.getCstConId());
        this.cstConBiz.delete(cstCon);
        ActionContext.getContext().getValueStack().set("id", id);
        return NONE;
    }

    public String news() {
        ActionContext.getContext().getValueStack().set("id", id);
        //System.out.print("222222222222222222"+id);
        return "news";
    }


    public String pageList() throws Exception {
        System.out.print("aaaaaaaaaaaaaaaaaaaaaaaaaaaa" + currentPage);
        //第一步先获取DetachedCriteria对象
        DetachedCriteria dc = DetachedCriteria.forClass(CstCon.class);
        Customer customer2 = this.customerBiz.loadbyid(id);
        dc.add(Restrictions.eq("customer", customer2));
//        Page page2= cstConBiz.find(dc, currentPage, 3);
        //根据时间进行排序
        if (paixu == 2) {
            dc.addOrder(Order.desc("cstConTime"));
        } else {
            dc.addOrder(Order.asc("cstConTime"));
        }
        ActionContext.getContext().getValueStack().set("customer", customer2);

        //第二步：调用biz层find方法，获取page对象
        String sql = "custId=" + id;
        Page page1 = cstConBiz.find(dc, currentPage, 3, sql);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        String s = JSON.toJSONString(page1);
        out.write(s);
        return NONE;
    }

    public String list() throws Exception {
        System.out.println("aaaaaaa>>>>>>>>>" + id);
        System.out.print(id);
        Customer customer = customerBiz.loadbyid(id);
        List<CstCon> CstCons = this.cstConBiz.find("from CstCon where custId=?", id);
        ActionContext.getContext().getValueStack().set("id", id);
        ActionContext.getContext().getValueStack().set("customer", customer);
        ActionContext.getContext().getValueStack().set("CstCons", CstCons);
        return "list";
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CustomerBiz getCustomerBiz() {
        return customerBiz;
    }

    public void setCustomerBiz(CustomerBiz customerBiz) {
        this.customerBiz = customerBiz;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getCstConId() {
        return cstConId;
    }

    public void setCstConId(int cstConId) {
        this.cstConId = cstConId;
    }

    public int getPaixu() {
        return paixu;
    }

    public void setPaixu(int paixu) {
        this.paixu = paixu;
    }

    public void setExportExcel(ExportExcel<CstCon> exportExcel) {
        this.exportExcel = exportExcel;
    }

    public ExportExcel<CstCon> getExportExcel() {
        return exportExcel;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getPathName() {
        return pathName;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public long getContentLength() {
        return contentLength;
    }

    public void setContentLength(long contentLength) {
        this.contentLength = contentLength;
    }
}
