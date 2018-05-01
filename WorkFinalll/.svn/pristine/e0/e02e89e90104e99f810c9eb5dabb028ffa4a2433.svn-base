package com.chinasofti.crm.action.salesOpp;

import com.chinasofti.crm.biz.SalesBiz;
import com.chinasofti.crm.domain.SalesManage;
import com.chinasofti.crm.utils.ExcelUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

/**
 * Created by codiibear on 2017/8/10.
 */
public class DownTest extends ActionSupport {
    private SalesBiz salesBiz;
    private InputStream inputStream;
    private String pathName;
    private String fileName;
    private long contentLength;

    public String execute() throws FileNotFoundException {

        UUID uuid = UUID.randomUUID();
        //获的唯一的名字
        String name = uuid.toString().replace("-","");
        //路径
        String path = ServletActionContext.getServletContext().getRealPath("/excel4Sale") ;
        System.out.println(path);

        File filePath = new File(path) ;

        //如果上传保存路径不存在，则创建
        if(!filePath.exists()) {
            filePath.mkdirs() ;
        }
        path=path+"\\";
        //查找list机会管理表
        List<SalesManage> salesManage = salesBiz.findAll();
        ExcelUtil.getExcel(path,name,"机会管理表",salesManage);
        pathName = path+name+".xlsx";
        System.out.println(path+name+".xlsx");
        File file = new File(pathName);
        fileName=file.getName();
        inputStream = new FileInputStream(pathName);
        return SUCCESS;



       /* File fileToDownload = new File("D:/a.xlsx");

        inputStream = new FileInputStream(fileToDownload);
        fileName = fileToDownload.getName();
        contentLength = fileToDownload.length();

        return SUCCESS;*/
    }

    public String getPathName() {
        return pathName;
    }

    public SalesBiz getSalesBiz() {
        return salesBiz;
    }

    public void setSalesBiz(SalesBiz salesBiz) {
        this.salesBiz = salesBiz;
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
}
