package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/4.
 */
public interface QuotationBaseDao<T> {
    void save(T t);

    void delete(T t);

    void update(T t);

    T loadById(Serializable id);

    List<T> findAll();
    PageBean<T> findAllData(DetachedCriteria dc, int currentPageNo, int pageSize, String sql);
    public List<T> find(String sql, Object... p);

}
