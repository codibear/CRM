package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Plan;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator  on 2017/8/9.
 */
public interface PlanBiz {

    Page<Plan> find(DetachedCriteria dc, int currentPage, int pageData);
    //增
    void save(Plan plan);
    //改
    void update(Plan plan);
    //删
    void delete(Plan plan);
    //查询id
    Plan loadById(Serializable id);
    //查询全部
    List<Plan> findAll();


    //根据salesId查询
    List<Plan> findBySalesId(String sql,Serializable id);

}
