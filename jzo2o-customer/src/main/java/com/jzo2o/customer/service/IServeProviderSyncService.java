package com.jzo2o.customer.service;

import com.jzo2o.customer.model.domain.ServeProviderSync;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 评分同步列表 服务类
 */
public interface IServeProviderSyncService extends IService<ServeProviderSync> {

    int add(Long id, Integer serveProviderType);

    /**
     * 更新评分
     * @param id 服务人员/机构id
     * @param evaluationScore 评分
     */
    void updateScore(Long id, Double evaluationScore);

}