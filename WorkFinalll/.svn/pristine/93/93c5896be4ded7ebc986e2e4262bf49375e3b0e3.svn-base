package com.chinasofti.crm.action.statisticalReport;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.TitleAndLogoBiz;
import com.chinasofti.crm.domain.WebSystem;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;


/**
 * Created by 杨广 on 2017/8/15.
 */
public class TitleAndLogoAction extends ActionSupport {
    private WebSystem webSystem;
    private TitleAndLogoBiz titleAndLogoBiz;
    private String systemname;
    private String title;
    private String copyright;
    /*图片上传*/
    private List<File> file ;  //上传的临时存储文件
    private List<String> fileFileName ;  // 上传文件的表单字段名称 + FileName
    private List<String> fileContentType ;  //获取上传文件的类型
    private static Logger logger=Logger.getLogger(StaReportAction.class);
    /*系统更新*/
    //查询系统名和logo
    public String findWeb() throws IOException {
        System.out.println("收到查询title ＆ logo 请求");
        webSystem=titleAndLogoBiz.findWeb();
        HttpServletResponse response=ServletActionContext.getResponse();
        String str= JSON.toJSONString(webSystem);
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        out.write(str);
        return NONE;
    }
    public String updatename() throws IOException {
        HttpServletRequest request=ServletActionContext.getRequest();
       String name= request.getParameter(systemname);
        System.out.println(name);
        System.out.println("收到更新系统名 请求");
        titleAndLogoBiz.updatename(systemname);
        System.out.println(systemname);

        //日志记录
        logger.info("修改系统名称");

        return "success";
    }
    /*更新title*/
    public String updatetitle() throws IOException {
        HttpServletRequest request=ServletActionContext.getRequest();
        String name= request.getParameter(title);
        System.out.println(name);
        System.out.println("收到更新title 请求");
        titleAndLogoBiz.updatetitle(title);
        System.out.println(title);
        //日志记录
        logger.info("修改title");

        return "success";
    }
    /*更新版权*/
    public String updatecopyright() throws IOException {
        HttpServletRequest request=ServletActionContext.getRequest();
        String name= request.getParameter(copyright);
        System.out.println(name);
        System.out.println("收到更新copyright请求");
        titleAndLogoBiz.updatcopyright(copyright);
        System.out.println(copyright);
        //日志记录
        logger.info("修改版权信息");

        return "success";
    }
    /*更新logo*/
    public String execute()throws Exception{
        System.out.println("收到更新logo请求");
        /*上传的保存路径全名*/
            String path = ServletActionContext.getServletContext().getRealPath("/update");
            File filePath = new File(path);
            //如果上传保存路径不存在，则创建
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            /**
             * 多文件上传
             */
            for (int i = 0; i < file.size(); i++) {
            /*根据混合方法*/
                String tmpStr = UUID.randomUUID().toString().replace("-", "");
                //111.temp.jpg 扩展名
                String extName = fileFileName.get(i).substring(fileFileName.get(i).lastIndexOf("."));
//        读  写
                String newFileName = tmpStr + extName ;
                System.out.println(newFileName);
                InputStream is = new FileInputStream(file.get(i)) ;
                OutputStream os = new FileOutputStream(new File(filePath,newFileName)) ;
                titleAndLogoBiz.updatelogo(newFileName);
                int num = is.read();
                while (num != -1) {
                    os.write(num);
                    num = is.read();
                }
                is.close();
                os.close();

            }

        //日志记录
        logger.info("图片上传");
        return "success1";
    }

    public WebSystem getWebSystem() {
        return webSystem;
    }

    public void setWebSystem(WebSystem webSystem) {
        this.webSystem = webSystem;
    }

    public void setTitleAndLogoBiz(TitleAndLogoBiz titleAndLogoBiz) {
        this.titleAndLogoBiz = titleAndLogoBiz;
    }

    public String getSystemname() {
        return systemname;
    }

    public void setSystemname(String systemname) {
        this.systemname = systemname;
    }

    public TitleAndLogoBiz getTitleAndLogoBiz() {
        return titleAndLogoBiz;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }

    public List<File> getFile() {
        return file;
    }

    public void setFile(List<File> file) {
        this.file = file;
    }

    public List<String> getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(List<String> fileFileName) {
        this.fileFileName = fileFileName;
    }

    public List<String> getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(List<String> fileContentType) {
        this.fileContentType = fileContentType;
    }
}
