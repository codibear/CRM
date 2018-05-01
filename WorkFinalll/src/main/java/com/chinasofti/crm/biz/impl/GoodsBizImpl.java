package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.GoodsBiz;
import com.chinasofti.crm.dao.GoodsDao;
import com.chinasofti.crm.domain.Goods;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
@Transactional
public class GoodsBizImpl implements GoodsBiz {
    private GoodsDao goodsDao;

    public Page<Goods> find(DetachedCriteria dc, int currentPage, int pageData) {

        return goodsDao.find(dc,currentPage,pageData);
    }

    public void save(Goods goods) {
        goodsDao.save(goods);
    }

    public List<Goods> findAll() {
        return goodsDao.findAll();
    }

    public void modify(Goods goods) {
        goodsDao.modify(goods);

    }

    public void delete(Goods goods) {
        goodsDao.delete(goods);

    }

    public Goods loadbyid(Serializable id) {
        return goodsDao.loadbyid(id);
    }

    public List<Goods> find(String sql, Object... p) {
        return goodsDao.find(sql,p);
    }

    @Override
    public List<Goods> selectName(String goodsName) {
        List<Goods> list=this.goodsDao.selectName(goodsName);
        return list;
    }

    @Override
    public List<Goods> selectModel(String goodsModel) {
        List<Goods> list=this.goodsDao.selectModel(goodsModel);
        return list;
    }

    @Override
    public List<Goods> selectLevel(String goodsLevel) {
        List<Goods> list=this.goodsDao.selectLevel(goodsLevel);
        return list;
    }

    public void setGoodsDao(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }
}
