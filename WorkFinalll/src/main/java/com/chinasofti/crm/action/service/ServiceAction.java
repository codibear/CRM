package com.chinasofti.crm.action.service;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.CustomerBiz;
import com.chinasofti.crm.biz.DataDictionaryBiz;
import com.chinasofti.crm.biz.ServiceBiz;
import com.chinasofti.crm.biz.UserBiz;
import com.chinasofti.crm.domain.*;
import com.chinasofti.crm.utils.isEnglishOrChineseUtil;
import com.chinasofti.crm.utils.pinyin4jUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.*;

public class ServiceAction  extends ActionSupport {

    //  注入ServiceBiz
    private ServiceBiz serviceBiz;

    //  注入CustomerBiz
    private CustomerBiz customerBiz;
    //  注入userBiz
    private UserBiz userBiz;

    //  注入DataDictionaryBiz
    private DataDictionaryBiz dataDictionaryBiz;

    //  实体类
    private Service service;
    private String serviceCreateTime ;

    //  服务编号
    private String serviceId ;
    private String cusName ;
    private String serviceType ;

    //服务状态
    private String  serviceState ;
    private String sql="";
    //  分页
    private int currentPageNo=1;
    private Page page;


    //客户经理的id
    private Integer managerId;

    //  服务类型的信息
    private String message;
    private List<Service> services ;
    private Set<String> set ;

    //  新创建一条服务
    public String save() throws Exception{
            System.out.println("进入了save方法-------------cusName:"+service.getCusName());
            //  通过客户名查找客户信息
            List<Customer>   list =  this.customerBiz.find("FROM Customer WHERE  cusName=?",service.getCusName());
            System.out.println("------------------list.size():"+list.size());
            Boolean flag = false ;
            if(list.size() > 0){
                String pinyin = pinyin4jUtil.convertLower(service.getCusName()) ;
                service.setPinyin(pinyin);
                System.out.println("---------------cusName:"+pinyin);
                service.setManagerId(null);
                service.setServiceDealUser("");
                System.out.println(service.getManagerId());
                this.serviceBiz.save(service);
                flag = true ;
            }
            HttpServletResponse response = ServletActionContext.getResponse() ;
            String jsonStr = JSON.toJSONString(flag) ;
            //    将文件的类型设置为json格式
            response.setContentType("text/json");
            PrintWriter out = response.getWriter() ;
            System.out.println("-------------------jsonStr:"+jsonStr);
            out.write(jsonStr);
            return NONE;
    }

    //  删除一条服务记录
    public String delete() throws Exception{
        System.out.println("进入了delete方法");
        service = new Service();
        service.setServiceId(serviceId);
        this.serviceBiz.delete(service);
        HttpServletResponse response= ServletActionContext.getResponse();
        PrintWriter pw=response.getWriter();
        pw.write("删除成功");
        return NONE;
    }

    //  修改一条服务的分配记录
    public String addAllo() throws Exception{
        System.out.println("addAllo方法");

        Integer managerId = Integer.valueOf(service.getServiceDealUser());

        //通过managerid查询其所对应的客户经理名称
        User user = userBiz.loadbyid(managerId);
        //得到分配的人员、销售主管（即谁指派的）、分配时间
        String serviceAlloUser = service.getServiceAlloUser();
        String dealUser = user.getUserName();
        Date alloTime = service.getServiceAlloTime();
        //将未修改的信息查出
        service = this.serviceBiz.loadbyid(service.getServiceId());
        //将修改后的信息放入service
        service.setServiceAlloUser(serviceAlloUser);
        service.setServiceDealUser(dealUser);
        service.setServiceAlloTime(alloTime);
        service.setManagerId(managerId);
        //状态改为已处理
        service.setServiceState("已分配");
        //修改信息
        this.serviceBiz.modify(service);
        HttpServletResponse response = ServletActionContext.getResponse() ;
        //定义编码格式以及返回的字符串格式
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        //将字符串输出到页面
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString("分配成功") ;
        pw.write(json);
        return NONE;
    }

