package com.store.common.core.page2;

import com.store.common.utils.ServletUtils;

/**
 * 表格数据处理
 *
 * @author store
 */
public class WebTableSupport
{
    /**
     * 当前记录起始索引
     */
    public static final String PAGE_NUM = "currentPage";

    /**
     * 每页显示记录数
     */
    public static final String PAGE_SIZE = "pageSize";

    /**
     * 排序列
     */
    public static final String ORDER_BY_COLUMN = "orderByColumn";

    /**
     * 排序的方向 "desc" 或者 "asc".
     */
    public static final String IS_ASC = "isAsc";

    /**
     * 封装分页对象
     */
    public static WebPageDomain getPageDomain(int currentPage ,int pageSize)
    {
        WebPageDomain pageDomain = new WebPageDomain();
        pageDomain.setCurrentPage(currentPage);
        pageDomain.setPageSize(pageSize);
        pageDomain.setOrderByColumn(ServletUtils.getParameter(ORDER_BY_COLUMN));
        pageDomain.setIsAsc(ServletUtils.getParameter(IS_ASC));
        return pageDomain;
    }

    public static WebPageDomain buildPageRequest(int currentPage ,int pageSize)
    {
        return getPageDomain( currentPage , pageSize);
    }
}
