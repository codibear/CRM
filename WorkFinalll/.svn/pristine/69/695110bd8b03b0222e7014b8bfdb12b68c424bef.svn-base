package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.RoleBiz;
import com.chinasofti.crm.dao.PowerDao;
import com.chinasofti.crm.dao.RoleDao;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.Role;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by ASUS on 2017/8/10.
 */
@Transactional
public class RoleBizImpl implements RoleBiz {

    private RoleDao roleDao;

    public Page<Role> find(DetachedCriteria dc, int currentPage, int pageData) {
        return roleDao.find(dc, currentPage, pageData);
    }

    public void save(Role role) {
        this.roleDao.save(role);
    }

    public List<Role> findAll() {
        return roleDao.findAll();
    }

    public void modify(Role role) {
        roleDao.modify(role);
    }

    public void delete(Role role) {
        roleDao.delete(role);
    }

    public Role loadbyid(Serializable id) {
        return roleDao.loadbyid(id);
    }

    public List<Role> find(String sql, Object... p) {
        return roleDao.find(sql, p);
    }

    @Override
    public void add(Role role, String powers) {

        roleDao.save(role);//持久对象

        String[] powerIds = powers.split(",");

        for (String powerId : powerIds) {
            Power power = new Power(Integer.parseInt(powerId));
            //角色关联权限
            role.getPowers().add(power);
        }
    }

    @Override
    public List<Role> findAllNotOne() {
        return roleDao.findAllNotOne();
    }

    public RoleDao getRoleDao() {
        return roleDao;
    }

    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }
}
