package com.trade.stock.user.controller;

import com.trade.stock.common.exception.enums.ApplicationErrorCodeEnum;
import com.trade.stock.common.response.ApiRespResult;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author YueLiMin
 * @version 1.0.0
 * @since 11
 */
@RestController
public class RestNotFoundController implements ErrorController {
    private static final String ERROR_PATH = "/error";

    @RequestMapping(value = ERROR_PATH)
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    public ApiRespResult<Object> handleError() {
        return ApiRespResult.error(ApplicationErrorCodeEnum.NOT_FOUND.getCode(), ApplicationErrorCodeEnum.NOT_FOUND.getMessage());
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
}
