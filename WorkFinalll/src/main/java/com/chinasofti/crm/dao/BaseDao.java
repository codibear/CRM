package com.chinasofti.crm.dao;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/4.
 */
public interface BaseDao<T> {

    Page<T> find(DetachedCriteria dc, int currentPage, int pageData);

    void save(T t);

    void delete(T t);

    void modify(T t);

    T loadbyid(Serializable id);

    List<T> findAll();

    //可变参数
    List<T> find(String sql,Object ...p);

}
