package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.SalesBiz;
import com.chinasofti.crm.dao.SalesDao;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.SalesManage;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/8.
 */
@Transactional
public class SalesBizImpl implements SalesBiz {

    private SalesDao salesDao;

    public void save(SalesManage salesmanage) {
        this.salesDao.save(salesmanage);
    }

    public void delete(SalesManage salesmanage) {
        this.salesDao.delete(salesmanage);
    }

    public void modify(SalesManage salesmanage) {
        this.salesDao.modify(salesmanage);
    }

    public SalesManage findById(Serializable id) {

        return salesDao.loadbyid(id);
    }

    public List<SalesManage> findAll() {
        return this.salesDao.findAll();
    }

    public List<SalesManage> find(String sql, Object... p) {

        return salesDao.find(sql, p);

    }



    public Page<SalesManage> find(DetachedCriteria dc, int currentPage, int pageData) {
        return salesDao.find(dc,currentPage,pageData);
    }




    public void setSalesDao(SalesDao salesDao) {
        this.salesDao = salesDao;
    }
}
