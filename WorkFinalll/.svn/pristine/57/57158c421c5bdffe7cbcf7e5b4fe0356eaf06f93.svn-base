package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Service;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by Administrator on 2017/8/8.
 */
public interface ServiceDao extends BaseDao<Service> {

    //    通过客户名称某个字段查询所有客户，模糊查询（客户表）
    List<Customer> select(String cusName) throws HibernateException;

    //    在service表通过客户名称某个字段查询所有客户，模糊查询（汉字）
    List<Service> selectCus(String cusName,String serviceState) throws HibernateException;

    //    在service表通过客户名称某个字段查询所有客户，模糊查询（英文）
    List<Service> selectCus2(String pinyin,String serviceState) throws HibernateException;

    //    分页
    Page<Service> find(DetachedCriteria dc, int currentPage, int pageData,String sql);
}
