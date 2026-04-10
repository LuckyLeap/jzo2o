package com.jzo2o.foundations.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jzo2o.common.expcetions.CommonException;
import com.jzo2o.common.expcetions.ForbiddenOperationException;
import com.jzo2o.common.model.PageResult;
import com.jzo2o.foundations.constants.RedisConstants;
import com.jzo2o.foundations.enums.FoundationStatusEnum;
import com.jzo2o.foundations.mapper.*;
import com.jzo2o.foundations.model.domain.*;
import com.jzo2o.foundations.model.dto.request.ServePageQueryReqDTO;
import com.jzo2o.foundations.model.dto.request.ServeUpsertReqDTO;
import com.jzo2o.foundations.model.dto.response.ServeResDTO;
import com.jzo2o.foundations.service.IServeService;
import com.jzo2o.mysql.utils.PageHelperUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
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

    @Autowired
    private ServeTypeMapper serveTypeMapper;

    @Autowired
    private ServeSyncMapper serveSyncMapper;

    /**
     * 查询区域服务信息并进行缓存
     * @param id 对应serve表的主键
     * @return 区域服务信息
     */
    //    @Cacheable(value = "JZ_CACHE:SERVE_RECORD",key = "#id")
    @Cacheable(value = RedisConstants.CacheName.SERVE, key = "#id", cacheManager = RedisConstants.CacheManager.ONE_DAY)
    public Serve queryServeByIdCache(Long id) {
        return getById(id);
    }

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
    @CachePut(value = RedisConstants.CacheName.SERVE, key = "#id",  cacheManager = RedisConstants.CacheManager.ONE_DAY)
    @Transactional
    public Serve onSale(Long id){
        Serve serve = baseMapper.selectById(id);
        if(ObjectUtil.isNull(serve)){
            throw new ForbiddenOperationException("区域服务不存在");
        }
        //上架状态
        Integer saleStatus = serve.getSaleStatus();
        //草稿或下架状态方可上架
        if (!(saleStatus==FoundationStatusEnum.INIT.getStatus() || saleStatus==FoundationStatusEnum.DISABLE.getStatus())) {
            throw new ForbiddenOperationException("草稿或下架状态方可上架");
        }
        //服务项id
        Long serveItemId = serve.getServeItemId();
        ServeItem serveItem = serveItemMapper.selectById(serveItemId);
        if(ObjectUtil.isNull(serveItem)){
            throw new ForbiddenOperationException("所属服务项不存在");
        }
        //服务项的启用状态
        Integer activeStatus = serveItem.getActiveStatus();
        //服务项为启用状态方可上架
        if (!(FoundationStatusEnum.ENABLE.getStatus()==activeStatus)) {
            throw new ForbiddenOperationException("服务项为启用状态方可上架");
        }

        //更新上架状态
        LambdaUpdateWrapper<Serve> updateWrapper = Wrappers.<Serve>lambdaUpdate()
                .eq(Serve::getId, id)
                .set(Serve::getSaleStatus, FoundationStatusEnum.ENABLE.getStatus());
        update(updateWrapper);

        //向serve_sync表写记录
        addServeSync(id);

        return baseMapper.selectById(id);
    }

    @Override
    @CacheEvict(value = RedisConstants.CacheName.SERVE, key = "#id")
    @Transactional
    public Serve offSale(Long id){
        Serve serve = baseMapper.selectById(id);
        if(ObjectUtil.isNull(serve)){
            throw new ForbiddenOperationException("区域服务不存在");
        }
        //上架状态
        Integer saleStatus = serve.getSaleStatus();
        //上架状态方可下架
        if (!(saleStatus==FoundationStatusEnum.ENABLE.getStatus())) {
            throw new ForbiddenOperationException("上架状态方可下架");
        }
        //更新下架状态
        LambdaUpdateWrapper<Serve> updateWrapper = Wrappers.<Serve>lambdaUpdate()
                .eq(Serve::getId, id)
                .set(Serve::getSaleStatus, FoundationStatusEnum.DISABLE.getStatus());
        update(updateWrapper);

        //删除serve_sync表的记录
        serveSyncMapper.deleteById(id);

        return baseMapper.selectById(id);
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
    @SuppressWarnings("DuplicatedCode")
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

    /**
     * 新增服务同步数据
     * @param serveId 服务id
     */
    private void addServeSync(Long serveId) {
        //服务信息
        Serve serve = baseMapper.selectById(serveId);
        //区域信息
        Region region = regionMapper.selectById(serve.getRegionId());
        //服务项信息
        ServeItem serveItem = serveItemMapper.selectById(serve.getServeItemId());
        //服务类型
        ServeType serveType = serveTypeMapper.selectById(serveItem.getServeTypeId());

        ServeSync serveSync = new ServeSync();
        serveSync.setServeTypeId(serveType.getId());
        serveSync.setServeTypeName(serveType.getName());
        serveSync.setServeTypeIcon(serveType.getServeTypeIcon());
        serveSync.setServeTypeImg(serveType.getImg());
        serveSync.setServeTypeSortNum(serveType.getSortNum());

        serveSync.setServeItemId(serveItem.getId());
        serveSync.setServeItemIcon(serveItem.getServeItemIcon());
        serveSync.setServeItemName(serveItem.getName());
        serveSync.setServeItemImg(serveItem.getImg());
        serveSync.setServeItemSortNum(serveItem.getSortNum());
        serveSync.setUnit(serveItem.getUnit());
        serveSync.setDetailImg(serveItem.getDetailImg());
        serveSync.setPrice(serve.getPrice());

        serveSync.setCityCode(region.getCityCode());
        serveSync.setId(serve.getId());
        serveSync.setIsHot(serve.getIsHot());
        serveSyncMapper.insert(serveSync);
    }
}