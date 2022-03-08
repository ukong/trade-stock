package com.trade.stock.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.trade.stock.auth.bo.TradeUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
@Mapper
public interface TradeUserMapper extends BaseMapper<TradeUser> {
}
