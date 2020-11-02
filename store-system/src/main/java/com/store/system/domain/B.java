package com.store.system.domain;

import java.util.Arrays;

public class B {
    private static final long serialVersionUID = 1L;
    int[]  categoryID;
    int  currentPage;
    int pageSize;

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

    @Override
    public String toString() {
        return "B{" +
            "categoryID=" + Arrays.toString(categoryID) +
            ", currentPage=" + currentPage +
            ", pageSize=" + pageSize +
            '}';
    }
}
