package com.chinasofti.crm.utils;

import com.chinasofti.crm.vo.JDBC;
import javassist.bytecode.stackmap.TypeData;

import java.io.*;
import java.net.URL;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.concurrent.ThreadFactory;


/**
 * Created by fzm on 2017/8/14.
 */
public class JDBCutil {
    /**
     * @param dbUrl  数据库连接url
     * @param dbUsername  数据库连接用户名
     * @param dbPassword  数据库连接密码
     * @param dbname  数据库名
     * @param IP  IP地址
     */

    // 属性集合对象
    Properties prop = new Properties();

    //jdbc.properties文件运行时路径
    String path = this.getClass().getClassLoader().getResource("jdbc.properties").getPath();

    /**
     * 打开文件流
     *
     * @return true 或 flase
     */
    public Boolean open() {
        FileInputStream fis;
        try {
//            File file = new File(dirPath, "jdbc.properties");
            fis = new FileInputStream(path);
            prop.load(fis);// 将属性文件流装载到Properties对象中
            fis.close();// 关闭流
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 搜索properties 中的 数据库连接属性值
     *
     * @return JDBC 对象
     */
    public JDBC find() {

        JDBC jdbc = new JDBC();
        //调用开启流的方法
        open();
        jdbc.setDbUrl(prop.getProperty("dbUrl"));
        //获取dbUrl
        String dbUrl = jdbc.getDbUrl();
        //中转字符串（包含IP+/+dbname）
        String str2 = null;
        if (dbUrl != null) {
            str2 = dbUrl.substring(dbUrl.indexOf("/") + 2);
        }


        //赋值
        String IP = str2.substring(0, str2.indexOf("/"));

        String dbname = str2.substring(str2.indexOf("/") + 1);

        jdbc.setIP(IP);
        jdbc.setDbname(dbname);
        jdbc.setDbPassword(prop.getProperty("dbPassword"));
        jdbc.setDbUsername(prop.getProperty("dbUsername"));
        return jdbc;
    }
    //参数为要修改的文件路径  以及要修改的属性名和属性值

    /**
     * 更新 properties 中的 数据库连接属性
     *
     * @param jdbc 传递的jdbc对象
     * @return
     */
    public Boolean updatePro(JDBC jdbc) {

        open();
        if (jdbc.getDbUrl() != null) {
            prop.setProperty("dbUrl", jdbc.getDbUrl());
        }
        if (jdbc.getDbUsername() != null) {
            prop.setProperty("dbUsername", jdbc.getDbUsername());
        }
        if (jdbc.getDbPassword() != null) {
            prop.setProperty("dbPassword", jdbc.getDbPassword());
        }

        // 文件输出流
        try {
            FileOutputStream fos = new FileOutputStream(path);

            // 将Properties集合保存到流中
            prop.store(fos, null);

            fos.close();// 关闭流
            open();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

}




