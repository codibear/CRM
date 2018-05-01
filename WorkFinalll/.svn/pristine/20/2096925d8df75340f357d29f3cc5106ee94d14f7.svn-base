package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.GoodsAndOrderBiz;
import com.chinasofti.crm.dao.GoodsAndOrderDao;
import com.chinasofti.crm.domain.GoodsAndOrder;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
@Transactional
public class GoodsAndOrderBizImpl implements GoodsAndOrderBiz {

    private GoodsAndOrderDao goodsAndOrderDao;

    public Page<GoodsAndOrder> find(DetachedCriteria dc, int currentPage, int pageData) {
        return goodsAndOrderDao.find(dc, currentPage, pageData);
    }

    public void save(GoodsAndOrder goodsAndOrder) {
        goodsAndOrderDao.save(goodsAndOrder);
    }

    public List<GoodsAndOrder> findAll() {
        return goodsAndOrderDao.findAll();
    }

    public void modify(GoodsAndOrder goodsAndOrder) {
        goodsAndOrderDao.modify(goodsAndOrder);
    }

    public void delete(GoodsAndOrder goodsAndOrder) {
        goodsAndOrderDao.delete(goodsAndOrder);
    }

    public GoodsAndOrder loadbyid(Serializable id) {
        return goodsAndOrderDao.loadbyid(id);
    }

    public List<GoodsAndOrder> find(String sql, Object... p) {
        return goodsAndOrderDao.find(sql, p);
    }

    public void setGoodsAndOrderDao(GoodsAndOrderDao goodsAndOrderDao) {
        this.goodsAndOrderDao = goodsAndOrderDao;
    }
}
