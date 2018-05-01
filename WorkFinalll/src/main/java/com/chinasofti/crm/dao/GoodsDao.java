package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.Goods;
import org.hibernate.HibernateException;

import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
public interface GoodsDao extends BaseDao<Goods>{
    List<Goods> selectName(String goodsName) throws HibernateException;
    List<Goods> selectModel(String goodsModel) throws HibernateException;
    List<Goods> selectLevel(String goodsLevel) throws HibernateException;

}
