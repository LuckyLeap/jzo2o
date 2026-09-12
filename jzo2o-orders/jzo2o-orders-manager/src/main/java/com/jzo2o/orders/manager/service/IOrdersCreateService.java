package com.jzo2o.orders.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jzo2o.orders.base.model.domain.Orders;
import com.jzo2o.orders.manager.model.dto.request.PlaceOrderReqDTO;
import com.jzo2o.orders.manager.model.dto.response.PlaceOrderResDTO;

/**
 * 下单服务类
 */
public interface IOrdersCreateService extends IService<Orders> {
    /**
     * 下单
     * @param placeOrderReqDTO 下单请求参数
     * @return 下单结果
     */
    PlaceOrderResDTO placeOrder(PlaceOrderReqDTO placeOrderReqDTO);
}