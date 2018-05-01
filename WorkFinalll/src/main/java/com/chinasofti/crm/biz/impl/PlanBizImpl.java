package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.PlanBiz;
import com.chinasofti.crm.dao.PlanDao;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Plan;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator  on 2017/8/9.
 */
@Transactional
public class PlanBizImpl implements PlanBiz {

    private PlanDao planDao;

    public Page<Plan> find(DetachedCriteria dc, int currentPage, int pageData) {
        return planDao.find(dc,currentPage,pageData);
    }

    public void save(Plan plan) {
        this.planDao.save(plan);
    }

    public void update(Plan plan) {
        this.planDao.modify(plan);
    }

    public void delete(Plan plan) {
        this.planDao.delete(plan);
    }

    public Plan loadById(Serializable id) {
        return planDao.loadbyid(id);
    }

    public List<Plan> findAll() {
        return planDao.findAll();
    }

    public List<Plan> findBySalesId(String sql, Serializable id) {
        return planDao.find(sql,id);
    }

    public void setPlanDao(PlanDao planDao) {
        this.planDao = planDao;
    }
}
