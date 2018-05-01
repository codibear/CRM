package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.DataDictionaryBiz;
import com.chinasofti.crm.dao.DataDictionaryDao;
import com.chinasofti.crm.domain.DataDictionary;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by ${zsq} on 2017/8/9 0009.
 */
@Transactional
public class DataDictionaryBizImpl implements DataDictionaryBiz{
    private DataDictionaryDao dataDictionaryDao;

    public Page<DataDictionary> find(DetachedCriteria dc, int currentPage, int pageData) {
        return dataDictionaryDao.find(dc,currentPage,pageData);
    }

    public void save(DataDictionary dataDictionary) {
        dataDictionaryDao.save(dataDictionary);
    }

    public List<DataDictionary> findAll() {
        return dataDictionaryDao.findAll();
    }

    public void modify(DataDictionary dataDictionary) {
        dataDictionaryDao.modify(dataDictionary);
    }

    public void delete(DataDictionary dataDictionary) {
        dataDictionaryDao.delete(dataDictionary);
    }

    public DataDictionary loadbyid(Serializable id) {
            return dataDictionaryDao.loadbyid(id);
    }

    public List<DataDictionary> find(String sql, Object... p) {
        return dataDictionaryDao.find(sql,p);
    }

    public List<DataDictionary> select(String type) {
        return dataDictionaryDao.select(type);
    }

    @Override
    public Page<DataDictionary> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {
        return dataDictionaryDao.find(dc,currentPage,pageData,sql);
    }

    public void setDataDictionaryDao(DataDictionaryDao dataDictionaryDao) {
        this.dataDictionaryDao = dataDictionaryDao;
    }
}
