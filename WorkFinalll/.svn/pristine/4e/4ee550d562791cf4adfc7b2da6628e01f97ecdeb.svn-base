package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.ServiceBiz;
import com.chinasofti.crm.dao.ServiceDao;
import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Service;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

@Transactional
public class ServiceBizImpl implements ServiceBiz {

    //  注入ServiceDao
    private ServiceDao serviceDao ;

    //  保存一条新创建的服务记录
    public void save(Service service) {
        this.serviceDao.save(service) ;
    }

    //  删除一条服务记录
    public void delete(Service service) {
        this.serviceDao.delete(service) ;
    }

    //  修改一条服务记录
    public void modify(Service service) {
        this.serviceDao.modify(service) ;
    }

    //  通过id查找一条服务记录,并返回一条记录
    public Service loadbyid(Serializable id) {
        return this.serviceDao.loadbyid(id) ;
    }

    //  查找所有的服务记录并返回所有的记录
    public List<Service> findAll() {
        return this.serviceDao.findAll();
    }

    //  查找符合条件的服务记录并返回所有的记录
    public List<Service> find(String sql, Object... p) {
        return serviceDao.find(sql,p);
    }

    //  查找客户
    public List<Customer> select(String cusName) {
        return this.serviceDao.select(cusName);
    }

    //    在service表通过客户名称某个字段查询所有客户，模糊查询（汉字）
    public List<Service> selectCus(String cusName,String serviceState) {
        return this.serviceDao.selectCus(cusName,serviceState);
    }

    //    在service表通过客户名称某个字段查询所有客户，模糊查询（英文）
    public List<Service> selectCus2(String pinyin, String serviceState) {
        return this.serviceDao.selectCus2(pinyin,serviceState);
    }

    //    分页
    public Page<Service> find(DetachedCriteria dc, int currentPage, int pageData,String sql){
        return serviceDao.find(dc ,currentPage,pageData, sql) ;
    }

    //    注入
    public void setServiceDao(ServiceDao serviceDao) {
        this.serviceDao = serviceDao;
    }


}
