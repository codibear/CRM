package com.chinasofti.crm.dao.impl;

import com.chinasofti.crm.dao.CstConDao;
import com.chinasofti.crm.domain.CstCon;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
public class CstConDaoImpl extends BaseDaoImpl<CstCon> implements CstConDao {

    public Page<CstCon> find(DetachedCriteria dc, int currentPage, int pageData, String sql) {
        Page page=new Page();
        //获取当前页面数
        page.setCurrentPage(currentPage);
        //获取页面数据
        page.setPageData(pageData);
        //获取当前页下所有数据
        List<CstCon> datas= (List<CstCon>) this.getHibernateTemplate().findByCriteria(dc,(currentPage-1)*pageData,pageData);

        page.setData(datas);

        List<Long> list= (List<Long>) this.getHibernateTemplate().find("select count(*) from CstCon WHERE "+sql);


        page.setTotalData(list.get(0));

        return page;
    }
}
