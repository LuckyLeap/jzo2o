package com.jzo2o.foundations.handler;

import com.jzo2o.canal.listeners.AbstractCanalRabbitMqMsgListener;
import com.jzo2o.es.core.ElasticSearchTemplate;
import com.jzo2o.foundations.constants.IndexConstants;
import com.jzo2o.foundations.model.domain.ServeSync;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * 服务信息同步程序
 */
@Component
public class ServeCanalDataSyncHandler extends AbstractCanalRabbitMqMsgListener<ServeSync> {

    @Resource
    private ElasticSearchTemplate elasticSearchTemplate;

    /**
     * 监听canal-mq-jzo2o-foundations队列
     */
    @RabbitListener(bindings = @QueueBinding(
            //设置 x-single-active-consumer = true ，确保同一时刻只有一个消费者处理消息，实现独占消费模式
            value = @Queue(name = "canal-mq-jzo2o-foundations", arguments={@Argument(name="x-single-active-consumer", value = "true", type = "java.lang.Boolean") }),
            exchange = @Exchange(name = "exchange.canal-jzo2o", type = ExchangeTypes.TOPIC),
            key = "canal-mq-jzo2o-foundations"),
            concurrency = "1" // concurrency指定消费线程数为1
    )
    public void onMessage(Message message) throws Exception {
        parseMsg(message);
    }

    /**
     * 向Es中保存数据，解析到binlog中新增、修改消息执行此方法
     */
    @Override
    public void batchSave(List<ServeSync> data) {
        // 向Es中保存索引，有索引则更新，没有则新增
        Boolean aBoolean = elasticSearchTemplate.opsForDoc().batchUpsert(IndexConstants.SERVE, data);
        if(!aBoolean){
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            throw new RuntimeException("同步失败");
        }
    }

    /**
     * 向Es中删除数据，解析到binlog中删除消息执行此方法
     */
    @Override
    public void batchDelete(List<Long> ids) {
        Boolean aBoolean = elasticSearchTemplate.opsForDoc().batchDelete(IndexConstants.SERVE, ids);
        if(!aBoolean){
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            throw new RuntimeException("同步失败");
        }
    }
}