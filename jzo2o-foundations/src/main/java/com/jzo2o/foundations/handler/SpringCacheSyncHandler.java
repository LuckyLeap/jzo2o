package com.jzo2o.foundations.handler;

import com.jzo2o.api.foundations.dto.response.RegionSimpleResDTO;
import com.jzo2o.foundations.constants.RedisConstants;
import com.jzo2o.foundations.service.HomeService;
import com.jzo2o.foundations.service.IRegionService;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * springCache缓存同步任务
 **/
@Slf4j
@Component
public class SpringCacheSyncHandler {

    @Resource
    private IRegionService regionService;
    @Resource
    private RedisTemplate<String, Object> redisTemplate;
    @Resource
    private HomeService homeService;

    /**
     * 已启用区域缓存更新
     * 每日凌晨1点执行
     */
    @XxlJob("activeRegionCacheSync")
    public void activeRegionCacheSync() throws Exception {
        log.info(">>>>>>>>开始进行缓存同步，更新已启用区域");

        //删除已启用区域列表缓存
        redisTemplate.delete(RedisConstants.CacheName.JZ_CACHE + "::ACTIVE_REGIONS");

        //查询开通区域列表
        List<RegionSimpleResDTO> regionSimpleResDTOS = regionService.queryActiveRegionList();
        if (regionSimpleResDTOS == null || regionSimpleResDTOS.isEmpty()) {
            log.warn(">>>>>>>>未查询到已启用区域，跳过缓存同步");
            return;
        }

        log.info(">>>>>>>>共需处理{}个区域的缓存", regionSimpleResDTOS.size());

        //遍历区域，刷新该区域下的缓存
        for (RegionSimpleResDTO item : regionSimpleResDTOS) {
            try {
                Long regionId = item.getId();
                
                //先加载新缓存，再删除旧缓存（先建后删）
                homeService.queryServeIconCategoryByRegionIdCache(regionId);
                redisTemplate.delete(RedisConstants.CacheName.SERVE_ICON + "::" + regionId);

                homeService.queryServeTypeListByRegionIdCache(regionId);
                redisTemplate.delete(RedisConstants.CacheName.SERVE_TYPE + "::" + regionId);

                homeService.queryHotServeListByRegionIdCache(regionId);
                redisTemplate.delete(RedisConstants.CacheName.HOT_SERVE + "::" + regionId);
            } catch (Exception e) {
                log.error(">>>>>>>>区域[{}]缓存刷新失败，继续处理其他区域", item.getId(), e);
            }
        }

        log.info(">>>>>>>>更新已启用区域完成，共处理{}个区域", regionSimpleResDTOS.size());
    }

}