    //  修改一条服务的处理记录
    public String modify() throws Exception{
        System.out.println("进入了modify方法");
        //得到修改后的值、处理方法  、处理人、处理时间
        String dealContent = service.getServiceDealContent();
        String dealUser = service.getServiceDealUser();
        Date dealTime = service.getServiceDealTime();
        //将未修改的信息查出
        service = this.serviceBiz.loadbyid(service.getServiceId());
        //将修改后的信息放入service
        service.setServiceDealContent(dealContent);
        service.setServiceDealUser(dealUser);
        service.setServiceDealTime(dealTime);
        //状态改为已处理
        service.setServiceState("已处理");
        //修改信息
        this.serviceBiz.modify(service);
        HttpServletResponse response= ServletActionContext.getResponse();
        PrintWriter pw=response.getWriter();
        pw.write("保存成功");
        return NONE;
    }

    //  修改一条服务的反馈记录
    public String modify2() throws Exception{
        System.out.println("进入了modify2方法");
        //将未修改的信息查出
        Service service = this.serviceBiz.loadbyid(this.service.getServiceId());
        //将修改后的信息放入service
        System.out.println("------------------"+this.service.getServiceSatisfy()) ;
        String flag = this.service.getServiceSatisfy() ;
        if (flag.equals("★") || flag.equals("★★")){
            service.setServiceState("已分配");
            service.setServiceDealResult(this.service.getServiceDealResult());
            service.setServiceSatisfy(this.service.getServiceSatisfy());
        }else {
            service.setServiceState("已归档");
            service.setServiceDealResult(this.service.getServiceDealResult());
            service.setServiceSatisfy(this.service.getServiceSatisfy());
        }
        //修改信息
        this.serviceBiz.modify(service) ;
        HttpServletResponse response= ServletActionContext.getResponse();
        PrintWriter pw=response.getWriter();
        pw.write("保存成功");
        return NONE;
    }

    //  查找一条服务信息之后分配其处理人（带有对象信息跳转页面）
    public String alloService(){
        System.out.println("进入了find方法");
        //查询要分配的服务
        service = this.serviceBiz.loadbyid(serviceId);
        //将要分配的服务放入request范围内
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("serviceAllo",service);
        return "AlloService" ;
    }

    //  通过id查找一条服务记录(处理)
    public String loadbyid(){
        System.out.println("进入了loadbyid方法");
        service = new Service();
        service = this.serviceBiz.loadbyid(serviceId);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("service",service);
        return "EditService" ;
    }

    //  通过id查找一条服务记录2（反馈）
    public String loadbyid2(){
        System.out.println("进入了loadbyid2方法");
        service = new Service();
        service = this.serviceBiz.loadbyid(serviceId);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("service",service);
        return "EditService2" ;
    }

    //  通过id查找一条服务记录3（归档）
    public String loadbyid3(){
        System.out.println("进入了loadbyid3方法");
        service = new Service();
        service = this.serviceBiz.loadbyid(serviceId);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("service",service);
        return "EditService3" ;
    }

    //  模糊查询（客户表）
    public String select() throws Exception{
        System.out.println("进入了客户表模糊查询方法");
        System.out.println("-----------------cusName:"+cusName);
        List list= this.serviceBiz.select(cusName);
        HttpServletResponse response = ServletActionContext.getResponse() ;
        String jsonStr = JSON.toJSONString(list) ;
        //    将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter() ;
        System.out.println("------------------jsonStr:"+jsonStr);
        out.write(jsonStr);
        return NONE;
    }

