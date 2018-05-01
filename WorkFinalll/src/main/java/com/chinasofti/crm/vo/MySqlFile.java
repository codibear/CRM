package com.chinasofti.crm.vo;

/**
 * Created by fzm on 2017/8/13.
 */
public class MySqlFile {

    /**
     *
     * @param hostIP MySQL数据库所在服务器地址IP
     * @param userName 进入数据库所需要的用户名
     * @param password 进入数据库所需要的密码
     * @param path 数据库导出/导入文件保存路径
     * @param fileName 数据库导出文件文件名
     * @param databaseName 要导出的数据库名
     */
    private String hostIP;
    private String userName;
    private String password;
    private String path;
    private String fileName;
    private String databaseName;

    public MySqlFile() {
    }

    public MySqlFile(String hostIP, String userName, String password, String path, String fileName, String databaseName) {
        this.hostIP = hostIP;
        this.userName = userName;
        this.password = password;
        this.path = path;
        this.fileName = fileName;
        this.databaseName = databaseName;
    }

    public String getHostIP() {
        return hostIP;
    }

    public void setHostIP(String hostIP) {
        this.hostIP = hostIP;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String savePath) {
        this.path = savePath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getDatabaseName() {
        return databaseName;
    }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    @Override
    public String toString() {
        return "MySqlFile{" +
                "hostIP='" + hostIP + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", path='" + path + '\'' +
                ", fileName='" + fileName + '\'' +
                ", databaseName='" + databaseName + '\'' +
                '}';
    }
}
