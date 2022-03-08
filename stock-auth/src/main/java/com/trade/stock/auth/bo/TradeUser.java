package com.trade.stock.auth.bo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName(value = "t_trade_user")
public class TradeUser implements Serializable {
    private static final long serialVersionUID = -1936101702873485926L;

    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

    /**
     * 用户编号
     */
    private String userNo;

    /**
     * 用户名称
     */
    private String name;

    /**
     * 用户密码
     */
    private String userPwd;

    /**
     * 电话号码
     */
    private String phone;

    /**
     * 公司ID
     */
    private Long companyId;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 地址
     */
    private String address;

    /**
     * 最近一次用户登陆IP
     */
    private String lastLoginIp;

    /**
     * 状态(0: 有效, 1: 锁定, 2: 禁用）
     */
    private int status;

    /**
     * 最近一次登陆时间
     */
    private LocalDateTime lastLoginTime;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

}
