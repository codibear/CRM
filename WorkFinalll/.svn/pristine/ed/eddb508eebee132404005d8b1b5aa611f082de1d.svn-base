package com.chinasofti.crm.biz.impl;
import com.chinasofti.crm.biz.QuotationBiz;
import com.chinasofti.crm.dao.QuotationDao;
import com.chinasofti.crm.domain.*;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
@Transactional
public class QuotationBizImpl implements QuotationBiz {
    private QuotationDao quotationDao;

    public List<Quotation> findBySome(String sql, Object...p) {
        return this.quotationDao.find(sql, p);
    }
    public boolean saveb (Quotation quotation) {
        this.quotationDao.save(quotation);
        return true;
    }
    public Orders findorder(Serializable orderId){
        return this.quotationDao.findById(orderId);
    }

    public List findByStatus(String quotationStatus) {
        return this.quotationDao.findByStatus(quotationStatus);
    }
    public List search(Serializable orderId) {
        return this.quotationDao.search(orderId);
    }

    public void save(Quotation q){
        quotationDao.save(q);
    }
    public void delete(Quotation q){
        quotationDao.delete(q);

    }
    public void update(Quotation q){
        quotationDao.update(q);
    }
    public Quotation loadById(Serializable id){

        return quotationDao.loadById(id);
    }
    public List<Quotation> findAll(){

        return quotationDao.findAll();
    }



    public List<Quotation> find(String sql, Object ... p){
   return quotationDao.find(sql,p);
    }
    //创建人模糊查询
    public List<Quotation> searchCreater(String pinyin) {
        return quotationDao.searchCreater(pinyin);
    }

    public List<Quotation> searchCreaterByHanzi(String quotationCreater) {
        return quotationDao.searchCreaterByHanzi(quotationCreater);
    }

    public List search2(Serializable quotationId) {
        return quotationDao.search2(quotationId);
    }

    @Override
    public Quotation findQuo(Serializable orderId) {
        return quotationDao.findQuo(orderId);
    }

    public PageBean<Quotation> findAllData(DetachedCriteria dc, int currentPageNo, int pageSize, String sql) {
        return quotationDao.findAllData(dc,currentPageNo,pageSize,sql);
    }
    //模板Page的分页查询方法
    public Page<Quotation> findAllDatas(DetachedCriteria dc, int currentPage, int pageData, String sql){

        return quotationDao.findAllDatas(dc,  currentPage,pageData, sql);
    }


    public void setQuotationDao(QuotationDao quotationDao) {
        this.quotationDao = quotationDao;
    }

}
