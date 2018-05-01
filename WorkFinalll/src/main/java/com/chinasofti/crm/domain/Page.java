package com.chinasofti.crm.domain;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/8/4.
 */
public class Page<T> implements Serializable {
    //当前页面数
    private long currentPage=1;
    //页面数量
    private long pageSize;
    //一共的数据
    private long totalData;
    //页面内的数据
    private long pageData;
    //总数据内容
    private List<T> data;
    /*
    返回上一页
     */
   public long uppage(){
       if(currentPage<=1){
           return 1;
       }
       return currentPage-1;
   }
     /*
    下一页
     */
    public Long nextpage(){
        if(currentPage>=getPageSize()){
            return getPageSize();
        }
        return currentPage+1;
    }

    public long getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(long currentPage) {
        this.currentPage = currentPage;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotalData() {
        return totalData;

    }

    public void setTotalData(long totalData) {
        this.totalData = totalData;

        long pagesize=this.totalData%pageData==0? this.totalData / pageData: this.totalData/pageData+1;

        this.setPageSize(pagesize);
    }

    public long getPageData() {
        return pageData;
    }

    public void setPageData(long pageData) {
        this.pageData = pageData;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
