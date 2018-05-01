package com.chinasofti.crm.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2017/8/16.
 */
public class isEnglishOrChineseUtil {

    public static boolean isChinese(String str){
        String regEx = "[\\u4e00-\\u9fa5]+";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        if(m.find()) {
            return true;
        }else {
            return false;
        }
    }
    public static boolean isEnglish(String charaString){
        return charaString.matches("^[a-zA-Z]*");
    }
}
