package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.QuotationBaseDao;
import com.chinasofti.crm.domain.PageBean;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * Created by Administrator on 2017/8/4.
 */
public class QuotationBaseDaoImpl<T> extends HibernateDaoSupport implements QuotationBaseDao<T> {
    private Class clazz;
    public QuotationBaseDaoImpl() {
        //从jvm虚拟中获取正在运行的当前类 DeptDaoImpl
        Class c=this.getClass();
        //获取当前的运行类的父类 BaseDaoImpl
        Type genericSuperclass=c.getGenericSuperclass();
        //判断是否是参数化类型
        if(genericSuperclass instanceof ParameterizedType){
              ParameterizedType parameterizedType= (ParameterizedType) genericSuperclass;
            //获取泛型中的类型列表,返回类型数组
            Type[] types=parameterizedType.getActualTypeArguments();
            clazz= (Class) types[0];
        }


    }

    public void save(T t) {
 this.getHibernateTemplate().save(t);
    }

    public void delete(T t) {
this.getHibernateTemplate().delete(t);
    }

    public void update(T t) {
 this.getHibernateTemplate().update(t);
    }

    public T loadById(Serializable id) {
        return (T)this.getHibernateTemplate().load(clazz,id);
    }

    public List<T> findAll() {
        //创建离线查询对象
        DetachedCriteria dc=DetachedCriteria.forClass(clazz);
       return (List<T>) this.getHibernateTemplate().findByCriteria(dc);
    }


    public PageBean<T> findAllData(DetachedCriteria dc, int currentPageNo, int pageSize, String sql) {
        PageBean pageBean=new PageBean();
        //设置当前页
        pageBean.setCurrentPageNo(currentPageNo);
        //设置每页显示条数
        pageBean.setPageSize(pageSize);
        //获取当前页下的所有数据
        List<T> datas = (List<T>) this.getHibernateTemplate().findByCriteria(dc,(currentPageNo-1) * pageSize,pageSize);
          pageBean.setDatas(datas);
        //查询总记录数
        Object o= this.getHibernateTemplate().find("SELECT COUNT(*) FROM "+clazz.getSimpleName()+sql).get(0);
        long count=(Long)o;
        int a=(int)count;
        //将总记录数设置在pageBean对象中,以便计算总页数
        pageBean.setTotalRecords(a);
        return pageBean;
    }
    public List<T> find(String sql, Object ... p) {
        //sql为参数语句
        List<T> list= (List<T>) this.getHibernateTemplate().find(sql,p);
        return list;
    }


}
