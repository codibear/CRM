package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.Role;
import com.chinasofti.crm.domain.User;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ASUS on 2017/8/10.
 */
public interface RoleBiz {
    Page<Role> find(DetachedCriteria dc, int currentPage, int pageData);

    void save(Role role);

    List<Role> findAll();

    void modify(Role role);

    void delete(Role role);

    Role loadbyid(Serializable id);

    //可变参数
    List<Role> find(String sql, Object ...p);

    void add(Role role, String powers);

    List<Role> findAllNotOne();
}
