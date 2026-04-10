package com.jzo2o.common.expcetions;

import static com.jzo2o.common.constants.ErrorInfo.Msg.PROCESS_FAILD;

/**
 * 服务器异常
 */
public class ServerErrorException extends CommonException {

    public ServerErrorException() {
        this(PROCESS_FAILD);
    }

    private static final int HTTP_500 = 500;

    public ServerErrorException(String message) {
        super(HTTP_500, message);
    }

    public ServerErrorException(Throwable throwable, String message) {
        super(throwable, HTTP_500, message);
    }

    public ServerErrorException(Throwable throwable) {
        super(throwable, HTTP_500, PROCESS_FAILD);
    }

}