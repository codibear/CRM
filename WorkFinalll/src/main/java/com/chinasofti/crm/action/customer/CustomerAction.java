package com.chinasofti.crm.action.customer;


import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.CustomerBiz;
import com.chinasofti.crm.biz.DataDictionaryBiz;
import com.chinasofti.crm.biz.RoleBiz;
import com.chinasofti.crm.biz.UserBiz;
import com.chinasofti.crm.domain.*;
import com.chinasofti.crm.utils.ExportExcel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Collection;
import java.util.List;

public class CustomerAction extends ActionSupport {
    private CustomerBiz customerBiz;
    private Customer customer;
    private int currentPage;
    private int id;
    private String cusId;
    private String cusName;
    private ExportExcel<Customer> exportExcel;
    private UserBiz userBiz;
    private DataDictionaryBiz dataDictionaryBiz;
    private String userId;
    private RoleBiz roleBiz;
    private InputStream inputStream;
    private String pathName;
    private String fileName;
    private long contentLength;


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String findEntry() throws Exception {
        String type = "客户等级";
        System.out.println(type);
        List<DataDictionary> entry = this.dataDictionaryBiz.find("from DataDictionary where type=? ", type);
        System.out.println("下面是等级");
        for (DataDictionary d:entry){
            System.out.println(d.getEntry());
        }
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(entry);
        pw.write(json);
        return NONE;
    }

    public String findcusId() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse() ;
        PrintWriter pw = response.getWriter();
        int flag = 0;
        List<Customer> list = customerBiz.find("from Customer where cusId=?", cusId);
        if(list.size()!=0){
            flag = 1;
        }
        String json = JSON.toJSONString(flag) ;
        pw.write(json);
        return NONE;
    }
    //查询客户经理
    public String findUser() throws Exception {
        String roleName = "客户经理";
        String sql = "select DISTINCT u from User u left outer join u.roles r where r.roleName=?";
        List<User> users = this.userBiz.find(sql,roleName);
        System.out.println("下面是客户经理：");
        for (User u:users){
            System.out.println(u.getUserName());
        }
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(users);
        System.out.println(json);
        pw.write(json);
        return NONE;
    }

    public String loadById() {


        Customer customer1 = customerBiz.loadbyid(id);
        ActionContext.getContext().getValueStack().set("customer", customer1);
        ActionContext.getContext().getValueStack().set("id", id);
        return "modify";
    }

    //导出Excel表格的方法
    public String exportExcel() throws FileNotFoundException {
        String path = ServletActionContext.getServletContext().getRealPath("/upload") ;
        System.out.println(path);

        File filePath = new File(path) ;

        //如果上传保存路径不存在，则创建
        if(!filePath.exists()) {
            filePath.mkdirs() ;
        }
        path=path+"\\";
        List<Customer> customers = this.customerBiz.findAll();
        Collection<Customer> c = customers;
        String[] headers = {"编号", "客户编号", "客户名称", "地区", "", "联系人编号", "联系人姓名", "客户等级", "客户满意度", "客户信用度", "地址", "邮政编码", "电话", "传真", "网址", "营业执照注册号", "法人", "注册资金（万元）", "年营业额", "开户银行", "银行账号", "地税局登记号", "国税局登记号", "状态"};
        OutputStream out = new FileOutputStream(path+"客户信息表.xls");
        this.exportExcel.exportExcel("客户信息表", headers, c, out, "yyyy-MM-dd");
        pathName=path+"客户信息表.xls";
        File file = new File(pathName);
        fileName=file.getName();
        System.out.println(fileName);
        inputStream=new FileInputStream(file);
        return SUCCESS;

    }


    public String search() throws Exception {
        String cusId = customer.getCusId();
        String cusName = customer.getCusName();
        if (!cusId.equals("") && cusName.equals("")) {
            List<Customer> list = customerBiz.find("from Customer where cusId=?", cusId);
            customer = list.get(0);
            System.out.print(list.size());
        } else if (cusId.equals("") && !cusName.equals("")) {
            List<Customer> list = customerBiz.find("from Customer where cusName=?", cusName);
            System.out.print(list.size());
            customer = list.get(0);
        } else if (cusId.equals("") && cusName.equals("")) {
            List<Customer> list = customerBiz.find("from Customer where cusName=? and cusId=?", cusName, cusId);
            System.out.print(list.size());
            customer = list.get(0);
        }
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        String jsonStr = JSON.toJSONString(customer);
        System.out.println(jsonStr);

        out.write(jsonStr);
        return NONE;
    }
    public String save(){
        int a=Integer.parseInt(customer.getCusManagerId());
       List<User> list= this.userBiz.find("from User where userId=?",a);
       customer.setCusManagerName(list.get(0).getUserName());
        this.customerBiz.save(customer);
        return "success";
    }

    public String modify(){
//        customer.setId(id);
        int a=Integer.parseInt(customer.getCusManagerId());
        List<User> list= this.userBiz.find("from User where userId=?",a);
        customer.setCusManagerName(list.get(0).getUserName());
        ActionContext.getContext().getValueStack().set("customer", customer);
        ActionContext.getContext().getValueStack().set("id", id);
        System.out.print("AAAAAAAAAAAAAAAAAAAAAAAAAA" + id);
        this.customerBiz.modify(customer);
        return "success1";
    }

    public String delete(){
        this.customerBiz.delete(customer);
        return "success";
    }
    public String list() throws Exception {
        List<Customer> customers = this.customerBiz.findAll();
        HttpServletResponse response = ServletActionContext.getResponse() ;
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(customers) ;
        pw.write(json);
        return NONE;
    }
    public String pageList() throws Exception {

        System.out.print("aaaaaaaaaaaaaaaaaaaaaaaaaaaa"+currentPage);
        //第一步先获取DetachedCriteria对象
        DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);


        dc.add(Restrictions.eq("cusManagerId", userId));




        String sql="cusManagerId="+userId;
        //第二步：调用biz层find方法，获取page对
        Page page = customerBiz.find(dc, currentPage, 3,sql);

        //第三步：将page对象进行json转换
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        String jsonStr = JSON.toJSONString(page);
        out.write(jsonStr);
        return NONE;
    }

    //模糊查询
    public String selectmohu() throws IOException {
        List<Customer> customers = this.customerBiz.find("from Customer where cusName LIKE ? ", "%" + cusName + "%");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        String jsonStr = JSON.toJSONString(customers);
        out.write(jsonStr);
        return NONE;

    }

    public UserBiz getUserBiz() {
        return userBiz;
    }

    public void setUserBiz(UserBiz userBiz) {
        this.userBiz = userBiz;
    }

    public CustomerBiz getCustomerBiz() {
        return customerBiz;
    }

    public Customer getCustomer() {
        return customer;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public void setCustomerBiz(CustomerBiz customerBiz) {
        this.customerBiz = customerBiz;
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

    public String getCusId() {
        return cusId;
    }

    public void setCusId(String cusId) {
        this.cusId = cusId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public void setExportExcel(ExportExcel<Customer> exportExcel) {
        this.exportExcel = exportExcel;
    }

    public DataDictionaryBiz getDataDictionaryBiz() {
        return dataDictionaryBiz;
    }

    public void setDataDictionaryBiz(DataDictionaryBiz dataDictionaryBiz) {
        this.dataDictionaryBiz = dataDictionaryBiz;
    }

    public ExportExcel<Customer> getExportExcel() {
        return exportExcel;
    }

    public RoleBiz getRoleBiz() {
        return roleBiz;
    }

    public void setRoleBiz(RoleBiz roleBiz) {
        this.roleBiz = roleBiz;
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
