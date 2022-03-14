package com.trade.stock.gateway.filter;

import io.netty.util.internal.StringUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * @author YueLiMin
 * @version 1.0.0
 * @since 11
 */
@Component
@Log4j2
public class RequestGlobalFilter implements GlobalFilter, Ordered {

    /**
     * 通过filter来自定义配置转发信息
     *
     * @param exchange
     * @param chain
     * @return
     */
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String authentication = exchange.getRequest().getHeaders().getFirst("Authorization");
        if (!StringUtil.isNullOrEmpty(authentication)) {
            log.info("enter RequestGlobalFilter filter method: " + authentication);
            exchange.getRequest().mutate().header("Authorization", authentication);
        }

        return chain.filter(exchange.mutate().build());
    }

    @Override
    public int getOrder() {
        return -1000;
    }
}
