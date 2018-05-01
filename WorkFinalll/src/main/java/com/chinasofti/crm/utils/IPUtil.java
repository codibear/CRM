package com.chinasofti.crm.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by fzm on 2017/8/16.
 */
public class IPUtil {

            public boolean isIP(String addr)
            {
                if(addr.length() < 7 || addr.length() > 15 || "".equals(addr))
                {
                    return false;
                }
                /**
                 * 判断IP格式和范围
                 */
/*
                String string2 ="^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\."
                        +"(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                        +"(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                        +"(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";
                String rexp = "([1-9]|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3}";*/
                String string= "^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])|localhost$";
                Pattern pat = Pattern.compile(string);

                Matcher mat = pat.matcher(addr);

                boolean ipAddress = mat.find();

                return ipAddress;
            }

    }
