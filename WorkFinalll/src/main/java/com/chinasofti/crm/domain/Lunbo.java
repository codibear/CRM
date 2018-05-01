package com.chinasofti.crm.domain;

import java.io.Serializable;

/**
 * Created by jlkj on 2017/8/9.
 */
public class Lunbo implements Serializable{

    private Integer photoId;//轮播图片ID
    private String picName;//图片名称
    private String relName;
    private String uploadMan;//上传人

//get/set方法



    public Integer getPhotoId() {
        return photoId;
    }

    public void setPhotoId(Integer photoId) {
        this.photoId = photoId;
    }

    public String getPicName() {
        return picName;
    }

    public void setPicName(String picName) {
        this.picName = picName;
    }

    public String getUploadMan() {
        return uploadMan;
    }

    public void setUploadMan(String uploadMan) {
        this.uploadMan = uploadMan;
    }

    public String getRelName() {
        return relName;
    }

    public void setRelName(String relName) {
        this.relName = relName;
    }
}
