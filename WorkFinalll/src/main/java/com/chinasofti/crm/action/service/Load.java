package com.chinasofti.crm.action.service;

import com.chinasofti.crm.biz.ServiceBiz;
import com.chinasofti.crm.domain.Service;
import com.chinasofti.crm.utils.ServiceExcelUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

public class Load extends ActionSupport {
    private ServiceBiz serviceBiz;
    private InputStream inputStream;
    private String pathName;
    private String fileName;

    //  查询所有已归档的服务记录
    public String downLoad() throws FileNotFoundException {
        System.out.println("进入了downLoad方法");
        UUID uuid = UUID.randomUUID();
        //  获的唯一的名字
        String name = uuid.toString().replace("-","");
        //路径
        String path = ServletActionContext.getServletContext().getRealPath("/excelService") ;
        System.out.println("------------path:"+path) ;
        File filePath = new File(path) ;
        //如果上传保存路径不存在，则创建
        if(!filePath.exists()) {
            filePath.mkdirs() ;
        }
        path=path+"\\";
        //  查找list服务归档表
        String serviceState="已归档";
        List<Service> services =  this.serviceBiz.find("FROM Service WHERE serviceState=?",serviceState);
        System.out.println(services);
        ServiceExcelUtil.getExcel(path,name,"服务归档表",services);
        pathName = path+name+".xlsx";
        System.out.println(path+name+".xlsx");
        File file = new File(pathName);
        fileName=file.getName();
        inputStream = new FileInputStream(pathName);
        return "success";
    }

    public void setServiceBiz(ServiceBiz serviceBiz) {
        this.serviceBiz = serviceBiz;
    }

    public String getPathName() {
        return pathName;
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

}
