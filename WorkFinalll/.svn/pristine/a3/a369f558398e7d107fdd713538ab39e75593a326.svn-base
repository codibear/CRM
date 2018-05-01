package com.chinasofti.crm.biz;



import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Stock;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by jlkj on 2017/8/9.
 */
public interface StockBiz {

//    根据产品名称查询库存
//    根据仓库查询库存

//可变参数
    List<Stock> find(String sql, Object... p);
//查询所有库存
    List<Stock> findAll();
    Page<Stock> find(DetachedCriteria dc, int currentPage, int pageData);

    List<Stock> select(String goodsName);
    List<Stock> selectware(String wareName);

    Page<Stock> find(DetachedCriteria dc, int currentPage, int pageData, String sql);

}
