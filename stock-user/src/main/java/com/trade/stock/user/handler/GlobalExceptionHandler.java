package com.trade.stock.user.handler;

import com.trade.stock.common.exception.ComponentException;
import com.trade.stock.common.exception.enums.IErrorCodeEnum;
import com.trade.stock.common.response.ApiRespResult;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author YueLiMin
 * @version 1.0.0
 * @since 11
 */
@Log4j2
@RestControllerAdvice
public class GlobalExceptionHandler {
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = Exception.class)
    public ApiRespResult<Object> processException(Exception e) {
        log.info(e.getMessage(), e);

        if (e instanceof ComponentException) {
            ComponentException componentException = (ComponentException) e;
            if (componentException.geterrorCodeEnum() != null) {
                IErrorCodeEnum iErrorCodeEnum = componentException.geterrorCodeEnum();
                return ApiRespResult.error(iErrorCodeEnum.getCode(), iErrorCodeEnum.getMessage());
            }
        }

        return ApiRespResult.sysError(e.getMessage());
    }
}
