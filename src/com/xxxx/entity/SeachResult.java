package com.xxxx.entity;

import com.xxxx.util.Constants;

public class SeachResult {
    private int pagenow;
    private int pagesize= Constants.PAGE_SIZE;
    private String risknumber;
    public int GetStart(){
        int a=(pagenow-1)*Constants.PAGE_SIZE;

        return (a);
    }
    public int getPagenow() {
        return pagenow;
    }

    public void setPagenow(int pagenow) {
        this.pagenow = pagenow;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public String getRisknumber() {
        return risknumber;
    }

    public void setRisknumber(String risknumber) {
        this.risknumber = risknumber;
    }
}
