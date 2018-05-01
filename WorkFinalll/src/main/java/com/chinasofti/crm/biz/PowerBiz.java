package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Power;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
public interface PowerBiz {
    Page<Power> find(DetachedCriteria dc, int currentPage, int pageData);
    //增
    void save(Power power);
    //改
    void update(Power power);
    //删
    void delete(Power power);
    //查询id
    Power loadById(Serializable id);
    //查询全部
    List<Power> findAll();
}
