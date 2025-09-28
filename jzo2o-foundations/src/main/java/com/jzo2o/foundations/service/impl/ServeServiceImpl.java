package com.jzo2o.foundations.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jzo2o.api.foundations.dto.response.ServeItemResDTO;
import com.jzo2o.common.expcetions.CommonException;
import com.jzo2o.common.expcetions.ForbiddenOperationException;
import com.jzo2o.common.model.PageResult;
import com.jzo2o.foundations.enums.FoundationStatusEnum;
import com.jzo2o.foundations.mapper.RegionMapper;
import com.jzo2o.foundations.mapper.ServeItemMapper;
import com.jzo2o.foundations.mapper.ServeMapper;
import com.jzo2o.foundations.model.domain.Region;
import com.jzo2o.foundations.model.domain.Serve;
import com.jzo2o.foundations.model.domain.ServeItem;
import com.jzo2o.foundations.model.dto.request.ServePageQueryReqDTO;
import com.jzo2o.foundations.model.dto.request.ServeUpsertReqDTO;
import com.jzo2o.foundations.model.dto.response.ServeResDTO;
import com.jzo2o.foundations.service.IServeService;
import com.jzo2o.mysql.utils.PageHelperUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 服务实现类
 */
@Service
public class ServeServiceImpl extends ServiceImpl<ServeMapper, Serve> implements IServeService {
    @Autowired
    private ServeItemMapper serveItemMapper;

    @Autowired
    private RegionMapper regionMapper;

    /**
     * 分页查询
     * @param servePageQueryReqDTO 查询条件
     * @return 分页结果
     */
    @Override
    public PageResult<ServeResDTO> page(ServePageQueryReqDTO servePageQueryReqDTO) {
        return PageHelperUtils.selectPage(servePageQueryReqDTO, () -> baseMapper.queryServeListByRegionId(servePageQueryReqDTO.getRegionId()));
    }

    @Override
    @Transactional
    public void batchAdd(List<ServeUpsertReqDTO> serveUpsertReqDTOList) {
        // 批量新增数据为空
        if (serveUpsertReqDTOList == null || serveUpsertReqDTOList.isEmpty()) {
            return;
        }

        // 批量获取服务项信息
        List<Long> serveItemIds = serveUpsertReqDTOList.stream()
                .map(ServeUpsertReqDTO::getServeItemId)
                .distinct()
                .toList();
        List<ServeItem> serveItems = serveItemMapper.selectBatchIds(serveItemIds);
        Map<Long, ServeItem> serveItemMap = serveItems.stream()
                .filter(item -> item.getActiveStatus() == FoundationStatusEnum.ENABLE.getStatus())
                .collect(Collectors.toMap(ServeItem::getId, item -> item));

        // 批量获取区域信息
        List<Long> regionIds = serveUpsertReqDTOList.stream()
                .map(ServeUpsertReqDTO::getRegionId)
                .distinct()
                .toList();
        List<Region> regions = regionMapper.selectBatchIds(regionIds);
        Map<Long, Region> regionMap = regions.stream()
                .collect(Collectors.toMap(Region::getId, region -> region));

        // 校验并准备插入数据
        List<Serve> serveList = new ArrayList<>();
        for (ServeUpsertReqDTO serveUpsertReqDTO : serveUpsertReqDTOList) {
            // 校验服务项是否为启用状态
            ServeItem serveItem = serveItemMap.get(serveUpsertReqDTO.getServeItemId());
            if (ObjectUtil.isNull(serveItem)) {
                throw new ForbiddenOperationException("该服务未启用无法添加到区域下使用");
            }

            // 校验是否重复新增
            int count = Math.toIntExact(lambdaQuery()
                    .eq(Serve::getRegionId, serveUpsertReqDTO.getRegionId())
                    .eq(Serve::getServeItemId, serveUpsertReqDTO.getServeItemId())
                    .count());
            if (count > 0) {
                throw new ForbiddenOperationException(serveItem.getName() + "服务已存在");
            }

            // 准备新增服务
            Serve serve = BeanUtil.toBean(serveUpsertReqDTO, Serve.class);
            Region region = regionMap.get(serveUpsertReqDTO.getRegionId());
            if (region != null) {
                serve.setCityCode(region.getCityCode());
            }
            serveList.add(serve);
        }

        // 批量插入
        if (!serveList.isEmpty()) {
            saveBatch(serveList);
        }
    }

    @Override
    @Transactional
    public Serve update(Long id, BigDecimal price) {
        //1.更新服务价格
        boolean update = lambdaUpdate()
                .eq(Serve::getId, id)
                .set(Serve::getPrice, price)
                .update();
        if (!update) {
            throw new CommonException("修改服务价格失败");
        }
        return baseMapper.selectById(id);
    }

    @Override
    @Transactional
    public void onSale(Long id) {
        Serve serve = baseMapper.selectById(id);
        if (ObjectUtil.isNull(serve)) {
            throw new ForbiddenOperationException("区域服务不存在");
        }
        // 上架状态
        Integer saleStatus = serve.getSaleStatus();
        // 草稿或下架状态方可上架
        if (!(saleStatus == FoundationStatusEnum.INIT.getStatus() || saleStatus == FoundationStatusEnum.DISABLE.getStatus())) {
            throw new ForbiddenOperationException("草稿或下架状态方可上架");
        }

        // 校验服务项是否为启用状态
        validateServeItem(serve.getServeItemId());

        // 更新上架状态
        boolean update = lambdaUpdate()
                .eq(Serve::getId, id)
                .set(Serve::getSaleStatus, FoundationStatusEnum.ENABLE.getStatus())
                .update();
        if (!update) {
            throw new CommonException("启动服务失败");
        }
    }

