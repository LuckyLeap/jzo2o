package com.jzo2o.foundations.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jzo2o.foundations.model.domain.Serve;
import com.jzo2o.foundations.model.dto.response.ServeAggregationSimpleResDTO;
import com.jzo2o.foundations.model.dto.response.ServeAggregationTypeSimpleResDTO;
import com.jzo2o.foundations.model.dto.response.ServeCategoryResDTO;
import com.jzo2o.foundations.model.dto.response.ServeResDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Mapper 接口
 */
public interface ServeMapper extends BaseMapper<Serve> {
    /**
     * 根据区域查询服务列表
     * @param regionId 区域id
     */
    List<ServeResDTO> queryServeListByRegionId(@Param("regionId") Long regionId);

    /**
     * 根据区域id和上架状态查询服务数量
     * @param id 区域id
     * @param status 上架状态
     */
    int queryServeCountByRegionIdAndSaleStatus(Long id, int status);

    /**
     * 根据服务项id和上架状态查询服务数量
     * @param id 服务项id
     * @param status 上架状态
     */
    int queryServeCountByServeItemIdAndSaleStatus(Long id, int status);

    /**
     * 查询首页服务图标信息
     * @param regionId 区域id
     */
    List<ServeCategoryResDTO> findServeIconCategoryByRegionId(@Param("regionId") Long regionId);

    /**
     * 根据区域id获取服务列表
     * @param regionId 区域id
     */
    List<ServeAggregationTypeSimpleResDTO> queryServeTypeListByRegionIdCache(@Param("regionId") Long regionId);

    /**
     * 根据区域id获取热门服务列表
     * @param regionId 区域id
     */
    List<ServeAggregationSimpleResDTO> queryHotServeListByRegionIdCache(@Param("regionId") Long regionId);

    /**
     * 根据服务id查询服务详情
     * @param serveItemId 服务id
     */
    ServeAggregationSimpleResDTO queryServeDetailById(@Param("serveItemId") Long serveItemId);
}