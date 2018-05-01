package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.CstLinkman;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public interface CstLinkmanBiz {
    Page<CstLinkman> find(DetachedCriteria dc, int currentPage, int pageData);

    void save(CstLinkman t);

    List<CstLinkman> findAll();

    void modify(CstLinkman t);

    void delete(CstLinkman t);

    CstLinkman loadbyid(Serializable id);

    //可变参数
    List<CstLinkman> find(String sql, Object... p);
}
