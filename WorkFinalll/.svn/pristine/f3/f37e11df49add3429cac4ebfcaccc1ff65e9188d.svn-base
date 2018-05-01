package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.PowerBiz;
import com.chinasofti.crm.dao.PowerDao;
import com.chinasofti.crm.domain.Page;
import com.chinasofti.crm.domain.Power;
import org.hibernate.criterion.DetachedCriteria;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
@Transactional
public class PowerBizImpl implements PowerBiz{

    private PowerDao powerDao;

    public Page<Power> find(DetachedCriteria dc, int currentPage, int pageData) {
        return this.powerDao.find(dc, currentPage, pageData);
    }

    public void save(Power power) {
    this.powerDao.save(power);
    }

    public void update(Power power) {
        this.powerDao.modify(power);
    }

    public void delete(Power power) {
        this.powerDao.delete(power);
    }

    public Power loadById(Serializable id) {
        return this.powerDao.loadbyid(id);
    }

    public List<Power> findAll() {
        return this.powerDao.findAll();
    }

    public void setPowerDao(PowerDao powerDao) {
        this.powerDao = powerDao;
    }
}
