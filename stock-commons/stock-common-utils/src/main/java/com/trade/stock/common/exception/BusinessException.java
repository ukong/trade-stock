package com.trade.stock.common.exception;

import com.trade.stock.common.exception.enums.IErrorCodeEnum;

import java.io.Serializable;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
public class BusinessException extends AbstractException implements Serializable {

	private static final long serialVersionUID = 5025424184273145295L;

	private IErrorCodeEnum errorCodeEnum;

	public BusinessException(IErrorCodeEnum errorCodeEnum) {
		super(errorCodeEnum.getCode() + ":" + errorCodeEnum.getMessage());
		this.errorCodeEnum = errorCodeEnum;
	}

	public IErrorCodeEnum geterrorCodeEnum() {
		return errorCodeEnum;
	}

}
