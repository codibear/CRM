package com.chinasofti.crm.action.quotation;
import com.chinasofti.crm.biz.QuotationBiz;
import com.chinasofti.crm.biz.QuotationStatusBiz;
import com.chinasofti.crm.domain.Quotation;
import com.chinasofti.crm.domain.QuotationStatus;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Administrator on 2017/8/11.
 */
public class QuotationProAction extends ActionSupport {
    private int quotationId;
    private QuotationBiz quotationBiz;
    private Quotation quotation;
    private List<QuotationStatus> quotationStatus;
    private QuotationStatusBiz quotationStatusBiz;

//    查询单个
    public String process(){
     System.out.println(quotationId);
        quotation=quotationBiz.loadById(quotationId);
        quotationStatus=quotationStatusBiz.findAllQuotationStatus();
        System.out.println(quotation.getProcessor());
        System.out.println(quotationStatus.get(0).getQuotationStatus());
        return "success";
    }
//    保存
    public String save() throws IOException {
        System.out.println(quotation.getQuotationId());
        Quotation quotation=quotationBiz.loadById(this.quotation.getQuotationId());
        quotation.setQuotationStatus(this.quotation.getQuotationStatus());
        quotation.setProcessor(this.quotation.getProcessor());
        quotation.setProcessorNo(this.quotation.getProcessorNo());
        quotationBiz.update(quotation);
        HttpServletResponse response= ServletActionContext.getResponse();
        PrintWriter pw=response.getWriter();
        pw.write("保存成功");
        return NONE;
    }

    public int getQuotationId() {
        return quotationId;
    }

    public void setQuotationId(int quotationId) {
        this.quotationId = quotationId;
    }

    public void setQuotationBiz(QuotationBiz quotationBiz) {
        this.quotationBiz = quotationBiz;
    }

    public Quotation getQuotation() {
        return quotation;
    }

    public void setQuotation(Quotation quotation) {
        this.quotation = quotation;
    }

    public List<QuotationStatus> getQuotationStatus() {
        return quotationStatus;
    }

    public void setQuotationStatus(List<QuotationStatus> quotationStatus) {
        this.quotationStatus = quotationStatus;
    }

    public void setQuotationStatusBiz(QuotationStatusBiz quotationStatusBiz) {
        this.quotationStatusBiz = quotationStatusBiz;
    }
}
