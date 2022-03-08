package com.trade.stock.common.response;

import com.trade.stock.common.exception.enums.ApplicationErrorCodeEnum;
import com.trade.stock.common.exception.enums.IErrorCodeEnum;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
@Data
@Accessors(chain = true)
public class ApiRespResult<T> implements Serializable {

    private static final long serialVersionUID = -8921720678605745475L;

    /**
     * 结果码
     */
    private String code = ApplicationErrorCodeEnum.SUCCESS.getCode();

    /**
     * 结果信息
     */
    private String msg = ApplicationErrorCodeEnum.SUCCESS.getMessage();

    /**
     * 扩展对象(放置分页信息, 其他信息等)
     */
    private Object extendData;

    /**
     * 返回结果的数据对象
     */
    private T data;

    public ApiRespResult() {
    }

    public ApiRespResult(String code) {
        this.code = code;
    }

    public ApiRespResult(String code, String message) {
        this.code = code;
        this.msg = message;
    }

    public ApiRespResult(IErrorCodeEnum errorCodeEnum) {
        this.code = errorCodeEnum.getCode();
        this.msg = errorCodeEnum.getMessage();
    }

    public static <T> ApiRespResult<T> error(IErrorCodeEnum errorCodeEnum) {
        return new ApiRespResult<T>(errorCodeEnum);
    }

    public static <T> ApiRespResult<T> sysError(String exceptionMsg) {
        ApiRespResult<T> error = new ApiRespResult<T>(ApplicationErrorCodeEnum.FAILURE);
        error.setMsg(error.getMsg() + ":" + exceptionMsg);
        return error;
    }

    public static <T> ApiRespResult<T> error(String code, String msg) {
        return new ApiRespResult<T>(code, msg);
    }

    public static <T> ApiRespResult<T> error(String code, String msg, T data) {
        return new ApiRespResult<T>(code, msg).setData(data);
    }

    public static ApiRespResult<Void> success() {
        return success(null);
    }

    public static <T> ApiRespResult<T> success(T data) {
        return success(data, null);
    }

    public static <T> ApiRespResult<T> success(T data, Object extendData) {
        return new ApiRespResult<T>().setData(data).setExtendData(extendData);
    }
}
