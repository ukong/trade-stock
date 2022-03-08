package com.trade.stock.auth.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
@Configuration
public class JwtTokenConfig {
    @Bean
    public TokenStore jwtTokenStore() {
        return new JwtTokenStore(jwtAccessTokenConverter());
    }

    @Bean
    public JwtAccessTokenConverter jwtAccessTokenConverter() {
        /**
         * JwtAccessTokenConverter是为了做 JWT 数据转换, 这样做是因为 JWT 有自身独特的数据格式.
         */
        JwtAccessTokenConverter accessTokenConverter = new JwtAccessTokenConverter();
        // 配置JWT使用的秘钥
        accessTokenConverter.setSigningKey("trade_stock");
        return accessTokenConverter;
    }
}
