package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.DataDictionaryDao;
import com.chinasofti.crm.domain.DataDictionary;
import com.chinasofti.crm.domain.Page;
import org.apache.poi.ss.formula.functions.T;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by ${zsq} on 2017/8/9 0009.
 */
public class DataDictionaryDaoImpl extends BaseDaoImpl<DataDictionary> implements DataDictionaryDao {
    //    类别，模糊查询
    public List<DataDictionary> select(String type) throws HibernateException {
        List list=this.getHibernateTemplate().find(" FROM DataDictionary d WHERE d.type LIKE '%"+type+"%'");

        return list;
    }
    public Page<DataDictionary> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {
        Page page=new Page();
        //获取当前页面数
        page.setCurrentPage(currentPage);
        //获取页面数据
        page.setPageData(pageData);
        //获取当前页下所有数据
        List<T> datas= (List<T>) this.getHibernateTemplate().findByCriteria(dc,(currentPage-1)*pageData,pageData);

        page.setData(datas);

        List<Long> list= (List<Long>) this.getHibernateTemplate().find("select count(*) from DataDictionary WHERE "+sql);


        page.setTotalData(list.get(0));

        return page;
    }

}
