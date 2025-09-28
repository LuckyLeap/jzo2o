package com.jzo2o.redis.handler;

import com.jzo2o.redis.model.SyncMessage;

import java.util.List;

public interface SyncProcessHandler<T> {
    /**
     * 批量处理同步队列中的数据
     */
    void batchProcess(List<SyncMessage<T>> multiData);

    /**
     * 单一处理数据
     */
    void singleProcess(SyncMessage<T> singleData);
}