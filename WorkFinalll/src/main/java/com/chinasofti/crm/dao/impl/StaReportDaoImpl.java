package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.StaReportDao;
import com.chinasofti.crm.domain.CstLost;
import com.chinasofti.crm.vo.DrillDown;
import com.chinasofti.crm.vo.DrillUp;
import com.chinasofti.crm.vo.Series;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by fzm on 2017/8/10.
 */

@Repository
public class StaReportDaoImpl implements StaReportDao {

    private SessionFactory sessionFactory;

    private static List<String> lstReasonList;

    //客户贡献分析
    public List findSumMoney() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "SELECT DISTINCT orderCusName as name from Orders  where  orderStatic='已付款'";

        System.out.println(sql);
        String sql2 = "SELECT SUM(orderMoney) as data from Orders  where  orderCusName=:orderCusName AND orderStatic='已付款' GROUP BY orderCusName ";
        List seriesList = new ArrayList();
        List nameList = session.createQuery(sql).list();
        System.out.println(nameList);
        for (Object obj : nameList) {
            DrillUp drillUp = new DrillUp();
            String name = (String) obj;
            Query query = session.createQuery(sql2);
            query.setParameter("orderCusName", obj);
            List dataList = query.list();
            for (Object data : dataList) {
                drillUp.setName(name);
                drillUp.setDrilldown(name);
                drillUp.setY((Double) data);
                seriesList.add(drillUp);
            }
        }

