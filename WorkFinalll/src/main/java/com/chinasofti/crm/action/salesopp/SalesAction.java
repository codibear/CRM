package com.chinasofti.crm.action.salesOpp;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.DataDictionaryBiz;
import com.chinasofti.crm.biz.SalesBiz;
import com.chinasofti.crm.biz.UserBiz;
import com.chinasofti.crm.domain.*;
import com.chinasofti.crm.utils.PinYinUtils;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class SalesAction extends ActionSupport{
    private SalesBiz salesBiz;

    private SalesManage sales;

    private Integer salesId;

    private String cusName;

    private String outLine;

     private String linkName;

    private int currentPageNo=1;

    private Page page;

    private UserBiz userBiz;

    private Integer roleId;

    public String roleCheck() throws IOException {

        User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");

        List<Role> roles = this.userBiz.fiindroleByUserId(user.getUserId());

        roleId = roles.get(0).getRoleId();

        HttpServletResponse response = ServletActionContext.getResponse();

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");

        String str=JSON.toJSONString(roleId);
        out.write(str);

        return NONE;
    }



//增加
    public String save() throws Exception{

        Object[] args = new Object[] {sales.getGiveMan()};

        List<User> users = userBiz.find("from User where  userName= ?",args);

        System.out.println(sales);

        sales.setGiveId(users.get(0).getUserId());

        salesBiz.save(sales);

        HttpServletResponse response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        String str=JSON.toJSONString("White");
        out.write(str);

        return "list";

    }


//pinyin4j
public  String findName() throws Exception{

    User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");

    List<Role> roles = this.userBiz.fiindroleByUserId(user.getUserId());

    if(roles.get(0).getRoleId()!=4) {

        System.out.println(cusName);

        char[] input = new char[cusName.length()];

        for (int i = 0; i < cusName.length(); i++) {

            input[i] = cusName.charAt(i);
        }

        List<String> list = new ArrayList<String>();

        String ches = null;

        List<SalesManage> salesManages = salesBiz.findAll();

        List<SalesManage> container = new ArrayList<SalesManage>();

        for (int i = 0; i < salesManages.size(); i++) {

            ches = PinYinUtils.getPinYin(salesManages.get(i).getCusName());


            String[] strs = ches.split(" ");

            int flag = 0;


            for (int j = 0; j < strs.length; j++) {

//            System.out.println(strs[j].charAt(0));

                char tmp = strs[flag].charAt(0);

                if (tmp == input[flag]) {
                    flag++;

                    if (flag == input.length) {
                        container.add(salesManages.get(i));
                        break;
                    } else {
                        continue;
                    }

                }

            }

        }

        for (SalesManage s : container) {

            list.add(s.getCusName());

        }

        HttpServletResponse response = ServletActionContext.getResponse();

        response.setCharacterEncoding("UTF-8");

        response.setContentType("text/json");

        PrintWriter pw = response.getWriter();

        String json = JSON.toJSONString(list);

        pw.write(json);

        System.out.println(json);
    }

        return NONE;
}

    //动态参数
    public String find()throws Exception{



        System.out.println(cusName);

        List<String> list=new ArrayList();

        String sql = "from SalesManage where 1=1";

        if (cusName!=""){

            sql+=" and cusName="+"?";

            list.add(cusName);

        }if (outLine!=""){

            sql+=" and outLine=?" ;

            list.add(outLine);

        }if(linkName!=""){

            sql+=" and linkName=?" ;

            list.add(linkName);
        }

        System.out.println(sql);


        String[] p = new String[list.size()];

        list.toArray(p);//将转化后的数组放入已经创建好的对象中

        List<SalesManage> salesManages = salesBiz.find(sql, p);

        System.out.println(salesManages);

        HttpServletResponse response = ServletActionContext.getResponse() ;

        response.setCharacterEncoding("UTF-8");

        response.setContentType("text/json");

        PrintWriter pw = response.getWriter();

        String json = JSON.toJSONString(salesManages) ;

        pw.write(json);

        System.out.println(json);

        return NONE;
    }



//修改
    public String modify() throws Exception{

//        System.out.println(sales.getGiveMan());
//        Object[] args = new Object[] {sales.getGiveMan()};
//
//        List<User> users = userBiz.find("from User where  userName= ?",args);
//
//        sales.setGiveId(users.get(0).getUserId());



        this.salesBiz.modify(sales);

        HttpServletResponse response = ServletActionContext.getResponse();

        PrintWriter out = response.getWriter();

        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");

        String str=JSON.toJSONString("White");

        out.write(str);

        return NONE;
    }

    //删除
    public String delete() throws IOException {


      sales= salesBiz.findById(salesId);

        this.salesBiz.delete(sales);
        HttpServletResponse response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        String str=JSON.toJSONString("White");
        out.write(str);
        out.close();

        return NONE;
    }

    //查找salesManage
    public String findById() throws Exception{

        System.out.println(salesId);

        sales = this.salesBiz.findById(salesId);

        return "findOne";

    }

    //查询全部
    public String list() throws Exception {
        List<SalesManage> saleslist = this.salesBiz.findAll();
        HttpServletResponse response = ServletActionContext.getResponse() ;
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(saleslist) ;
        pw.write(json);
        return NONE;
    }


//分页
    public String page() throws Exception{

        //获取userId判断角色如=2则直接调用，如=4则调用findbygiveId 从salesManage
        // 表里获得此条数据填到table里

        DetachedCriteria dc= DetachedCriteria.forClass(SalesManage.class);

        //ServletActionContext.getRequest().getSession().getAttribute("userId");

        /**
         * 获得userId查找权限啊
         * 如果权限为销售主管
         *      直接按原来的走
         * 如果权限为客户经理
         *      按照客户经理的id来查找list
         *      然后page.setList
         */

        User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");

        List<Role> roles = this.userBiz.fiindroleByUserId(user.getUserId());

        page=this.salesBiz.find(dc,currentPageNo,3);

        if(roles.get(0).getRoleId()!=4){

            HttpServletResponse response = ServletActionContext.getResponse() ;

            String json = JSON.toJSONString(page);

            response.setContentType("text/json");

            PrintWriter pw = response.getWriter();

            pw.write(json);

            return NONE;
        }else{

            System.out.println(user.getUserId());

//            int [] uId = new int[]{user.getUserId()};

            Object[] args = new Object[] {user.getUserId()};

            List<SalesManage> salesManages = salesBiz.find("from SalesManage where giveId = ?",args);

            page.setData(salesManages);

            HttpServletResponse response = ServletActionContext.getResponse() ;

            String json = JSON.toJSONString(page);

            response.setContentType("text/json");

            PrintWriter pw = response.getWriter();

            pw.write(json);

            return NONE;

        }

    }
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

    //客户等级
    public String findEntry() throws Exception {

  List<User> users= userBiz.findAll();

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(users);
        pw.write(json);
        return NONE;
    }


    public UserBiz getUserBiz() {
        return userBiz;
    }

    public void setUserBiz(UserBiz userBiz) {
        this.userBiz = userBiz;
    }

    public SalesBiz getSalesBiz() {
        return salesBiz;
    }

    public void setSalesBiz(SalesBiz salesBiz) {
        this.salesBiz = salesBiz;
    }

    public SalesManage getSales() {

        return sales;
    }

    public void setSales(SalesManage sales)
    {
        this.sales = sales;
    }

    public Integer getSalesId()
    {
        return salesId;
    }

    public void setSalesId(Integer salesId) {
        this.salesId = salesId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getOutLine() {
        return outLine;
    }

    public void setOutLine(String outLine) {
        this.outLine = outLine;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
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

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
