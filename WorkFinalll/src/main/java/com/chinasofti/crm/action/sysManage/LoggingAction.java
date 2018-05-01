package com.chinasofti.crm.action.sysManage;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.LoggingBiz;
import com.chinasofti.crm.domain.Log;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.SalesManage;
import com.chinasofti.crm.utils.ExcelUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;

import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import static org.aspectj.weaver.tools.cache.SimpleCacheFactory.path;

/**
 * Created by  Li min  on 2017/8/14.
 */
public class LoggingAction extends ActionSupport {
    private Log log;
    private LoggingBiz loggingBiz;
    private List<Log> logs;
    private int currentPage;
    private static Logger logger=Logger.getLogger(LoggingAction.class);


    public String find() throws IOException {

        System.out.println("000000000000000000000000000000000000");
        logs=this.loggingBiz.findAll();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(logs);
        System.out.println(logs);
        pw.write(json);
        //日志记录
        logger.info("查看日志记录");

        return NONE;
    }
    //分页查询
    public String pageList() throws Exception {
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaa"+currentPage);
        //第一步先获取DetachedCriteria对象
        DetachedCriteria dc = DetachedCriteria.forClass(Log.class);
dc .addOrder( Order.desc("createtime") );
        //第二步：调用biz层find方法，获取page对象
        Page page = loggingBiz.find(dc,currentPage, 7);
        System.out.println(page.getData());

        //第三步：将page对象进行json转换
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        String jsonStr = JSON.toJSONString(page);
        System.out.println(page);
        out.write(jsonStr);
        System.out.println(jsonStr);
        return NONE;
    }



    public Log getLog() {
        return log;
    }

    public void setLog(Log log) {
        this.log = log;
    }

    public List<Log> getLogs() {
        return logs;
    }

    public void setLogs(List<Log> logs) {
        this.logs = logs;
    }

    public void setLoggingBiz(LoggingBiz loggingBiz) {
        this.loggingBiz = loggingBiz;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

}
