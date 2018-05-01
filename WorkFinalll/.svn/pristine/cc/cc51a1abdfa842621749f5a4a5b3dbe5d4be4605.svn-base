package com.chinasofti.crm.utils;


import com.chinasofti.crm.domain.User;
import org.apache.log4j.MDC;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by  Li min  on 2017/8/12.
 */
public class ResFilter implements Filter{

    private final static double DEFAULT_USERID= Math.random()*100000.0;

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)request;
        HttpSession session= req.getSession();

        String remoteAddr = request.getRemoteAddr();

        if (session==null){
            MDC.put("userId",DEFAULT_USERID);
        }
        else{
            User user=(User) session.getAttribute("user");
            if (user==null){
                MDC.put("userId",DEFAULT_USERID);
                MDC.put("userName",DEFAULT_USERID);
            }
            else
            {
                MDC.put("userId",user.getUserId());
                MDC.put("userName",user.getUserName());
                MDC.put("IP", ((HttpServletRequest) request).getSession().getAttribute("IP"));
            }
        }
        //logger.info("test for MDC.");
        chain.doFilter(request, response);
    }
    public void init(FilterConfig Config) throws ServletException {


    }
}