package com.jzo2o.orders.manager.service.impl.client;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.jzo2o.api.foundations.ServeApi;
import com.jzo2o.api.foundations.dto.response.ServeAggregationResDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
@Slf4j
public class ServeClient {
    @Resource
    private ServeApi serveApi;

    /**
     * value:资源名称，用于在Sentinel中进行标识
     * fallback:降级回调方法
     * blockHandler:流控回调方法
     */
    @SentinelResource(value = "getServeDetail", fallback = "findByIdFallback", blockHandler = "findByIdBlockHandler")
    public ServeAggregationResDTO findById(Long id) {
        return serveApi.findById(id);
    }

    //当findById方法执行异常时，会调用此方法
    public ServeAggregationResDTO findByIdFallback(Long id, Throwable throwable) {
        log.error("非熔断、限流等异常时执行的降级方法, id:{}", id, throwable);
        return null;
    }

    //当findById方法发生熔断、限流时，会调用此方法
    public ServeAggregationResDTO findByIdBlockHandler(Long id, BlockException blockException) {
        log.error("触发熔断、限流异常时执行的流控方法, id:{}", id, blockException);
        return null;
    }
}