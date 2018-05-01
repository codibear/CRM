package com.chinasofti.crm.action.salesOpp;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.chinasofti.crm.biz.PlanBiz;
import com.chinasofti.crm.biz.SalesBiz;
import com.chinasofti.crm.domain.Plan;
import com.chinasofti.crm.domain.SalesManage;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


public class PlanAction extends ActionSupport{

    private PlanBiz planBiz;
    private SalesBiz salesBiz;
    private Plan plan;
    private SalesManage sales;
    private Integer planId;
    private Integer salesId;
    private String planPro;
    private String planResult;


    //查询全部
    public String findAll() throws Exception {
        List<Plan> plens=planBiz.findAll();
        HttpServletResponse response= ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        String jsonStr= JSON.toJSONString(plens);
        PrintWriter out=response.getWriter();
        out.write(jsonStr);
        return NONE;
    }

    //根据salesId查询
    public String findBySalesId() throws Exception {

        List<Plan> plans = planBiz.findBySalesId("from Plan where salesId = ?",salesId);
        HttpServletResponse response = ServletActionContext.getResponse() ;
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        String json = JSONArray.toJSONString(plans);
        PrintWriter pw = response.getWriter();
        pw.write(json);
        return NONE;
    }

    //制作计划
    public String drawPlanFind(){
        System.out.println("-------drawPlanFind-------"+salesId);
        sales = this.salesBiz.findById(salesId);
        return "drawPlan";
    }

    //执行计划的判断
    public String doPlanFind(){

        List<Plan> plans = planBiz.findBySalesId("from Plan where salesId = ?",salesId);

        for (Plan p:plans){

          if (p.getPlanPro()!=null){

              sales = this.salesBiz.findById(salesId);

              return "doPlan";
          }

        }
        return "zero";

    }

    //增加
    public String save() throws Exception{
        SalesManage sales = this.salesBiz.findById(salesId);
        plan.setSalesmanage(sales);
        this.planBiz.save(plan);
        HttpServletResponse response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        String str=JSON.toJSONString("White");
        out.write(str);
        out.close();
        return NONE;
    }
    //删除
    public String delete() throws Exception{
        Plan plan=planBiz.loadById(planId);
        this.planBiz.delete(plan);
        HttpServletResponse response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        String str=JSON.toJSONString("White");
        out.write(str);
        out.close();
        return NONE;
    }
    //修改更新
    public String update() throws Exception{
        plan = planBiz.loadById(planId);
        plan.setPlanPro(planPro);
        this.planBiz.update(plan);
        HttpServletResponse response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        String str=JSON.toJSONString("White");
        out.write(str);
        out.close();
        return NONE;
    }

    //修改计划
    public String modify() throws IOException {
        plan = planBiz.loadById(planId);
        plan.setPlanResult(planResult);
        this.planBiz.update(plan);
        HttpServletResponse response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        //将文件的类型设置为json格式
        response.setContentType("text/json");
        String str=JSON.toJSONString("White");
        out.write(str);
        out.close();
        return NONE;
    }

    public PlanBiz getPlanBiz() {
        return planBiz;
    }

    public void setPlanBiz(PlanBiz planBiz) {
        this.planBiz = planBiz;
    }

    public SalesBiz getSalesBiz() {
        return salesBiz;
    }

    public void setSalesBiz(SalesBiz salesBiz) {
        this.salesBiz = salesBiz;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public SalesManage getSales() {
        return sales;
    }

    public void setSales(SalesManage sales) {
        this.sales = sales;
    }

    public Integer getPlanId() {
        return planId;
    }

    public void setPlanId(Integer planId) {
        this.planId = planId;
    }

    public Integer getSalesId() {
        return salesId;
    }

    public void setSalesId(Integer salesId) {
        this.salesId = salesId;
    }

    public String getPlanPro() {
        return planPro;
    }

    public void setPlanPro(String planPro) {
        this.planPro = planPro;
    }

    public String getPlanResult() {
        return planResult;
    }

    public void setPlanResult(String planResult) {
        this.planResult = planResult;
    }
}
