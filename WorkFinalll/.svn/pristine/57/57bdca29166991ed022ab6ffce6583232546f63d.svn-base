package com.chinasofti.crm.dao.impl;
import com.chinasofti.crm.dao.QuotationDao;
import com.chinasofti.crm.domain.Orders;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Quotation;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.query.Query;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class QuotationDaoImpl extends QuotationBaseDaoImpl<Quotation> implements QuotationDao {
    public Orders findById(Serializable orderId) throws HibernateException {

        return this.getHibernateTemplate().load(Orders.class,orderId);
    }

    public List search(Serializable orderId) throws HibernateException {
        List list=this.getHibernateTemplate().find("FROM Orders o WHERE o.orderId LIKE '%"+orderId+"%'");

        return list;
    }
    //创建人模糊查询
    public List<Quotation> searchCreater(String pinyin){
        List<Quotation> l= (List<Quotation>) this.getHibernateTemplate().find("FROM Quotation q WHERE q.pinyin LIKE '"+pinyin+"%'");
        return  l;
    }
    //创建人模糊查询汉字
    public List<Quotation> searchCreaterByHanzi(String quotationCreater){
        List<Quotation> l= (List<Quotation>) this.getHibernateTemplate().find("FROM Quotation q WHERE q.quotationCreater LIKE '"+quotationCreater+"%'");
        return  l;
    }
    //报价单号模糊查询
    public List search2(Serializable quotationId) throws HibernateException {
        List list = this.getHibernateTemplate().find("FROM Quotation q WHERE q.quotationId LIKE '%" + quotationId + "%'");

        return list;
    }
    public Quotation findQuo(Serializable orderId) throws HibernateException {

        Query query= this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery("FROM Quotation q WHERE q.orderId=?");
       query.setParameter(0,orderId);
        List<Quotation> quotations= query.list();
        Quotation quotation=quotations.get(0);
        return quotation;
    }

    public List<Quotation> findByStatus(String quotationStatus) {

        Query query=  this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery("FROM Quotation q WHERE q.quotationStatus=?");
        query.setParameter(0,quotationStatus);
        List list=query.list();

        return list;
    }
    public Page<Quotation> findAllDatas(DetachedCriteria dc, int currentPage, int pageData, String sql) {

        Page page=new Page();
        //获取当前页面数
        page.setCurrentPage(currentPage);
        //获取页面数据
        page.setPageData(pageData);
        //获取当前页下所有数据
        List<Quotation> datas= (List<Quotation>) this.getHibernateTemplate().findByCriteria(dc,(currentPage-1)*pageData,pageData);
        page.setData(datas);
        List<Long> list= (List<Long>) this.getHibernateTemplate().find("select count(*) from Quotation "+sql);
        page.setTotalData(list.get(0));
        return page;
    }


}
