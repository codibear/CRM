package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.News;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public interface NewsBiz {
    Page<News> find(DetachedCriteria dc, int currentPage, int pageData);

    void save(News news);

    List<News> findAll();

    void modify(News news);

    void delete(News news);

    News loadbyid(Serializable id);

    //可变参数
    List<News> find(String sql, Object... p);
    List<News> select(String newsName);
    List<News> select1(String newsAuthor);
    List<News> select2(String newsDate);

}
