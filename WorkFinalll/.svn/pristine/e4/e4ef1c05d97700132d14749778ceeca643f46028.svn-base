package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.CstLost;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public interface CstLostBiz {
    Page<CstLost> find(DetachedCriteria dc, int currentPage, int pageData);

    void save(CstLost cstCon);

    List<CstLost> findAll();

    void modify(CstLost cstCon);

    void delete(CstLost cstCon);

    CstLost loadbyid(Serializable id);

    //可变参数
    List<CstLost> find(String sql, Object... p);
}
