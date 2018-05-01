package com.chinasofti.crm.action.sysManage;

import com.chinasofti.crm.biz.LoggingBiz;
import com.chinasofti.crm.domain.Log;
import com.chinasofti.crm.utils.ExcelUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;

import java.io.*;
import java.util.List;
import java.util.UUID;

/**
 * Created by  Li min  on 2017/8/15.
 */
public class DownloadExcel extends ActionSupport {

    private Log logging;
    private LoggingBiz loggingBiz;
    private List list;
    private String pathName;
    private String fileName;
    private InputStream inputStream;
    private static Logger logger=Logger.getLogger(DownloadExcel.class);




    public String execute() throws FileNotFoundException {
        List list = this.loggingBiz.findAll();
        System.out.println(list.get(0));

//        HttpServletResponse response = ServletActionContext.getResponse();
//
//        OutputStream output = response.getOutputStream();
//        response.reset();
//        response.setHeader("Content-disposition", "attachment; filename=" + path);
//        response.setContentType("Content-Type:application/vnd.ms-excel ");
//        PrintWriter wb = response.getWriter();
//        wb.write(String.valueOf(output));
//        output.close();

        UUID uuid = UUID.randomUUID();
        //获的唯一的名字
        String name = uuid.toString().replace("-","");
        //路径
        String path = "F:/";
        ExcelUtil.getExcel(path,name,"日志记录表",list);
        pathName = path+name+".xlsx";
        System.out.println(path+name+".xlsx");
        File file = new File(pathName);
        fileName=file.getName();
        inputStream = new FileInputStream(pathName);

        //日志记录
        logger.info("导出日志记录.xls");

        return SUCCESS;
    }

    public Log getLogging() {
        return logging;
    }

    public void setLogging(Log logging) {
        this.logging = logging;
    }

    public LoggingBiz getLoggingBiz() {
        return loggingBiz;
    }

    public void setLoggingBiz(LoggingBiz loggingBiz) {
        this.loggingBiz = loggingBiz;
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

    public void setPathName(String pathName) {
        this.pathName = pathName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
