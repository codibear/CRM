package com.chinasofti.crm.action.privilegeManage;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.RoleBiz;
import com.chinasofti.crm.domain.Message;
import com.chinasofti.crm.domain.Role;
import com.chinasofti.crm.domain.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
public class RoleAction extends ActionSupport {
    private Role role;
    private RoleBiz roleBiz;

    //增加
    public String save() throws IOException {

        this.roleBiz.save(role);

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


    //删除
    public String delete()throws IOException{
        role=roleBiz.loadbyid(role.getRoleId());
        this.roleBiz.delete(role);
        HttpServletResponse response = ServletActionContext.getResponse() ;

        response.setCharacterEncoding("UTF-8");

        //将文件的类型设置为json格式
        response.setContentType("text/json");

        Message message = new Message("1") ;

        String jsonStr = JSON.toJSONString(message ) ;

        PrintWriter out = response.getWriter();

        out.write(jsonStr);

        return NONE;
    }

    //修改
    public String modify() throws IOException{

        this.roleBiz.modify(role);
        HttpServletResponse response = ServletActionContext.getResponse() ;

        response.setCharacterEncoding("UTF-8");

        //将文件的类型设置为json格式
        response.setContentType("text/json");

        Message message = new Message("1") ;

        String jsonStr = JSON.toJSONString(message ) ;

        PrintWriter out = response.getWriter();

        out.write(jsonStr);

        return NONE;
    }

    //按条件查询
    public String loadById() throws IOException {

        role=  this.roleBiz.loadbyid(role.getRoleId());

        HttpServletResponse response = ServletActionContext.getResponse();

        response.setCharacterEncoding("UTF-8");


        String json = JSON.toJSONString(role);

        //将文件的类型设置为json格式
        response.setContentType("text/json");

        PrintWriter out = response.getWriter() ;

        out.write(json);

        return NONE;


    }

    //查询全部
    public String list() throws IOException {

        List<Role> roles= this.roleBiz.findAll();

        HttpServletResponse response= ServletActionContext.getResponse();

        response.setCharacterEncoding("UTF-8");

        response.setContentType("text/json");

        PrintWriter px= response.getWriter();

        String json= JSON.toJSONString(roles);

        px.write(json);


        return NONE;
    }

    //查询   除系统管理员外   的所有有关角色的信息
    public String listNot() throws IOException {

        List<Role> roles= this.roleBiz.findAllNotOne();

        HttpServletResponse response= ServletActionContext.getResponse();

        response.setCharacterEncoding("UTF-8");

        response.setContentType("text/json");

        PrintWriter px= response.getWriter();

        String json= JSON.toJSONString(roles);

        px.write(json);


        return NONE;
    }

    //接收权限数据
    private String powerIds;
    /**
     * 添加角色
     */
    public String add() throws IOException {

        System.out.println("************************************");
        System.out.println(powerIds);

        roleBiz.add(role,powerIds);

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

    public String getPowerIds() {
        return powerIds;
    }

    public void setPowerIds(String powerIds) {
        this.powerIds = powerIds;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setRoleBiz(RoleBiz roleBiz) {
        this.roleBiz = roleBiz;
    }

    public RoleBiz getRoleBiz() {
        return roleBiz;
    }
}
