package com.chinasofti.crm.action.news;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.biz.LunboBiz;
import com.chinasofti.crm.domain.Lunbo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by jlkj on 2017/8/9.
 */
public class LunboAction extends ActionSupport {
    private LunboBiz lunboBiz;
    private Lunbo lunbo;
    private String newFileName;
    private String picName;
    private String uploadMan;

    private Integer photoId;

    private List<File> file;
    private List<String> fileFileName;
    private List<String> fileContentType;
    private static org.apache.log4j.Logger logger= org.apache.log4j.Logger.getLogger(LunboAction.class);


//    查询所有轮播图
    public String list() throws Exception{
        List<Lunbo> lunbos=this.lunboBiz.findAll();
        HttpServletResponse response = ServletActionContext.getResponse() ;
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();

        String json = JSON.toJSONString(lunbos) ;
        pw.write(json);
//        //日志记录
//        logger.info("查询所有轮播图");
        return NONE;

    }
    //分类查询
    public String find()throws Exception{
        System.out.println(picName);
        System.out.println(uploadMan);
        List<String> list=new ArrayList();
        List<Lunbo> lunbos=null;
        String sql="from Lunbo where 1=1 ";
        if (picName!=""){
            sql+=" and picName="+"?";
            list.add(picName);
        }if (uploadMan!=""){
            sql+=" and uploadMan=?";
            list.add(uploadMan);
        }
        for (String s:list){
            System.out.println(s);
            String[] p={s};
            System.out.println(sql);
            lunbos=lunboBiz.find(sql,p);
            System.out.println(lunbos);
        }
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        PrintWriter pw = response.getWriter();
        String json = JSON.toJSONString(lunbos);
        pw.write(json);
//        //日志记录
//        logger.info("轮播图动态查询");
        return NONE;
    }

//    修改轮播图（替换）
    public String modify()throws Exception{
        if (newFileName!=null) {
            lunbo.setRelName(newFileName);
        }
        this.lunboBiz.modify(lunbo);
//        //日志记录
//        logger.info("修改轮播图");
        return "success";
    }
    public String findById()throws Exception{
       lunbo=this.lunboBiz.findById(photoId);
        ActionContext.getContext().getValueStack().push(lunbo);

        System.out.println(lunbo.getPhotoId());
//        //日志记录
//        logger.info("根据ID查找轮播图");
        return "ok";
    }
    //文件上传
    public String execute()throws Exception{
        try {
        /*上传的保存路径全名*/
            String path = ServletActionContext.getServletContext().getRealPath("/assets/img");
            System.out.println("-------------" + path);
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
                String newName=tmpStr + extName;
//            String extName=fileFileName.get(i);
//        读  写
                InputStream is = new FileInputStream(file.get(i));
                BufferedInputStream bis = new BufferedInputStream(is);
                OutputStream os = new FileOutputStream(new File(filePath, newName));
                BufferedOutputStream bos = new BufferedOutputStream(os);
                int num = bis.read();
                while (num != -1) {
                    bos.write(num);
                    num = bis.read();
                }
                bis.close();
                bos.close();
                newFileName =newName;
            }
        }catch (Exception e){

        }
//        //日志记录
//        logger.info("图片上传");
        return "file";
    }




    public LunboBiz getLunboBiz() {
        return lunboBiz;
    }

    public void setLunboBiz(LunboBiz lunboBiz) {
        this.lunboBiz = lunboBiz;
    }

    public Lunbo getLunbo() {
        return lunbo;
    }

    public void setLunbo(Lunbo lunbo) {
        this.lunbo = lunbo;
    }

    public String getPicName() {
        return picName;
    }

    public void setPicName(String picName) {
        this.picName = picName;
    }

    public String getUploadMan() {
        return uploadMan;
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

    public void setUploadMan(String uploadMan) {
        this.uploadMan = uploadMan;
    }

    public Integer getPhotoId() {
        return photoId;
    }

    public void setPhotoId(Integer photoId) {
        this.photoId = photoId;
    }

    public String getNewFileName() {
        return newFileName;
    }

    public void setNewFileName(String newFileName) {
        this.newFileName = newFileName;
    }
}
