package com.chinasofti.crm.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

/**
 * Created by fzm on 2017/8/16.
 */
public class TomcatUtil {

    static Map<String, String> envs = System.getenv();
    String path = envs.get("TOMCAT_HOME");

    public void tom(String cat) throws Exception {
        Process process = Runtime.getRuntime().exec("cmd.exe /c " + path + cat); // 调用外部程序
        final InputStream in = process.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        StringBuilder buf = new StringBuilder();
        String line = null;
        while ((line = br.readLine()) != null) buf.append(line);
        System.out.println("输出结果为：" + buf);
    }


    //开启tomcat 方法
    public void start() throws Exception {

        String cat = "bin\\startup.bat";
        tom(cat);
//  new Thread(new Runnable() {
//      public void run() {
//          BufferedReader br = new BufferedReader(new InputStreamReader(in));
//          try {
//     while(br.readLine() != null) ;
//    } catch (IOException e) {
//     e.printStackTrace();
//    }
//      }
//  }).start();// 启动单独的线程来清空process.getInputStream()的缓冲区
//  InputStream error = process.getErrorStream();
//  BufferedReader br = new BufferedReader(new InputStreamReader(error));
//  StringBuilder buf = new StringBuilder(); // 保存输出结果流
//  String line = null;
//  while((line = br.readLine()) != null) buf.append(line); // 循环等待ffmpeg进程结束
//  System.out.println("输出结果为：" + buf);
    }

    //关闭tomact方法
    public void shout() throws Exception {
        String cat = "bin\\shutdown.bat";
        tom(cat);

    }


}