    @Override
    @Transactional
    public void offSale(Long id) {
        Serve serve = baseMapper.selectById(id);
        if (ObjectUtil.isNull(serve)) {
            throw new ForbiddenOperationException("区域服务不存在");
        }
        // 上架状态
        Integer saleStatus = serve.getSaleStatus();
        if (!(saleStatus == FoundationStatusEnum.ENABLE.getStatus())) {
            throw new ForbiddenOperationException("售卖状态为草稿/下架，无需操作");
        }

        // 更新下架状态
        boolean update = lambdaUpdate()
                .eq(Serve::getId, id)
                .set(Serve::getSaleStatus, FoundationStatusEnum.DISABLE.getStatus())
                .update();
        if (!update) {
            throw new CommonException("下架服务失败");
        }
    }

    @Override
    @Transactional
    public void delete(Long id) {
        Serve serve = baseMapper.selectById(id);
        if (ObjectUtil.isNull(serve)) {
            throw new ForbiddenOperationException("区域服务不存在");
        }

        // 校验服务项是否为启用状态，不是启用状态不能删除
        ServeItem serveItem = serveItemMapper.selectById(serve.getServeItemId());
        // 如果服务项信息不存在或未启用
        if (ObjectUtil.isNull(serveItem) || serveItem.getActiveStatus() != FoundationStatusEnum.ENABLE.getStatus()) {
            throw new ForbiddenOperationException("该服务未启用无法添加到区域下使用");
        }

        // 如果区域服务saleStatus = 2 【上架】，则不能删除
        if (serve.getSaleStatus() == FoundationStatusEnum.ENABLE.getStatus()) {
            throw new ForbiddenOperationException("区域服务已上架，不能删除");
        }
        boolean delete = baseMapper.deleteById(id) > 0;
        if (!delete) {
            throw new CommonException("删除服务失败");
        }
    }

    @Override
    @Transactional
    public void onHot(Long id) {
        Serve serve = baseMapper.selectById(id);
        if (ObjectUtil.isNull(serve)) {
            throw new ForbiddenOperationException("区域服务不存在");
        }
        // 上架状态
        Integer saleStatus = serve.getSaleStatus();
        // 上架状态方可设置热门开发
        if (!(saleStatus == FoundationStatusEnum.ENABLE.getStatus())) {
            throw new ForbiddenOperationException("上架状态方可设置热门开发");
        }

        // 校验服务项是否为启用状态
        validateServeItem(serve.getServeItemId());

        // 更新设置热门开发
        boolean update = lambdaUpdate()
                .eq(Serve::getId, id)
                .set(Serve::getIsHot, 1)
                .update();
        if (!update) {
            throw new CommonException("设置热门服务失败");
        }
    }

    @Override
    @Transactional
    public void offHot(Long id) {
        Serve serve = baseMapper.selectById(id);
        if (ObjectUtil.isNull(serve)) {
            throw new ForbiddenOperationException("区域服务不存在");
        }
        // 热门状态
        Integer isHot = serve.getIsHot();
        // 热门开发状态方可取消
        if (!(isHot == 1)) {
            throw new ForbiddenOperationException("已取消热门状态，请勿重试");
        }

        boolean update = lambdaUpdate()
                .eq(Serve::getId, id)
                .set(Serve::getIsHot, 0)
                .update();
        if (!update) {
            throw new CommonException("取消热门服务失败");
        }
    }

    @Override
    public int queryServeCountByRegionIdAndSaleStatus(Long id, int status){
        //校验id 和 status
        if (ObjectUtil.isNull(id) || ObjectUtil.isNull(status)) {
            throw new ForbiddenOperationException("参数错误");
        }
        return baseMapper.queryServeCountByRegionIdAndSaleStatus(id, status);
    }

    @Override
    public int queryServeCountByServeItemIdAndSaleStatus(Long id, int status) {
        //校验id 和 status
        if (ObjectUtil.isNull(id) || ObjectUtil.isNull(status)) {
            throw new ForbiddenOperationException("参数错误");
        }
        return baseMapper.queryServeCountByServeItemIdAndSaleStatus(id, status);
    }

    /**
     * 校验服务项是否启用
     * @param serveItemId 服务项ID
     */
    private void validateServeItem(Long serveItemId) {
        ServeItem serveItem = serveItemMapper.selectById(serveItemId);
        if (ObjectUtil.isNull(serveItem)) {
            throw new ForbiddenOperationException("所属服务项不存在");
        }
        // 服务项的启用状态
        Integer activeStatus = serveItem.getActiveStatus();
        // 服务项为启用状态方可操作
        if (!(FoundationStatusEnum.ENABLE.getStatus() == activeStatus)) {
            throw new ForbiddenOperationException("服务项为启用状态方可上架");
        }
    }
}