package com.trade.stock.user.handler;

import com.alibaba.csp.sentinel.adapter.spring.webmvc.callback.BlockExceptionHandler;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeException;
import com.alibaba.csp.sentinel.slots.block.flow.FlowException;
import com.alibaba.fastjson.JSON;
import com.trade.stock.common.exception.enums.ApplicationErrorCodeEnum;
import com.trade.stock.common.response.ApiRespResult;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author YueLiMin
 * @version 1.0.0
 * @since 11
 */
@Component
public class SentinelExceptionHandler implements BlockExceptionHandler {
    @Override
    public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, BlockException e) throws Exception {
        ApiRespResult<Object> result = null;

        if (e instanceof DegradeException) {
            result = ApiRespResult.error(ApplicationErrorCodeEnum.SYS_BUSY.getCode(), ApplicationErrorCodeEnum.SYS_BUSY.getMessage());
        } else if (e instanceof FlowException) {
            result = ApiRespResult.error(ApplicationErrorCodeEnum.SYS_FLOW.getCode(), ApplicationErrorCodeEnum.SYS_FLOW.getMessage());
        } else {
            // 默认 未捕获, 不符合配置的规则, 进入系统异常
            result = ApiRespResult.error(ApplicationErrorCodeEnum.FAILURE.getCode(), ApplicationErrorCodeEnum.FAILURE.getMessage());
        }

        // 返回数据
        httpServletResponse.setStatus(200);
        httpServletResponse.setContentType("application/json;charset=utf-8");
        httpServletResponse.getWriter().write(JSON.toJSONString(result));
    }
}
