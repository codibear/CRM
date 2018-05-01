package com.chinasofti.crm.action.basicData;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.DataDictionaryBiz;
import com.chinasofti.crm.domain.DataDictionary;
import com.chinasofti.crm.domain.Page;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * Created by ${zsq} on 2017/8/10 0010.
 */
public class DataDictionaryAction extends ActionSupport {
    private Integer number;
    private String type;
    private String entry;
    private DataDictionary dataDictionary;
    private DataDictionaryBiz dataDictionaryBiz;
    private static org.apache.log4j.Logger logger= org.apache.log4j.Logger.getLogger(DataDictionaryAction.class);
    private int currentPage;

//    查询都有哪些类别
public String findType() throws Exception {
    List<DataDictionary> dataDictionaries =this.dataDictionaryBiz.findAll();
    Set types=new HashSet();
    for (DataDictionary v:dataDictionaries){
        types.add(v.getType());
    }
    HttpServletResponse response = ServletActionContext.getResponse();
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/json");
    PrintWriter pw = response.getWriter();
    String json = JSON.toJSONString(types);
    pw.write(json);
//    //日志记录
//    logger.info("查询都有哪些类别");
    return NONE;
}
    //    查询类别下有哪些条目
    public String findEntry() throws Exception {
        String type = getType();
        String[] a={type};
        List<DataDictionary> entry = this.dataDictionaryBiz.find("from DataDictionary where type=? ", a);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(entry);
        pw.write(json);
//        //日志记录
//        logger.info("查询类别下有哪些条目");
        return NONE;
    }
    public String save()throws Exception {
        String a[]={dataDictionary.getType(),dataDictionary.getEntry()};
        List list=dataDictionaryBiz.find("from DataDictionary where type=? and entry=?", a);
        String msg="false";
        try {
            list.get(0);
        }catch (Exception e){
            dataDictionaryBiz.save(dataDictionary);
            msg="success";
        }


        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        pw.write(msg);
//        //日志记录
//        logger.info("保存数据字典");
        return NONE;

    }

    //分页查询
    public String pageList() throws Exception {
        System.out.print(currentPage);
        //第一步先获取DetachedCriteria对象
        DetachedCriteria dc = DetachedCriteria.forClass(DataDictionary.class);

        //第二步：调用biz层find方法，获取page对象
        Page page = dataDictionaryBiz.find(dc,currentPage,5);

        //第三步：将page对象进行json转换
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        String jsonStr = JSON.toJSONString(page);
        out.write(jsonStr);
//        //日志记录
//        logger.info("查询所有");
        return NONE;
    }
//    查询后分页
    public String page() throws Exception{
        DetachedCriteria dc = DetachedCriteria.forClass(DataDictionary.class);
        String type = getType();
        String  entry = getEntry();
        Page page =null;
        if(type!=null&&entry==null){
            String sql="type='"+type+"'";
            dc.add(Restrictions.eq("type",type));
            page = dataDictionaryBiz.find(dc,currentPage,5,sql);
            //日志记录
            logger.info("查询类别下数据字典内容");
        }else if(type!=null&&entry!=null){
            String sql="type='"+type+"'and entry='"+entry+"'";
            dc.add(Restrictions.eq("type",type));
            dc.add(Restrictions.eq("entry",entry));
            page = dataDictionaryBiz.find(dc,currentPage,5,sql);
            //日志记录
            logger.info("查询具体数据字典内容");
        }
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        String jsonStr = JSON.toJSONString(page);
        out.write(jsonStr);

        return NONE;
    }
//    查出要修改的
    public String modify()throws Exception{
    dataDictionary=this.dataDictionaryBiz.loadbyid(getNumber());
//        //日志记录
//        logger.info("查出修改数据字典");
        return "success";
    }
//    修改
    public String modifyy()throws Exception{
        dataDictionaryBiz.modify(dataDictionary);
        String msg="success";
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        pw.write(msg);
//        //日志记录
//        logger.info("修改数据字典");
        return NONE;
    }
//    删除
    public String delete()throws Exception{
        dataDictionary=this.dataDictionaryBiz.loadbyid(dataDictionary.getNumber());
        dataDictionaryBiz.delete(dataDictionary);
            String msg="success";
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setCharacterEncoding("UTF-8");
            PrintWriter pw = response.getWriter();
            pw.write(msg);
//        //日志记录
//        logger.info("删除数据字典");
        return "success";
    }
//模糊查询类别
public String select()throws Exception{
    List<DataDictionary> dataDictionaryes=this.dataDictionaryBiz.select(getType());
    Set types=new HashSet();
    for (DataDictionary v:dataDictionaryes){
        types.add(v.getType());
    }
    HttpServletResponse response = ServletActionContext.getResponse();
    response.setContentType("text/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter pw = response.getWriter();
    String json = JSON.toJSONString(types);
    pw.write(json);
//    //日志记录
//    logger.info("模糊查询数据字典");
    return "none";
}
    public DataDictionaryBiz getDataDictionaryBiz() {
        return dataDictionaryBiz;
    }

    public void setDataDictionaryBiz(DataDictionaryBiz dataDictionaryBiz) {
        this.dataDictionaryBiz = dataDictionaryBiz;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEntry() {
        return entry;
    }

    public void setEntry(String entry) {
        this.entry = entry;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getCurrentPage() {
        return currentPage;
    }

    public DataDictionary getDataDictionary() {
        return dataDictionary;
    }

    public void setDataDictionary(DataDictionary dataDictionary) {
        this.dataDictionary = dataDictionary;
    }
}
