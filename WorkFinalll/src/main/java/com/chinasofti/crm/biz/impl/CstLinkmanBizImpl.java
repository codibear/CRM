package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.CstLinkmanBiz;
import com.chinasofti.crm.dao.CstLinkmanDao;
import com.chinasofti.crm.domain.CstLinkman;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
@Transactional
public class CstLinkmanBizImpl implements CstLinkmanBiz{
    private CstLinkmanDao cstLinkmanDao;

    public CstLinkmanDao getCstLinkmanDao() {
        return cstLinkmanDao;
    }

    public void setCstLinkmanDao(CstLinkmanDao cstLinkmanDao) {
        this.cstLinkmanDao = cstLinkmanDao;
    }

    public Page<CstLinkman> find(DetachedCriteria dc, int currentPage, int pageData) {
        return cstLinkmanDao.find(dc, currentPage, pageData);
    }

    public void save(CstLinkman cstLinkman){
        cstLinkmanDao.save(cstLinkman);
    }
    public void delete(CstLinkman cstLinkman){
        cstLinkmanDao.delete(cstLinkman);
    }

    public CstLinkman loadbyid(Serializable id) {
        return cstLinkmanDao.loadbyid(id);

    }

    public List<CstLinkman> find(String sql, Object ... p){
        return cstLinkmanDao.find(sql,p);
    }
    public List<CstLinkman> findAll(){
        return cstLinkmanDao.findAll();
    }
    public void modify(CstLinkman cstLinkman){
        cstLinkmanDao.modify(cstLinkman);
    }
}
