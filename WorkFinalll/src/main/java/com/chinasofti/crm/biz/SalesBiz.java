package com.chinasofti.crm.biz;


import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.SalesManage;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

public interface SalesBiz {
    void save(SalesManage salesManage);
    void delete(SalesManage salesManage);
    void modify(SalesManage salesManage);
    SalesManage findById(Serializable id);
    List<SalesManage> findAll();
     List<SalesManage> find(String sql,Object ...p);


    Page<SalesManage> find(DetachedCriteria dc, int currentPage, int pageData);
}
