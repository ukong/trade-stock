package com.trade.stock.user.controller;

import com.trade.stock.common.exception.ComponentException;
import com.trade.stock.common.response.ApiRespResult;
import com.trade.stock.user.service.ITradeUserService;
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
@RestController
@RequestMapping("/user")
public class TradeStockUserController {
    @Autowired
    private ITradeUserService iTradeUserService;

    @PostMapping("/userLogin")
    public ApiRespResult<Object> userLogin(@RequestParam("userNo") String userNo, @RequestParam("userPwd") String userPwd) throws ComponentException {
        return ApiRespResult.success(iTradeUserService.userLogin(userNo, userPwd));
    }
}
