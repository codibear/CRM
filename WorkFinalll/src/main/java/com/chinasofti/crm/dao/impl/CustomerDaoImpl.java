package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.CustomerDao;
import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;


public class CustomerDaoImpl extends BaseDaoImpl<Customer> implements CustomerDao {
    public Page<Customer> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {
        Page page=new Page();
        //获取当前页面数
        page.setCurrentPage(currentPage);
        //获取页面数据
        page.setPageData(pageData);
        //获取当前页下所有数据
        List<Customer> datas= (List<Customer>) this.getHibernateTemplate().findByCriteria(dc,(currentPage-1)*pageData,pageData);

        page.setData(datas);

        List<Long> list= (List<Long>) this.getHibernateTemplate().find("select count(*) from Customer WHERE "+sql);


        page.setTotalData(list.get(0));

        return page;
    }

}
