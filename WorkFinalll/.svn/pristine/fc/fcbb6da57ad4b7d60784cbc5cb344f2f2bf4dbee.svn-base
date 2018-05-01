package com.chinasofti.crm.action.privilegeManage;


import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.UserBiz;
import com.chinasofti.crm.domain.Message;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.User;
import com.chinasofti.crm.shiro.UserRealm;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
public class UserAction extends ActionSupport {
    private User user;
    private UserBiz userBiz;
    private int currentPage;
    private String err;
    private String[] roleIds;

    //增加
    public String save() throws IOException {

        this.userBiz.save(user);

        HttpServletResponse response = ServletActionContext.getResponse() ;

        response.setCharacterEncoding("UTF-8");

        //将文件的类型设置为json格式
        response.setContentType("text/json");

        Message message = new Message("1") ;

        String jsonStr = JSON.toJSONString(message) ;

        PrintWriter out = response.getWriter();

        out.write(jsonStr);

        return NONE;


    }
    /**
     * 添加用户
     */
    public String add() throws IOException {
        System.out.println("进入add方法");

        userBiz.add(user,roleIds);

        HttpServletResponse response = ServletActionContext.getResponse() ;

        response.setCharacterEncoding("UTF-8");

        //将文件的类型设置为json格式
        response.setContentType("text/json");

        Message message = new Message("1") ;

        String jsonStr = JSON.toJSONString(message) ;

        PrintWriter out = response.getWriter();

        out.write(jsonStr);

        return NONE;
    }
    //修改
    public String modify() throws IOException {

        this.userBiz.modify(user);


        HttpServletResponse response = ServletActionContext.getResponse() ;

        response.setCharacterEncoding("UTF-8");

        //将文件的类型设置为json格式
        response.setContentType("text/json");

        Message message2 = new Message("1") ;

        String jsonStr2 = JSON.toJSONString(message2) ;

        PrintWriter out = response.getWriter();

        out.write(jsonStr2);

        return NONE;
    }
    //删除
    public String delete() throws IOException {

        user = userBiz.loadbyid(user.getUserId());

        this.userBiz.delete(user);

        HttpServletResponse response = ServletActionContext.getResponse();

        response.setCharacterEncoding("UTF-8");

        Message message = new Message("1");

        String json = JSON.toJSONString(message);

        //将文件的类型设置为json格式
        response.setContentType("text/json");

        PrintWriter out = response.getWriter() ;

        out.write(json);

        return NONE;

    }
    //通过id查找
    public String findById() throws IOException {

        user = this.userBiz.loadbyid(user.getUserId());

        HttpServletResponse response = ServletActionContext.getResponse();

        response.setCharacterEncoding("UTF-8");

        String json = JSON.toJSONString(user);

        response.setContentType("text/json");

        PrintWriter out = response.getWriter() ;

        out.write(json);

        return NONE;

    }
    //查询所有
    public String list() throws Exception {

        List<User> users = this.userBiz.findAll();

        HttpServletResponse response = ServletActionContext.getResponse();

        response.setCharacterEncoding("UTF-8");

        response.setContentType("text/json");

        PrintWriter pw = response.getWriter();

        String json = JSON.toJSONString(users);

        pw.write(json);

        return NONE;
    }

    //分页
    public String page() throws Exception{

        DetachedCriteria dc=DetachedCriteria.forClass(User.class);

        Page page=userBiz.find(dc,currentPage,8);

        HttpServletResponse response = ServletActionContext.getResponse() ;

        response.setContentType("text/json");
        String json = JSON.toJSONString(page);
        PrintWriter pw = response.getWriter();
        pw.write(json);
        return NONE;
    }

    @RequestMapping("privilegeManage/login")
    public String login(){

        System.out.println("登录的方法已进入");
        String exceptionClassName = (String) ServletActionContext.getRequest().getAttribute("shiroLoginFailure");
        System.out.println(exceptionClassName);
        if (exceptionClassName != null){
            if (AuthenticationException.class.getName().equals(exceptionClassName)){
                err = "用户不存在";
            }else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)){
                err = "账户或密码错误";
            }
        }

        System.out.println(err);
        return "login";
    }
    @RequestMapping("privilegeManage/first")
    public String first(){
        System.out.println("进入首页的action");
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        HttpSession session =  ServletActionContext.getRequest().getSession() ;
        session.setAttribute("user",user);

        String remoteAddr = ServletActionContext.getRequest().getRemoteAddr();
        session.setAttribute("IP",remoteAddr);

        return "first";
    }
    //此方法为调用realm清空缓存方法

    private UserRealm userRealm;

    public void setUserRealm(UserRealm userRealm) {
        this.userRealm = userRealm;
    }

    @RequestMapping("privilegeManage/clearShiroCache")
    public String clearShiroCache(){
        userRealm.clearCache();
        return "success";
    }
    public String gonews(){
        return "news";
    }


    public String getErr() {
        return err;
    }

    public void setErr(String err) {
        this.err = err;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setUserBiz(UserBiz userBiz) {
        this.userBiz = userBiz;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public UserBiz getUserBiz() {
        return userBiz;
    }

    public String[] getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String[] roleIds) {
        this.roleIds = roleIds;
    }
}
