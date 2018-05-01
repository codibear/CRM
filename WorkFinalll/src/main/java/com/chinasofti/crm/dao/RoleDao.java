package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.Role;
import com.chinasofti.crm.domain.User;

import java.util.List;

/**
 * Created by ASUS on 2017/8/10.
 */
public interface RoleDao extends BaseDao<Role> {
    List<Role> findAllNotOne();
}
