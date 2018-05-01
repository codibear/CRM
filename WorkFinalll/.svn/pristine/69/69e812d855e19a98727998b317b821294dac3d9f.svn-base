package com.chinasofti.crm.domain;


import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 王立崇 on 2017/8/10 0010.
 */
public class Power implements Serializable {

    private Integer powerId;//编号
    private Power power;//父类权限
    private  String powerName;//名称
    private String powerType;//类型
    private String powerUrl;//Url地址
    private String powerCode;//优先级（0,1）
    @JSONField(serialize = false)
    private transient Set<Role> roles=new HashSet<Role>(0);
    @JSONField(serialize = false)
    private transient Set<Power> powers=new HashSet<Power>(0);

    public Power() {
    }

    public Power(Integer powerId) {
        this.powerId = powerId;
    }

    public Power(Integer powerId, Power power, String powerName, String powerType, String powerUrl, String powerCode, Set<Role> roles, Set<Power> powers) {
        this.powerId = powerId;
        this.power = power;
        this.powerName = powerName;
        this.powerType = powerType;
        this.powerUrl = powerUrl;
        this.powerCode = powerCode;
        this.roles = roles;
        this.powers = powers;
    }

    public Power getPower() {
        return power;
    }

    public void setPower(Power power) {
        this.power = power;
    }

    public Set<Power> getPowers() {
        return powers;
    }

    public void setPowers(Set<Power> powers) {
        this.powers = powers;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public Integer getPowerId() {
        return powerId;
    }

    public void setPowerId(Integer powerId) {
        this.powerId = powerId;
    }

    public String getPowerName() {
        return powerName;
    }

    public void setPowerName(String powerName) {
        this.powerName = powerName;
    }

    public String getPowerType() {
        return powerType;
    }

    public void setPowerType(String powerType) {
        this.powerType = powerType;
    }

    public String getPowerUrl() {
        return powerUrl;
    }

    public void setPowerUrl(String powerUrl) {
        this.powerUrl = powerUrl;
    }

    public String getPowerCode() {
        return powerCode;
    }

    public void setPowerCode(String powerCode) {
        this.powerCode = powerCode;
    }

    public int getpId() {
        if(power != null){
            return power.getPowerId();
        }else{
            return 0 ;
        }
    }
}
