package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.TitleAndLogoDao;
import com.chinasofti.crm.domain.WebSystem;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

/**
 * Created by 杨广 on 2017/8/15.
 */
@Repository
public class TitleAndLogoDaoImpl implements TitleAndLogoDao {
    private SessionFactory sessionFactory;
    /*查询系统名和logo*/
    @Override
    public WebSystem findWeb() {
        System.out.println("dao收到查询title ＆ logo 请求");
        Session session=sessionFactory.getCurrentSession();

        WebSystem webSystem=session.load(WebSystem.class,1);
        System.out.println("dao"+webSystem.getSystemname());
        return webSystem;
    }

    @Override
    public void updatelogo(String logoip) {
        Session session=sessionFactory.getCurrentSession();
        String sql="update WebSystem web set web.syslogoip=:syslogoip where web.sysremid=:sysremid";

        Query query=session.createQuery(sql);
        query.setParameter("syslogoip",logoip);
        query.setParameter("sysremid",1);
        query.executeUpdate();

    }

    @Override
    public void updatename(String systemname) {
        Session session=sessionFactory.getCurrentSession();
        String sql="update WebSystem web set web.systemname=:systemname  where web.sysremid=:sysremid";
        Query query=session.createQuery(sql);
        query.setParameter("systemname",systemname);
        query.setParameter("sysremid",1);
        query.executeUpdate();

    }

    @Override
    public void updatetitle(String title) {
        Session session=sessionFactory.getCurrentSession();
        String sql="update WebSystem web set web.title=:title  where web.sysremid=:sysremid";
        Query query=session.createQuery(sql);
        query.setParameter("title",title);
        query.setParameter("sysremid",1);
        query.executeUpdate();


    }

    @Override
    public void updatcopyright(String copyright) {
        Session session=sessionFactory.getCurrentSession();
        String sql="update WebSystem web set web.copyright=:copyright  where web.sysremid=:sysremid";
        Query query=session.createQuery(sql);
        query.setParameter("copyright",copyright);
        query.setParameter("sysremid",1);
        query.executeUpdate();

    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
