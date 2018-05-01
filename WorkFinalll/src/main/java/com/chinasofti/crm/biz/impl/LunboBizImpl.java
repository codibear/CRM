package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.LunboBiz;
import com.chinasofti.crm.dao.LunboDao;
import com.chinasofti.crm.domain.Lunbo;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

/**
 * Created by jlkj on 2017/8/9.
 */
@Transactional
public class LunboBizImpl implements LunboBiz {

    private LunboDao lunboDao;

    public List<Lunbo> findAll() {

        return this.lunboDao.findAll();
    }

    public void modify(Lunbo lunbo) {
        this.lunboDao.modify(lunbo);
    }

    public List<Lunbo> find(String sql, Object... p) {
        return this.lunboDao.find(sql, p);
    }

    public Lunbo findById(Serializable id) {
        return this.lunboDao.loadbyid(id);
    }

    public void setLunboDao(LunboDao lunboDao) {
        this.lunboDao = lunboDao;
    }
}
