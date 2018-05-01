package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.Goods;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
public interface GoodsBiz {
    Page<Goods> find(DetachedCriteria dc, int currentPage, int pageData);

    void save(Goods goods);

    List<Goods> findAll();

    void modify(Goods goods);

    void delete(Goods goods);

    Goods loadbyid(Serializable id);

    //可变参数
    List<Goods> find(String sql,Object ...p);

    List<Goods> selectName(String goodsName);
    List<Goods> selectModel(String goodsModel);
    List<Goods> selectLevel(String goodsLevel);



}
