package com.chinasofti.crm.domain;


import java.io.Serializable;
import java.util.Date;

public class Customer implements Serializable {

    private Integer id;//自增编号
    private String cusId;//客户编号
    private String cusName;//客户名称
    private String cusRegion;//地区
    private String cusManagerId;//客户经理编号
    private String cusManagerName;//客户经理名称
    private String cusLevel;//客户等级
    private Date cusCreatTime;//创建时间
    private String cusSatisfy;//客户满意度
    private String cusCredit;//客户信用度
    private String cusAddr;//客户地址
    private String cusZip;//客户邮政编码
    private String cusTel;//客户电话
    private String cusFax;//客户传真
    private String cusWebsite;//客户网站
    private String licenceNo;//营业执照注册号
    private String chieftain;//法人
    private double bankroll;//注册资金
    private double cusTurnover;//年营业额
    private String bank;//开户银行
    private String bankAccount;//银行账号
    private String localTaxNo;//地税局登记号
    private String nationalTaxNo;//国税局登记号
    private String status;//状态


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCusId() {
        return cusId;
    }

    public void setCusId(String cusId) {
        this.cusId = cusId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusRegion() {
        return cusRegion;
    }

    public void setCusRegion(String cusRegion) {
        this.cusRegion = cusRegion;
    }

    public String getCusManagerId() {
        return cusManagerId;
    }

    public void setCusManagerId(String cusManagerId) {
        this.cusManagerId = cusManagerId;
    }

    public String getCusManagerName() {
        return cusManagerName;
    }

    public void setCusManagerName(String cusManagerName) {
        this.cusManagerName = cusManagerName;
    }

    public String getCusLevel() {
        return cusLevel;
    }

    public void setCusLevel(String cusLevel) {
        this.cusLevel = cusLevel;
    }

    public Date getCusCreatTime() {
        return cusCreatTime;
    }

    public void setCusCreatTime(Date cusCreatTime) {
        this.cusCreatTime = cusCreatTime;
    }

    public String getCusSatisfy() {
        return cusSatisfy;
    }

    public void setCusSatisfy(String cusSatisfy) {
        this.cusSatisfy = cusSatisfy;
    }

    public String getCusCredit() {
        return cusCredit;
    }

    public void setCusCredit(String cusCredit) {
        this.cusCredit = cusCredit;
    }

    public String getCusAddr() {
        return cusAddr;
    }

    public void setCusAddr(String cusAddr) {
        this.cusAddr = cusAddr;
    }

    public String getCusZip() {
        return cusZip;
    }

    public void setCusZip(String cusZip) {
        this.cusZip = cusZip;
    }

    public String getCusTel() {
        return cusTel;
    }

    public void setCusTel(String cusTel) {
        this.cusTel = cusTel;
    }

    public String getCusFax() {
        return cusFax;
    }

    public void setCusFax(String cusFax) {
        this.cusFax = cusFax;
    }

    public String getCusWebsite() {
        return cusWebsite;
    }

    public void setCusWebsite(String cusWebsite) {
        this.cusWebsite = cusWebsite;
    }

    public String getLicenceNo() {
        return licenceNo;
    }

    public void setLicenceNo(String licenceNo) {
        this.licenceNo = licenceNo;
    }

    public String getChieftain() {
        return chieftain;
    }

    public void setChieftain(String chieftain) {
        this.chieftain = chieftain;
    }

    public double getBankroll() {
        return bankroll;
    }

    public void setBankroll(double bankroll) {
        this.bankroll = bankroll;
    }

    public double getCusTurnover() {
        return cusTurnover;
    }

    public void setCusTurnover(double cusTurnover) {
        this.cusTurnover = cusTurnover;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getLocalTaxNo() {
        return localTaxNo;
    }

    public void setLocalTaxNo(String localTaxNo) {
        this.localTaxNo = localTaxNo;
    }

    public String getNationalTaxNo() {
        return nationalTaxNo;
    }

    public void setNationalTaxNo(String nationalTaxNo) {
        this.nationalTaxNo = nationalTaxNo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


}
