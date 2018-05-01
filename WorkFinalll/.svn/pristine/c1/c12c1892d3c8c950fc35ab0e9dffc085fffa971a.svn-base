package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.StaReportBiz;
import com.chinasofti.crm.dao.StaReportDao;
import com.chinasofti.crm.domain.CstLost;
import com.chinasofti.crm.vo.Series;

import javax.transaction.Transactional;
import java.util.List;


/**
 * Created by fzm on 2017/8/10.
 */
@Transactional
public class StaReportBizImpl  implements StaReportBiz {

    private StaReportDao staReportDao;

    //客户贡献分析

    public List<Series> findSumMoney() {
        return   this.staReportDao.findSumMoney();
    }
    //客户名称和年份
    @Override
    public List findCustAndYear() {
        return this.staReportDao.findCustAndYear();
    }

//    @Override
   /*统计：查询所有客户*/

    //客户构成分析
/*统计：查询所有客户*/
    public List findAll() {
        List list=staReportDao.findll();
        return list;
    }

    public List findByRank(String rank) {
        List list=staReportDao.findByRank(rank);
        return list;
    }

    public List findBySatisfy() {
        List list=staReportDao.findBySatisfy();
        return list;
    }

    public List findByCredit() {
        List list=staReportDao.findByCredit();
        return list;
    }

    //客户服务分析
    public List cfindAll() {
        return this.staReportDao.cfindAll();
    }

    public List findByDate(int date) {
        return this.staReportDao.findByDate(date);
    }

    public List findByDateTwo() {
        return this.staReportDao.findByDateTwo();
    }

    //客户流失分析
    /**
     * 查看流失原因及其对应的数量
     * */
    @Override
    public List findLstReason() {
        List list=this.staReportDao.findLstReason();
        return list;
    }

    /**
     * 客户流失按年份显示方法
     */
    @Override
    public List findByYear(){
        List list=this.staReportDao.findByYear();
        return list;
    }

    /**
     * 客户流失年份
     */
    @Override
    public List findYear() {
        List year=this.staReportDao.findYear();
        return year;
    }

    /**
     * 客户流失页按条件查询
     */
    @Override
    public List<CstLost> findByAsk(String cusName, String cusManagerName) {
        List<CstLost> list=this.staReportDao.findByAsk(cusName,cusManagerName);
        return list;
    }


    public StaReportDao getStaReportDao() {
        return staReportDao;
    }

    public void setStaReportDao(StaReportDao staReportDao) {
        this.staReportDao = staReportDao;
    }


}
