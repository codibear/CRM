package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.CstLostBiz;
import com.chinasofti.crm.dao.CstLostDao;
import com.chinasofti.crm.dao.impl.CstLinkmanDaoImpl;
import com.chinasofti.crm.domain.CstLost;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
@Transactional
public class CstLostBizImpl implements CstLostBiz {
    private CstLostDao cstLostDao;
    private CstLinkmanDaoImpl cstLinkmanDao;

    public CstLostDao getCstLostDao() {
        return cstLostDao;
    }

    public void setCstLostDao(CstLostDao cstLostDao) {
        this.cstLostDao = cstLostDao;
    }

    public Page<CstLost> find(DetachedCriteria dc, int currentPage, int pageData ) {
        return cstLostDao.find(dc, currentPage, pageData);
    }

    public void save(CstLost cstLost){
        cstLostDao.save(cstLost);
    }
    public void delete(CstLost cstLost){
        cstLostDao.delete(cstLost);
    }

    public CstLost loadbyid(Serializable id) {
        return cstLostDao.loadbyid(id);
    }

    public List<CstLost> find(String sql, Object ... p){
        return cstLostDao.find(sql,p);
    }
    public List<CstLost> findAll(){
        return cstLostDao.findAll();
    }
    public void modify(CstLost cstLost){
        cstLostDao.modify(cstLost);
    }

    public void setCstLinkmanDao(CstLinkmanDaoImpl cstLinkmanDao) {
        this.cstLinkmanDao = cstLinkmanDao;
    }

    public CstLinkmanDaoImpl getCstLinkmanDao() {
        return cstLinkmanDao;
    }
}
