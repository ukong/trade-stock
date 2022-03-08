package com.trade.stock.auth.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.trade.stock.auth.bo.TradeUser;
import com.trade.stock.auth.mapper.TradeUserMapper;
import com.trade.stock.auth.oauth.OAuth2TradeUser;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
@Log4j2
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private TradeUserMapper tradeUserMapper;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        TradeUser tradeUser = tradeUserMapper.selectOne(new LambdaQueryWrapper<TradeUser>().eq(TradeUser::getUserNo, s));

        if (tradeUser == null) {
            log.info("用户编号: {} 不存在", s);
            throw new UsernameNotFoundException("用户不存在");
        }

        return new OAuth2TradeUser(tradeUser);
    }
}
