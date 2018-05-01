package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.MySqlBiz;
import com.chinasofti.crm.dao.MySqlDao;
import com.chinasofti.crm.utils.IPUtil;
import com.chinasofti.crm.utils.JDBCutil;
import com.chinasofti.crm.vo.JDBC;
import com.chinasofti.crm.vo.MySqlFile;

/**
 * Created by fzm on 2017/8/12.
 */
public class MySqlBizImpl implements MySqlBiz {

    private MySqlDao mySqlDao;


    @Override
    public boolean exportDatabaseTool(MySqlFile mySqlFile) {
        boolean b = this.mySqlDao.exportDatabaseTool(mySqlFile);

        return b;
    }

    @Override
    public boolean importDatabase(MySqlFile mySqlFile) {
        boolean b = this.mySqlDao.importDatabase(mySqlFile);
        return b;
    }

    @Override
    public String updateJDBC(JDBC jdbc) {
        JDBCutil jdbCutil = new JDBCutil();
        IPUtil ipUtil = new IPUtil();

            if (jdbc.getDbname().trim().equals("")) {
                return "数据库名不可为空";
            }
            if (jdbc.getDbUsername().trim().equals("")) {
                return "用户名不可为空";
            }
            if (jdbc.getDbPassword().trim().equals("")) {
                return "密码不可为空";
            }
            if (!ipUtil.isIP(jdbc.getIP())) {
                return "请输入正确的IP地址";
            }
            String url = "jdbc:mysql://";
            String url2 = "/";
            jdbc.setDbUrl(url + jdbc.getIP() + url2 + jdbc.getDbname());
            jdbCutil.updatePro(jdbc);
            System.out.println(jdbc);
             return "更新成功";
    }



    @Override
    public JDBC findJDBC() {
        JDBCutil jdbCutil = new JDBCutil();
        JDBC jdbc = jdbCutil.find();
        return jdbc;
    }


    public MySqlDao getMySqlDao() {
        return mySqlDao;
    }


    public void setMySqlDao(MySqlDao mySqlDao) {
        this.mySqlDao = mySqlDao;
    }

}
