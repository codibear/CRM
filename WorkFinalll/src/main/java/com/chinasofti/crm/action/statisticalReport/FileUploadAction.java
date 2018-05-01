package com.chinasofti.crm.action.statisticalReport;

import com.chinasofti.crm.biz.TitleAndLogoBiz;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/7/24 0024.
 */
public class FileUploadAction {
    private List<File> file ;  //上传的临时存储文件
    private List<String> fileFileName ;  // 上传文件的表单字段名称 + FileName
    private List<String> fileContentType ;  //获取上传文件的类型
    private TitleAndLogoBiz titleAndLogoBiz;

    public String execute() throws Exception {

        /*上传的保存路径全名*/

        String path = ServletActionContext.getServletContext().getRealPath("/upload") ;


        File filePath = new File(path) ;

        //如果上传保存路径不存在，则创建
        if(!filePath.exists()) {
            filePath.mkdirs() ;
        }
        /**
         * 多文件上传
         */
        String newFileName=null;
        for(int i = 0 ; i < file.size() ; i++) {
            //根据混合方法
            String tmpStr = UUID.randomUUID().toString().replace("-","") ;
            //111.temp.jpg
            String extName = fileFileName.get(i).substring(fileFileName.get(i).lastIndexOf(".")) ;

            newFileName = tmpStr + extName ;

            InputStream is = new FileInputStream(file.get(i)) ;

            OutputStream os = new FileOutputStream(new File(filePath,newFileName)) ;

            //继续优化 Buffered

            int num = is.read() ;

            while(num != -1) {
                os.write(num);
                num = is.read() ;
            }

            os.close();
            is.close();
        }

        titleAndLogoBiz.updatelogo(newFileName);
        return "success" ;

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

    public void setTitleAndLogoBiz(TitleAndLogoBiz titleAndLogoBiz) {
        this.titleAndLogoBiz = titleAndLogoBiz;
    }
}
