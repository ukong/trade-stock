package com.trade.stock.user.service;

import com.trade.stock.common.exception.ComponentException;
import com.trade.stock.user.bo.TradeUser;

/**
 * @author YueLiMin
 * @version 1.0.0
 * @since 11
 */
public interface ITradeUserService {
    TradeUser userLogin(String userNo, String userPwd) throws ComponentException;
}
