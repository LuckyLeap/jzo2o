package com.jzo2o.api.foundations;

import com.jzo2o.api.foundations.dto.response.ServeAggregationResDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 服务API
 */
@FeignClient(contextId = "jzo2o-foundations", value = "jzo2o-foundations", path = "/foundations/inner/serve")
public interface ServeApi {

    /**
     * 根据ID获取服务详情
     */
    @GetMapping("/{id}")
    ServeAggregationResDTO findById(@PathVariable("id") Long id);

}