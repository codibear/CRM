package com.chinasofti.crm.utils;

import java.util.Random;

/**
 * Created by yuanyanwei on 2017/8/16.
 */
public class RandomStr {
    public static String getRandomStr(int length){
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        int randomNum;
        char randomChar;
        Random random = new Random();
        StringBuffer str = new StringBuffer();

        for (int i = 0;i < length;i++){
            randomNum = random.nextInt(base.length());
            randomChar = base.charAt(randomNum);
            str.append(randomChar);
        }
        return str.toString();
    }
//    public static void main(String[] args){
//        System.out.println(getRandomStr(5));
//    }
}
