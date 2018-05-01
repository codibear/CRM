package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.NewsDao;
import com.chinasofti.crm.domain.News;
import org.hibernate.HibernateException;

import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class NewsDaoImpl extends BaseDaoImpl<News> implements NewsDao {
    public List<News> select(String newsName) throws HibernateException {
        List list=this.getHibernateTemplate().find(" FROM News n WHERE n.newsName LIKE '%"+newsName+"%'");
        return list;
    }

    public List<News> select1(String newsAuthor) {
        List list=this.getHibernateTemplate().find(" FROM News n WHERE n.newsAuthor LIKE '%"+newsAuthor+"%'");
        return list;
    }

    public List<News> select2(String newsDate) {
        List list=this.getHibernateTemplate().find(" FROM News n WHERE n.newsDate LIKE '%"+newsDate+"%'");

        return list;
    }

}
