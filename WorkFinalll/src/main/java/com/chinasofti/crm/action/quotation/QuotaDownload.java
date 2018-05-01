package com.chinasofti.crm.action.quotation;

import com.chinasofti.crm.biz.QuotationBiz;
import com.chinasofti.crm.domain.SalesManage;
import com.chinasofti.crm.utils.ExcelUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

/**
 * Created by codiibear on 2017/8/22.
 */
public class QuotaDownload extends ActionSupport {
    private List list;
    private InputStream inputStream;
    private String pathName;
    private String fileName;
    private String quotationStatus;
    private QuotationBiz quotationBiz;
    private long contentLength;

    public String execute() throws IOException {

        System.out.println("请求了action");
        System.out.println(quotationStatus);
        list=this.quotationBiz.findByStatus("已通过");

        String path = ServletActionContext.getServletContext().getRealPath("/excel4quota") ;
        File filePath = new File(path) ;

        //如果上传保存路径不存在，则创建
        if(!filePath.exists()) {
            filePath.mkdirs() ;
        }
        path=path+"\\";

        ExcelUtil.getExcel(path,"报价管理单","报价管理单",list);

        pathName = path+"报价管理单"+".xlsx";
        File file = new File(pathName);
        fileName=file.getName();
        inputStream = new FileInputStream(pathName);
        /*HttpServletResponse response = ServletActionContext.getResponse() ;
        PrintWriter out = response.getWriter() ;
        out.write("导出成功");*/
        return SUCCESS;



       /* File fileToDownload = new File("D:/a.xlsx");

        inputStream = new FileInputStream(fileToDownload);
        fileName = fileToDownload.getName();
        contentLength = fileToDownload.length();

        return SUCCESS;*/
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public String getPathName() {
        return pathName;
    }

    public long getContentLength() {
        return contentLength;
    }

    public String getFileName() {
        return fileName;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getQuotationStatus() {
        return quotationStatus;
    }

    public void setQuotationStatus(String quotationStatus) {
        this.quotationStatus = quotationStatus;
    }

    public QuotationBiz getQuotationBiz() {
        return quotationBiz;
    }

    public void setQuotationBiz(QuotationBiz quotationBiz) {
        this.quotationBiz = quotationBiz;
    }
}
