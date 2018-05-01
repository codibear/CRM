package com.chinasofti.crm.domain;

import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 王立崇 on 2017/8/10 0010.
 */
public class Role implements Serializable {

    private Integer roleId;//编号
    private String roleName;//角色名称
    @JSONField(serialize = false)
    private transient Set<User> users=new HashSet<User>(0);
    @JSONField(serialize = false)
    private transient Set<Power> powers=new HashSet<Power>(0);

    public Role() {
    }

    public Role(Integer roleId) {
        this.roleId = roleId;
    }

    public Role(Integer roleId, String roleName, Set<User> users, Set<Power> powers) {
        this.roleId = roleId;
        this.roleName = roleName;
        this.users = users;
        this.powers = powers;
    }

    public Set<Power> getPowers() {
        return powers;
    }

    public void setPowers(Set<Power> powers) {
        this.powers = powers;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
