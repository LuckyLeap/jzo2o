package com.jzo2o.common.expcetions;

import static com.jzo2o.common.constants.ErrorInfo.Msg.PROCESS_FAILD;

public class DBException extends CommonException {
    private static final int HTTP_500 = 500;
    
    public DBException() {
        super(HTTP_500, PROCESS_FAILD);
    }

    public DBException( String message) {
        super(HTTP_500, message);
    }

    public DBException(Throwable throwable, String message) {
        super(throwable, HTTP_500, message);
    }

    public DBException(Throwable throwable) {
        super(throwable, HTTP_500, PROCESS_FAILD);
    }
}