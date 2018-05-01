package com.chinasofti.crm.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * Created by yuanyanwei on 2017/8/16.
 */
public class PwdByMD5 {
    public static String getPwd(String pwd, String salt) {

        int hashIterations = 1;

        Md5Hash md5Hash = new Md5Hash(pwd, salt, hashIterations);

        String password = md5Hash.toString();
        return password;
    }
//    public static void main(String args[]){
//        String salt = RandomStr.getRandomStr(5);
//        String pwd = "111111";
//        String password = getPwd(pwd,salt);
//        System.out.println(salt);
//        System.out.println(password);
//    }
}
