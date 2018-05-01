package com.chinasofti.crm.biz;

import com.chinasofti.crm.vo.JDBC;
import com.chinasofti.crm.vo.MySqlFile;

/**
 * Created by fzm on 2017/8/12.
 */
public interface MySqlBiz {

    boolean exportDatabaseTool(MySqlFile mySqlFile);
    boolean importDatabase(MySqlFile mySqlFile);

    String  updateJDBC(JDBC jdbc) ;
    JDBC  findJDBC() ;
}
