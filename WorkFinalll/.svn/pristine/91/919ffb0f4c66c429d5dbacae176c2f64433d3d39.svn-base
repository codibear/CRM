package com.chinasofti.crm.biz;
import com.chinasofti.crm.domain.*;
import com.sun.org.apache.xpath.internal.operations.Quo;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public interface QuotationBiz {
    //    保存
    public void save(Quotation q);
    //    删除
    public void delete(Quotation q);
    //    修改
    public void update(Quotation q);
    //    查找单个
    public Quotation loadById(Serializable id);
    //    查找全部
    public List<Quotation> findAll();

    //    条件查询
    public List<Quotation> findBySome(String sql, Object... p);
    //    初始添加
    public boolean saveb(Quotation quotation);
    //    通过订单编号查找客户，订单，商品的相关信息
    public Orders findorder(Serializable orderId);
    //    通过状态查询报价表中所有状态为已通过的报价信息
    public List findByStatus(String quotationStatus);
    //    通过订单编号某个字段查询所有订单编号，模糊查询
    public List search(Serializable orderId);
    //模板Page的分页查询方法
    public Page<Quotation> findAllDatas(DetachedCriteria dc, int currentPage, int pageData, String sql);
    //page分页
    public PageBean<Quotation> findAllData(DetachedCriteria dc, int currentPageNo, int pageSize, String sql);
    public List<Quotation> find(String sql, Object... p);
    //创建人模糊查询
    public List<Quotation> searchCreater(String pinyin);
    //创建人模糊查询汉字
    public List<Quotation> searchCreaterByHanzi(String quotationCreater);
    //报价单号模糊查询
    public List search2(Serializable quotationId);
//    通过订单编号查询单个报价单
    Quotation findQuo(Serializable orderId);
}
