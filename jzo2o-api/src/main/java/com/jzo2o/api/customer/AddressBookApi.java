package com.jzo2o.api.customer;

import com.jzo2o.api.customer.dto.response.AddressBookResDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 内部接口 - 地址簿相关远程接口
 */
@FeignClient(contextId = "jzo2o-customer", value = "jzo2o-customer", path = "/customer/inner/address-book")
public interface AddressBookApi {
    /**
     * 根据ID获取地址簿详情
     */
    @GetMapping("/{id}")
    AddressBookResDTO detail(@PathVariable("id") Long id);

    /**
     * 根据用户ID和城市获取地址簿列表
     */
    @GetMapping("/getByUserIdAndCity")
    List<AddressBookResDTO> getByUserIdAndCity(@RequestParam("userId") Long userId, @RequestParam("city") String city);
}