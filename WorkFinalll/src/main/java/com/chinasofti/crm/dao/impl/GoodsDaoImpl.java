package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.GoodsDao;
import com.chinasofti.crm.domain.Goods;
import org.hibernate.HibernateException;

import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
public class GoodsDaoImpl extends BaseDaoImpl<Goods> implements GoodsDao {
    @Override
    public List<Goods> selectName(String goodsName) throws HibernateException {
        List list=this.getHibernateTemplate().find(" FROM Goods d WHERE d.goodsName LIKE '%"+goodsName+"%'");
        return list;
    }

    @Override
    public List<Goods> selectModel(String goodsModel) throws HibernateException {
        List list=this.getHibernateTemplate().find(" FROM Goods d WHERE d.goodsModel LIKE '%"+goodsModel+"%'");
        return list;
    }

    @Override
    public List<Goods> selectLevel(String goodsLevel) throws HibernateException {
        List list=this.getHibernateTemplate().find(" FROM Goods d WHERE d.goodsLevel LIKE '%"+goodsLevel+"%'");
        return list;
    }
}
