package com.chinasofti.crm.domain;

import java.util.List;

/**
 * Created by Administrator on 2017/8/4.
 */
public class PageBean<T> {
    private int currentPageNo=1;//当前页面
    private int pageSize;//每页有多少条数据
    private int totalRecords;//总记录数
    private int totalPageNo;//总页面数
    private List<T> datas;//数据
 //获取上一页的页码
    public int getPreviewPageNo(){
     if(currentPageNo<=1) {
         return 1;
     }
        return currentPageNo-1;

    }
    //返回下一页的页码
    public int getNextPageNo(){
     if(currentPageNo>=totalPageNo){
         return totalPageNo;

     }
       return currentPageNo+1;

    }

    public int getCurrentPageNo() {
        return currentPageNo;
    }

    public void setCurrentPageNo(int currentPageNo) {
        this.currentPageNo = currentPageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
        //获取总页面数
        int totalPageNo=this.getTotalRecords()%pageSize==0? this.totalRecords/pageSize:this.totalRecords
                /pageSize+1;
        this.setTotalPageNo(totalPageNo);
    }

    public int getTotalPageNo() {
        return totalPageNo;
    }

    public void setTotalPageNo(int totalPageNo) {
        this.totalPageNo = totalPageNo;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }
}
