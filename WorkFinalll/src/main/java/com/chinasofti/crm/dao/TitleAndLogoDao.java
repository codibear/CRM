package com.chinasofti.crm.dao;

import com.chinasofti.crm.domain.WebSystem;

/**
 * Created by 杨广 on 2017/8/15.
 */
public interface TitleAndLogoDao {
    /*查询系统名和logo*/
    WebSystem findWeb();
    /*更新logo*/
    void updatelogo(String logoip);
    /*更新系统名*/
    void updatename(String systemname);
    /*更新title*/
    void updatetitle(String title);
    /*更新系统名*/
    void updatcopyright(String copyright);

}
