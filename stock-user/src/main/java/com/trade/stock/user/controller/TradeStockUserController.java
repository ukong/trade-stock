package com.trade.stock.user.controller;

import com.trade.stock.common.exception.ComponentException;
import com.trade.stock.common.response.ApiRespResult;
import com.trade.stock.user.bo.TradeUser;
import com.trade.stock.user.service.ITradeUserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author YueLiMin
 * @version 1.0.0
 * @since 11
 */
@RequestMapping("/user")
@RestController
@Log4j2
public class TradeStockUserController {
    @Autowired
    private ITradeUserService iTradeUserService;

    @PostMapping("/userLogin")
    public ApiRespResult<Object> userLogin(@RequestParam("userNo") String userNo, @RequestParam("userPwd") String userPwd) {

        ApiRespResult<Object> result = null;
        try {
            // 用户登陆逻辑处理
            TradeUser tradeUser = iTradeUserService.userLogin(userNo, userPwd);
            result = ApiRespResult.success(tradeUser);
        } catch (ComponentException e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.error(e.geterrorCodeEnum());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.sysError(e.getMessage());
        }

        return result;

    }
}
