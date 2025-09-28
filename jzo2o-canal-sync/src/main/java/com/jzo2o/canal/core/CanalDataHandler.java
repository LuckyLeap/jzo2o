package com.jzo2o.canal.core;

import java.util.List;

public interface CanalDataHandler<T> {

    /**
     * 批量保存
     */
    void batchSave(List<T> data);

    /**
     * 批量删除
     */
    void batchDelete(List<Long> ids);
}