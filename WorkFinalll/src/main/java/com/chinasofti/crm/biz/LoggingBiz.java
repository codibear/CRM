package com.chinasofti.crm.biz;

import com.chinasofti.crm.domain.Log;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

/**
 * Created by  Li min  on 2017/8/14.
 */
public interface LoggingBiz {
    Page<Log> find(DetachedCriteria dc, int currentPage, int pageData);
    List findAll();
}
