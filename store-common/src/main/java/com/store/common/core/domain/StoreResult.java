package com.store.common.core.domain;

import com.store.common.constant.HttpStatus;
import com.store.common.utils.StringUtils;
import java.util.HashMap;

/**
 * 操作消息提醒
 *
 * @author store
 */
public class StoreResult extends HashMap<String, Object>
{
    private static final long serialVersionUID = 1L;

    /** 状态码 */
    public static final String CODE_TAG = "code";

    /** 返回内容 */
    public static final String MSG_TAG = "msg";

    /** 数据对象 */
    public static final String DATA_TAG = "data";

    /**
     * 初始化一个新创建的 AjaxResult 对象，使其表示一个空消息。
     */
    public StoreResult()
    {
    }

    /**
     * 初始化一个新创建的 AjaxResult 对象
     *
     * @param code 状态码
     * @param msg 返回内容
     */
    public StoreResult(String code, String msg)
    {
        super.put(CODE_TAG, code);
        super.put(MSG_TAG, msg);
    }

    /**
     * 初始化一个新创建的 AjaxResult 对象
     *
     * @param code 状态码
     * @param msg 返回内容
     * @param data 数据对象
     */
    public StoreResult(String code, String msg, Object data)
    {
        super.put(CODE_TAG, code);
        super.put(MSG_TAG, msg);
        if (StringUtils.isNotNull(data))
        {
            super.put(data.getClass().getSimpleName(), data);
        }
    }
    /**
     * 初始化一个新创建的 AjaxResult 对象
     *
     * @param code 状态码
     * @param msg 返回内容
     * @param data 数据对象
     */
    public StoreResult(String code, String msg, String title,Object data)
    {
        super.put(CODE_TAG, code);
        super.put(MSG_TAG, msg);
        if (StringUtils.isNotNull(data))
        {
            super.put(title, data);
        }
    }
    /**
     * 返回成功消息
     *
     * @return 成功消息
     */
    public static StoreResult success()
    {
        return StoreResult.success("操作成功");
    }

    /**
     * 返回成功数据
     *
     * @return 成功消息
     */
    public static StoreResult success(Object data)
    {
        return StoreResult.success("操作成功", data);
    }

    /**
     * 返回成功消息
     *
     * @param msg 返回内容
     * @return 成功消息
     */
    public static StoreResult success(String msg)
    {
        return StoreResult.success(msg, null);
    }

    /**
     * 返回成功消息
     *
     * @param msg 返回内容
     * @param data 数据对象
     * @return 成功消息
     */
    public static StoreResult success(String msg,  String title,Object data)
    {
        return new StoreResult("001", msg,   title,data);
    }


    /**
     * 返回成功消息
     *
     * @param msg 返回内容
     * @param data 数据对象
     * @return 成功消息
     */
    public static StoreResult success(String msg, Object data)
    {
        return new StoreResult("001", msg, data);
    }
    /**
     * 返回错误消息
     *
     * @return
     */
    public static StoreResult error()
    {
        return StoreResult.error("操作失败");
    }

    /**
     * 返回错误消息
     *
     * @param msg 返回内容
     * @return 警告消息
     */
    public static StoreResult error(String msg)
    {
        return StoreResult.error("004", msg);
    }

    /**
     * 返回错误消息
     *
     * @param msg 返回内容
     * @param data 数据对象
     * @return 警告消息
     */
    public static StoreResult error(String msg, Object data)
    {
        return new StoreResult("004", msg, data);
    }

    /**
     * 返回错误消息
     *
     * @param code 状态码
     * @param msg 返回内容
     * @return 警告消息
     */
    public static StoreResult error(String code, String msg)
    {
        return new StoreResult(code, msg, null);
    }
}
