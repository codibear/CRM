package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.DataDictionary;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ${zsq} on 2017/8/9 0009.
 */
public interface DataDictionaryBiz {
    Page<DataDictionary> find(DetachedCriteria dc, int currentPage, int pageData);

    void save(DataDictionary dataDictionary);

    List<DataDictionary> findAll();

    void modify(DataDictionary dataDictionary);

    void delete(DataDictionary dataDictionary);

    DataDictionary loadbyid(Serializable id);
    //可变参数
    List<DataDictionary> find(String sql, Object... p);

    List<DataDictionary> select(String type) ;

    Page<DataDictionary> find(DetachedCriteria dc, int currentPage, int pageData, String sql);
}
