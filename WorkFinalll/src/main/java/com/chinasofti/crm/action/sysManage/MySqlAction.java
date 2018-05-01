package com.chinasofti.crm.action.sysManage;

import com.alibaba.fastjson.JSON;
import com.chinasofti.crm.action.statisticalReport.StaReportAction;
import com.chinasofti.crm.biz.MySqlBiz;
import com.chinasofti.crm.vo.JDBC;
import com.chinasofti.crm.vo.MySqlFile;
import com.chinasofti.crm.vo.Series;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by fzm on 2017/8/12.
 */
public class MySqlAction extends ActionSupport {

    private MySqlBiz mySqlBiz;
    private static MySqlFile mySqlFile = new MySqlFile();
    private JDBC jdbc;
    private static Logger logger = Logger.getLogger(MySqlAction.class);

    private File file;  //上传的临时存储文件

    private String fileName;  //  FileName

    private static Series series = new Series();

    //备份数据库
    public String exportDatabaseTool() throws Exception {

        Date nowTime = new Date(System.currentTimeMillis());
        SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd");
        String retStrFormatNowDate = sdFormatter.format(nowTime);
        retStrFormatNowDate = retStrFormatNowDate + ".sql";
        jdbc = mySqlBiz.findJDBC();
        String path = ServletActionContext.getServletContext().getRealPath("/mySql备份");
        mySqlFile = new MySqlFile(jdbc.getIP(), jdbc.getDbUsername(), jdbc.getDbPassword(), path, retStrFormatNowDate, jdbc.getDbname());

        if (this.mySqlBiz.exportDatabaseTool(mySqlFile)) {
            System.out.println("数据库备份成功！！！");
        } else {
            System.out.println("数据库备份失败！！！");
        }

        return NONE;
    }

    //恢复数据库
    public String importDatabase() throws Exception {


        //   mySqlFile=new MySqlFile();

        /*上传的保存路径全名*/
        String path = ServletActionContext.getServletContext().getRealPath("/mySql恢复");

//        String path = "D:\\mySql备份";
        File filePath = new File(path);


        if (!filePath.exists()) {
            filePath.mkdirs();
        }

        //根据混合方法重命名文件
        String tmpStr = UUID.randomUUID().toString().replace("-", "");

        String extName = "crm.sql";

        String newFileName = tmpStr + extName;

        InputStream is = new FileInputStream(file);

        OutputStream os = new FileOutputStream(new File(filePath, newFileName));

        int num = is.read();

        while (num != -1) {
            os.write(num);
            num = is.read();
        }

        os.close();
        is.close();

        jdbc = mySqlBiz.findJDBC();
        mySqlFile = new MySqlFile(jdbc.getIP(), jdbc.getDbUsername(), jdbc.getDbPassword(), path, newFileName, jdbc.getDbname());

        System.out.println("1.mySqlFile.getPath() : " + mySqlFile.getPath());
        System.out.println("1.mySqlFile.getFileName : " + mySqlFile.getFileName());

        if (this.mySqlBiz.importDatabase(mySqlFile)) {
//            str="数据库恢复成功";
            series.setSerName("数据库恢复成功");
            System.out.println("数据库恢复成功！！！");
            File fileDel = new File(path + "/" + newFileName);
            fileDel.delete();
        } else {
            series.setSerName("数据库恢复失败");
            System.out.println("数据库恢复失败！！！");
            File fileDel = new File(path + "/" + newFileName);
            fileDel.delete();
        }

        return NONE;
    }

//  数据库恢复提示
    public String sendTib() throws IOException {

        HttpServletResponse response = ServletActionContext.getResponse();

        String jsonStr = JSON.toJSONString(series.getSerName());
        System.out.println(jsonStr);

        response.setContentType("text/json");

        PrintWriter out = response.getWriter();

        out.write(jsonStr);

        return NONE;
    }


    /**
     * 修改数据库连接源（JDBC）
     *
     * @return
     * @throws Exception
     */
    public String updateJDBC() throws Exception {

        String meg = mySqlBiz.updateJDBC(jdbc);
        HttpServletResponse response = ServletActionContext.getResponse();

        String jsonStr = JSON.toJSONString(meg);
        System.out.println(jsonStr);

        response.setContentType("text/json");

        PrintWriter out = response.getWriter();

        out.write(jsonStr);
        return NONE;
    }


    /**
     * 初始化显示数据库连接源（JDBC）
     *
     * @return
     * @throws Exception
     */

    public String findJDBC() throws Exception {
        System.out.println("findJDBC");
        jdbc = mySqlBiz.findJDBC();
        System.out.println(mySqlBiz.findJDBC() + "---------");
        System.out.println(jdbc + "/////////////////////");
        HttpServletResponse response = ServletActionContext.getResponse();

        String jsonStr = JSON.toJSONString(jdbc);

        response.setContentType("text/json");

        PrintWriter out = response.getWriter();

        out.write(jsonStr);
        System.out.println(jsonStr);

        return NONE;
    }


    public JDBC getJdbc() {
        return jdbc;
    }

    public void setJdbc(JDBC jdbc) {
        this.jdbc = jdbc;
    }

    public MySqlFile getMySqlFile() {
        return mySqlFile;
    }

    public void setMySqlFile(MySqlFile mySqlFile) {
        this.mySqlFile = mySqlFile;
    }

    public MySqlBiz getMySqlBiz() {
        return mySqlBiz;
    }

    public void setMySqlBiz(MySqlBiz mySqlBiz) {
        this.mySqlBiz = mySqlBiz;
    }


    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public static Logger getLogger() {
        return logger;
    }

    public static void setLogger(Logger logger) {
        MySqlAction.logger = logger;
    }

    public Series getSeries() {
        return series;
    }

    public void setSeries(Series series) {
        this.series = series;
    }
}
