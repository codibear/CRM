package com.chinasofti.crm.domain;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/8/9.
 */
public class News implements Serializable {
    //新闻编号
    private int newsId;
    //新闻名字
    private String newsName;
    //新闻标题
    private String newsTitle;
    //作者
    private String newsAuthor;
    //新闻来源
    private String newsResource;
    //新闻内容
    private String newsContain;

    private String newsDate;

    //构造方法
     public News() {
    }

    //set get方法

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getNewsName() {
        return newsName;
    }

    public void setNewsName(String newsName) {
        this.newsName = newsName;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsAuthor() {
        return newsAuthor;
    }

    public void setNewsAuthor(String newsAuthor) {
        this.newsAuthor = newsAuthor;
    }

    public String getNewsResource() {
        return newsResource;
    }

    public void setNewsResource(String newsResource) {
        this.newsResource = newsResource;
    }

    public String getNewsContain() {
        return newsContain;
    }

    public void setNewsContain(String newsContain) {
        this.newsContain = newsContain;
    }

    public String getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(String newsDate) {
        this.newsDate = newsDate;
    }
}
