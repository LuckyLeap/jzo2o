package com.jzo2o.orders.manager.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jzo2o.api.customer.dto.response.AddressBookResDTO;
import com.jzo2o.api.foundations.dto.response.ServeAggregationResDTO;
import com.jzo2o.common.expcetions.CommonException;
import com.jzo2o.common.utils.DateUtils;
import com.jzo2o.mvc.utils.UserContext;
import com.jzo2o.orders.base.constants.RedisConstants;
import com.jzo2o.orders.base.enums.OrderPayStatusEnum;
import com.jzo2o.orders.base.enums.OrderStatusEnum;
import com.jzo2o.orders.base.mapper.OrdersMapper;
import com.jzo2o.orders.base.model.domain.Orders;
import com.jzo2o.orders.manager.model.dto.request.PlaceOrderReqDTO;
import com.jzo2o.orders.manager.model.dto.response.PlaceOrderResDTO;
import com.jzo2o.orders.manager.service.IOrdersCreateService;
import com.jzo2o.orders.manager.service.impl.client.CustomerClient;
import com.jzo2o.orders.manager.service.impl.client.ServeClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 下单服务类
 */
@Slf4j
@Service
public class OrdersCreateServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements IOrdersCreateService {

    @Resource
    private CustomerClient customerClient;

    @Resource
    private RedisTemplate<String, Long> redisTemplate;

    @Resource
    private ServeClient serveClient;

    @Resource
    private OrdersCreateServiceImpl owner;

    @Override
    public PlaceOrderResDTO placeOrder(PlaceOrderReqDTO placeOrderReqDTO) {
        //调用jzo2o-customer服务，获取地址簿信息
        AddressBookResDTO addressBookResDTO = customerClient.getDetail(placeOrderReqDTO.getAddressBookId());

        //调用jzo2o-foundations服务，获取服务相关信息
        ServeAggregationResDTO serveAggregationResDTO = serveClient.findById(placeOrderReqDTO.getServeId());

        //组装Order信息
        Orders orders = new Orders();
        //生成订单号【2位年2位月2位日+13位序号（Redis INCR命令）】
        orders.setId(generateOrderId()); //订单id

        orders.setUserId(UserContext.currentUserId()); //下单人id
        orders.setServeTypeId(serveAggregationResDTO.getServeTypeId()); //服务类型id
        orders.setServeTypeName(serveAggregationResDTO.getServeTypeName()); //服务类型名称
        orders.setServeItemId(serveAggregationResDTO.getServeItemId()); //服务项目id
        orders.setServeItemName(serveAggregationResDTO.getServeItemName()); //服务项目名称
        orders.setServeItemImg(serveAggregationResDTO.getServeItemImg()); //服务项目图片
        orders.setUnit(serveAggregationResDTO.getUnit()); //单位
        orders.setServeId(placeOrderReqDTO.getServeId()); //服务id
        //订单状态为待支付
        orders.setOrdersStatus(OrderStatusEnum.NO_PAY.getStatus());
        //支付状态为未支付
        orders.setPayStatus(OrderPayStatusEnum.NO_PAY.getStatus());
        orders.setPrice(serveAggregationResDTO.getPrice()); //价格
        orders.setPurNum(placeOrderReqDTO.getPurNum()); //购买数量
        //计算订单总价
        orders.setTotalAmount(serveAggregationResDTO.getPrice().multiply(new BigDecimal(placeOrderReqDTO.getPurNum())));
        //优惠券金额
        orders.setDiscountAmount(BigDecimal.ZERO); //TODO 优惠券
        //实际支付金额
        orders.setRealPayAmount(orders.getTotalAmount().subtract(orders.getDiscountAmount()));
        orders.setCityCode(serveAggregationResDTO.getCityCode()); //城市代码
        //服务地址
        String serveAddress = addressBookResDTO.getProvince() + addressBookResDTO.getCity() + addressBookResDTO.getCounty() + addressBookResDTO.getAddress();
        orders.setServeAddress(serveAddress);
        orders.setContactsPhone(addressBookResDTO.getPhone()); //联系人电话
        orders.setContactsName(addressBookResDTO.getName()); //联系人名称
        orders.setServeStartTime(placeOrderReqDTO.getServeStartTime()); //服务开始时间
        orders.setLon(addressBookResDTO.getLon()); //经度
        orders.setLat(addressBookResDTO.getLat()); //纬度
        //排序字段【由服务开始时间转为的毫秒时间戳+订单后5位】
        orders.setSortBy(DateUtils.toEpochMilli(orders.getServeStartTime()) + orders.getId() % 100000);

        //保存订单信息
        owner.saveOrder(orders);

        //返回下单结果
        return new PlaceOrderResDTO(orders.getId());
    }

    @Transactional(rollbackFor = Exception.class)
    public void saveOrder(Orders orders){
        boolean result = this.save(orders);
        if (!result) {
            throw new CommonException("下单失败");
        }
    }

    /**
     * 生成订单号
     */
    private Long generateOrderId() {
        //通过Redis的INCR命令生成自增序号
        Long id = redisTemplate.opsForValue().increment(RedisConstants.Lock.ORDERS_SHARD_KEY_ID_GENERATOR, 1);
        if (id == null) {
            throw new RuntimeException("订单序号生成失败");
        }
        //生成订单号【2位年2位月2位日+13位序号】
        Long datePart = DateUtils.getFormatDate(LocalDateTime.now(), "yyMMdd");
        if (datePart == null) {
            throw new RuntimeException("订单号日期生成失败");
        }
        return datePart * 1000000000000L + id;
    }
}