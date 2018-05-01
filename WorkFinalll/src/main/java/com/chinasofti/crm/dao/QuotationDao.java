package com.chinasofti.crm.dao;


import com.chinasofti.crm.domain.Orders;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Quotation;
import com.chinasofti.crm.domain.User;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public interface QuotationDao extends QuotationBaseDao<Quotation> {
    //    通过订单编号查找客户，订单，商品的相关信息
    Orders findById(Serializable orderId) throws HibernateException;
    //    通过订单编号某个字段查询所有订单编号，模糊查询
    List<Orders> search(Serializable orderId) throws HibernateException;
    //    通过状态查询报价表中所有状态为已通过的报价信息
    List<Quotation> findByStatus(String quotationStatus) throws HibernateException;
    //模板Page的分页查询方法
    public Page<Quotation> findAllDatas(DetachedCriteria dc, int currentPage, int pageData, String sql);
    //创建人模糊查询
    public List<Quotation> searchCreater(String pinyin);
    //创建人模糊查询汉字
    public List<Quotation> searchCreaterByHanzi(String quotationCreater);
    //报价单号模糊查询
    public List search2(Serializable quotationId) throws HibernateException;
//    根据订单编号查询报价单是否存在
    Quotation findQuo(Serializable orderId) throws HibernateException;
}
