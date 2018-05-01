package com.chinasofti.crm.biz.impl;

import com.chinasofti.crm.biz.TitleAndLogoBiz;
import com.chinasofti.crm.dao.TitleAndLogoDao;
import com.chinasofti.crm.domain.WebSystem;

import javax.transaction.Transactional;

/**
 * Created by 杨广 on 2017/8/15.
 */
@Transactional
public class TitleAndLogoBizImpl implements TitleAndLogoBiz {
    private TitleAndLogoDao titleAndLogoDao;
    @Override
    public WebSystem findWeb() {
        System.out.println("Biz收到查询title ＆ logo 请求");

        return titleAndLogoDao.findWeb();
    }

    @Override
    public void updatelogo(String logoip) {
        titleAndLogoDao.updatelogo(logoip);

    }

    @Override
    public void updatename(String systemname) {
        titleAndLogoDao.updatename(systemname);

    }

    @Override
    public void updatetitle(String title) {

        titleAndLogoDao.updatetitle(title);
    }

    @Override
    public void updatcopyright(String copyright) {
        titleAndLogoDao.updatcopyright(copyright);

    }


    public void setTitleAndLogoDao(TitleAndLogoDao titleAndLogoDao) {
        this.titleAndLogoDao = titleAndLogoDao;
    }
}
