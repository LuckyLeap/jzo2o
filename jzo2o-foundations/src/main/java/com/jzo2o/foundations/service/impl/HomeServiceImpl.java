package com.jzo2o.foundations.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.jzo2o.foundations.constants.RedisConstants;
import com.jzo2o.foundations.enums.FoundationStatusEnum;
import com.jzo2o.foundations.mapper.ServeMapper;
import com.jzo2o.foundations.model.domain.Region;
import com.jzo2o.foundations.model.dto.response.ServeAggregationSimpleResDTO;
import com.jzo2o.foundations.model.dto.response.ServeAggregationTypeSimpleResDTO;
import com.jzo2o.foundations.model.dto.response.ServeCategoryResDTO;
import com.jzo2o.foundations.model.dto.response.ServeSimpleResDTO;
import com.jzo2o.foundations.service.HomeService;
import com.jzo2o.foundations.service.IRegionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 首页查询相关功能
 **/
@Slf4j
@Service
public class HomeServiceImpl implements HomeService {
    @Resource
    private ServeMapper serveMapper;

    @Resource
    private IRegionService regionService;

    /**
     * 根据区域id获取服务图标信息
     * @param regionId 区域id
     * @return (2个一级服务分类 ， 每个服务分类下查询4个服务项)
     */
    @Caching(
            cacheable = {
                    //result为null时,属于缓存穿透情况，缓存时间30分钟
                    @Cacheable(value = RedisConstants.CacheName.SERVE_ICON, key = "#regionId", unless = "#result.size() != 0", cacheManager = RedisConstants.CacheManager.THIRTY_MINUTES),
                    //result不为null时,永久缓存
                    @Cacheable(value = RedisConstants.CacheName.SERVE_ICON, key = "#regionId", unless = "#result.size() == 0", cacheManager = RedisConstants.CacheManager.FOREVER)
            }
    )
    @Override
    public List<ServeCategoryResDTO> queryServeIconCategoryByRegionIdCache(Long regionId) {
        //1.校验当前城市是否为启用状态
        Region region = regionService.getById(regionId);
        if (ObjectUtil.isEmpty(region) || ObjectUtil.equal(FoundationStatusEnum.DISABLE.getStatus(), region.getActiveStatus())) {
            return Collections.emptyList();
        }

        //2.根据城市编码查询所有的服务图标
        List<ServeCategoryResDTO> list = serveMapper.findServeIconCategoryByRegionId(regionId);
        if (ObjectUtil.isEmpty(list)) {
            return Collections.emptyList();
        }

        //3.服务类型取前两个，每个类型下服务项取前4个
        //list的截止下标
        int endIndex = Math.min(list.size(), 2);
        List<ServeCategoryResDTO> serveCategoryResDTOS = new ArrayList<>(list.subList(0, endIndex));
        serveCategoryResDTOS.forEach(v -> {
            List<ServeSimpleResDTO> serveResDTOList = v.getServeResDTOList();
            //serveResDTOList的截止下标
            int endIndex2 = Math.min(serveResDTOList.size(), 4);
            List<ServeSimpleResDTO> serveSimpleResDTOS = new ArrayList<>(serveResDTOList.subList(0, endIndex2));
            v.setServeResDTOList(serveSimpleResDTOS);
        });

        return serveCategoryResDTOS;
    }

    /**
     * 根据区域id获取服务列表
     * 如果缓存没有则查询数据库并缓存，如果缓存有则直接返回
     * @param regionId 区域id
     * @return 服务列表
     */
    @Cacheable(value = RedisConstants.CacheName.SERVE_TYPE, key = "#regionId", 
               unless = "#result == null || #result.isEmpty()", 
               cacheManager = RedisConstants.CacheManager.THIRTY_MINUTES)
    public List<ServeAggregationTypeSimpleResDTO> queryServeTypeListByRegionIdCache(Long regionId) {
        return serveMapper.queryServeTypeListByRegionIdCache(regionId);
    }

    /**
     * 根据区域id获取热门服务列表
     * 查询热门服务列表，如果缓存没有则查询数据库并缓存，如果缓存有则直接返回
     * @param regionId 区域id
     * @return 热门服务列表
     */
    @Caching(
            cacheable = {
                    @Cacheable(value = RedisConstants.CacheName.HOT_SERVE, key = "#regionId", unless = "#result.size() != 0", cacheManager = RedisConstants.CacheManager.THIRTY_MINUTES),
                    @Cacheable(value = RedisConstants.CacheName.HOT_SERVE, key = "#regionId", unless = "#result.size() == 0", cacheManager = RedisConstants.CacheManager.FOREVER)
            }
    )
    @Override
    public List<ServeAggregationSimpleResDTO> queryHotServeListByRegionIdCache(Long regionId) {
        Region region = regionService.getById(regionId);
        if (ObjectUtil.isEmpty(region) || ObjectUtil.equal(FoundationStatusEnum.DISABLE.getStatus(), region.getActiveStatus())) {
            return Collections.emptyList();
        }

        return serveMapper.queryHotServeListByRegionIdCache(regionId);
    }

    /**
     * 根据服务id查询服务详情
     * @param id 服务id
     * @return 服务详情
     */
    @Override
    public ServeAggregationSimpleResDTO queryServeDetailById(Long serveItemId) {
        return serveMapper.queryServeDetailById(serveItemId);
    }
}