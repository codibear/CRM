package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.UserDao;
import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.Role;
import com.chinasofti.crm.domain.User;

import java.util.List;


/**
 * Created by 王立崇 on 2017/8/10 0010.
 */
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

    @Override
    public List<Role> fiindroleByUserId(Integer userId) {
        String hql = "SELECT DISTINCT r FROM Role r LEFT OUTER JOIN r.users u WHERE u.userId = ?";
        return (List<Role>) this.getHibernateTemplate().find(hql, userId);    }

    @Override
    public List<Power> findListByUserid(Integer userid) {
        String hql = "SELECT DISTINCT p FROM Power p LEFT OUTER JOIN p.roles r" +
                " LEFT OUTER JOIN r.users u WHERE u.userId = ?";
        return (List<Power>) this.getHibernateTemplate().find(hql, userid);
    }
}
