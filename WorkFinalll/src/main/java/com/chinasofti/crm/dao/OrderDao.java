package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.Orders;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

/**
 * Created by zxk on 2017/8/9 0009.
 */
public interface OrderDao extends BaseDao<Orders> {

    public Page<Orders> find(DetachedCriteria dc, int currentPage, int pageData, String sql) ;
}
