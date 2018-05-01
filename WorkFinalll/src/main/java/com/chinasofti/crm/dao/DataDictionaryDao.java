package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.DataDictionary;
import com.chinasofti.crm.domain.Page;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by ${zsq} on 2017/8/9 0009.
 */
public interface DataDictionaryDao extends BaseDao<DataDictionary> {
     List<DataDictionary> select(String type) throws HibernateException;
     Page<DataDictionary> find(DetachedCriteria dc, int currentPage, int pageData, String sql);
}
