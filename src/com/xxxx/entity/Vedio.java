package com.xxxx.entity;

public class Vedio {
    private String url;
    private String vedioid;

    private String vedioname;
    private String introduction;
    private String bid;//b站对应视频av号
    private String sid;//分集

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getVedioid() {
        return vedioid;
    }

    public void setVedioid(String vedioid) {
        this.vedioid = vedioid;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    private String imgurl;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


    public String getVedioname() {
        return vedioname;
    }

    public void setVedioname(String vedioname) {
        this.vedioname = vedioname;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}
