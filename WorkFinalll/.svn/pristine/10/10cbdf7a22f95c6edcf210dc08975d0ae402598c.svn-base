package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.CstConBiz;
import com.chinasofti.crm.dao.CstConDao;
import com.chinasofti.crm.domain.CstCon;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
    @Transactional
public class CstConBizImpl implements CstConBiz {

    private CstConDao cstConDao;

    public Page<CstCon> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {
        return cstConDao.find(dc, currentPage, pageData,sql );
    }

    public void save(CstCon cstCon) {
        cstConDao.save(cstCon);

    }

    public List<CstCon> findAll() {
        return cstConDao.findAll();
    }

    public void modify(CstCon cstCon) {
        cstConDao.modify(cstCon);
    }

    public void delete(CstCon cstCon) {
        cstConDao.delete(cstCon);
    }

    public CstCon loadbyid(Serializable id) {
        return cstConDao.loadbyid(id);
    }

    public List<CstCon> find(String sql, Object... p) {
        return cstConDao.find(sql, p);
    }


    public void setCstConDao(CstConDao cstConDao) {
        this.cstConDao = cstConDao;
    }
}
