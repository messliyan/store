package com.store.common.core.page2;

import java.io.Serializable;
import java.util.List;

/**
 * 表格分页数据对象
 *
 * @author store
 */
public class WebTableDataInfo implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 总记录数 */
    private long total;

    /** 列表数据 */
    private List<?> Product;

    /** 消息状态码 */
    private String code;

    /** 消息内容 */
    private String msg;

    /**
     * 表格数据对象
     */
    public WebTableDataInfo()
    {
    }

    /**
     * 分页
     *
     * @param list 列表数据
     * @param total 总记录数
     */
    public WebTableDataInfo(List<?> list, int total)
    {
        this.Product = list;
        this.total = total;
    }

    public long getTotal()
    {
        return total;
    }

    public void setTotal(long total)
    {
        this.total = total;
    }

    public List<?> getProduct()
    {
        return Product;
    }

    public void setProduct(List<?> Product)
    {
        this.Product = Product;
    }

    public String getCode()
    {
        return code;
    }

    public void setCode(String code)
    {
        this.code = code;
    }

    public String getMsg()
    {
        return msg;
    }

    public void setMsg(String msg)
    {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "WebTableDataInfo{" +
            "total=" + total +
            ", Product=" + Product +
            ", code='" + code + '\'' +
            ", msg='" + msg + '\'' +
            '}';
    }
}
