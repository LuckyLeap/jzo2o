package com.jzo2o.foundations.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jzo2o.common.model.PageResult;
import com.jzo2o.foundations.model.domain.Serve;
import com.jzo2o.foundations.model.dto.request.ServePageQueryReqDTO;
import com.jzo2o.foundations.model.dto.request.ServeUpsertReqDTO;
import com.jzo2o.foundations.model.dto.response.ServeResDTO;

import java.math.BigDecimal;
import java.util.List;

/**
 * 服务类
 */
public interface IServeService extends IService<Serve> {
    /**
     * 查询区域服务信息并进行缓存
     * @param id 对应serve表的主键
     * @return 区域服务信息
     */
    Serve queryServeByIdCache(Long id);

    /**
     * 分页查询服务列表
     * @param servePageQueryReqDTO 查询条件
     * @return 分页结果
     */
    PageResult<ServeResDTO> page(ServePageQueryReqDTO servePageQueryReqDTO);

    /**
     * 批量新增
     * @param serveUpsertReqDTOList 批量新增数据
     */
    void batchAdd(List<ServeUpsertReqDTO> serveUpsertReqDTOList);

    /**
     * 服务价格修改
     * @param id    服务id
     * @param price 价格
     * @return 服务
     */
    Serve update(Long id, BigDecimal price);

    /**
     * 上架
     * @param id 服务id
     */
    Serve onSale(Long id);

    /**
     * 删除
     * @param id    服务id
     */
    void delete(Long id);

    /**
     * 下架
     * @param id 服务id
     */
    Serve offSale(Long id);

    /**
     * 添加热门服务
     * @param id 服务id
     */
    void onHot(Long id);

    /**
     * 取消热门服务
     * @param id 服务id
     */
    void offHot(Long id);

    /**
     * 根据区域id和上架状态查询服务数量
     * @param id 区域id
     * @param status 上架状态
     * @return 服务数量
     */
    int queryServeCountByRegionIdAndSaleStatus(Long id, int status);

    /**
     * 根据服务项id和上架状态查询服务数量
     * @param id 服务项id
     * @param status 上架状态
     * @return 服务数量
     */
    int queryServeCountByServeItemIdAndSaleStatus(Long id, int status);
}