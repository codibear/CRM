package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.Role;
import com.chinasofti.crm.domain.User;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 王立崇 on 2017/8/10 0010.
 */
public interface UserBiz {
    Page<User> find(DetachedCriteria dc, int currentPage, int pageData);

    void save(User user);

    List<User> findAll();

    void modify(User user);

    void delete(User user);

    User loadbyid(Serializable id);

    //可变参数
    List<User> find(String sql, Object... p);

    //添加角色和用户
    void add(User user, String[] roleIds);

    
    //通过userId查询角色
    List<Role> fiindroleByUserId(Integer userId);
    //通过userId查询角色和权限
    List<Power> findListByUserid(Integer userId);

}
