package com.trade.stock.auth.component;

import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
@Component
public class JwtTokenEnhancer implements TokenEnhancer {
    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken token, OAuth2Authentication auth) {
        Map<String, Object> info = new HashMap<>();
        info.put("jwt-ext", "jwt enhancer information");
        info.put("active", true);
        ((DefaultOAuth2AccessToken) token).setAdditionalInformation(info);
        return token;
    }
}
