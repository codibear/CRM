package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.Role;
import com.chinasofti.crm.domain.User;

import java.util.List;

/**
 * Created by 王立崇 on 2017/8/10 0010.
 */
public interface UserDao extends BaseDao<User>{
    //通过userId查询角色
    List<Role> fiindroleByUserId(Integer userId);
    //通过userId查询角色和权限
    List<Power> findListByUserid(Integer userId);
}
