package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.RoleDao;
import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.Role;

import java.util.List;

/**
 * Created by ASUS on 2017/8/10.
 */
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao{

    @Override
    public List<Role> findAllNotOne() {
        String hql = "FROM Role WHERE roleName!='系统管理员'";
        return (List<Role>) this.getHibernateTemplate().find(hql);
    }
}
