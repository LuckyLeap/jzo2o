package com.jzo2o.foundations.model.dto.request;

import com.jzo2o.common.model.dto.PageQueryDTO;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 区域分页查询类
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("区域分页查询类")
public class RegionPageQueryReqDTO extends PageQueryDTO {
}