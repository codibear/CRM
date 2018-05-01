package com.chinasofti.crm.shiro;

import com.chinasofti.crm.biz.UserBiz;
import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yuanyanwei on 2017/8/14.
 */
public class UserRealm extends AuthorizingRealm{

    private UserBiz userBiz;

    public void setUserBiz(UserBiz userBiz) {
        this.userBiz = userBiz;
    }
    public void setName(String name){
        super.setName(name);
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String username = (String)token.getPrincipal();
        System.out.println(username);
        User user = null;
        String hql = "from User where userNo=?";
        List<User> users =  userBiz.find(hql,username);
        user = users.get(0);
        if (user == null){
            return null;
        }

        String salt = user.getSalt();
        String password = user.getUserPwd();
        System.out.println(salt);
        System.out.println(password);

        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user,password, ByteSource.Util.bytes(salt),this.getName());

        return simpleAuthenticationInfo;
    }



    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        User user1 = (User) principals.getPrimaryPrincipal();

        List<Power> powers = this.userBiz.findListByUserid(user1.getUserId());

        List<String> pow = new ArrayList<String>();

        if (powers != null){
            for (Power power:powers){
                pow.add(power.getPowerCode());
            }
        }

        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();

        simpleAuthorizationInfo.addStringPermissions(pow);
        return simpleAuthorizationInfo;
    }
    //清空缓存
    public void clearCache(){
        PrincipalCollection principalCollection = SecurityUtils.getSubject().getPrincipals();
        super.clearCache(principalCollection);
    }
}
