package com.trade.stock.common.exception;

import com.trade.stock.common.exception.enums.IErrorCodeEnum;

import java.io.Serializable;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
public class ComponentException extends AbstractException implements Serializable {

    private static final long serialVersionUID = -2325270170717432827L;

    /**
     * 错误码枚举信息
     */
    private IErrorCodeEnum errorCodeEnum;

    /**
     * 扩展的错误信息
     */
    private String extendErrorMessage;

    public ComponentException(IErrorCodeEnum errorCodeEnum) {
        super(errorCodeEnum.getCode() + ":" + errorCodeEnum.getMessage());
        this.errorCodeEnum = errorCodeEnum;
    }

    public ComponentException(IErrorCodeEnum errorCodeEnum, String extendErrorMessage) {
        super(errorCodeEnum.getCode() + ":" + errorCodeEnum.getMessage() + "[" + extendErrorMessage + "]");
        this.errorCodeEnum = errorCodeEnum;
        this.extendErrorMessage = extendErrorMessage;
    }

    public IErrorCodeEnum geterrorCodeEnum() {
        return errorCodeEnum;
    }

    public void seterrorCodeEnum(IErrorCodeEnum errorCodeEnum) {
        this.errorCodeEnum = errorCodeEnum;
    }

    public String getExtendErrorMessage() {
        return extendErrorMessage;
    }

    public void setExtendErrorMessage(String extendErrorMessage) {
        this.extendErrorMessage = extendErrorMessage;
    }

}
