package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.StockDao;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Stock;
import org.apache.poi.ss.formula.functions.T;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by jlkj on 2017/8/9.
 */
public class StockDaoImpl extends BaseDaoImpl<Stock> implements StockDao {


    @Override
    public List<Stock> select(String goodsName) throws HibernateException {
        List list=this.getHibernateTemplate().find(" FROM Stock s WHERE s.goodsName LIKE '%"+goodsName+"%'");
        return list;
    }
    @Override
    public List<Stock> findware(String wareHouse) throws HibernateException {
        List list=this.getHibernateTemplate().find(" FROM Stock s WHERE s.wareHouse LIKE '%"+wareHouse+"%'");
        return list;
    }

    @Override
    //查询分页
    public Page<Stock> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {
        Page page=new Page();
        //获取当前页面数
        page.setCurrentPage(currentPage);
        //获取页面数据
        page.setPageData(pageData);
        //获取当前页下所有数据
        List<T> datas= (List<T>) this.getHibernateTemplate().findByCriteria(dc,(currentPage-1)*pageData,pageData);

        page.setData(datas);

        List<Long> list= (List<Long>) this.getHibernateTemplate().find("select count(*) from Stock WHERE "+sql);


        page.setTotalData(list.get(0));

        return page;
    }


}
