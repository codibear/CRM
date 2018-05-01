package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.OrderBiz;
import com.chinasofti.crm.dao.OrderDao;
import com.chinasofti.crm.domain.Orders;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
@Transactional
public class OrderBizImpl implements OrderBiz {

    private OrderDao orderDao;

    public Page<Orders> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {

        return orderDao.find(dc, currentPage, pageData,sql);
    }

    public void save(Orders order) {
        orderDao.save(order);

    }

    public List<Orders> findAll() {

        return orderDao.findAll();
    }

    public void modify(Orders order) {

        orderDao.modify(order);
    }

    public void delete(Orders order) {
        orderDao.delete(order);
    }

    public Orders loadbyid(Serializable id) {
        return orderDao.loadbyid(id);
    }

    public List<Orders> find(String sql, Object... p) {
        return orderDao.find(sql, p);
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
}
