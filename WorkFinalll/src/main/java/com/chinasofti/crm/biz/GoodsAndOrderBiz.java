package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.GoodsAndOrder;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
public interface GoodsAndOrderBiz{
    
    Page<GoodsAndOrder> find(DetachedCriteria dc, int currentPage, int pageData);

    void save(GoodsAndOrder goodsAndOrder);

    List<GoodsAndOrder> findAll();

    void modify(GoodsAndOrder goodsAndOrder);

    void delete(GoodsAndOrder goodsAndOrder);

    GoodsAndOrder loadbyid(Serializable id);

    //可变参数
    List<GoodsAndOrder> find(String sql,Object ...p);
}