        System.out.println(seriesList+"@@@@@@@@@@@@@@@@");
        return seriesList;

    }

    //条件查询（客户名称与年份）
    @Override
    public List findCustAndYear() {
        Session session = sessionFactory.getCurrentSession();
        String sql1 = "SELECT DISTINCT orderCusName as name from Orders  where  orderStatic='已付款'";
        String sql2 = "SELECT  (YEAR(orderTime))  from Orders  where  orderCusName=:orderCusName   AND orderStatic='已付款'    GROUP BY  (YEAR(orderTime)) ";
        String sql3 = "SELECT  SUM(orderMoney)  from Orders  where  orderCusName=";
        String sql4 = " AND orderStatic='已付款'  AND  (YEAR(orderTime)) =";
        List seriesList = new ArrayList();
        List nameList = session.createQuery(sql1).list();
        for (Object obj : nameList) {
            DrillDown drillDown = new DrillDown();
            Query query = session.createQuery(sql2);

            query.setParameter("orderCusName", obj);
            List dataList = query.list();
            List data2 = new ArrayList();
            for (Object obj2 : dataList) {
                System.out.println(obj2 + "@@@@@@@@@@@@@@@@@@@@@@@@@@");
                int t = (Integer) obj2;
                String sql5 = sql3 + "'" + obj + "'" + sql4 + t;
                Query query2 = session.createQuery(sql5);
                List dataList2 = query2.list();
                List data = new ArrayList();
                for (Object o : dataList2) {
                    System.out.println(obj2);

                    data.add(obj2);
                    data.add(dataList2.get(0));
                    data2.add(data);
                    drillDown.setName((String) obj);
                    drillDown.setId((String) obj);
                    drillDown.setData(data2);
                }
            }

            seriesList.add(drillDown);
        }
        return seriesList;
    }


    //客户构成分析

    /*扇形图*/
    public List findll() {
        List list = new ArrayList();
        List list2 = null;
        Session session=sessionFactory.getCurrentSession();
        String sql="select cusLevel FROM Customer GROUP BY cusLevel";
        String sql2="select count(*) FROM Customer where cusLevel=:cusLevel";
        List list1=session.createQuery(sql).list();
        for (Object obj : list1) {
            System.out.println(obj);
            Query query=session.createQuery(sql2);
            query.setParameter("cusLevel",obj);
            List num=query.list();
            for (Object oobbjj : num) {
                list2 = new ArrayList();
                list2.add(obj);
                list2.add(oobbjj);
                list.add(list2);
            }

        }
        System.out.println(list.size());
        return list;
    }
    /*按等级查询*/
    public List findByRank(String rank) {
        System.out.println(rank);
        Session session=sessionFactory.getCurrentSession();
        System.out.println("进入");
        List list = new ArrayList();
        List list1 = new ArrayList();
        List list2 = new ArrayList();
        String sql="SELECT DISTINCT(YEAR(cusCreatTime)) FROM Customer";
        String sql2="select COUNT(*) from Customer WHERE cusLevel=:cusLevel and (YEAR(cusCreatTime))=:cusCreatTime ";
        List d=session.createQuery(sql).list();
        for (Object name : d) {
            System.out.println(name);
            Query query=session.createQuery(sql2);
            query.setParameter("cusCreatTime",name);
            query.setParameter("cusLevel",rank);
            List a=query.list();
            for (Object oo : a) {
                list2.add(oo);
                System.out.println(oo);
                list1.add(name);
            }
        }
        list.add(list1);
        list.add(list2);
        return list;
    }
    /*按满意度查询*/
    public List findBySatisfy() {
        Session session=sessionFactory.getCurrentSession();
        List list = new ArrayList();
        List list1 = null;
        List list2 = null;
        List no=null;
        String totalDate = "";
        /*查找所有客户*/
        String sql="select cusLevel from Customer group by cusLevel";
         /*查找所有满意度等级*/
        String sql2="select cusSatisfy from Customer group by cusSatisfy";
        /*按条件查询*/
        String sql3="select count(*) from Customer where cusSatisfy=:cusSatisfy and cusLevel=:cusLevel";
        List cusname=session.createQuery(sql).list();
        for (Object name : cusname) {
            list1 = new ArrayList();
            list1.add(name);
            list2 = new ArrayList();
            no=session.createQuery(sql2).list();
            for (Object num : no) {
                Query query=session.createQuery(sql3);
                query.setParameter("cusSatisfy",num);
                query.setParameter("cusLevel",name);
                List list11=query.list();
                for (Object n : list11) {
                    list2.add(n);

                }
            }
            Series s = new Series();
            s.setSerName((String) name);
            s.setSerList(list2);
            totalDate += s.toString();
        }
        list.add(no);
        list.add(totalDate);
        return list;
    }
    /*按信誉度查询*/
    public List findByCredit() {
        Session session=sessionFactory.getCurrentSession();
        List list = new ArrayList();
        List list1 = null;
        List list2 = null;
        List no=null;
        String totalDate = "";
        /*查找所有客户*/
        String sql="select cusLevel from Customer group by cusLevel";
         /*查找所有满意度等级*/
        String sql2="select cusCredit from Customer group by cusCredit";
        /*按条件查询*/
        String sql3="select count(*) from Customer where cusCredit=:cusCredit and cusLevel=:cusLevel";
        List cusname=session.createQuery(sql).list();
        for (Object name : cusname) {
            list1 = new ArrayList();
            list1.add(name);
            list2 = new ArrayList();
            no=session.createQuery(sql2).list();
            for (Object num : no) {
                Query query=session.createQuery(sql3);
                query.setParameter("cusCredit",num);
                query.setParameter("cusLevel",name);
                List list11=query.list();
                for (Object n : list11) {
                    list2.add(n);

                }
            }
            Series s = new Series();
            s.setSerName((String) name);
            s.setSerList(list2);
            totalDate += s.toString();
        }
        list.add(no);
        list.add(totalDate);
        return list;
    }


    //客户服务分析
    public List cfindAll() {
        Session session=sessionFactory.getCurrentSession();
        String sql="SELECT DISTINCT serviceType FROM Service ";
        String sql2="SELECT count(*) FROM Service WHERE serviceType=:ytype";

        List sumlist=new ArrayList();
        List  nlist =session.createQuery(sql).list();

        for (Object obj: nlist ){
            List list=new ArrayList();
            list.add(obj);

            Query query=session.createQuery(sql2);
            query.setParameter("ytype",obj);
            List twolist=query.list();
            for (Object t: twolist){

                list.add(t);

                sumlist.add(list);
            }
            System.out.println(sumlist);
        }

        return  sumlist;

    }

    //条件查询
    public List findByDate(int date ) {

        Session session=sessionFactory.getCurrentSession();
        String sql="SELECT DISTINCT serviceType FROM Service ";
        String sql2="SELECT count(*) FROM Service WHERE serviceType=:ytype and (YEAR(serviceCreateTime))=:ydate";

        List sumlist=new ArrayList();
        List  nlist =session.createQuery(sql).list();
        for (Object obj: nlist ) {
            List list = new ArrayList();
            String n = (String) obj;
            list.add(n);
            Query query = session.createQuery(sql2);
            query.setParameter("ytype", obj);

            query.setParameter("ydate",date);
            List twolist = query.list();
            for (Object t : twolist) {

                list.add(t);



                sumlist.add(list);
            }
            System.out.println(sumlist);
        }
        return sumlist;
    }

    public List findByDateTwo() {
        Session session=sessionFactory.getCurrentSession();
        String sql="SELECT DISTINCT (YEAR(serviceCreateTime)) FROM Service order by serviceCreateTime";

        List sumlist=new ArrayList();
        List  nlist =session.createQuery(sql).list();
        for (Object y:nlist){
            List list = new ArrayList();
            list.add(y);
            sumlist.add(list);
        }

        return sumlist;
    }


    //客户流失分析

    /**
     * 查看流失原因及其对应的数量
     */
    @Override
    public List findLstReason() {

        Session session = sessionFactory.getCurrentSession();

        //声明各种list
        List<Long> numList;
        List TotalList = new ArrayList();

        //查询语句
        String sql1 = "SELECT DISTINCT lstReason FROM CstLost";
        String sql2 = "SELECT COUNT(lstId) FROM CstLost WHERE lstReason=";

        //查询客户流失表流失原因ID
        lstReasonList = session.createQuery(sql1).list();

        String name1;
        String name2;
        //通过ID查询原因对应的名称及数量
        for (int i = 0; i < lstReasonList.size(); i++) {
            List list = new ArrayList();
            name1 = lstReasonList.get(i);
            name2 = "\'" + lstReasonList.get(i) + "\'";
            System.out.println(name1);
            sql2 += name2;
            numList = (List<Long>) session.createQuery(sql2).list();
            System.out.println(i + numList.get(0));
            Long num = numList.get(0);
            list.add(name1);
            list.add(num);
            TotalList.add(list);
            sql2 = "SELECT COUNT(lstId) FROM CstLost WHERE lstReason=";
        }

        return TotalList;
    }

    /**
     * 客户流失按年份显示方法
     */
    @Override
    public List findByYear() {

        Session session = sessionFactory.getCurrentSession();

        //查找所有年份
        String sql1 = "SELECT YEAR(lstLostDate) FROM CstLost GROUP BY YEAR(lstLostDate)";
        String sql2 = "SELECT COUNT(lstId) FROM CstLost WHERE YEAR(lstLostDate)=";
        String sql3 = "AND lstReason=";
        String sql4 = "SELECT DISTINCT lstReason FROM CstLost";

        List TotalList = new ArrayList();
        List years = (List) session.createQuery(sql1).list();

        lstReasonList = session.createQuery(sql4).list();

        int year;
        String name1;
        String name2;
        String totalDate = "";

        //两个for循环
        for (int i = 0; i < lstReasonList.size(); i++) {
            List date = new ArrayList();

            name1 = lstReasonList.get(i);
            name2 = "\'" + lstReasonList.get(i) + "\'";

            for (int j = 0; j < years.size(); j++) {
                year = (Integer) years.get(j);
                sql2 += year + sql3 + name2;
                List list = (List) session.createQuery(sql2).list();
                Long l = (Long) list.get(0);
                int inte = new Long(l).intValue();
                if (inte == 0) {
                    inte = 0;
                }
                date.add(inte);
                sql2 = "SELECT COUNT(lstId) FROM CstLost WHERE YEAR(lstLostDate)=";
            }
            Series s = new Series();
            s.setSerName(name1);
            s.setSerList(date);
            totalDate += s.toString();
        }
        TotalList.add(totalDate);
        return TotalList;
    }

    /**
     * 客户流失年份
     */
    @Override
    public List findYear() {

        Session session = sessionFactory.getCurrentSession();

        //查找所有年份
        String sql = "SELECT YEAR(lstLostDate) FROM CstLost GROUP BY YEAR(lstLostDate)";
        List years1 = session.createQuery(sql).list();
        List years2 = new ArrayList();
        List list = new ArrayList();
        String year = "";
        for (int i = 0; i < years1.size(); i++) {
            year = "\'" + years1.get(i) + "\'";
            years2.add(year);
        }
        list.add(years2);
        return list;
    }


    /**
     * 客户流失页按条件查询
     */

    public List<CstLost> findByAsk(String cusName, String cusManagerName) {

        Session session = sessionFactory.getCurrentSession();

        //按条件拼接Sql语句
        String sql1 = "SELECT new com.chinasofti.crm.domain.CstLost(lstId,lstCustNo,lstCustName,lstCustManagerId,lstCustManagerName,lstLastOrderDate,lstLostDate,lstDelay,lstReason,lstStatus) FROM CstLost WHERE ";
        String sql2 = " lstCustName=";
        String sql3 = " lstCustManagerName=";
        String sql4 = "AND";

        //判断客户到底输入了哪些条件
        if ("".equals(cusName)) {
            String str1 = "\'" + cusManagerName + "\'";
            sql1 += sql3 + str1;
        } else if ("".equals(cusManagerName)) {
            String str2 = "\'" + cusName + "\'";
            sql1 += sql2 + str2;
        } else {
            String str1 = "\'" + cusName + "\'";
            String str2 = "\'" + cusManagerName + "\'";

            sql1 += sql2 + str1 + sql4 + sql3 + str2;
        }

        //查询，返回List
        List<CstLost> list = session.createQuery(sql1).list();
        return list;
    }




    //SessionFactory的get，set方法
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


}
