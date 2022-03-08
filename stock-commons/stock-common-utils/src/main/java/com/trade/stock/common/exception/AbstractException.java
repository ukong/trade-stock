package com.trade.stock.common.exception;

import java.io.Serializable;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
public abstract class AbstractException extends Exception implements Serializable {

    private static final long serialVersionUID = 6747287861704285936L;

    public AbstractException(String message) {
        super(message);
    }
}
