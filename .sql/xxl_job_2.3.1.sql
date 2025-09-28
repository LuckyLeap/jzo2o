-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 192.168.101.68    Database: xxl_job_2.3.1
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `xxl_job_2.3.1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `xxl_job_2.3.1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `xxl_job_2.3.1`;

--
-- Table structure for table `xxl_job_group`
--

DROP TABLE IF EXISTS `xxl_job_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_group`
--

LOCK TABLES `xxl_job_group` WRITE;
/*!40000 ALTER TABLE `xxl_job_group` DISABLE KEYS */;
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (1,'xxl-job-executor-sample','示例执行器',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (2,'media-process-service','视频处理任务',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (3,'coursepublish-job','课程发布任务',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (4,'payresultnotify-job','支付结果通知',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (5,'jzo2o-orders-seize','抢单调度器',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (6,'jzo2o-orders-dispatch','派单调度器',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (8,'jzo2o-orders-manager','订单管理',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (9,'jzo2o-trade','支付服务',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (10,'jzo2o-market','营销中心',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (11,'jzo2o-orders-history','历史订单',0,NULL,'2023-11-30 22:04:25');
INSERT INTO `xxl_job_group` (`id`, `app_name`, `title`, `address_type`, `address_list`, `update_time`) VALUES (12,'jzo2o-health','即刻体检',0,NULL,'2023-11-30 22:04:25');
/*!40000 ALTER TABLE `xxl_job_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_info`
--

DROP TABLE IF EXISTS `xxl_job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_info`
--

LOCK TABLES `xxl_job_info` WRITE;
/*!40000 ALTER TABLE `xxl_job_info` DISABLE KEYS */;
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (1,1,'测试任务1','2018-11-03 22:21:31','2018-11-03 22:21:31','XXL','','CRON','0 0 0 * * ? *','DO_NOTHING','FIRST','demoJobHandler','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2018-11-03 22:21:31','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (2,2,'视频处理','2022-09-13 20:42:33','2022-09-13 21:14:04','xxljob','','CRON','0/3 * * * * ?','DO_NOTHING','FIRST','testJob','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2022-09-13 20:42:33','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (3,2,'测试分片任务','2022-09-13 21:15:18','2022-09-14 18:32:24','xxljob','','CRON','0/3 * * * * ?','DO_NOTHING','SHARDING_BROADCAST','shardingJobHandler','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2022-09-13 21:15:18','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (4,2,'视频处理','2022-09-14 18:33:41','2022-09-22 14:13:58','xxljob','','CRON','0/5 * * * * ?','DO_NOTHING','SHARDING_BROADCAST','videoJobHandler','','DISCARD_LATER',0,0,'BEAN','','GLUE代码初始化','2022-09-14 18:33:41','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (5,3,'课程发布任务','2022-09-22 10:46:22','2023-10-17 20:44:42','xxl-job','','CRON','0/10 * * * * ?','DO_NOTHING','SHARDING_BROADCAST','CoursePublishJobHandler','','DISCARD_LATER',0,0,'BEAN','','GLUE代码初始化','2022-09-22 10:46:22','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (6,4,'支付结果通知','2022-10-05 06:38:02','2023-10-17 20:44:51','xxl-job','','CRON','0/10 * * * * ?','DO_NOTHING','SHARDING_BROADCAST','NotifyPayResultJobHandler','','DISCARD_LATER',0,0,'BEAN','','GLUE代码初始化','2022-10-05 06:38:02','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (7,5,'抢单终止','2023-10-17 20:45:16','2023-11-15 17:01:19','xxljob','','CRON','0/5 * * * * ?','DO_NOTHING','FIRST','arriveServeStartTimeStopSeizeJob','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-10-17 20:45:16','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (8,5,'抢单超时进入派单','2023-10-17 20:45:46','2023-11-15 17:01:16','xxljob','','CRON','0/5 * * * * ?','DO_NOTHING','FIRST','seizeTimeoutIntoDispatchPoolJob','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-10-17 20:45:46','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (9,5,'抢单结果同步','2023-10-17 20:46:13','2023-11-30 21:39:22','xxljob','','CRON','0/10 * * * * ?','DO_NOTHING','FIRST','seizeSyncJob','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-10-17 20:46:13','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (10,6,'派单终止','2023-10-17 20:54:58','2023-11-24 15:42:35','xxljob','','CRON','0/5 * * * * ?','DO_NOTHING','FIRST','arriveServeStartTimeStopDispatchJob','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-10-17 20:54:58','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (11,6,'派单调度任务','2023-10-17 20:55:19','2023-11-30 21:39:06','xxljob','','CRON','0/5 * * * * ?','DO_NOTHING','FIRST','dispatch','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-10-17 20:55:19','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (13,8,'退款','2023-10-28 17:18:48','2023-11-02 18:45:16','xxljob','','CRON','0/5 * * * * ?','DO_NOTHING','FIRST','handleRefundOrders','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-10-28 17:18:48','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (14,9,'支付通知','2023-10-31 16:21:49','2023-11-30 21:39:27','xxljob','','CRON','0/5 * * * * ?','DO_NOTHING','SHARDING_BROADCAST','tradingJob','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-10-31 16:21:49','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (15,10,'活动状态变更任务','2023-11-05 15:44:54','2023-11-09 21:23:31','xxljob','','CRON','0/59 * * * * ?','DO_NOTHING','FIRST','updateActivityStatus','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-11-05 15:44:54','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (17,10,'活动定时预热任务','2023-11-08 10:19:56','2023-11-09 21:23:29','xxljob','','CRON','0/5 * * * * ?','DO_NOTHING','FIRST','activityPreheat','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-11-08 10:19:56','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (18,10,'抢券结果同步任务','2023-11-09 09:12:42','2023-11-09 21:23:27','xxljob','','CRON','0/10 * * * * ?','DO_NOTHING','FIRST','seizeCouponSyncJob','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-11-09 09:12:42','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (19,11,'迁移订单信息','2023-11-20 18:45:39','2023-11-30 21:39:15','xxljob','','CRON','0/10 * * * * ?','DO_NOTHING','FIRST','migrateHistoryOrders','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-11-20 18:45:39','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (20,11,'订单统计','2023-11-20 19:34:03','2023-11-30 21:39:12','xxljob','','CRON','0/10 * * * * ?','DO_NOTHING','FIRST','statAndSaveData','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-11-20 19:34:03','',0,0,0);
INSERT INTO `xxl_job_info` (`id`, `job_group`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `schedule_type`, `schedule_conf`, `misfire_strategy`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`, `trigger_status`, `trigger_last_time`, `trigger_next_time`) VALUES (21,12,'订单退款异步任务','2023-11-27 10:36:13','2023-11-30 21:38:57','xxljob','','CRON','0/10 * * * * ?','DO_NOTHING','FIRST','handleRefundOrders','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-11-27 10:36:13','',0,0,0);
/*!40000 ALTER TABLE `xxl_job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_lock`
--

DROP TABLE IF EXISTS `xxl_job_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_lock`
--

LOCK TABLES `xxl_job_lock` WRITE;
/*!40000 ALTER TABLE `xxl_job_lock` DISABLE KEYS */;
INSERT INTO `xxl_job_lock` (`lock_name`) VALUES ('schedule_lock');
/*!40000 ALTER TABLE `xxl_job_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_log`
--

DROP TABLE IF EXISTS `xxl_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`),
  KEY `I_handle_code` (`handle_code`)
) ENGINE=InnoDB AUTO_INCREMENT=546502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_log`
--

LOCK TABLES `xxl_job_log` WRITE;
/*!40000 ALTER TABLE `xxl_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_log_report`
--

DROP TABLE IF EXISTS `xxl_job_log_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_log_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_log_report`
--

LOCK TABLES `xxl_job_log_report` WRITE;
/*!40000 ALTER TABLE `xxl_job_log_report` DISABLE KEYS */;
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (1,'2022-09-13 00:00:00',0,126,1759,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (2,'2022-09-12 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (3,'2022-09-11 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (4,'2022-09-14 00:00:00',0,1451,4120,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (5,'2022-09-22 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (6,'2022-09-21 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (7,'2022-09-20 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (8,'2022-09-23 00:00:00',0,1067,65,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (9,'2022-09-24 00:00:00',0,103,2876,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (10,'2022-09-25 00:00:00',0,43,5120,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (11,'2022-09-26 00:00:00',0,0,3740,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (12,'2022-09-27 00:00:00',0,3966,1210,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (13,'2022-09-28 00:00:00',0,3082,2477,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (14,'2022-09-29 00:00:00',0,2140,2966,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (15,'2022-09-30 00:00:00',0,3308,1808,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (16,'2022-10-01 00:00:00',0,3118,343,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (17,'2022-10-02 00:00:00',0,2067,2037,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (18,'2022-10-03 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (19,'2022-10-04 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (20,'2022-10-05 00:00:00',0,2748,246,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (21,'2023-10-17 00:00:00',0,697,92,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (22,'2023-10-16 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (23,'2023-10-15 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (24,'2023-10-26 00:00:00',0,1132,13407,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (25,'2023-10-25 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (26,'2023-10-24 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (27,'2023-10-27 00:00:00',0,6900,31556,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (28,'2023-10-28 00:00:00',0,3056,7579,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (29,'2023-10-29 00:00:00',0,1660,30320,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (30,'2023-10-31 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (31,'2023-10-30 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (32,'2023-11-01 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (33,'2023-11-02 00:00:00',0,5815,11680,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (34,'2023-11-05 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (35,'2023-11-04 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (36,'2023-11-03 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (37,'2023-11-06 00:00:00',0,6249,32238,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (38,'2023-11-08 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (39,'2023-11-07 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (40,'2023-11-09 00:00:00',0,7892,17631,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (41,'2023-11-15 00:00:00',0,1508,3045,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (42,'2023-11-14 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (43,'2023-11-13 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (44,'2023-11-20 00:00:00',0,5537,10946,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (45,'2023-11-19 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (46,'2023-11-18 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (47,'2023-11-21 00:00:00',0,1786,8253,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (48,'2023-11-24 00:00:00',0,3971,3317,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (49,'2023-11-23 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (50,'2023-11-22 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (51,'2023-11-27 00:00:00',0,8252,34368,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (52,'2023-11-26 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (53,'2023-11-25 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (54,'2023-11-30 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (55,'2023-11-29 00:00:00',0,0,0,NULL);
INSERT INTO `xxl_job_log_report` (`id`, `trigger_day`, `running_count`, `suc_count`, `fail_count`, `update_time`) VALUES (56,'2023-11-28 00:00:00',0,0,0,NULL);
/*!40000 ALTER TABLE `xxl_job_log_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_logglue`
--

DROP TABLE IF EXISTS `xxl_job_logglue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_logglue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_logglue`
--

LOCK TABLES `xxl_job_logglue` WRITE;
/*!40000 ALTER TABLE `xxl_job_logglue` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_logglue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_registry`
--

DROP TABLE IF EXISTS `xxl_job_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_registry`
--

LOCK TABLES `xxl_job_registry` WRITE;
/*!40000 ALTER TABLE `xxl_job_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_user`
--

DROP TABLE IF EXISTS `xxl_job_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_user`
--

LOCK TABLES `xxl_job_user` WRITE;
/*!40000 ALTER TABLE `xxl_job_user` DISABLE KEYS */;
INSERT INTO `xxl_job_user` (`id`, `username`, `password`, `role`, `permission`) VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e',1,NULL);
/*!40000 ALTER TABLE `xxl_job_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 22:03:40
