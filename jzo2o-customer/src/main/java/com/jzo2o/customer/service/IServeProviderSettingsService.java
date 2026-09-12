package com.jzo2o.customer.service;

import com.jzo2o.customer.model.domain.ServeProviderSettings;
import com.jzo2o.customer.model.dto.request.ServePickUpReqDTO;
import com.jzo2o.customer.model.dto.request.ServeScopeSetReqDTO;
import com.jzo2o.customer.model.dto.response.ServeProviderSettingsGetResDTO;
import com.jzo2o.customer.model.dto.response.ServeSettingsStatusResDTO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * 服务人员/机构附属信息 服务类
 */
public interface IServeProviderSettingsService extends IService<ServeProviderSettings> {

    void add(Long id, Integer serveProviderType);

    /**
     * 设置服务范围
     * @param serveScopeSetReqDTO 服务范围设置请求
     */
    void setServeScope(ServeScopeSetReqDTO serveScopeSetReqDTO);

    /**
     * 获取服务范围
     * @return 服务范围设置响应
     */
    ServeProviderSettingsGetResDTO getServeScope();

    /**
     * 设置接单
     * @param servePickUpReqDTO 接单设置请求
     */
    void setPickUp(ServePickUpReqDTO servePickUpReqDTO);

    /**
     * 设置接单状态
     * @param id 服务人员/机构id
     * @param canPickUp 是否开启接单
     */
    void setPickUp(Long id, Integer canPickUp);

    /**
     * 获取设置状态
     * @return 设置状态响应
     */
    ServeSettingsStatusResDTO getSettingStatus();

    ServeProviderSettings findById(Long id);


    /**
     * 标记已设置服务技能
     * @param currentUserId 当前用户id
     */
    void setHaveSkill(Long currentUserId);


    /**
     * 批量获取服务人员或机构所在城市编码
     * @param serveProviderIds 服务人员或机构id列表
     * @return 服务人员或机构所在城市编码映射
     */
    Map<Long, String> findManyCityCodeOfServeProvider(List<Long> serveProviderIds);

}