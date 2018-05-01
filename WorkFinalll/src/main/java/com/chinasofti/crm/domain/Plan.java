package com.chinasofti.crm.domain;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

public class Plan implements Serializable {
    //计划编号
    private Integer planId;
    //计划项
    private String planPro;
    //计划时间
    private Date planTime;
    //执行效果
    private String planResult;

    @JSONField(serialize = false)
    private transient SalesManage salesmanage;


    public Integer getPlanId() {
        return planId;
    }

    public void setPlanId(Integer planId) {
        this.planId = planId;
    }

    public String getPlanPro() {
        return planPro;
    }

    public void setPlanPro(String planPro) {
        this.planPro = planPro;
    }

    public Date getPlanTime() {
        return planTime;
    }

    public void setPlanTime(Date planTime) {
        this.planTime = planTime;
    }

    public String getPlanResult() {
        return planResult;
    }

    public void setPlanResult(String planResult) {
        this.planResult = planResult;
    }

    public SalesManage getSalesmanage() {
        return salesmanage;
    }

    public void setSalesmanage(SalesManage salesmanage) {
        this.salesmanage = salesmanage;
    }
}
