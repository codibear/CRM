package com.chinasofti.crm.action.privilegeManage;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.PowerBiz;
import com.chinasofti.crm.domain.Message;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Power;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
public class PowerAction extends ActionSupport {
    private Power power;
    private PowerBiz powerBiz;
    private int currentPage;
    //增加
    public String save() throws IOException {

        this.powerBiz.save(power);

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
    //删除
    public String delete() throws IOException {

        power= this.powerBiz.loadById(power.getPowerId());

        this.powerBiz.delete(power);

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
    public String modify() throws IOException {

        this.powerBiz.update(power);

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

    public String loadById() throws IOException {

        power= this.powerBiz.loadById(power.getPowerId());

        HttpServletResponse response = ServletActionContext.getResponse() ;

        response.setCharacterEncoding("UTF-8");

        //将文件的类型设置为json格式
        response.setContentType("text/json");

        PrintWriter out = response.getWriter();

        String jsonString = JSON.toJSONString(power) ;

        out.write(jsonString);

        return NONE;

    }
    //查询所有
    public String list() throws IOException {

        List<Power> powers =  this.powerBiz.findAll();

        HttpServletResponse response = ServletActionContext.getResponse();

        response.setCharacterEncoding("UTF-8");

        response.setContentType("text/json");

        PrintWriter pw = response.getWriter();

        String json = JSON.toJSONString(powers);

        pw.write(json);

        return NONE;

    }

    //分页

    public String page() throws Exception{

        DetachedCriteria dc=DetachedCriteria.forClass(Power.class);

        Page page=powerBiz.find(dc,currentPage,10);

        HttpServletResponse response = ServletActionContext.getResponse() ;

        response.setContentType("text/json");
        String json = JSON.toJSONString(page);
        PrintWriter pw = response.getWriter();
        pw.write(json);
        return NONE;
    }

    //查找所有权限并写进ajax
    public String listajax() throws IOException{

        List<Power> lists =  this.powerBiz.findAll();

        String[] excludes = new String[]{"power","powers","roles"};

        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(excludes);
        JSONArray jsonObject = JSONArray.fromObject(lists, jsonConfig);
        String json = jsonObject.toString();

        ServletActionContext.getResponse().setContentType(
                "text/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().print(json);

        return NONE;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public Power getPower() {
        return power;
    }

    public void setPower(Power power) {
        this.power = power;
    }

    public void setPowerBiz(PowerBiz powerBiz) {
        this.powerBiz = powerBiz;
    }
}
