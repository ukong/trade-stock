package com.trade.stock.auth.oauth;

import com.trade.stock.auth.bo.TradeUser;
import org.springframework.security.core.userdetails.User;

import java.io.Serializable;
import java.util.Collections;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
public class OAuth2TradeUser extends User implements Serializable {
    private static final long serialVersionUID = -3069191847873945795L;

    public OAuth2TradeUser(TradeUser tradeUser) {
        // oauth2 认证用户信息构造处理
        // todo 完成用户权限获取
        super(tradeUser.getUserNo(), tradeUser.getUserPwd(), tradeUser.getStatus() == 0, true, true, tradeUser.getStatus() == 0, Collections.emptyList());
    }
}
