package com.chinasofti.crm.biz.impl;


import com.chinasofti.crm.biz.QuotationStatusBiz;
import com.chinasofti.crm.dao.QuotationStatusDao;
import com.chinasofti.crm.domain.QuotationStatus;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Administrator on 2017/8/11.
 */
@Transactional
public class QuotationStatusBizImpl implements QuotationStatusBiz {
    private QuotationStatusDao quotationStatusDao;
  public List<QuotationStatus> findAllQuotationStatus(){
      return  quotationStatusDao.findAll();
  }
    public void setQuotationStatusDao(QuotationStatusDao quotationStatusDao) {
        this.quotationStatusDao = quotationStatusDao;
    }
}
