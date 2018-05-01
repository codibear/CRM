package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.OrderDao;
import com.chinasofti.crm.domain.Orders;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
public class OrderDaoImpl extends BaseDaoImpl<Orders> implements OrderDao {



    public Page<Orders> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {
        Page page=new Page();
        //获取当前页面数
        page.setCurrentPage(currentPage);
        //获取页面数据
        page.setPageData(pageData);
        //获取当前页下所有数据
        List<Orders> datas= (List<Orders>) this.getHibernateTemplate().findByCriteria(dc,(currentPage-1)*pageData,pageData);

        page.setData(datas);

        List<Long> list= (List<Long>) this.getHibernateTemplate().find("select count(*) from Orders WHERE "+sql);


        page.setTotalData(list.get(0));

        return page;
    }




}
