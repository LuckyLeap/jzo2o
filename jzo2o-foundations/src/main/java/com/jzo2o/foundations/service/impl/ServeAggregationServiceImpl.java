package com.jzo2o.foundations.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import co.elastic.clients.elasticsearch._types.SortOptions;
import co.elastic.clients.elasticsearch._types.SortOrder;
import co.elastic.clients.elasticsearch._types.query_dsl.BoolQuery;
import co.elastic.clients.elasticsearch.core.SearchRequest;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import co.elastic.clients.elasticsearch.core.search.Hit;
import com.jzo2o.es.core.ElasticSearchTemplate;
import com.jzo2o.es.utils.SearchResponseUtils;
import com.jzo2o.foundations.model.domain.ServeAggregation;
import com.jzo2o.foundations.model.dto.response.ServeSimpleResDTO;
import com.jzo2o.foundations.service.ServeAggregationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 服务相关
 **/
@Slf4j
@Service
public class ServeAggregationServiceImpl implements ServeAggregationService {

    @Resource
    private ElasticSearchTemplate elasticSearchTemplate;

    /**
     * 查询服务列表
     * @param cityCode    城市编码
     * @param serveTypeId 服务类型id
     * @param keyword     关键词
     * @return 服务列表
     */
    @Override
    public List<ServeSimpleResDTO> findServeList(String cityCode, Long serveTypeId, String keyword) {
        // 构建搜索请求
        SearchRequest.Builder builder = new SearchRequest.Builder();

        // 构建布尔查询
        BoolQuery.Builder boolBuilder = new BoolQuery.Builder();

        // 匹配城市编码
        if (ObjectUtil.isNotEmpty(cityCode)) {
            boolBuilder.must(m -> m.term(t -> t.field("city_code").value(cityCode)));
        }

        // 匹配服务类型ID
        if (serveTypeId != null) {
            boolBuilder.must(m -> m.term(t -> t.field("serve_type_id").value(serveTypeId)));
        }

        // 匹配关键字
        if (ObjectUtil.isNotEmpty(keyword)) {
            boolBuilder.must(m -> m.multiMatch(mm -> mm.fields("serve_item_name", "serve_type_name").query(keyword)));
        }

        // 设置查询条件
        builder.query(q -> q.bool(boolBuilder.build()));

        // 排序 按服务项的serveItemSortNum排序(升序)
        List<SortOptions> sortOptions = new ArrayList<>();
        sortOptions.add(SortOptions.of(sortOption -> sortOption.field(field -> field.field("serve_item_sort_num").order(SortOrder.Asc))));
        builder.sort(sortOptions);

        // 指定索引
        builder.index("serve_aggregation");

        // 请求对象
        SearchRequest searchRequest = builder.build();

        // 检索数据
        SearchResponse<ServeAggregation> searchResponse = elasticSearchTemplate.opsForDoc().search(searchRequest, ServeAggregation.class);

        // 如果搜索成功返回结果集
        if (SearchResponseUtils.isSuccess(searchResponse)) {
            List<ServeAggregation> collect = searchResponse.hits().hits()
                    .stream()
                    .map(Hit::source)
                    .filter(Objects::nonNull)
                    .collect(Collectors.toList());

            return BeanUtil.copyToList(collect, ServeSimpleResDTO.class);
        }

        return Collections.emptyList();
    }
}