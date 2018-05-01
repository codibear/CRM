package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.ServiceDao;
import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Service;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by Administrator on 2017/8/8.
 */
public class ServiceDaoImpl extends BaseDaoImpl<Service> implements ServiceDao{

    //    通过客户名称某个字段查询所有客户，模糊查询（客户表）
    public List<Customer> select(String cusName) throws HibernateException {
        List list=this.getHibernateTemplate().find(" FROM Customer c WHERE c.cusName LIKE '%"+cusName+"%'");
        return list;
    }

    //    在service表通过客户名称某个字段查询所有客户，模糊查询（汉字）
    public List<Service> selectCus(String cusName ,String serviceState) throws HibernateException {
        List list=this.getHibernateTemplate().find(" FROM Service s WHERE s.cusName LIKE '%"+cusName+"%' AND s.serviceState ='"+serviceState+"'");
//        List list=this.getHibernateTemplate().find(" FROM Service s WHERE s.cusName LIKE '%"+cusName+"%' AND s.serviceState =?",serviceState);
        return list;
    }

    //    在service表通过客户名称某个字段查询所有客户，模糊查询（英文）
    public List<Service> selectCus2(String pinyin, String serviceState) throws HibernateException{
        List list=this.getHibernateTemplate().find(" FROM Service s WHERE s.pinyin LIKE '%"+pinyin+"%' AND s.serviceState ='"+serviceState+"'");
        return list;
    }

    //   分页
    public  Page<Service> find(DetachedCriteria dc, int currentPage, int pageData,String sql) {
        Page page=new Page();
        //  获取当前页面数
        page.setCurrentPage(currentPage);
        //  获取页面数据
        page.setPageData(pageData);
        //  获取当前页下所有数据
        List<Service> datas= (List<Service>) this.getHibernateTemplate().findByCriteria(dc,(currentPage-1)*pageData,pageData);
        page.setData(datas);
        List<Long> list= (List<Long>) this.getHibernateTemplate().find("select count(*) from  Service WHERE "+sql);
        page.setTotalData(list.get(0));
        return page;
    }

}
