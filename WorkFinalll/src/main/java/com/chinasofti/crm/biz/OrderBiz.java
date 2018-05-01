package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.Orders;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
public interface OrderBiz {

    Page<Orders> find(DetachedCriteria dc, int currentPage, int pageData, String sql);

    void save(Orders order);

    List<Orders> findAll();

    void modify(Orders order);

    void delete(Orders order);

    Orders loadbyid(Serializable id);

    //可变参数
    List<Orders> find(String sql, Object... p);
}
