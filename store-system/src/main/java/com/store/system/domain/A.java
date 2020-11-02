package com.store.system.domain;

import java.util.Arrays;

public class A{
    private static final long serialVersionUID = 1L;
    String[] categoryName;


    public String[] getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String[] categoryName) {
        this.categoryName = categoryName;
    }

    public A() {
    }

    @Override
    public String toString() {
        return "A{" +
            "categoryName=" + Arrays.toString(categoryName) +
            '}';
    }

}
