package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.CstCon;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by zxk on 2017/8/9 0009.
 */
public interface CstConBiz {
    Page<CstCon> find(DetachedCriteria dc, int currentPage, int pageData, String sql);

    void save(CstCon cstCon);

    List<CstCon> findAll();

    void modify(CstCon cstCon);

    void delete(CstCon cstCon);

    CstCon loadbyid(Serializable id);

    //可变参数
    List<CstCon> find(String sql, Object... p);
}
