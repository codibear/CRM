package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.CustomerBiz;
import com.chinasofti.crm.dao.CustomerDao;
import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

@Transactional
public class CustomerBizImpl implements CustomerBiz {

    private CustomerDao customerDao;

    public Page<Customer> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {
        return customerDao.find(dc, currentPage, pageData,sql);
    }

    public void save(Customer customer) {
        this.customerDao.save(customer);
    }

    public void delete(Customer customer) {
        this.customerDao.delete(customer);
    }

    public Customer loadbyid(Serializable id) {
        return customerDao.loadbyid(id);
    }

    public List<Customer> find(String sql, Object... p) {
        return customerDao.find(sql, p);
    }

    public void modify(Customer customer) {
        this.customerDao.modify(customer);
    }

    public Customer findById(Serializable id) {
        return null;
    }

    public List<Customer> findAll() {
        return this.customerDao.findAll();
    }

    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }
}
