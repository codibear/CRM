package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.BaseDao;
import com.chinasofti.crm.domain.Page;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * Created by Administrator on 2017/8/4.
 */

public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T>{

    private Class clazz;

    public BaseDaoImpl() {
        //从jvm虚拟机中获取正在运行当前类:DeptDaoImpl
        Class c = this.getClass() ;
        //获取当前的运行类的父类 BaseDaoImpl<Dept>
        Type genericSuperclass = c.getGenericSuperclass();
        //判断是否是参数化类型
        if(genericSuperclass instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) genericSuperclass;
            //获取泛型中的类型列表，返回类型数组
            Type[] types = parameterizedType.getActualTypeArguments() ;

            this.clazz = (Class) types[0];
        }
//        System.out.println(c);
    }

    public Page<T> find(DetachedCriteria dc, int currentPage, int pageData) {
        Page page=new Page();
        //获取当前页面数
        page.setCurrentPage(currentPage);
        //获取页面数据
        page.setPageData(pageData);
        //获取当前页下所有数据
        List<T> datas= (List<T>) this.getHibernateTemplate().findByCriteria(dc,(currentPage-1)*pageData,pageData);

        page.setData(datas);

        List<Long> list= (List<Long>) this.getHibernateTemplate().find("select count(*) from "+clazz.getSimpleName());

        page.setTotalData(list.get(0));

        return page;
    }

    public void save(T t) {

        this.getHibernateTemplate().save(t) ;

    }

    public List<T> findAll() {

        //创建离线查询对象
        DetachedCriteria dc = DetachedCriteria.forClass(clazz) ;

        List<T> list= (List<T>) this.getHibernateTemplate().findByCriteria(dc);

        return list;
    }

    public void modify(T t) {

        this.getHibernateTemplate().update(t);

    }

    public void delete(T t) {

        this.getHibernateTemplate().delete(t);

    }

    public T loadbyid(Serializable id) {

        this.getHibernateTemplate().getSessionFactory().getCurrentSession().clear();
        return (T) this.getHibernateTemplate().get(clazz,id);

    }


    public List<T> find(String sql, Object ... p) {

       //sql为参数语句

        List<T> list= (List<T>) this.getHibernateTemplate().find(sql,p);

        return list;
    }

}