    //  模糊查询（服务表）
    public String selectCus() throws Exception{
        System.out.println("进入了服务表模糊查询方法");
        //  模糊查询（不同状态下已存在服务的客户：英文）
        boolean b= isEnglishOrChineseUtil.isEnglish(cusName);
        if(b==true){
            services  = serviceBiz.selectCus2(cusName,serviceState) ;
            List<String> cusNames =  new ArrayList<String>() ;
            for(Service service : services){
                cusNames.add(service.getCusName()) ;
            }
            set = new HashSet<String>(cusNames) ;
        }
        //  模糊查询（不同状态下已存在服务的客户：中文）
        else {
            services = serviceBiz.selectCus(cusName,serviceState);
            List<String> cusNames =  new ArrayList<String>() ;
            for(Service service : services){
                cusNames.add(service.getCusName()) ;
            }
            set = new HashSet<String>(cusNames) ;
        }
        HttpServletResponse response= ServletActionContext.getResponse();
        String jsonStr= JSON.toJSONString(set) ;
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter pw=response.getWriter();
        pw.write(jsonStr);
        return NONE;
    }

    //  服务分页
    public String page() throws Exception{
        String sql = " serviceState='"+serviceState+"'" ;
        DetachedCriteria dc = DetachedCriteria.forClass(Service.class);
        dc.add(Restrictions.eq("serviceState",serviceState)) ;
        if (cusName != ""){
            sql+= "AND cusName='"+cusName+"'" ;
            dc.add(Restrictions.eq("cusName",cusName));
        }
        if(managerId!=null){
            sql += " AND managerId='"+managerId+"'" ;
            dc.add(Restrictions.eq("managerId",managerId));
        }
        if (serviceId != ""){
            sql+= "AND serviceId='"+serviceId+"'" ;
            dc.add(Restrictions.eq("serviceId",serviceId));
        }
        if(serviceType != ""){
            sql+= "AND serviceType='"+serviceType+"'";
            dc.add(Restrictions.eq("serviceType",serviceType));
        }
        System.out.println("----------------sql:"+sql);
        System.out.println("-----------------dc:"+dc);
        page=this.serviceBiz.find(dc,currentPageNo,6,sql ) ;
        HttpServletResponse response = ServletActionContext.getResponse() ;
        String json = JSON.toJSONString(page);
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        System.out.println("page---------分页--------json:"+json);
        pw.write(json);
        return NONE;
    }

    //  查询数据字典
    public String findAllselect() throws Exception{
        System.out.println(message);
        List<DataDictionary> dataDictionaryList =  this.dataDictionaryBiz.find("FROM DataDictionary WHERE type=?",message);
        HttpServletResponse response = ServletActionContext.getResponse() ;
        //定义编码格式以及返回的字符串格式
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        //将字符串输出到页面
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(dataDictionaryList) ;
        pw.write(json);
        return NONE;
    }

    //注入的set方法
    public void setServiceBiz(ServiceBiz serviceBiz) {
        this.serviceBiz = serviceBiz;
    }

    public void setDataDictionaryBiz(DataDictionaryBiz dataDictionaryBiz) {
        this.dataDictionaryBiz = dataDictionaryBiz;
    }

    public void setCustomerBiz(CustomerBiz customerBiz) {
        this.customerBiz = customerBiz;
    }

    //实体类的get/set方法
    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public String getServiceCreateTime() {
        return serviceCreateTime;
    }

    public void setServiceCreateTime(String serviceCreateTime) {
        this.serviceCreateTime = serviceCreateTime;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public int getCurrentPageNo() {
        return currentPageNo;
    }

    public void setCurrentPageNo(int currentPageNo) {
        this.currentPageNo = currentPageNo;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public String getServiceState() {
        return serviceState;
    }

    public void setServiceState(String serviceState) {
        this.serviceState = serviceState;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<Service> getServices() {
        return services;
    }

    public void setServices(List<Service> services) {
        this.services = services;
    }

    public Set<String> getSet() {
        return set;
    }

    public void setSet(Set<String> set) {
        this.set = set;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }

    public void setUserBiz(UserBiz userBiz) {
        this.userBiz = userBiz;
    }
}
