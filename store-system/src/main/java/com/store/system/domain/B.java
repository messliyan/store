package com.store.system.domain;

import java.util.Arrays;

public class B {
    private static final long serialVersionUID = 1L;
    int[]  categoryID;
    int  currentPage;
    int pageSize;
    /** 搜索值 */
    private String  search;;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int[] getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int[] categoryID) {
        this.categoryID = categoryID;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public B( int currentPage, int pageSize, String search) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.search = search;
    }
    public B(int[] categoryID, int currentPage, int pageSize) {
        this.categoryID = categoryID;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }
    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public B() {
    }

    @Override
    public String toString() {
        return "B{" +
            "categoryID=" + Arrays.toString(categoryID) +
            ", currentPage=" + currentPage +
            ", pageSize=" + pageSize +
            ", search='" + search + '\'' +
            '}';
    }
}
