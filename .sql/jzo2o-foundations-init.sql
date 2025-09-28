-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 192.168.101.68    Database: jzo2o-foundations
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
-- Current Database: `jzo2o-foundations`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jzo2o-foundations` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `jzo2o-foundations`;

--
-- Table structure for table `city_directory`
--

DROP TABLE IF EXISTS `city_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_directory` (
  `parent_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '上级归属',
  `type` int DEFAULT NULL COMMENT '类型，1：省，2：市',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '城市名称',
  `city_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '城市编码',
  `sort_num` int DEFAULT NULL COMMENT '排序字段',
  `pinyin_initial` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '城市名称拼音首字母',
  `id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='城市编码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_directory`
--

LOCK TABLES `city_directory` WRITE;
/*!40000 ALTER TABLE `city_directory` DISABLE KEYS */;
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('11',2,'北京市','010',27,'B','010');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'广州市','020',88,'G','020');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('31',2,'上海市','021',241,'S','021');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('12',2,'天津市','022',271,'T','022');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('50',2,'重庆市','023',54,'C','023');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'沈阳市','024',248,'S','024');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'南京市','025',197,'N','025');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'武汉市','027',299,'W','027');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'成都市','028',46,'C','028');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'西安市','029',303,'X','029');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'邯郸市','0310',100,'H','0310');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'石家庄市','0311',251,'S','0311');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'保定市','0312',22,'B','0312');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'张家口市','0313',354,'Z','0313');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'承德市','0314',48,'C','0314');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'唐山市','0315',270,'T','0315');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'廊坊市','0316',161,'L','0316');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'沧州市','0317',34,'C','0317');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'衡水市','0318',112,'H','0318');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'邢台市','0319',321,'X','0319');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('13',2,'秦皇岛市','0335',221,'Q','0335');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'朔州市','0349',255,'S','0349');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'忻州市','0350',318,'X','0350');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'太原市','0351',269,'T','0351');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'大同市','0352',59,'D','0352');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'阳泉市','0353',332,'Y','0353');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'晋中市','0354',145,'J','0354');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'长治市','0355',42,'C','0355');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'晋城市','0356',144,'J','0356');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'临汾市','0357',173,'L','0357');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'吕梁市','0358',184,'L','0358');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('14',2,'运城市','0359',349,'Y','0359');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'商丘市','0370',240,'S','0370');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'郑州市','0371',359,'Z','0371');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'安阳市','0372',10,'A','0372');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'新乡市','0373',316,'X','0373');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'许昌市','0374',323,'X','0374');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'平顶山市','0375',209,'P','0375');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'信阳市','0376',319,'X','0376');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'南阳市','0377',201,'N','0377');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'开封市','0378',152,'K','0378');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'洛阳市','0379',185,'L','0379');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'焦作市','0391',139,'J','0391');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'鹤壁市','0392',108,'H','0392');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'濮阳市','0393',213,'P','0393');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'周口市','0394',363,'Z','0394');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'漯河市','0395',187,'L','0395');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'驻马店市','0396',366,'Z','0396');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'三门峡市','0398',232,'S','0398');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'铁岭市','0410',274,'T','0410');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'大连市','0411',57,'D','0411');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'鞍山市','0412',6,'A','0412');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'抚顺市','0413',78,'F','0413');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'本溪市','0414',29,'B','0414');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'丹东市','0415',61,'D','0415');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'锦州市','0416',143,'J','0416');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'营口市','0417',341,'Y','0417');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'阜新市','0418',80,'F','0418');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'辽阳市','0419',169,'L','0419');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'朝阳市','0421',43,'C','0421');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'盘锦市','0427',207,'P','0427');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('21',2,'葫芦岛市','0429',117,'H','0429');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('22',2,'长春市','0431',40,'C','0431');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('22',2,'吉林市','0432',131,'J','0432');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('22',2,'四平市','0434',256,'S','0434');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('22',2,'通化市','0435',276,'T','0435');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('22',2,'白城市','0436',15,'B','0436');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('22',2,'辽源市','0437',170,'L','0437');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('22',2,'松原市','0438',257,'S','0438');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('22',2,'白山市','0439',17,'B','0439');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'哈尔滨市','0451',93,'H','0451');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'齐齐哈尔市','0452',215,'Q','0452');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'牡丹江市','0453',193,'M','0453');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'佳木斯市','0454',137,'J','0454');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'绥化市','0455',262,'S','0455');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'黑河市','0456',111,'H','0456');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'大兴安岭地区','0457',60,'D','0457');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'伊春市','0458',333,'Y','0458');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'大庆市','0459',58,'D','0459');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'七台河市','0464',214,'Q','0464');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'鸡西市','0467',129,'J','0467');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'鹤岗市','0468',109,'H','0468');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('23',2,'双鸭山市','0469',254,'S','0469');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'呼伦贝尔市','0470',116,'H','0470');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'呼和浩特市','0471',115,'H','0471');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'包头市','0472',21,'B','0472');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'乌海市','0473',292,'W','0473');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'乌兰察布市','0474',293,'W','0474');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'通辽市','0475',277,'T','0475');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'赤峰市','0476',50,'C','0476');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'鄂尔多斯市','0477',72,'E','0477');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'巴彦淖尔市','0478',12,'B','0478');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'锡林郭勒盟','0479',306,'X','0479');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'兴安盟','0482',320,'X','0482');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('15',2,'阿拉善盟','0483',3,'A','0483');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'无锡市','0510',295,'W','0510');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'镇江市','0511',358,'Z','0511');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'苏州市','0512',258,'S','0512');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'南通市','0513',200,'N','0513');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'扬州市','0514',330,'Y','0514');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'盐城市','0515',327,'Y','0515');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'徐州市','0516',322,'X','0516');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'淮安市','0517',121,'H','0517');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'连云港市','0518',166,'L','0518');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'常州市','0519',39,'C','0519');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'泰州市','0523',268,'T','0523');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('32',2,'宿迁市','0527',259,'S','0527');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'菏泽市','0530',103,'H','0530');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'济南市','0531',132,'J','0531');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'青岛市','0532',222,'Q','0532');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'淄博市','0533',368,'Z','0533');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'德州市','0534',64,'D','0534');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'烟台市','0535',326,'Y','0535');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'潍坊市','0536',287,'W','0536');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'济宁市','0537',133,'J','0537');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'泰安市','0538',267,'T','0538');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'临沂市','0539',176,'L','0539');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'滨州市','0543',31,'B','0543');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'东营市','0546',69,'D','0546');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'滁州市','0550',52,'C','0550');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'合肥市','0551',105,'H','0551');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'蚌埠市','0552',20,'B','0552');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'芜湖市','0553',296,'W','0553');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'淮南市','0554',123,'H','0554');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'马鞍山市','0555',188,'M','0555');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'安庆市','0556',8,'A','0556');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'宿州市','0557',260,'S','0557');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'亳州市','0558',33,'B','0558');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'黄山市','0559',126,'H','0559');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'淮北市','0561',122,'H','0561');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'铜陵市','0562',279,'T','0562');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'宣城市','0563',324,'X','0563');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'六安市','0564',179,'L','0564');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'池州市','0566',49,'C','0566');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'衢州市','0570',229,'Q','0570');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'杭州市','0571',102,'H','0571');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'湖州市','0572',119,'H','0572');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'嘉兴市','0573',135,'J','0573');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'宁波市','0574',203,'N','0574');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'绍兴市','0575',245,'S','0575');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'台州市','0576',266,'T','0576');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'温州市','0577',289,'W','0577');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'丽水市','0578',165,'L','0578');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'金华市','0579',142,'J','0579');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('33',2,'舟山市','0580',362,'Z','0580');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('35',2,'福州市','0591',77,'F','0591');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('35',2,'厦门市','0592',307,'X','0592');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('35',2,'宁德市','0593',204,'N','0593');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('35',2,'莆田市','0594',211,'P','0594');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('35',2,'泉州市','0595',228,'Q','0595');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('35',2,'漳州市','0596',352,'Z','0596');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('35',2,'龙岩市','0597',181,'L','0597');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('35',2,'三明市','0598',233,'S','0598');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('35',2,'南平市','0599',199,'N','0599');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'威海市','0631',286,'W','0631');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'枣庄市','0632',350,'Z','0632');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'日照市','0633',231,'R','0633');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('37',2,'聊城市','0635',168,'L','0635');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'汕尾市','0660',238,'S','0660');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'阳江市','0662',331,'Y','0662');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'揭阳市','0663',140,'J','0663');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'茂名市','0668',189,'M','0668');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'西双版纳傣族自治州','0691',305,'X','0691');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'德宏傣族景颇族自治州','0692',62,'D','0692');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'鹰潭市','0701',340,'Y','0701');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'襄阳市','0710',312,'X','0710');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'鄂州市','0711',73,'E','0711');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'孝感市','0712',315,'X','0712');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'黄冈市','0713',124,'H','0713');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'黄石市','0714',127,'H','0714');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'咸宁市','0715',309,'X','0715');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'荆州市','0716',147,'J','0716');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'宜昌市','0717',336,'Y','0717');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'恩施土家族苗族自治州','0718',74,'E','0718');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'十堰市','0719',249,'S','0719');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'随州市','0722',261,'S','0722');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'荆门市','0724',146,'J','0724');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'仙桃市','0728',308,'X','0728');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'岳阳市','0730',347,'Y','0730');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'长沙市','0731',41,'C','0731');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'湘潭市','0732',313,'X','0732');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'株洲市','0733',365,'Z','0733');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'衡阳市','0734',113,'H','0734');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'郴州市','0735',45,'C','0735');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'常德市','0736',38,'C','0736');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'益阳市','0737',338,'Y','0737');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'娄底市','0738',183,'L','0738');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'邵阳市','0739',244,'S','0739');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'湘西土家族苗族自治州','0743',314,'X','0743');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'张家界市','0744',353,'Z','0744');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'怀化市','0745',120,'H','0745');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('43',2,'永州市','0746',342,'Y','0746');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'江门市','0750',138,'J','0750');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'韶关市','0751',243,'S','0751');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'惠州市','0752',128,'H','0752');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'梅州市','0753',190,'M','0753');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'汕头市','0754',237,'S','0754');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'深圳市','0755',246,'S','0755');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'珠海市','0756',364,'Z','0756');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'佛山市','0757',76,'F','0757');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'肇庆市','0758',357,'Z','0758');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'湛江市','0759',351,'Z','0759');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'中山市','0760',360,'Z','0760');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'河源市','0762',107,'H','0762');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'清远市','0763',223,'Q','0763');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'云浮市','0766',348,'Y','0766');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'潮州市','0768',44,'C','0768');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('44',2,'东莞市','0769',70,'D','0769');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'防城港市','0770',75,'F','0770');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'南宁市','0771',198,'N','0771');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'柳州市','0772',178,'L','0772');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'桂林市','0773',89,'G','0773');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'梧州市','0774',297,'W','0774');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'玉林市','0775',344,'Y','0775');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'百色市','0776',19,'B','0776');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'钦州市','0777',220,'Q','0777');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'河池市','0778',106,'H','0778');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'北海市','0779',26,'B','0779');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'新余市','0790',317,'X','0790');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'南昌市','0791',195,'N','0791');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'九江市','0792',149,'J','0792');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'上饶市','0793',242,'S','0793');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'抚州市','0794',79,'F','0794');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'宜春市','0795',337,'Y','0795');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'吉安市','0796',130,'J','0796');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'赣州市','0797',84,'G','0797');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'景德镇市','0798',148,'J','0798');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('36',2,'萍乡市','0799',208,'P','0799');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'保亭黎族苗族自治县','0801',24,'B','0801');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'白沙黎族自治县','0802',16,'B','0802');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'昌江黎族自治县','0803',37,'C','0803');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'澄迈县','0804',47,'C','0804');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'儋州市','0805',71,'D','0805');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'定安县','0806',66,'D','0806');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'东方市','0807',68,'D','0807');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'陵水黎族自治县','0809',177,'L','0809');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'攀枝花市','0812',206,'P','0812');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'自贡市','0813',369,'Z','0813');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'绵阳市','0816',192,'M','0816');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'南充市','0817',196,'N','0817');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'达州市','0818',55,'D','0818');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'遂宁市','0825',263,'S','0825');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'广安市','0826',86,'G','0826');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'巴中市','0827',14,'B','0827');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'泸州市','0830',186,'L','0830');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'宜宾市','0831',335,'Y','0831');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'资阳市','0832',367,'Z','0832');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'乐山市','0833',163,'L','0833');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'凉山彝族自治州','0834',167,'L','0834');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'雅安市','0835',325,'Y','0835');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'甘孜藏族自治州','0836',83,'G','0836');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'阿坝藏族羌族自治州','0837',0,'A','0837');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'德阳市','0838',63,'D','0838');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'广元市','0839',87,'G','0839');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('52',2,'贵阳市','0851',91,'G','0851');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('52',2,'遵义市','0852',370,'Z','0852');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('52',2,'安顺市','0853',9,'A','0853');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('52',2,'黔南布依族苗族自治州','0854',217,'Q','0854');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('52',2,'黔东南苗族侗族自治州','0855',216,'Q','0855');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('52',2,'铜仁市','0856',280,'T','0856');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('52',2,'毕节市','0857',30,'B','0857');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('52',2,'六盘水市','0858',180,'L','0858');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('52',2,'黔西南布依族苗族自治州','0859',218,'Q','0859');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'昭通市','0870',356,'Z','0870');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'昆明市','0871',156,'K','0871');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'大理白族自治州','0872',56,'D','0872');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'红河哈尼族彝族自治州','0873',114,'H','0873');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'曲靖市','0874',227,'Q','0874');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'保山市','0875',23,'B','0875');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'文山壮族苗族自治州','0876',291,'W','0876');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'玉溪市','0877',346,'Y','0877');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'楚雄彝族自治州','0878',53,'C','0878');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'普洱市','0879',212,'P','0879');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'临沧市','0883',172,'L','0883');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'怒江傈僳族自治州','0886',205,'N','0886');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'迪庆藏族自治州','0887',65,'D','0887');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('53',2,'丽江市','0888',164,'L','0888');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('54',2,'拉萨市','0891',158,'L','0891');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('54',2,'日喀则市','0892',230,'R','0892');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('54',2,'山南市','0893',236,'S','0893');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('54',2,'林芝市','0894',171,'L','0894');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('54',2,'昌都市','0895',35,'C','0895');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('54',2,'那曲市','0896',194,'N','0896');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('54',2,'阿里地区','0897',5,'A','0897');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'海口市','0898',97,'H','0898');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'三亚市','0899',235,'S','0899');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'塔城地区','0901',264,'T','0901');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'哈密市','0902',94,'H','0902');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'和田地区','0903',104,'H','0903');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'阿勒泰地区','0906',4,'A','0906');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'克孜勒苏柯尔克孜自治州','0908',155,'K','0908');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'博尔塔拉蒙古自治州','0909',32,'B','0909');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'咸阳市','0910',310,'X','0910');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'延安市','0911',328,'Y','0911');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'榆林市','0912',343,'Y','0912');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'渭南市','0913',288,'W','0913');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'商洛市','0914',239,'S','0914');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'安康市','0915',7,'A','0915');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'汉中市','0916',101,'H','0916');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'宝鸡市','0917',25,'B','0917');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('61',2,'铜川市','0919',278,'T','0919');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'临夏回族自治州','0930',175,'L','0930');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'兰州市','0931',160,'L','0931');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'定西市','0932',67,'D','0932');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'平凉市','0933',210,'P','0933');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'庆阳市','0934',224,'Q','0934');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'金昌市','0935',141,'J','0935');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'张掖市','0936',355,'Z','0936');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'酒泉市','0937',150,'J','0937');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'天水市','0938',273,'T','0938');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'甘南藏族自治州','0941',82,'G','0941');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'白银市','0943',18,'B','0943');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('64',2,'银川市','0951',339,'Y','0951');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('64',2,'石嘴山市','0952',252,'S','0952');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('64',2,'吴忠市','0953',298,'W','0953');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('64',2,'固原市','0954',85,'G','0954');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('63',2,'海北藏族自治州','0970',95,'H','0970');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('63',2,'西宁市','0971',304,'X','0971');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('63',2,'海东市','0972',96,'H','0972');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('63',2,'黄南藏族自治州','0973',125,'H','0973');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('63',2,'海南藏族自治州','0974',98,'H','0974');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('63',2,'果洛藏族自治州','0975',92,'G','0975');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('63',2,'玉树藏族自治州','0976',345,'Y','0976');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('63',2,'海西蒙古族藏族自治州','0977',99,'H','0977');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'克拉玛依市','0990',154,'K','0990');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'乌鲁木齐市','0991',294,'W','0991');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'胡杨河市','0992',118,'H','0992');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'石河子市','0993',250,'S','0993');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'昌吉回族自治州','0994',36,'C','0994');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'吐鲁番市','0995',282,'T','0995');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'巴音郭楞蒙古自治州','0996',13,'B','0996');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'阿克苏地区','0997',1,'A','0997');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'喀什地区','0998',151,'K','0998');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'伊犁哈萨克自治州','0999',334,'Y','0999');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'北京市','11',2,'B','11');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'天津市','12',28,'T','12');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'河北省','13',10,'H','13');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('41',2,'济源市','1391',134,'J','1391');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'山西省','14',23,'S','14');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('22',2,'延边朝鲜族自治州','1433',329,'Y','1433');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'内蒙古自治区','15',19,'N','15');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('34',2,'阜阳市','1558',81,'F','1558');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'神农架林区','1719',247,'S','1719');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'天门市','1728',272,'T','1728');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'贵港市','1755',90,'G','1755');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'崇左市','1771',51,'C','1771');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'来宾市','1772',159,'L','1772');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('45',2,'贺州市','1774',110,'H','1774');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'内江市','1832',202,'N','1832');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('51',2,'眉山市','1833',191,'M','1833');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('81',2,'香港特别行政区','1852',311,'X','1852');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('82',2,'澳门特别行政区','1853',11,'A','1853');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('71',2,'台湾省','1886',265,'T','1886');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'屯昌县','1892',283,'T','1892');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'文昌市','1893',290,'W','1893');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'琼海市','1894',225,'Q','1894');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'临高县','1896',174,'L','1896');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'五指山市','1897',302,'W','1897');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'万宁市','1898',285,'W','1898');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'琼中黎族苗族自治县','1899',226,'Q','1899');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('90',2,'外国','1900',284,'W','1900');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'昆玉市','1903',157,'K','1903');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'北屯市','1906',28,'B','1906');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'双河市','1909',253,'S','1909');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'武威市','1935',300,'W','1935');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'嘉峪关市','1937',136,'J','1937');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('64',2,'中卫市','1953',361,'Z','1953');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'五家渠市','1994',301,'W','1994');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'铁门关市','1996',275,'T','1996');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'阿拉尔市','1997',2,'A','1997');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'图木舒克市','1998',281,'T','1998');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('65',2,'可克达拉市','1999',153,'K','1999');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'辽宁省','21',18,'L','21');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'吉林省','22',15,'J','22');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'黑龙江省','23',12,'H','23');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('42',2,'潜江市','2728',219,'Q','2728');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'乐东黎族自治县','2802',162,'L','2802');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('46',2,'三沙市','2898',234,'S','2898');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('62',2,'陇南市','2935',182,'L','2935');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'上海市','31',25,'S','31');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'江苏省','32',16,'J','32');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'浙江省','33',33,'Z','33');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'安徽省','34',0,'A','34');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'福建省','35',4,'F','35');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'江西省','36',17,'J','36');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'山东省','37',22,'S','37');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'河南省','41',11,'H','41');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'湖北省','42',13,'H','42');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'湖南省','43',14,'H','43');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'广东省','44',6,'G','44');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'广西壮族自治区','45',7,'G','45');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'海南省','46',9,'H','46');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'重庆市','50',3,'C','50');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'四川省','51',26,'S','51');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'贵州省','52',8,'G','52');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'云南省','53',32,'Y','53');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'西藏自治区','54',29,'X','54');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'陕西省','61',24,'S','61');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'甘肃省','62',5,'G','62');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'青海省','63',21,'Q','63');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'宁夏回族自治区','64',20,'N','64');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'新疆维吾尔自治区','65',31,'X','65');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'台湾省','71',27,'T','71');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'香港特别行政区','81',30,'X','81');
INSERT INTO `city_directory` (`parent_code`, `type`, `city_name`, `city_code`, `sort_num`, `pinyin_initial`, `id`) VALUES ('0',1,'澳门特别行政区','82',1,'A','82');
/*!40000 ALTER TABLE `city_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_region`
--

DROP TABLE IF EXISTS `config_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_region` (
  `id` bigint NOT NULL COMMENT '区域id',
  `city_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市编码',
  `staff_receive_order_max` int DEFAULT '10' COMMENT '（个体）接单量限制',
  `institution_receive_order_max` int DEFAULT '100' COMMENT '（企业）接单量限制值',
  `staff_serve_radius` int DEFAULT '50' COMMENT '（个体）服务范围半径',
  `institution_serve_radius` int DEFAULT '200' COMMENT '（企业）服务范围半径',
  `diversion_interval` int DEFAULT NULL COMMENT '分流间隔（单位分钟），即下单时间与服务预计开始时间的间隔',
  `seize_timeout_interval` int DEFAULT NULL COMMENT '抢单超时时间间隔（单位分钟），从支付成功进入抢单后超过当前时间抢单派单同步进行',
  `dispatch_strategy` int DEFAULT NULL COMMENT '派单策略，1：距离优先策略，2：评分优先策略，3：接单量优先策略',
  `dispatch_per_round_interval` int DEFAULT NULL COMMENT '派单每轮时间间隔',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='区域业务配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_region`
--

LOCK TABLES `config_region` WRITE;
/*!40000 ALTER TABLE `config_region` DISABLE KEYS */;
INSERT INTO `config_region` (`id`, `city_code`, `staff_receive_order_max`, `institution_receive_order_max`, `staff_serve_radius`, `institution_serve_radius`, `diversion_interval`, `seize_timeout_interval`, `dispatch_strategy`, `dispatch_per_round_interval`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1694272956343619586,'010',10,100,50,200,180,60,1,180,'2023-08-23 16:58:45','2023-11-24 15:27:02',1674350264389750786,1674350264389750786);
INSERT INTO `config_region` (`id`, `city_code`, `staff_receive_order_max`, `institution_receive_order_max`, `staff_serve_radius`, `institution_serve_radius`, `diversion_interval`, `seize_timeout_interval`, `dispatch_strategy`, `dispatch_per_round_interval`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1716408821385113602,'0478',10,100,50,200,120,60,1,180,'2023-10-23 10:59:39','2023-10-23 10:59:39',1674350264389750786,1674350264389750786);
/*!40000 ALTER TABLE `config_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operator`
--

DROP TABLE IF EXISTS `operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operator` (
  `id` bigint DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL,
  `update_by` bigint DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operator`
--

LOCK TABLES `operator` WRITE;
/*!40000 ALTER TABLE `operator` DISABLE KEYS */;
INSERT INTO `operator` (`id`, `username`, `avatar`, `name`, `phone`, `password`, `status`, `create_time`, `update_time`, `create_by`, `update_by`, `is_deleted`) VALUES (1,'zhangsan',NULL,NULL,'12011110000','$2a$10$v633CoJ.eIMA8sTuZxN5fOkmls5K8JmyVa6LEOptHl80bs/JA4JxO',1,'2023-06-29 06:10:31','2023-08-09 10:44:26',NULL,0,1);
INSERT INTO `operator` (`id`, `username`, `avatar`, `name`, `phone`, `password`, `status`, `create_time`, `update_time`, `create_by`, `update_by`, `is_deleted`) VALUES (1674350264389750786,'xiaoyan',NULL,'萧炎',NULL,'$2a$10$v633CoJ.eIMA8sTuZxN5fOkmls5K8JmyVa6LEOptHl80bs/JA4JxO',1,'2023-06-29 09:33:04','2023-07-19 21:31:26',NULL,NULL,0);
/*!40000 ALTER TABLE `operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` bigint NOT NULL COMMENT '区域id',
  `city_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '城市编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '区域名称',
  `manager_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人名称',
  `manager_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人电话',
  `active_status` int NOT NULL DEFAULT '0' COMMENT '是否启用，0草稿,1禁用，2启用',
  `sort_num` int NOT NULL DEFAULT '0' COMMENT '排序字段',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `城市编码唯一` (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1677152267410149378,'0997','阿克苏地区','老王','13512312312',0,0,'2023-07-07 03:07:15','2023-08-03 17:14:32',NULL,NULL);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1678648108367044609,'022','天津市','张三1','13512345678',0,0,'2023-07-11 14:11:11','2023-07-21 16:24:40',1674350264389750786,NULL);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1678654872303001601,'0556','安庆市','小孩','18600876543',0,0,'2023-07-11 14:38:04','2023-07-21 16:24:40',1674350264389750786,NULL);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1679004945467641857,'1853','澳门特别行政区','老王吧','15861231211',0,0,'2023-07-12 13:49:08','2023-07-21 16:28:25',1674350264389750786,NULL);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1683378699177644034,'0312','保定市','松松','13122132155',0,0,'2023-07-24 15:28:52','2023-07-24 16:14:09',1674350264389750786,NULL);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1683379605386383361,'0550','滁州市','帅帅','13221511211',0,0,'2023-07-24 15:32:28','2023-07-24 16:14:24',1674350264389750786,NULL);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1686303222843662337,'010','北京市','老孙','15812312112',2,0,'2023-08-01 17:09:52','2023-08-29 12:05:34',1674350264389750786,1674350264389750786);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1689579042623430657,'0594','莆田市','李四','17812345678',1,0,'2023-08-10 18:06:48','2023-08-15 16:14:33',NULL,NULL);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1691733203794628609,'021','上海市','张北大','13512312121',1,0,'2023-08-16 16:46:41','2023-08-17 15:19:50',NULL,NULL);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1692010607909900289,'023','重庆市','猪八戒','13231221212',1,0,'2023-08-17 11:08:59','2023-08-23 20:37:24',NULL,NULL);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1692472339767234562,'0371','郑州市','小红','13333333333',1,0,'2023-08-18 17:42:04','2023-10-26 14:00:12',1674350264389750786,1674350264389750786);
INSERT INTO `region` (`id`, `city_code`, `name`, `manager_name`, `manager_phone`, `active_status`, `sort_num`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1716408821385113602,'0478','巴彦淖尔市','fs','13333333333',0,12,'2023-10-23 10:59:38','2023-10-23 10:59:38',1674350264389750786,1674350264389750786);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serve`
--

DROP TABLE IF EXISTS `serve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serve` (
  `id` bigint NOT NULL COMMENT '服务id',
  `serve_item_id` bigint NOT NULL COMMENT '服务项id',
  `region_id` bigint NOT NULL COMMENT '区域id',
  `city_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '城市编码',
  `sale_status` int NOT NULL DEFAULT '0' COMMENT '售卖状态，0：草稿，1下架，2上架',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `is_hot` int NOT NULL DEFAULT '0' COMMENT '是否为热门，0非热门，1热门',
  `hot_time_stamp` bigint DEFAULT NULL COMMENT '更新为热门的时间戳',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `区域id` (`region_id`) USING BTREE,
  KEY `服务id` (`serve_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='服务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serve`
--

LOCK TABLES `serve` WRITE;
/*!40000 ALTER TABLE `serve` DISABLE KEYS */;
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1687401441778552834,1678727478181957634,1677152267410149378,'0997',0,5.00,0,NULL,'2023-08-04 17:53:48','2023-08-04 17:53:48',1674350264389750786,1674350264389750786);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1692475249121038338,1692475107114487809,1692472339767234562,'0371',0,10.00,0,NULL,'2023-08-18 17:53:38','2023-08-18 17:53:38',1674350264389750786,1674350264389750786);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1693543106233835521,1692475107114487809,1686303222843662337,'010',2,10.00,1,1692607169853,'2023-08-21 16:38:35','2023-10-17 09:55:27',1674350264389750786,NULL);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1693814922651181057,1678727478181957634,1692472339767234562,'0371',0,5.00,0,NULL,'2023-08-22 10:38:41','2023-08-22 10:38:41',1674350264389750786,1674350264389750786);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1693814923234189313,1685850705647194113,1692472339767234562,'0371',1,198.00,1,1692675704654,'2023-08-22 10:38:41','2023-10-26 14:00:08',1674350264389750786,NULL);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1693815623867506689,1683432288440897537,1686303222843662337,'010',2,1000.00,0,NULL,'2023-08-22 10:41:28','2023-08-26 03:48:30',1674350264389750786,1674350264389750786);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1693815623951392770,1685850371004649474,1686303222843662337,'010',0,49.00,0,NULL,'2023-08-22 10:41:28','2023-08-22 10:41:28',1674350264389750786,1674350264389750786);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1693815624114970626,1685894105234755585,1686303222843662337,'010',2,1.00,1,1692704857527,'2023-08-22 10:41:29','2023-10-17 09:55:30',1674350264389750786,NULL);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1694279289969152001,1683432288440897537,1692010607909900289,'023',2,1000.00,1,1692792962202,'2023-08-23 17:23:55','2023-08-23 20:37:09',1674350264389750786,NULL);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1694293275770982401,1692475107114487809,1692010607909900289,'023',2,10.00,1,1692792963574,'2023-08-23 18:19:30','2023-08-23 20:37:15',1674350264389750786,NULL);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1694322596350889986,1678727478181957634,1692010607909900289,'023',2,5.00,1,1692792964476,'2023-08-23 20:16:00','2023-08-23 20:37:17',1674350264389750786,NULL);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1694322596669657090,1685850705647194113,1692010607909900289,'023',2,198.00,1,1692792965365,'2023-08-23 20:16:00','2023-08-23 20:37:19',1674350264389750786,NULL);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1694336444920901634,1692475107114487809,1691733203794628609,'021',0,20.00,0,NULL,'2023-08-23 21:11:02','2023-08-23 21:11:02',NULL,NULL);
INSERT INTO `serve` (`id`, `serve_item_id`, `region_id`, `city_code`, `sale_status`, `price`, `is_hot`, `hot_time_stamp`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1715263395009191938,1685850705647194113,1686303222843662337,'010',2,17.00,0,1697794644978,'2023-10-20 07:08:10','2023-10-25 08:08:40',1674350264389750786,1674350264389750786);
/*!40000 ALTER TABLE `serve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serve_item`
--

DROP TABLE IF EXISTS `serve_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serve_item` (
  `id` bigint NOT NULL COMMENT '服务项id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务编码',
  `serve_type_id` bigint NOT NULL COMMENT '服务类型id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务名称',
  `serve_item_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务图标',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务图片',
  `unit` int NOT NULL COMMENT '服务数量单位',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务描述',
  `detail_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务详图',
  `reference_price` decimal(10,2) NOT NULL COMMENT '参考价格',
  `sort_num` int DEFAULT NULL COMMENT '排序字段',
  `active_status` int NOT NULL DEFAULT '0' COMMENT '活动状态，0：草稿，1禁用，2启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `名称唯一` (`name`),
  KEY `类型id` (`serve_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='服务项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serve_item`
--

LOCK TABLES `serve_item` WRITE;
/*!40000 ALTER TABLE `serve_item` DISABLE KEYS */;
INSERT INTO `serve_item` (`id`, `code`, `serve_type_id`, `name`, `serve_item_icon`, `img`, `unit`, `description`, `detail_img`, `reference_price`, `sort_num`, `active_status`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1678727478181957634,'1678727478190346240',1678654490336124929,'日常维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/8179d29c-6b85-4c08-aa13-08429a91d86a.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/9b87ab7c-9592-4090-9299-5bcf97409fb9.png',1,'测试服务','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/be1449d6-1c2d-4cca-9f8a-4b562b79998d.jpg',5.00,5,2,'2023-07-11 19:26:34','2023-08-23 16:21:58',1674350264389750786,NULL);
INSERT INTO `serve_item` (`id`, `code`, `serve_type_id`, `name`, `serve_item_icon`, `img`, `unit`, `description`, `detail_img`, `reference_price`, `sort_num`, `active_status`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1683432288440897537,'1683432288403148800',1678649931106705409,'厨卫维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/3cab9e4c-40e2-49a8-9b39-44ade6031ae3.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/0f2653d7-1d61-4014-9fc8-0c440f562eac.png',1,'不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了，动了麻烦不要动了，','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/8df4454f-4e42-4266-9bfc-34ef3f4d4443.jpg',1000.00,99,2,'2023-07-24 19:01:48','2023-08-22 10:39:05',1674350264389750786,NULL);
INSERT INTO `serve_item` (`id`, `code`, `serve_type_id`, `name`, `serve_item_icon`, `img`, `unit`, `description`, `detail_img`, `reference_price`, `sort_num`, `active_status`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1685850371004649474,'1685850370996260864',1678649931106705409,'开荒保洁','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/bd2f6ba2-68d8-4e7e-a1a8-2e9a5101e8da.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/d24573e9-d13c-416b-ade0-dc2e065ffaed.png',1,'','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/76badece-b053-492b-b6fa-0dce2dc70574.jpg',49.00,1,1,'2023-07-31 11:10:24','2023-08-23 16:48:48',1674350264389750786,NULL);
INSERT INTO `serve_item` (`id`, `code`, `serve_type_id`, `name`, `serve_item_icon`, `img`, `unit`, `description`, `detail_img`, `reference_price`, `sort_num`, `active_status`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1685850705647194113,'1685850705647194112',1678654490336124929,'空调维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c70042a9-89d4-44b9-a44a-0434e5fd3217.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/71460cfd-0f49-467f-923d-1f9a02912b81.png',4,'不要乱删 乱下架','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/9cb3bdb4-dfd9-489b-b660-d25dbcfbcbed.jpg',198.00,2,2,'2023-07-31 11:11:44','2023-08-22 19:21:12',1674350264389750786,NULL);
INSERT INTO `serve_item` (`id`, `code`, `serve_type_id`, `name`, `serve_item_icon`, `img`, `unit`, `description`, `detail_img`, `reference_price`, `sort_num`, `active_status`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1685894105234755585,'1685894105234755584',1678649931106705409,'日常保洁','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/072e4709-9be3-4df2-96ad-c3e2d5790556.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/aa6489e5-cd92-42f0-837a-952c99653b8b.png',1,'不要乱命名','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/18dca364-6b22-473c-a225-20954009c5b8.jpg',58.00,1,2,'2023-07-31 14:04:11','2023-08-22 10:39:11',1674350264389750786,NULL);
INSERT INTO `serve_item` (`id`, `code`, `serve_type_id`, `name`, `serve_item_icon`, `img`, `unit`, `description`, `detail_img`, `reference_price`, `sort_num`, `active_status`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1692475107114487809,'1692475107110293504',1692473174681194497,'安装窗帘','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4327bfd0-d4dc-4d1e-a634-8835b8fc62cb.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4860042d-bcf9-4b60-b308-fb574c058db9.png',5,'提供安装窗帘服务，量身打造，保证满意。','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/efe9b6e9-e518-4862-9595-6cce7b15f82a.png',10.00,1,2,'2023-08-18 17:53:04','2023-08-18 17:53:23',1674350264389750786,NULL);
/*!40000 ALTER TABLE `serve_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serve_sync`
--

DROP TABLE IF EXISTS `serve_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serve_sync` (
  `id` bigint NOT NULL COMMENT '服务id',
  `serve_item_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务项名称',
  `serve_type_id` bigint NOT NULL COMMENT '服务类型id',
  `serve_item_id` bigint NOT NULL COMMENT '服务项id',
  `city_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '城市编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `is_hot` int DEFAULT NULL COMMENT '是否为热门，0非热门，1热门',
  `hot_time_stamp` bigint DEFAULT NULL COMMENT '更新为热门的时间戳',
  `serve_item_sort_num` int DEFAULT NULL COMMENT '服务项排序字段',
  `serve_type_sort_num` int DEFAULT NULL COMMENT '服务类型排序字段',
  `serve_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '服务类型名称',
  `serve_type_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '服务类型图片',
  `serve_type_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '服务类型icon',
  `unit` int DEFAULT NULL COMMENT '服务数量单位',
  `detail_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '服务项详情图片',
  `serve_item_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '服务项图片',
  `serve_item_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '服务项图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='服务同步表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serve_sync`
--

LOCK TABLES `serve_sync` WRITE;
/*!40000 ALTER TABLE `serve_sync` DISABLE KEYS */;
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1686352662791016449,'日常维修',1678654490336124929,1678727478181957634,'010',5.00,1,1692256062300,6,2,'日常维修12','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/00ba6d8a-fd7e-4691-8415-8ada95004b33.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c8725882-1fa7-49a6-94ab-cac2530b3b7b.png',1,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/be1449d6-1c2d-4cca-9f8a-4b562b79998d.jpg','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/9b87ab7c-9592-4090-9299-5bcf97409fb9.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/8179d29c-6b85-4c08-aa13-08429a91d86a.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1686645112923312129,'空调维修',1678654490336124929,1685850705647194113,'010',9999.99,1,1692607117222,NULL,2,'日常维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/00ba6d8a-fd7e-4691-8415-8ada95004b33.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c8725882-1fa7-49a6-94ab-cac2530b3b7b.png',NULL,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/9cb3bdb4-dfd9-489b-b660-d25dbcfbcbed.jpg',NULL,NULL);
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1687401441778552834,'日常维修',1678654490336124929,1678727478181957634,'0997',5.00,NULL,NULL,6,2,'日常维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/00ba6d8a-fd7e-4691-8415-8ada95004b33.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c8725882-1fa7-49a6-94ab-cac2530b3b7b.png',1,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/be1449d6-1c2d-4cca-9f8a-4b562b79998d.jpg','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/9b87ab7c-9592-4090-9299-5bcf97409fb9.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/8179d29c-6b85-4c08-aa13-08429a91d86a.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1692475249121038338,'安装窗帘',1692473174681194497,1692475107114487809,'0371',10.00,NULL,NULL,2,4,'家居服务','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/6c4fe274-c91b-414e-bb44-3515b5d1fd98.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/98a0c76d-d9e5-4ad4-9d85-852fdb3bdaa2.png',5,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/efe9b6e9-e518-4862-9595-6cce7b15f82a.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4860042d-bcf9-4b60-b308-fb574c058db9.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4327bfd0-d4dc-4d1e-a634-8835b8fc62cb.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1693543106233835521,'安装窗帘',1692473174681194497,1692475107114487809,'010',10.00,1,NULL,1,4,'家居服务','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/6c4fe274-c91b-414e-bb44-3515b5d1fd98.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/98a0c76d-d9e5-4ad4-9d85-852fdb3bdaa2.png',5,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/efe9b6e9-e518-4862-9595-6cce7b15f82a.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4860042d-bcf9-4b60-b308-fb574c058db9.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4327bfd0-d4dc-4d1e-a634-8835b8fc62cb.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1693814922651181057,'日常维修',1678654490336124929,1678727478181957634,'0371',5.00,NULL,NULL,6,2,'日常维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/00ba6d8a-fd7e-4691-8415-8ada95004b33.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c8725882-1fa7-49a6-94ab-cac2530b3b7b.png',1,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/be1449d6-1c2d-4cca-9f8a-4b562b79998d.jpg','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/9b87ab7c-9592-4090-9299-5bcf97409fb9.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/8179d29c-6b85-4c08-aa13-08429a91d86a.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1693814923234189313,'空调维修',1678654490336124929,1685850705647194113,'0371',198.00,1,1692675704654,NULL,2,'日常维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/00ba6d8a-fd7e-4691-8415-8ada95004b33.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c8725882-1fa7-49a6-94ab-cac2530b3b7b.png',NULL,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/9cb3bdb4-dfd9-489b-b660-d25dbcfbcbed.jpg',NULL,NULL);
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1693815623867506689,'厨卫维修',1678649931106705409,1683432288440897537,'010',1000.00,NULL,NULL,100,1,'保洁清','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/90b5ecb9-034f-4afe-95f1-66ad73a517ee.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/0e687e39-19a6-4270-993c-01c626df5bad.png',1,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/8df4454f-4e42-4266-9bfc-34ef3f4d4443.jpg','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/0f2653d7-1d61-4014-9fc8-0c440f562eac.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/3cab9e4c-40e2-49a8-9b39-44ade6031ae3.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1693815623951392770,'开荒保洁',1678649931106705409,1685850371004649474,'010',49.00,NULL,NULL,2,1,'保洁清','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/90b5ecb9-034f-4afe-95f1-66ad73a517ee.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/0e687e39-19a6-4270-993c-01c626df5bad.png',1,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/76badece-b053-492b-b6fa-0dce2dc70574.jpg','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/d24573e9-d13c-416b-ade0-dc2e065ffaed.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/bd2f6ba2-68d8-4e7e-a1a8-2e9a5101e8da.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1693815624114970626,'日常保洁',1678649931106705409,1685894105234755585,'010',1.00,1,NULL,1,1,'保洁清','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/90b5ecb9-034f-4afe-95f1-66ad73a517ee.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/0e687e39-19a6-4270-993c-01c626df5bad.png',1,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/18dca364-6b22-473c-a225-20954009c5b8.jpg','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/aa6489e5-cd92-42f0-837a-952c99653b8b.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/072e4709-9be3-4df2-96ad-c3e2d5790556.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1694279289969152001,'厨卫维修',1678649931106705409,1683432288440897537,'023',1000.00,1,1692792962202,100,1,'保洁清','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/90b5ecb9-034f-4afe-95f1-66ad73a517ee.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/0e687e39-19a6-4270-993c-01c626df5bad.png',1,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/8df4454f-4e42-4266-9bfc-34ef3f4d4443.jpg','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/0f2653d7-1d61-4014-9fc8-0c440f562eac.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/3cab9e4c-40e2-49a8-9b39-44ade6031ae3.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1694293275770982401,'安装窗帘',1692473174681194497,1692475107114487809,'023',10.00,1,1692792963574,2,4,'家居服务','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/6c4fe274-c91b-414e-bb44-3515b5d1fd98.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/98a0c76d-d9e5-4ad4-9d85-852fdb3bdaa2.png',5,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/efe9b6e9-e518-4862-9595-6cce7b15f82a.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4860042d-bcf9-4b60-b308-fb574c058db9.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4327bfd0-d4dc-4d1e-a634-8835b8fc62cb.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1694322596350889986,'日常维修',1678654490336124929,1678727478181957634,'023',5.00,1,1692792964476,6,2,'日常维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/00ba6d8a-fd7e-4691-8415-8ada95004b33.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c8725882-1fa7-49a6-94ab-cac2530b3b7b.png',1,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/be1449d6-1c2d-4cca-9f8a-4b562b79998d.jpg','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/9b87ab7c-9592-4090-9299-5bcf97409fb9.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/8179d29c-6b85-4c08-aa13-08429a91d86a.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1694322596669657090,'空调维修',1678654490336124929,1685850705647194113,'023',198.00,0,1692792965365,3,2,'日常维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/00ba6d8a-fd7e-4691-8415-8ada95004b33.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c8725882-1fa7-49a6-94ab-cac2530b3b7b.png',4,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/9cb3bdb4-dfd9-489b-b660-d25dbcfbcbed.jpg','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/71460cfd-0f49-467f-923d-1f9a02912b81.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c70042a9-89d4-44b9-a44a-0434e5fd3217.png');
INSERT INTO `serve_sync` (`id`, `serve_item_name`, `serve_type_id`, `serve_item_id`, `city_code`, `price`, `is_hot`, `hot_time_stamp`, `serve_item_sort_num`, `serve_type_sort_num`, `serve_type_name`, `serve_type_img`, `serve_type_icon`, `unit`, `detail_img`, `serve_item_img`, `serve_item_icon`) VALUES (1694336444920901634,'安装窗帘',1692473174681194497,1692475107114487809,'021',20.00,NULL,NULL,2,4,'家居服务','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/6c4fe274-c91b-414e-bb44-3515b5d1fd98.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/98a0c76d-d9e5-4ad4-9d85-852fdb3bdaa2.png',5,'https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/efe9b6e9-e518-4862-9595-6cce7b15f82a.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4860042d-bcf9-4b60-b308-fb574c058db9.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/4327bfd0-d4dc-4d1e-a634-8835b8fc62cb.png');
/*!40000 ALTER TABLE `serve_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serve_type`
--

DROP TABLE IF EXISTS `serve_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serve_type` (
  `id` bigint NOT NULL COMMENT '服务类型id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务类型编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务类型名称',
  `serve_type_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务类型图标',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务类型图片',
  `sort_num` int DEFAULT NULL COMMENT '排序字段',
  `active_status` int NOT NULL DEFAULT '0' COMMENT '是否启用，0草稿,1禁用，2启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `名称唯一` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='服务类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serve_type`
--

LOCK TABLES `serve_type` WRITE;
/*!40000 ALTER TABLE `serve_type` DISABLE KEYS */;
INSERT INTO `serve_type` (`id`, `code`, `name`, `serve_type_icon`, `img`, `sort_num`, `active_status`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1678649931106705409,'1678649931106705408','保洁清','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/0e687e39-19a6-4270-993c-01c626df5bad.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/90b5ecb9-034f-4afe-95f1-66ad73a517ee.png',1,1,'2023-07-11 14:18:26','2023-08-23 16:14:21',1674350264389750786,NULL);
INSERT INTO `serve_type` (`id`, `code`, `name`, `serve_type_icon`, `img`, `sort_num`, `active_status`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1678654490336124929,'1678654490336124928','日常维修','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/c8725882-1fa7-49a6-94ab-cac2530b3b7b.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/00ba6d8a-fd7e-4691-8415-8ada95004b33.png',2,1,'2023-07-11 14:36:33','2023-08-03 16:32:05',1674350264389750786,NULL);
INSERT INTO `serve_type` (`id`, `code`, `name`, `serve_type_icon`, `img`, `sort_num`, `active_status`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES (1692473174681194497,'1692473174672805888','家居服务','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/98a0c76d-d9e5-4ad4-9d85-852fdb3bdaa2.png','https://yjy-xzbjzfw-oss.oss-cn-hangzhou.aliyuncs.com/6c4fe274-c91b-414e-bb44-3515b5d1fd98.png',4,1,'2023-08-18 17:45:23','2023-08-18 17:49:37',1674350264389750786,NULL);
/*!40000 ALTER TABLE `serve_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-27 22:48:21
