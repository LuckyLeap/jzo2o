package com.jzo2o.foundations.controller.consumer;

import com.jzo2o.foundations.model.dto.response.ServeAggregationSimpleResDTO;
import com.jzo2o.foundations.model.dto.response.ServeAggregationTypeSimpleResDTO;
import com.jzo2o.foundations.model.dto.response.ServeCategoryResDTO;
import com.jzo2o.foundations.model.dto.response.ServeSimpleResDTO;
import com.jzo2o.foundations.service.HomeService;
import com.jzo2o.foundations.service.ServeAggregationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 前端控制器
 */
@Validated
@RestController("consumerServeController")
@RequestMapping("/customer/serve")
@Api(tags = "用户端 - 首页服务控制器")
public class FirstPageServeController {
    @Resource
    private HomeService homeService;
    @Resource
    private ServeAggregationService serveAggregationService;

    @GetMapping("/firstPageServeList")
    @ApiOperation("首页服务列表")
    @ApiImplicitParams({@ApiImplicitParam(name = "regionId", value = "区域id", required = true, dataTypeClass = Long.class)})
    public List<ServeCategoryResDTO> serveCategory(@RequestParam("regionId") Long regionId) {
        return homeService.queryServeIconCategoryByRegionIdCache(regionId);
    }

    @GetMapping("/serveTypeList")
    @ApiOperation("服务类型列表")
    @ApiImplicitParams({@ApiImplicitParam(name = "regionId", value = "区域id", required = true, dataTypeClass = Long.class)})
    public List<ServeAggregationTypeSimpleResDTO> serveTypeList(@RequestParam("regionId") Long regionId) {
        return homeService.queryServeTypeListByRegionIdCache(regionId);
    }

    @GetMapping("/hotServeList")
    @ApiOperation("热门服务列表")
    @ApiImplicitParams({@ApiImplicitParam(name = "regionId", value = "区域id", required = true, dataTypeClass = Long.class)})
    public List<ServeAggregationSimpleResDTO> hotServeList(@RequestParam("regionId") Long regionId) {
        return homeService.queryHotServeListByRegionIdCache(regionId);
    }

    @GetMapping("/{id}")
    @ApiOperation("服务详情")
    @ApiImplicitParams({@ApiImplicitParam(name = "id", value = "服务id", required = true, dataTypeClass = Long.class)})
    public ServeAggregationSimpleResDTO serveDetail(@PathVariable("id") Long id) {
        return homeService.queryServeDetailById(id);
    }

    @GetMapping("/search")
    @ApiOperation("首页服务搜索")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "cityCode", value = "城市编码", required = true, dataTypeClass = String.class),
            @ApiImplicitParam(name = "serveTypeId", value = "服务类型id", dataTypeClass = Long.class),
            @ApiImplicitParam(name = "keyword", value = "关键词", dataTypeClass = String.class)
            })
    public List<ServeSimpleResDTO> findServeList(@RequestParam("cityCode") String cityCode,
                                                 @RequestParam(value = "serveTypeId", required = false) Long serveTypeId,
                                                 @RequestParam(value = "keyword", required = false) String keyword) {
        return serveAggregationService.findServeList(cityCode, serveTypeId, keyword);
    }
}