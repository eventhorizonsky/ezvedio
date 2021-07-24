package com.xxxx.entity.vo;

import com.xxxx.entity.Vedio;
import com.xxxx.util.Constants;

import java.util.List;

public class SearchModel<T> {
    private List<T> date;
    private Object object;

    private int totalCount; //总共的条数
    private int pagenow;
    private int pageCount;
    private String risknumber;

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public List<T> getDate() {
        return date;
    }

    public void setDate(List<T> date) {
        this.date = date;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPagenow() {
        return pagenow;
    }

    public void setPagenow(int pagenow) {
        this.pagenow = pagenow;
    }

    public String getRisknumber() {
        return risknumber;
    }

    public void setRisknumber(String risknumber) {
        this.risknumber = risknumber;
    }

    public int getPageCount() {
        if(totalCount % Constants.PAGE_SIZE==0){
            pageCount=totalCount/Constants.PAGE_SIZE;
        }else{
            pageCount=totalCount/Constants.PAGE_SIZE+1;
        }
        return pageCount;
    }
}
