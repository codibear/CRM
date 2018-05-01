package com.chinasofti.crm.dao;


import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

public interface CustomerDao extends BaseDao<Customer> {
    public Page<Customer> find(DetachedCriteria dc, int currentPage, int pageData, String sql) ;

}
