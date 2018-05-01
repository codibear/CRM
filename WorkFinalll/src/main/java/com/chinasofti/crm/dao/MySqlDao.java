package com.chinasofti.crm.dao;

import com.chinasofti.crm.vo.MySqlFile;

/**
 * Created by fzm on 2017/8/12.
 */
public interface MySqlDao {


    boolean exportDatabaseTool(MySqlFile mySqlFile);
    boolean importDatabase(MySqlFile mySqlFile);
}
