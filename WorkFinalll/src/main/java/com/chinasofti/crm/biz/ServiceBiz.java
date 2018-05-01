package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Service;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

public interface ServiceBiz {

    //  保存一条新创建的服务记录
     void save(Service service);

    //  删除一条服务记录
     void delete(Service service);

    //  修改一条服务记录
     void modify(Service service);

    //  通过id查找一条服务记录,并返回一条记录
     Service loadbyid(Serializable id);

    //  查找所有的服务记录并返回所有的记录
     List<Service> findAll();

    //  可变参数查询
    List<Service> find(String sql, Object... p);

    //    分页
    Page<Service> find(DetachedCriteria dc, int currentPage, int pageData,String sql) ;

    //    模糊查询客户
    List<Customer> select(String cusName) ;

    //    在service表通过客户名称某个字段查询所有客户，模糊查询（汉字）
    List<Service> selectCus(String cusName,String serviceState) ;

    //    在service表通过客户名称某个字段查询所有客户，模糊查询（英文）
    List<Service> selectCus2(String pinyin,String serviceState) ;

}
