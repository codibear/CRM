package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.UserBiz;
import com.chinasofti.crm.dao.UserDao;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.Role;
import com.chinasofti.crm.domain.User;
import com.chinasofti.crm.utils.PwdByMD5;
import com.chinasofti.crm.utils.RandomStr;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by 王立崇 on 2017/8/10 0010.
 */
@Transactional
public class UserBizImpl implements UserBiz {

    private UserDao userDao;


    public Page<User> find(DetachedCriteria dc, int currentPage, int pageData) {
        return userDao.find(dc,currentPage,pageData);
    }

    public void save(User user) {
//        String salt = RandomStr.getRandomStr(6);
//        user.setSalt(salt);
//        String md5Pwd = PwdByMD5.getPwd(user.getUserPwd(),salt);
//        user.setUserPwd(md5Pwd);
//        System.out.println(salt);
//        System.out.println(md5Pwd);
        this.userDao.save(user);
    }

    public List<User> findAll() {
        return userDao.findAll();
    }

    public void modify(User user) {
        userDao.modify(user);

    }

    public void delete(User user) {
        userDao.delete(user);
    }

    public User loadbyid(Serializable id) {
        return userDao.loadbyid(id);
    }

    public List<User> find(String sql, Object... p) {
        return userDao.find(sql,p);
    }

    @Override
    public void add(User user, String[] roleIds) {
        String salt = RandomStr.getRandomStr(6);
        user.setSalt(salt);
        String md5Pwd = PwdByMD5.getPwd(user.getUserPwd(),salt);
        user.setUserPwd(md5Pwd);
        System.out.println(salt);
        System.out.println(md5Pwd);

        userDao.save(user);//持久对象

        for (String roleId : roleIds) {
            Role role = new Role(Integer.parseInt(roleId));
            //用户关联角色
            user.getRoles().add(role);
        }
    }

    @Override
    public List<Role> fiindroleByUserId(Integer userId) {
        return this.userDao.fiindroleByUserId(userId);
    }

    @Override
    public List<Power> findListByUserid(Integer userId) {
        return this.userDao.findListByUserid(userId);
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
