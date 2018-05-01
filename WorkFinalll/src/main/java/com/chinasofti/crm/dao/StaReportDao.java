package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.CstLost;
import com.chinasofti.crm.vo.Series;

import java.util.List;

/**
 * Created by fzm on 2017/8/10.
 */
public interface StaReportDao   {

    //客户贡献分析
    List<Series> findSumMoney();
    //条件查询（客户名称与年份）
    List findCustAndYear();
    //客户构成分析
    /*查询全部等级的客户*/
    List findll();
    /*通过等级查询*/
    List findByRank(String rank);
    /*通过满意度查询*/
    List findBySatisfy();
    /*通过信誉度查询*/
    List findByCredit();


    //客户服务分析
    List cfindAll() ;

    List findByDate(int date);

    List findByDateTwo();

    //客户流失分析

    /*-查询流失原因及其数量-*/
    List findLstReason();

    /*-客户流失数量按年份显示-*/
    List findByYear();

    /*-客户流失年份-*/
    List findYear();

    /*-按条件查询-*/
    List<CstLost> findByAsk(String cusName, String cusManagerName);

    //更新系统



}
