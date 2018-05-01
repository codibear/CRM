package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.MySqlDao;
import com.chinasofti.crm.vo.MySqlFile;
import org.hibernate.SessionFactory;

import java.io.File;
import java.io.IOException;

/**
 * Created by fzm on 2017/8/12.
 */
public class MySqlDaoImpl implements MySqlDao{

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * Java代码实现MySQL数据库导出
     *
     *  hostIP MySQL数据库所在服务器地址IP
     * userName 进入数据库所需要的用户名
     *  password 进入数据库所需要的密码
     *  path 数据库导出文件保存路径
     *  fileName 数据库导出文件文件名
     *  databaseName 要导出的数据库名
     *  返回true表示导出成功，否则返回false。
     */
    public  boolean exportDatabaseTool(MySqlFile mySqlFile) {
        File saveFile = new File(mySqlFile.getPath());
        if (!saveFile.exists()) {// 如果目录不存在
            saveFile.mkdirs();// 创建文件夹
        }
        if (!mySqlFile.getPath().endsWith(File.separator)) {
           mySqlFile.setPath(mySqlFile.getPath() + File.separator);
        }

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("cmd /C  mysqldump").append(" --opt").append(" -h").append(mySqlFile.getHostIP());
        stringBuilder.append(" --user=").append(mySqlFile.getUserName()) .append(" --password=").append(mySqlFile.getPassword()).append(" --lock-all-tables=true");
        stringBuilder.append(" --result-file=").append(mySqlFile.getPath() + mySqlFile.getFileName()).append(" --default-character-set=utf8 ").append(mySqlFile.getDatabaseName());
        System.out.println(stringBuilder);
        try {
            Process process = Runtime.getRuntime().exec(stringBuilder.toString());
            System.out.println(process.waitFor());
            if (process.waitFor() == 0) {// 0 表示线程正常终止。
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Java实现MySQL数据库导入
     *  hostIP MySQL数据库所在服务器地址IP
     *  userName 数据库用户名
     *  password 进入数据库所需要的密码
     *  path 数据库文件路径
     *  sqlFileName 数据库文件名
     *  databaseName 要导入的数据库名
     *  返回true表示导入成功，否则返回false。
     */
    public  boolean importDatabase(MySqlFile mySqlFile) {
        File saveFile = new File(mySqlFile.getPath(),"UTF-8");
        if (!saveFile.exists()) {// 如果目录不存在
            saveFile.mkdirs();// 创建文件夹
        }
        if (!mySqlFile.getPath().endsWith(File.separator)) {
            mySqlFile.setPath(mySqlFile.getPath() + File.separator);
        }
        System.out.println(mySqlFile+"@@@@@@@@@@@@@@@@@@@@@");

        StringBuilder stringBuilder=new StringBuilder();
        stringBuilder.append("cmd /c mysql").append(" -h").append(mySqlFile.getHostIP());
        stringBuilder.append(" -u").append(mySqlFile.getUserName()).append(" -p").append(mySqlFile.getPassword());
        stringBuilder.append(" ").append(mySqlFile.getDatabaseName());
        stringBuilder.append(" <").append(mySqlFile.getPath()).append(mySqlFile.getFileName());
        try {
            Process process = Runtime.getRuntime().exec(stringBuilder.toString());//必须要有“cmd /c ”
            if (process.waitFor() == 0) {// 0 表示线程正常终止。
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return false;
    }




}
