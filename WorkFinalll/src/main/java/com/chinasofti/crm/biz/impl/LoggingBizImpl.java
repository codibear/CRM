package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.LoggingBiz;
import com.chinasofti.crm.dao.LoggingDao;
import com.chinasofti.crm.domain.Log;
import com.chinasofti.crm.domain.Page;
import org.hibernate.criterion.DetachedCriteria;


import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by  Li min  on 2017/8/14.
 */
@Transactional
public class LoggingBizImpl  implements LoggingBiz {
    private LoggingDao loggingDao;

    @Override
    public Page<Log> find(DetachedCriteria dc, int currentPage, int pageData) {
        return loggingDao.find(dc, currentPage, pageData);
    }

    @Override
    public List<Log> findAll() {
        return this.loggingDao.findAll();
    }

    public LoggingDao getLoggingDao() {
        return loggingDao;
    }

    public void setLoggingDao(LoggingDao loggingDao) {
        this.loggingDao = loggingDao;
    }
}
