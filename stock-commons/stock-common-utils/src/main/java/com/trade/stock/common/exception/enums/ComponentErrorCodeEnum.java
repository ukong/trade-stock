package com.trade.stock.common.exception.enums;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
public enum ComponentErrorCodeEnum implements IErrorCodeEnum {
    /**
     * 组件错误状态码
     */
    COMPONENT_LOAD_PROPERTIES_OBJ_HAD_EXIST("0001", "配置文件加载类已经存在"),
    ;

    private String module;
    private String code;
    private String message;
    private WarningLevelEnum warningLevel;


    ComponentErrorCodeEnum(String code, String message, WarningLevelEnum warningLevelEnum) {
        this.code = code;
        this.message = message;
        this.warningLevel = warningLevelEnum;
    }

    ComponentErrorCodeEnum(String module, String code, String message, WarningLevelEnum warningLevelEnum) {
        this.module = module;
        this.code = code;
        this.message = message;
        this.warningLevel = warningLevelEnum;
    }

    ComponentErrorCodeEnum(String module, String code, String message) {
        this.module = module;
        this.code = code;
        this.message = message;
        this.warningLevel = WarningLevelEnum.COMMON;
        ;
    }

    ComponentErrorCodeEnum(String code, String message) {
        this.module = IErrorCodeEnum.MODULE_SYSTEM;
        this.code = code;
        this.message = message;
        this.warningLevel = WarningLevelEnum.COMMON;
    }

    @Override
    public String getCode() {
        return IErrorCodeEnum.MODULE_SYSTEM + this.code;
    }

    @Override
    public String getMessage() {
        return this.message;
    }

    @Override
    public WarningLevelEnum getLevel() {
        return warningLevel;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public WarningLevelEnum getWarningLevel() {
        return warningLevel;
    }

    public void setWarningLevel(WarningLevelEnum warningLevel) {
        this.warningLevel = warningLevel;
    }
}
