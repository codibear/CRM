package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.NewsBiz;
import com.chinasofti.crm.dao.NewsDao;
import com.chinasofti.crm.domain.News;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
@Transactional
public class NewsBizImpl implements NewsBiz {

    private NewsDao newsDao;

    //查找完全部并分页
    public Page<News> find(DetachedCriteria dc, int currentPage, int pageData) {
        Page page= this.newsDao.find(dc,currentPage,pageData);
        return page;
    }
    //保存新闻
    public void save(News news) {
        this.newsDao.save(news);

    }
    //查找全部
    public List<News> findAll() {
    List<News> list=this.newsDao.findAll();
        return list;
    }
    //修改
    public void modify(News news) {
        this.newsDao.modify(news);
    }
    //删除
    public void delete(News news) {
        this.newsDao.delete(news);
    }
    //通过id查询
    public News loadbyid(Serializable id) {
        return this.newsDao.loadbyid(id);
    }
    //通过条件查询
    public List<News> find(String sql, Object... p) {
        return this.newsDao.find(sql,p);
    }

    public List<News> select(String newsName) {
       List<News> list=this.newsDao.select(newsName);
        return list;
    }

    public List<News> select1(String newsAuthor) {
        List<News> list=this.newsDao.select1(newsAuthor);
        return list;
    }

    public List<News> select2(String newsDate) {
        List<News> list=this.newsDao.select2(newsDate);

        return list;
    }


    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }
}
