package com.trade.stock.common.exception.enums;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
public interface IErrorCodeEnum {
    /**
     * 用户服务模块
     */
    String MODULE_USER = "USER_";

    /**
     * 系统模块
     */
    String MODULE_SYSTEM = "SYS_";

    /**
     * 获取自定义的错误码
     *
     * @return
     */
    String getCode();

    /**
     * 获取自定义的错误码提示消息
     *
     * @return
     */
    String getMessage();

    /**
     * 获取自定义的错误级别信息
     *
     * @return
     */
    WarningLevelEnum getLevel();

}
