package com.chinasofti.crm.action.quotation;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.QuotationBiz;
import com.chinasofti.crm.domain.Quotation;
import com.chinasofti.crm.utils.isEnglishOrChineseUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/8/10.
 */
public class QuotationSelAction extends ActionSupport {
    private QuotationBiz quotationBiz;
    private int quotationId;
    private String quotationCreater="";
    private String quotationStatus="";
    private List<Quotation> l=new ArrayList<Quotation>();
//    多条件查询
    public String findBySome() throws IOException {
        System.out.println(quotationId);
        System.out.println(">>>>>>>>>>>>>>>>>"+quotationCreater);
        System.out.println(quotationStatus);
        if(quotationId!=0&&quotationCreater.equals("")){
            l=quotationBiz.find("from Quotation where quotationId=? and quotationStatus='未审核'",quotationId);
            if(l.size()!=0){
                sendJson();}
        }
        if(quotationId==0&&!quotationCreater.equals("")){
            l=quotationBiz.find("from Quotation where quotationCreater=? and quotationStatus='未审核'",quotationCreater);
            if(l.size()!=0){
                sendJson();}
        }
        if(quotationId!=0&&!quotationCreater.equals("")){
            l=quotationBiz.find("from Quotation where quotationId=? and quotationCreater=? and quotationStatus='未审核'",quotationId,quotationCreater);
            if(l.size()!=0){
                sendJson();}
        }
        if(quotationId==0&&quotationCreater.equals("")){

        }
        return NONE;
    }
    public void sendJson() throws IOException {
        HttpServletResponse response= ServletActionContext.getResponse();
        String jsonStr= JSON.toJSONString(l);
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter pw=response.getWriter();
        pw.write(jsonStr);
    }
    public String vague() throws IOException {
        System.out.println("进入模糊查询方法!");
        boolean b= isEnglishOrChineseUtil.isEnglish(quotationCreater);
        if(b==true){
            l=quotationBiz.searchCreater(quotationCreater);
            List<String> quotationCreaters=new ArrayList<String>();
           for(Quotation quotation:l){
                quotationCreaters.add(quotation.getQuotationCreater());
           }
            Set<String> set= new HashSet(quotationCreaters);
            HttpServletResponse response= ServletActionContext.getResponse();
            String jsonStr= JSON.toJSONString(set);
            //将文件的类型设置为json格式
            response.setContentType("text/json");
            PrintWriter pw=response.getWriter();
            pw.write(jsonStr);

        }else {
            l=quotationBiz.searchCreaterByHanzi(quotationCreater);
            List<String> quotationCreaters=new ArrayList<String>();
            for(Quotation quotation:l){
                quotationCreaters.add(quotation.getQuotationCreater());
            }
            Set<String> set= new HashSet(quotationCreaters);
            HttpServletResponse response= ServletActionContext.getResponse();
            String jsonStr= JSON.toJSONString(set);
            //将文件的类型设置为json格式
            response.setContentType("text/json");
            PrintWriter pw=response.getWriter();
            pw.write(jsonStr);


        }

        return NONE;
    }
    public void setQuotationBiz(QuotationBiz quotationBiz) {
        this.quotationBiz = quotationBiz;
    }

    public int getQuotationId() {
        return quotationId;
    }

    public void setQuotationId(int quotationId) {
        this.quotationId = quotationId;
    }

    public String getQuotationCreater() {
        return quotationCreater;
    }

    public void setQuotationCreater(String quotationCreater) {
        this.quotationCreater = quotationCreater;
    }

    public String getQuotationStatus() {
        return quotationStatus;
    }

    public void setQuotationStatus(String quotationStatus) {
        this.quotationStatus = quotationStatus;
    }
}
