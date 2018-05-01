package com.chinasofti.crm.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/7/2.
 */
public class DataSourceUtils {
    private static  ComboPooledDataSource ds=new ComboPooledDataSource("myDataSource");
    public static ThreadLocal<Connection> connectionThreadLocal=new ThreadLocal<Connection>();
    static {
        Connection conn=connectionThreadLocal.get();
        if(conn==null){
            try {
                connectionThreadLocal.set(getConnection());
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    //回滚事物：
    public final static void rollback(){
        Connection connection=connectionThreadLocal.get();
        if(connection!=null){
            try {
                connection.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    //提交事物
    public final static void commit(){
        Connection connection=connectionThreadLocal.get();
        if(connection!=null){
            try {
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public final static void beginTransation(){
        //获取connection
        Connection connection=connectionThreadLocal.get();
        if(connection!=null){
            try {
                //将原本自动提交的事物改为手动提交的事物
                connection.setAutoCommit(false);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
    public final static Connection getConnection() throws SQLException {
        //返回获取到connection对象
        return ds.getConnection() ;
    }
    public final static javax.sql.DataSource getDataSource(){
      return  ds;
    }

    public final  static void close(Connection connection) throws SQLException {
        connection.close();
    }
}
