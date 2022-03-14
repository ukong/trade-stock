package com.trade.stock.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.trade.stock.common.exception.ComponentException;
import com.trade.stock.common.exception.enums.ApplicationErrorCodeEnum;
import com.trade.stock.user.bo.TradeUser;
import com.trade.stock.user.mapper.TradeUserMapper;
import com.trade.stock.user.service.ITradeUserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * @author YueLiMin
 * @version 1.0.0
 * @since 11
 */
@Log4j2
@Service
public class ITradeUserServiceImpl implements ITradeUserService {
    @Autowired
    private TradeUserMapper tradeUserMapper;

    @Override
    public TradeUser userLogin(String userNo, String userPwd) throws ComponentException {
        TradeUser tradeUser = tradeUserMapper.selectOne(new LambdaQueryWrapper<TradeUser>().eq(TradeUser::getUserNo, userNo));
        if (tradeUser != null) {
            // 用户密码加密判断
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            boolean matches = bCryptPasswordEncoder.matches(userPwd, tradeUser.getUserPwd());

            if (!matches) {
                log.error(ApplicationErrorCodeEnum.USER_PWD_ERROR);
                throw new ComponentException(ApplicationErrorCodeEnum.USER_PWD_ERROR);
            }

            return tradeUser;
        }

        throw new ComponentException(ApplicationErrorCodeEnum.USER_NOT_FOUND);
    }
}
