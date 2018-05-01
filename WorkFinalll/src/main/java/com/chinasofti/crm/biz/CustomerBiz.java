package com.chinasofti.crm.biz;


import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

public interface CustomerBiz {
    Page<Customer> find(DetachedCriteria dc, int currentPage, int pageData, String sql);

    void save(Customer t);

    List<Customer> findAll();

    void modify(Customer t);

    void delete(Customer t);

    Customer loadbyid(Serializable id);

    //可变参数
    List<Customer> find(String sql, Object... p);
}
