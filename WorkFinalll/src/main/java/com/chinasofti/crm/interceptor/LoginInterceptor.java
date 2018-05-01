package com.chinasofti.crm.interceptor;

import com.chinasofti.crm.domain.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

/**
 * Created by 王立崇 on 2017/8/10 0010.
 * 自定义一个struts2拦截器，实现用户未登录，自动跳转到登录页面
 */
public class LoginInterceptor extends MethodFilterInterceptor {
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        User user = (User) ServletActionContext.getRequest().getSession()
                .getAttribute("loginUser");
        if(user == null){
            //未登录，跳转到登录页面
            return "login";
        }
        return actionInvocation.invoke();// 放行
    }
}
