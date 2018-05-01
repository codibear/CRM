package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.StockBiz;
import com.chinasofti.crm.dao.StockDao;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Stock;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by jlkj on 2017/8/9.
 */
@Transactional
public class StockBizImpl implements StockBiz {
    //注入StockDao
    private StockDao stockDao;
//    根据参数查询
    public List<Stock> find(String sql, Object... p) {

        return this.stockDao.find(sql, p);
    }

    public List<Stock> findAll() {

        return this.stockDao.findAll() ;
    }

    public Page<Stock> find(DetachedCriteria dc, int currentPage, int pageData) {
        return stockDao.find(dc, currentPage, pageData);
    }

    @Override
    public List<Stock> select(String goodsName) {
        List<Stock> list=this.stockDao.select(goodsName);
        return list;
    }

    @Override
    public List<Stock> selectware(String wareName) {
        List<Stock> list=this.stockDao.findware(wareName);
        return list;
    }

    @Override
    public Page<Stock> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {
        return stockDao.find(dc, currentPage, pageData,sql);
    }

    public void setStockDao(StockDao stockDao) {
        this.stockDao = stockDao;
    }

}
