package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Stock;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by jlkj on 2017/8/9.
 */
public interface StockDao extends BaseDao<Stock>{
    List<Stock> select(String goodsName) throws HibernateException;
    List<Stock> findware(String wareHouse) throws HibernateException;

    Page<Stock> find(DetachedCriteria dc, int currentPage, int pageData, String sql);

}
