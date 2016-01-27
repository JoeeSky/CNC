/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : cnc

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2016-01-27 10:24:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cnc
-- ----------------------------
DROP TABLE IF EXISTS `cnc`;
CREATE TABLE `cnc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '公司名称',
  `description` text COMMENT '描述',
  `pinyin` varchar(100) NOT NULL COMMENT '公司拼音',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `contact` varchar(100) NOT NULL COMMENT '联系人',
  `email` varchar(100) NOT NULL COMMENT '邮件',
  `mobile` varchar(100) NOT NULL COMMENT '手机',
  `tel` varchar(100) DEFAULT '' COMMENT '固定电话',
  `verifystatus` int(10) unsigned DEFAULT '0' COMMENT '审核状态：0（未审核），1（审核通过），2（审核未通过）',
  `logo` varchar(200) DEFAULT '' COMMENT '公司logo',
  `url` varchar(200) DEFAULT NULL COMMENT '网站地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnc
-- ----------------------------
INSERT INTO `cnc` VALUES ('27', '明森', '数控工厂', 'mingsen', '天河长湴', '明森', '532456333@qq.com', '13899998888', '02038392345', '1', '', 'www.mingsen333.com');
INSERT INTO `cnc` VALUES ('28', '明森1', '数控工厂', 'mingsen1', '天河长湴', '明森', '532456@qq.com', '13899998888', '02038392345', '0', '', 'www.mingsen.com');
INSERT INTO `cnc` VALUES ('29', '明森2', '数控工厂', 'mingsen2', '天河长湴', '明森', '532456@qq.com', '13899998888', '02038392345', '0', '', 'www.mingsen.com');
INSERT INTO `cnc` VALUES ('30', '明森3', '数控工厂', 'mingsen3', '天河长湴', '明森', '532456@qq.com', '13899998888', '02038392345', '0', '', 'www.mingsen.com');
INSERT INTO `cnc` VALUES ('31', '明森4', '数控工厂', 'mingsen4', '天河长湴', '明森', '532456@qq.com', '13899998888', '02038392345', '0', '', 'www.mingsen.com');
INSERT INTO `cnc` VALUES ('32', '明森5', '数控工厂', 'mingsen5', '天河长湴', '明森', '532456@qq.com', '13899998888', '02038392345', '0', '', 'www.mingsen.com');

-- ----------------------------
-- Table structure for cnclog
-- ----------------------------
DROP TABLE IF EXISTS `cnclog`;
CREATE TABLE `cnclog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_desc` longtext NOT NULL,
  `event_table` longtext NOT NULL,
  `log_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7890F6EC437EC317` (`user_id`),
  CONSTRAINT `FK7890F6EC437EC317` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnclog
-- ----------------------------

-- ----------------------------
-- Table structure for cnctaskresult
-- ----------------------------
DROP TABLE IF EXISTS `cnctaskresult`;
CREATE TABLE `cnctaskresult` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SN` char(12) NOT NULL,
  `TASK_NAME` varchar(200) NOT NULL,
  `DEMANDER_ID` int(10) unsigned NOT NULL,
  `DEMANER_USER_ID` int(10) unsigned NOT NULL,
  `ISSUE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `MANUFACTURER_ID` int(10) unsigned NOT NULL,
  `STATUS` int(10) unsigned NOT NULL,
  `demander_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SN` (`SN`),
  KEY `FKBCF5E91AE23CE977` (`DEMANDER_ID`),
  KEY `FKBCF5E91ACACC4210` (`demander_user_id`),
  KEY `FKBCF5E91AC0EBF057` (`MANUFACTURER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnctaskresult
-- ----------------------------

-- ----------------------------
-- Table structure for cnctaskresultdetails
-- ----------------------------
DROP TABLE IF EXISTS `cnctaskresultdetails`;
CREATE TABLE `cnctaskresultdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) NOT NULL,
  `task_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `file_name` varchar(20) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `isdown` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnctaskresultdetails
-- ----------------------------

-- ----------------------------
-- Table structure for cnctaskresult_details
-- ----------------------------
DROP TABLE IF EXISTS `cnctaskresult_details`;
CREATE TABLE `cnctaskresult_details` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SN` char(12) NOT NULL,
  `TASK_ID` int(10) unsigned NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `TYPE` int(10) unsigned NOT NULL,
  `FILE_NAME` varchar(20) NOT NULL,
  `FILE_PATH` varchar(200) NOT NULL,
  `ISDOWN` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnctaskresult_details
-- ----------------------------

-- ----------------------------
-- Table structure for cnc_log
-- ----------------------------
DROP TABLE IF EXISTS `cnc_log`;
CREATE TABLE `cnc_log` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) unsigned NOT NULL,
  `LOG_DESC` varchar(1000) NOT NULL,
  `EVENT_TABLE` varchar(100) NOT NULL,
  `LOG_TIME` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnc_log
-- ----------------------------

-- ----------------------------
-- Table structure for demander
-- ----------------------------
DROP TABLE IF EXISTS `demander`;
CREATE TABLE `demander` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '公司名称',
  `description` text COMMENT '描述',
  `pinyin` varchar(100) NOT NULL COMMENT '公司拼音',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `contact` varchar(100) NOT NULL COMMENT '联系人',
  `email` varchar(100) NOT NULL COMMENT '邮件',
  `mobile` varchar(100) NOT NULL COMMENT '手机',
  `tel` varchar(100) DEFAULT NULL COMMENT '固定电话',
  `verifystatus` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态：0（未审核），1（审核通过），2（审核未通过）',
  `logo` varchar(0) DEFAULT NULL COMMENT '公司logo',
  `url` varchar(200) DEFAULT NULL COMMENT '网站地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demander
-- ----------------------------
INSERT INTO `demander` VALUES ('5', '需求商1', '需求商', 'xuqiushang1', '天河上面', '需求商1', '543217@qq.com', '13888888888', '02039384567', '1', null, 'www');
INSERT INTO `demander` VALUES ('6', '需求商2', '需求商', 'xuqiushang2', '天河上面', '需求商2', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `demander` VALUES ('7', '需求商3', '需求商', 'xuqiushang3', '天河上面', '需求商3', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `demander` VALUES ('8', '需求商4', '需求商', 'xuqiushang4', '天河上面', '需求商4', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `demander` VALUES ('9', '需求商5', '需求商', 'xuqiushang5', '天河上面', '需求商5', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `demander` VALUES ('10', '需求商6', '需求商', 'xuqiushang6', '天河上面', '需求商6', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `demander` VALUES ('11', '需求商7', '需求商', 'xuqiushang7', '天河隔壁', '需求商7', '567812345@qq.com', '13888888888', '02038399999', '0', '', 'www.www.www');

-- ----------------------------
-- Table structure for demanderlog
-- ----------------------------
DROP TABLE IF EXISTS `demanderlog`;
CREATE TABLE `demanderlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_desc` longtext NOT NULL,
  `event_table` longtext NOT NULL,
  `log_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD684B7CC437EC317` (`user_id`),
  CONSTRAINT `FKD684B7CC437EC317` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demanderlog
-- ----------------------------

-- ----------------------------
-- Table structure for demander_log
-- ----------------------------
DROP TABLE IF EXISTS `demander_log`;
CREATE TABLE `demander_log` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) unsigned NOT NULL,
  `LOG_DESC` varchar(1000) NOT NULL,
  `EVENT_TABLE` varchar(100) NOT NULL,
  `LOG_TIME` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demander_log
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `upperID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA9601F725F16500C` (`upperID`),
  CONSTRAINT `FKA9601F725F16500C` FOREIGN KEY (`upperID`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '部门1', null);
INSERT INTO `department` VALUES ('2', '部门2', '1');
INSERT INTO `department` VALUES ('3', '部门3', '1');
INSERT INTO `department` VALUES ('4', '部门4', '2');
INSERT INTO `department` VALUES ('5', '部门5', '2');
INSERT INTO `department` VALUES ('6', '部门6', '2');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `value` varchar(40) DEFAULT NULL,
  `wordGroup` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', 'mingsen', '明森管理员', 'companyType');
INSERT INTO `dict` VALUES ('2', 'cnc', 'CNC', 'companyType');
INSERT INTO `dict` VALUES ('3', 'demander', '需求方', 'companyType');
INSERT INTO `dict` VALUES ('4', 'manufacturer', '机加工', 'companyType');
INSERT INTO `dict` VALUES ('5', 'U', '可用', 'userStatus');
INSERT INTO `dict` VALUES ('6', 'N', '禁用', 'userStatus');
INSERT INTO `dict` VALUES ('7', 'D', '已删除', 'userStatus');
INSERT INTO `dict` VALUES ('8', 'true', '是', 'yesNo');
INSERT INTO `dict` VALUES ('9', 'false', '否', 'yesNo');
INSERT INTO `dict` VALUES ('10', 'U', '启用', 'funcStatus');
INSERT INTO `dict` VALUES ('11', 'N', '禁用', 'funcStatus');
INSERT INTO `dict` VALUES ('12', 'A', '无权限', 'funcStatus');
INSERT INTO `dict` VALUES ('13', 'U', '启用', 'requestStatus');
INSERT INTO `dict` VALUES ('14', 'N', '禁用', 'requestStatus');
INSERT INTO `dict` VALUES ('15', 'A', '无权限', 'requestStatus');

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of function
-- ----------------------------

-- ----------------------------
-- Table structure for manufacturelog
-- ----------------------------
DROP TABLE IF EXISTS `manufacturelog`;
CREATE TABLE `manufacturelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_desc` longtext NOT NULL,
  `event_table` longtext NOT NULL,
  `log_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1FEABEE3437EC317` (`user_id`),
  CONSTRAINT `FK1FEABEE3437EC317` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturelog
-- ----------------------------

-- ----------------------------
-- Table structure for manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '公司名称',
  `description` text COMMENT '描述',
  `pinyin` varchar(100) NOT NULL COMMENT '公司拼音',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `contact` varchar(100) NOT NULL COMMENT '联系人',
  `email` varchar(100) NOT NULL COMMENT '邮件',
  `mobile` varchar(100) NOT NULL COMMENT '手机',
  `tel` varchar(100) DEFAULT NULL COMMENT '固定电话',
  `verifystatus` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态：0（未审核），1（审核通过），2（审核未通过）',
  `logo` varchar(0) DEFAULT NULL COMMENT '公司logo',
  `url` varchar(200) DEFAULT NULL COMMENT '网站地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------
INSERT INTO `manufacturer` VALUES ('4', '制造商1', '制造商', 'zhizaoshang1', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `manufacturer` VALUES ('6', '制造商2', '制造商', 'zhizaoshang2', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '1', '', 'qqqq');
INSERT INTO `manufacturer` VALUES ('7', '制造商3', '制造商', 'zhizaoshang3', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `manufacturer` VALUES ('8', '制造商4', '制造商', 'zhizaoshang4', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `manufacturer` VALUES ('9', '制造商5', '制造商', 'zhizaoshang5', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '1', '', '');
INSERT INTO `manufacturer` VALUES ('10', '制造商6', '制造商', 'zhizaoshang6', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '2', '', '');

-- ----------------------------
-- Table structure for manufacturetask
-- ----------------------------
DROP TABLE IF EXISTS `manufacturetask`;
CREATE TABLE `manufacturetask` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SN` char(12) NOT NULL,
  `TASK_NAME` varchar(200) NOT NULL,
  `DEMANDER_ID` int(10) unsigned NOT NULL,
  `DEMANER_USER_ID` int(10) unsigned NOT NULL,
  `ISSUE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `MANUFACTURER_ID` int(10) unsigned NOT NULL,
  `STATUS` int(10) unsigned NOT NULL,
  `demander_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SN` (`SN`),
  KEY `FKDD7F19A6E23CE977` (`DEMANDER_ID`),
  KEY `FKDD7F19A6CACC4210` (`demander_user_id`),
  KEY `FKDD7F19A6C0EBF057` (`MANUFACTURER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturetask
-- ----------------------------

-- ----------------------------
-- Table structure for manufacturetaskdetails
-- ----------------------------
DROP TABLE IF EXISTS `manufacturetaskdetails`;
CREATE TABLE `manufacturetaskdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) NOT NULL,
  `task_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `file_name` varchar(20) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `isdown` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturetaskdetails
-- ----------------------------

-- ----------------------------
-- Table structure for manufacturetask_details
-- ----------------------------
DROP TABLE IF EXISTS `manufacturetask_details`;
CREATE TABLE `manufacturetask_details` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SN` char(12) NOT NULL,
  `TASK_ID` int(10) unsigned NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `TYPE` int(10) unsigned NOT NULL,
  `FILE_NAME` varchar(20) NOT NULL,
  `FILE_PATH` varchar(200) NOT NULL,
  `ISDOWN` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturetask_details
-- ----------------------------

-- ----------------------------
-- Table structure for manufacture_log
-- ----------------------------
DROP TABLE IF EXISTS `manufacture_log`;
CREATE TABLE `manufacture_log` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) unsigned NOT NULL,
  `LOG_DESC` varchar(1000) NOT NULL,
  `EVENT_TABLE` varchar(100) NOT NULL,
  `LOG_TIME` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacture_log
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `hasRead` bit(1) NOT NULL,
  `content` longtext,
  `receiver` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2015-01-31 22:55:48', '', '新增品牌<i>testtest</i>审核通过，审核人：张洪伟ppsh', '25');
INSERT INTO `message` VALUES ('2', '2015-02-01 00:00:41', '\0', '新增品牌[<i>test2</i>]审核通过。审核人：张洪伟ppsh 审核理由：可以增加，没问题', '25');
INSERT INTO `message` VALUES ('3', '2015-02-01 00:01:19', '\0', '新增品牌[<i>test3</i>]审核不通过。审核人：张洪伟ppsh 审核理由：这个不行。', '25');
INSERT INTO `message` VALUES ('4', '2015-02-01 00:04:17', '', '新增品牌[<i>testtt</i>]审核通过。审核人：齐德昱 审核理由：nikeyi', '32');
INSERT INTO `message` VALUES ('5', '2015-02-01 12:54:00', '', '申请客户[<i>csasc</i>]通过,审核流程：<br/>连惠琼;忽略;null-->李剑;忽略;null-->齐德昱;忽略;null-->曾总;通过;他更适合', '32');
INSERT INTO `message` VALUES ('6', '2015-02-01 12:54:00', '\0', '申请客户[<i>csasc</i>]不通过,审核流程：<br/>连惠琼;忽略;null-->李剑;忽略;null-->齐德昱;忽略;null-->曾总;不通过;他更适合', '34');
INSERT INTO `message` VALUES ('7', '2015-02-01 12:54:00', '\0', '申请客户[<i>csasc</i>]不通过,审核流程：<br/>李剑;忽略;null-->齐德昱;忽略;null-->曾总;不通过;他更适合', '33');
INSERT INTO `message` VALUES ('8', '2015-02-01 12:54:00', '\0', '申请客户[<i>csasc</i>]不通过,审核流程：<br/>李胜;忽略;null-->曾总;不通过;他更适合', '38');
INSERT INTO `message` VALUES ('9', '2015-02-01 13:01:37', '\0', '申请客户[<i>lhqlhq</i>]不通过,审核流程：<br/>连惠琼;忽略;null-->李剑;忽略;null-->齐德昱;通过;-->曾总;不通过;你不行', '34');
INSERT INTO `message` VALUES ('10', '2015-02-01 13:12:54', '', '申请客户[<i>test1都是</i>]通过,审核流程：<br/>连惠琼;忽略;-->李剑;忽略;-->齐德昱;忽略;-->曾总;通过;keyi', '32');
INSERT INTO `message` VALUES ('11', '2015-03-05 10:50:32', '', '申请客户[<i>lhqlhq</i>]不通过,审核流程：<br/>连惠琼;忽略;-->李剑;忽略;-->齐德昱;忽略;-->曾总;不通过;', '32');
INSERT INTO `message` VALUES ('12', '2015-03-05 10:51:40', '\0', '申请客户[<i>testtest</i>]不通过,审核流程：<br/>李剑;忽略;-->齐德昱;不通过;', '32');
INSERT INTO `message` VALUES ('13', '2015-03-05 19:41:25', '', '申请客户[<i>345222</i>]通过,审核流程：<br/>连惠琼;通过;而我-->齐德昱;通过;sdf', '32');
INSERT INTO `message` VALUES ('14', '2015-04-25 17:15:37', '\0', '新增品牌[<i>杨炯鑫</i>]审核不通过。审核人：hj123 审核理由：不值这个价', '42');
INSERT INTO `message` VALUES ('15', '2015-04-28 10:00:56', '\0', '新增品牌[<i>鞋子</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('16', '2015-04-29 10:39:32', '\0', '新增客户[<i>000000</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('17', '2015-04-29 14:24:09', '\0', '新增客户[<i>1111111</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('18', '2015-08-18 11:18:42', '\0', '新增客户[<i>111111</i>]审核通过。审核人：081806 审核理由：', '57');
INSERT INTO `message` VALUES ('19', '2015-08-18 11:31:10', '\0', '新增品牌[<i>加多宝</i>]审核通过。审核人：081809 审核理由：', '59');
INSERT INTO `message` VALUES ('20', '2015-08-18 11:50:45', '\0', '新增客户[<i>广东南方新视界</i>]审核通过。审核人：081806 审核理由：', '57');
INSERT INTO `message` VALUES ('21', '2015-08-18 11:50:54', '\0', '新增客户[<i>华南理工大学</i>]审核通过。审核人：081806 审核理由：', '57');
INSERT INTO `message` VALUES ('22', '2015-08-19 00:58:52', '\0', '修改客户[<i>今晚</i>]审核通过。审核人：081806 审核理由：', '1');
INSERT INTO `message` VALUES ('23', '2015-08-19 00:59:13', '\0', '新增客户[<i>rr </i>]审核通过。审核人：081806 审核理由：', '1');
INSERT INTO `message` VALUES ('24', '2015-08-19 09:46:49', '\0', '新增客户[<i>2015.08.12</i>]审核通过。审核人：081806 审核理由：', '52');
INSERT INTO `message` VALUES ('25', '2015-08-19 09:46:55', '\0', '修改客户[<i>1111111</i>]审核通过。审核人：081806 审核理由：', '1');
INSERT INTO `message` VALUES ('26', '2015-08-19 09:47:29', '\0', '新增客户[<i>ww</i>]审核通过。审核人：081806 审核理由：', '1');
INSERT INTO `message` VALUES ('27', '2015-08-19 10:04:07', '\0', '新增客户[<i>腾讯</i>]审核通过。审核人：领导2 审核理由：', '67');
INSERT INTO `message` VALUES ('28', '2015-08-19 10:04:12', '\0', '新增客户[<i>百度</i>]审核通过。审核人：领导2 审核理由：', '67');
INSERT INTO `message` VALUES ('29', '2015-08-19 10:04:17', '\0', '新增客户[<i>阿里巴巴</i>]审核通过。审核人：领导2 审核理由：', '67');
INSERT INTO `message` VALUES ('30', '2015-08-19 10:14:43', '\0', '申请客户[<i>百度</i>]不通过,审核流程：<br/>领导2;不通过;', '68');
INSERT INTO `message` VALUES ('31', '2015-08-19 10:19:24', '\0', '申请客户[<i>百度</i>]通过,审核流程：<br/>领导2;通过;-->领导1;通过;', '67');
INSERT INTO `message` VALUES ('32', '2015-08-24 15:41:37', '\0', '新增客户[<i>南方新视界</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('33', '2015-08-25 10:26:01', '\0', '新增客户[<i>华系</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('34', '2015-08-25 11:13:32', '\0', '修改品牌[<i>tett</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('35', '2015-08-25 11:13:40', '\0', '修改品牌[<i>tett</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('36', '2015-08-25 11:13:45', '\0', '修改品牌[<i>the last</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('37', '2015-08-25 11:13:59', '\0', '修改品牌[<i>2131</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('38', '2015-08-25 11:14:02', '\0', '修改品牌[<i>2131</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('39', '2015-08-25 23:50:08', '\0', '修改客户[<i>rr </i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('40', '2015-08-28 17:19:49', '', '新增品牌[<i>哈喽</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('41', '2015-08-28 17:20:40', '', '新增客户[<i>奔驰广州</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('42', '2015-08-28 17:21:29', '', '新增客户[<i>奔驰</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('43', '2015-08-28 17:21:33', '', '新增客户[<i>奔驰</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('45', '2015-09-09 11:15:09', '', '新增品牌[<i>腾讯</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('46', '2015-09-09 20:49:46', '', '新增客户[<i>哈哈哈哈哈哈哈啊啊啊啊啊啊啊啊啊啊</i>]审核通过。审核人：你猜我是谁 审核理由：过吧过吧过吧', '1');
INSERT INTO `message` VALUES ('47', '2015-09-09 21:14:14', '\0', '申请客户[<i>afsdddddsd</i>]通过,审核流程：<br/>领导2;通过;好哇好哇-->领导1;通过;不行不行哇', '67');
INSERT INTO `message` VALUES ('48', '2015-09-09 21:15:27', '\0', '申请客户[<i>lhqlhq</i>]通过,审核流程：<br/>领导2;忽略;-->领导1;通过;哈哈哈', '67');
INSERT INTO `message` VALUES ('49', '2015-09-09 23:54:09', '\0', '申请客户[<i>腾讯</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', '67');
INSERT INTO `message` VALUES ('50', '2015-09-09 23:54:09', '\0', '申请客户[<i>腾讯</i>]通过,审核流程：<br/>领导2;忽略;-->领导1;通过;', '68');
INSERT INTO `message` VALUES ('51', '2015-09-09 23:54:58', '\0', '申请客户[<i>阿里巴巴</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈', '67');
INSERT INTO `message` VALUES ('52', '2015-09-09 23:54:58', '\0', '申请客户[<i>阿里巴巴</i>]通过,审核流程：<br/>领导2;忽略;-->领导1;通过;哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈', '68');
INSERT INTO `message` VALUES ('53', '2015-09-14 14:13:24', '\0', '申请客户[<i>111111</i>]通过,审核流程：<br/>领导1;通过;', '67');
INSERT INTO `message` VALUES ('54', '2015-09-16 09:41:57', '\0', '新增品牌[<i>华为</i>]审核通过。审核人：你猜我是谁 审核理由：哈哈哈', '1');
INSERT INTO `message` VALUES ('55', '2015-09-16 10:09:27', '', '新增客户[<i>深圳华为</i>]审核通过。审核人：领导3 审核理由：', '80');
INSERT INTO `message` VALUES ('56', '2015-09-16 10:11:30', '\0', '新增客户[<i>彭伟华</i>]审核通过。审核人：领导3 审核理由：', '80');
INSERT INTO `message` VALUES ('57', '2015-09-16 14:56:15', '\0', '申请客户[<i>中午5</i>]通过,审核流程：<br/>领导2;通过;-->领导1;通过;', '68');
INSERT INTO `message` VALUES ('58', '2015-09-16 16:31:15', '\0', '新增客户[<i>彭伟华</i>]审核通过。审核人：你猜我是谁 审核理由：', '80');
INSERT INTO `message` VALUES ('59', '2015-09-16 16:31:15', '\0', '新增客户[<i>深圳华为</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('60', '2015-09-16 16:31:15', '\0', '新增客户[<i>深圳华为</i>]审核通过。审核人：你猜我是谁 审核理由：', '1');
INSERT INTO `message` VALUES ('61', '2015-10-17 11:29:25', '\0', '申请客户[<i>1111111</i>]不通过,审核流程：<br/>领导1;不通过;', '67');
INSERT INTO `message` VALUES ('62', '2015-11-25 16:11:04', '\0', '申请客户[<i>华南理工大学计算机系统研究生</i>]通过,审核流程：<br/>领导1;通过;1232143342734381723524313243542312543243123534313235343136452343113235324312532431324224354231245444', '70');
INSERT INTO `message` VALUES ('63', '2015-11-25 16:11:44', '\0', '申请客户[<i>彭伟华</i>]不通过,审核流程：<br/>领导3;忽略;-->领导2;不通过;1232544556678789787654321133456789654321324345765643221334567786754324323234546787654321234356766534', '80');
INSERT INTO `message` VALUES ('64', '2015-12-02 10:32:27', '\0', '申请客户[<i>111111</i>]不通过,审核流程：<br/>领导2;通过;通过哈-->领导1;不通过;', '75');
INSERT INTO `message` VALUES ('65', '2015-12-02 10:32:27', '\0', '申请客户[<i>111111</i>]通过,审核流程：<br/>领导1;通过;', '70');
INSERT INTO `message` VALUES ('66', '2015-12-02 10:33:06', '\0', '申请客户[<i>000000</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;给你', '75');
INSERT INTO `message` VALUES ('67', '2015-12-02 10:33:06', '\0', '申请客户[<i>000000</i>]通过,审核流程：<br/>领导1;通过;给你', '70');
INSERT INTO `message` VALUES ('68', '2015-12-02 10:51:34', '\0', '申请客户[<i>1111111</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', '75');
INSERT INTO `message` VALUES ('69', '2015-12-02 10:51:34', '\0', '申请客户[<i>1111111</i>]通过,审核流程：<br/>领导1;通过;', '70');
INSERT INTO `message` VALUES ('70', '2015-12-03 09:28:48', '\0', '申请客户[<i>1123</i>]通过,审核流程：<br/>领导2;通过;-->领导1;通过;', '75');
INSERT INTO `message` VALUES ('71', '2015-12-03 09:28:48', '\0', '申请客户[<i>1123</i>]不通过,审核流程：<br/>领导1;不通过;', '70');
INSERT INTO `message` VALUES ('72', '2015-12-03 09:52:11', '\0', '申请客户[<i>testtest</i>]通过,审核流程：<br/>领导1;通过;', '70');
INSERT INTO `message` VALUES ('73', '2015-12-03 09:52:11', '\0', '申请客户[<i>testtest</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', '75');
INSERT INTO `message` VALUES ('74', '2015-12-03 09:52:38', '\0', '申请客户[<i>testtt</i>]通过,审核流程：<br/>领导1;通过;', '70');
INSERT INTO `message` VALUES ('75', '2015-12-03 09:52:38', '\0', '申请客户[<i>testtt</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', '75');
INSERT INTO `message` VALUES ('76', '2015-12-03 09:52:54', '\0', '申请客户[<i>tyyy</i>]通过,审核流程：<br/>领导1;通过;', '70');
INSERT INTO `message` VALUES ('77', '2015-12-03 09:52:54', '\0', '申请客户[<i>tyyy</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', '75');
INSERT INTO `message` VALUES ('78', '2015-12-03 09:53:32', '\0', '申请客户[<i>中午2</i>]不通过,审核流程：<br/>领导1;不通过;', '67');
INSERT INTO `message` VALUES ('79', '2015-12-03 09:53:32', '\0', '申请客户[<i>中午2</i>]通过,审核流程：<br/>领导1;通过;', '70');
INSERT INTO `message` VALUES ('80', '2015-12-03 09:53:32', '\0', '申请客户[<i>中午2</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', '75');
INSERT INTO `message` VALUES ('81', '2015-12-11 20:03:45', '\0', '申请客户[<i>的沙</i>]通过,审核流程：<br/>领导2;通过;-->领导1;通过;', '75');

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `name` varchar(50) NOT NULL COMMENT '页面名称',
  `url` varchar(100) NOT NULL COMMENT '页面的url',
  `parentName` varchar(20) NOT NULL COMMENT '页面在左侧菜单中分父菜单',
  `sortOrder` int(10) unsigned NOT NULL DEFAULT '20' COMMENT '页面在左侧导航中列出的顺序',
  `companyTypes` varchar(100) NOT NULL COMMENT '可以访问页面的公司类型，多种类型用逗号分隔，如cnc,demander',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='页面表';

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', '用户列表', 'userManage/list', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('2', '添加用户', 'userManage/addInput', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('3', '上传G代码任务', 'programTask/uploadProgramTask', 'G代码', '20', 'mingsen');
INSERT INTO `page` VALUES ('4', 'G代码任务列表', 'programTask/programTaskList', 'G代码', '20', 'mingsen');
INSERT INTO `page` VALUES ('5', '接收G代码任务', 'programTask/acceptProgramTask', 'G代码', '20', 'mingsen');
INSERT INTO `page` VALUES ('6', '上传机加工任务', 'manufacturerTask/uploadManufacturerTask', '机加工', '20', 'mingsen');
INSERT INTO `page` VALUES ('7', '机加工任务列表', 'manufacturerTask/manufacturerTaskList', '机加工', '20', 'mingsen');
INSERT INTO `page` VALUES ('8', '接收机加工任务', 'manufacturerTask/acceptManufacturerTask', '机加工', '20', 'mingsen');
INSERT INTO `page` VALUES ('9', '修改用户', 'userManage/updateInput', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('10', '角色列表', 'role/list', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('11', '角色详细信息', 'role/info', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('12', '添加角色', 'role/addInput', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('13', '修改角色', 'role/updateInput', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('14', '用户详细信息', 'userManage/info', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('15', '功能列表', 'function/list', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('16', '分配功能', 'role/grantInput', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('17', '请求列表', 'request/list', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('18', '请求详细信息', 'request/info', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('19', '功能详细信息', 'function/info', '用户管理', '20', 'mingsen');
INSERT INTO `page` VALUES ('20', '注册', 'register/add', '注册', '20', 'mingsen');
INSERT INTO `page` VALUES ('21', '公司审核', 'verify/list', '公司信息', '20', 'mingsen');
INSERT INTO `page` VALUES ('22', '数控工厂信息（无效）', 'verify/cncInfo', '公司信息', '20', 'mingsen');
INSERT INTO `page` VALUES ('23', '需求商信息（无效）', 'verify/demanderInfo', '公司信息', '20', 'mingsen');
INSERT INTO `page` VALUES ('24', '制造商信息（无效）', 'verify/manufacturerInfo', '公司信息', '20', 'mingsen');
INSERT INTO `page` VALUES ('25', '编辑CNC信息', 'editInfo/cncInfo', '公司信息', '20', 'mingsen');
INSERT INTO `page` VALUES ('26', '编辑需求商信息', 'editInfo/demanderInfo', '公司信息', '20', 'mingsen');
INSERT INTO `page` VALUES ('27', '编辑制造商信息', 'editInfo/manufacturerInfo', '公司信息', '20', 'mingsen');

-- ----------------------------
-- Table structure for programtask
-- ----------------------------
DROP TABLE IF EXISTS `programtask`;
CREATE TABLE `programtask` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SN` char(12) NOT NULL,
  `TASK_NAME` varchar(200) NOT NULL,
  `DEMANER_USER_ID` int(11) unsigned NOT NULL,
  `DEMANDER_ID` int(11) unsigned NOT NULL,
  `ISSUE_TIME` datetime NOT NULL,
  `MODIFY_TIME` datetime NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `PROGRAMMER_ID` int(11) unsigned NOT NULL,
  `STATUS` int(11) unsigned NOT NULL,
  `demander_user_id` int(11) DEFAULT NULL,
  `manufacturer_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK9FB419E9E23CE977` (`DEMANDER_ID`),
  KEY `FK9FB419E9CACC4210` (`demander_user_id`),
  KEY `FK9FB419E9C0EBF057` (`manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programtask
-- ----------------------------

-- ----------------------------
-- Table structure for programtaskattachment
-- ----------------------------
DROP TABLE IF EXISTS `programtaskattachment`;
CREATE TABLE `programtaskattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) NOT NULL,
  `task_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `file_name` varchar(20) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programtaskattachment
-- ----------------------------

-- ----------------------------
-- Table structure for programtaskdetails
-- ----------------------------
DROP TABLE IF EXISTS `programtaskdetails`;
CREATE TABLE `programtaskdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) NOT NULL,
  `task_id` int(11) NOT NULL,
  `type` longtext NOT NULL,
  `drawing_name` longtext NOT NULL,
  `drawing_path` longtext NOT NULL,
  `description` longtext NOT NULL,
  `picture_2d_1` longblob NOT NULL,
  `pic_description_1` longtext NOT NULL,
  `picture_2d_2` longblob NOT NULL,
  `pic_description_2` longtext NOT NULL,
  `picture_2d_3` longblob NOT NULL,
  `pic_description_3` longtext NOT NULL,
  `picture_2d_4` longblob NOT NULL,
  `pic_description_4` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programtaskdetails
-- ----------------------------

-- ----------------------------
-- Table structure for programtask_attachment
-- ----------------------------
DROP TABLE IF EXISTS `programtask_attachment`;
CREATE TABLE `programtask_attachment` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SN` char(12) NOT NULL,
  `TASK_ID` int(10) unsigned NOT NULL,
  `TYPE` int(10) unsigned NOT NULL,
  `FILE_NAME` varchar(20) NOT NULL,
  `FILE_PATH` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programtask_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for programtask_details
-- ----------------------------
DROP TABLE IF EXISTS `programtask_details`;
CREATE TABLE `programtask_details` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SN` char(12) NOT NULL,
  `TASK_ID` int(10) unsigned NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `DRAWING_NAME` varchar(100) NOT NULL,
  `DRAWING_PATH` varchar(200) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `PICTURE_2D_1` blob NOT NULL,
  `PIC_DESCRIPTION_1` varchar(200) NOT NULL,
  `PICTURE_2D_2` blob NOT NULL,
  `PIC_DESCRIPTION_2` varchar(200) NOT NULL,
  `PICTURE_2D_3` blob NOT NULL,
  `PIC_DESCRIPTION_3` varchar(200) NOT NULL,
  `PICTURE_2D_4` blob NOT NULL,
  `PIC_DESCRIPTION_4` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programtask_details
-- ----------------------------

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `url` varchar(50) NOT NULL,
  `parentName` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '用户列表', 'userManage/userList', '用户管理');
INSERT INTO `resource` VALUES ('2', '添加用户', 'userManage/userAdd', '用户管理');
INSERT INTO `resource` VALUES ('3', '上传G代码任务', 'programTask/uploadProgramTask', 'G代码');
INSERT INTO `resource` VALUES ('4', 'G代码任务列表', 'programTask/programTaskList', 'G代码');
INSERT INTO `resource` VALUES ('5', '接收G代码任务', 'programTask/acceptProgramTask', 'G代码');
INSERT INTO `resource` VALUES ('6', '上传机加工任务', 'manufacturerTask/uploadManufacturerTask', '机加工');
INSERT INTO `resource` VALUES ('7', '机加工任务列表', 'manufacturerTask/manufacturerTaskList', '机加工');
INSERT INTO `resource` VALUES ('8', '接收机加工任务', 'manufacturerTask/acceptManufacturerTask', '机加工');
INSERT INTO `resource` VALUES ('9', '注册', 'register/add', '注册');
INSERT INTO `resource` VALUES ('10', '公司审核', 'verify/list', '公司审核');
INSERT INTO `resource` VALUES ('11', '数控工厂信息', 'verify/cncInfo', '公司信息');
INSERT INTO `resource` VALUES ('12', '需求商信息', 'verify/demanderInfo', '公司信息');
INSERT INTO `resource` VALUES ('13', '制造商信息', 'verify/manufacturerInfo', '公司信息');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `companyType` varchar(20) NOT NULL COMMENT '公司类型',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `enable` tinyint(1) NOT NULL COMMENT '是否启用',
  `sortOrder` int(6) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', 'mingsen', '', '1', '20');
INSERT INTO `role` VALUES ('2', '管理员', 'demander', '', '1', '20');
INSERT INTO `role` VALUES ('3', '业务员', 'manufacturer', '', '1', '20');
INSERT INTO `role` VALUES ('4', '领导', 'cnc', '', '1', '20');
INSERT INTO `role` VALUES ('5', '品牌创建修改人员', 'manufacturer', '', '1', '20');
INSERT INTO `role` VALUES ('6', '品牌审核人员', 'cnc', '', '1', '20');
INSERT INTO `role` VALUES ('8', '财务', 'cnc', 'xxxxx', '1', '21');
INSERT INTO `role` VALUES ('9', '财务财务', 'mingsen', 'xcs', '1', '22');
INSERT INTO `role` VALUES ('10', '清洁人员', 'cnc', '打扫卫生，煮饭', '1', '24');

-- ----------------------------
-- Table structure for rolefunction
-- ----------------------------
DROP TABLE IF EXISTS `rolefunction`;
CREATE TABLE `rolefunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `functionId` int(11) NOT NULL,
  `identify` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEA35D68E8B5D6188` (`functionId`),
  CONSTRAINT `FKEA35D68E8B5D6188` FOREIGN KEY (`functionId`) REFERENCES `function` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolefunction
-- ----------------------------

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `role_id` smallint(6) NOT NULL,
  `resource_id` smallint(6) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('1', '1', '1');
INSERT INTO `role_resource` VALUES ('1', '2', '2');
INSERT INTO `role_resource` VALUES ('1', '3', '3');
INSERT INTO `role_resource` VALUES ('1', '4', '4');
INSERT INTO `role_resource` VALUES ('1', '5', '5');
INSERT INTO `role_resource` VALUES ('1', '6', '6');
INSERT INTO `role_resource` VALUES ('1', '7', '7');
INSERT INTO `role_resource` VALUES ('1', '8', '8');
INSERT INTO `role_resource` VALUES ('1', '9', '9');
INSERT INTO `role_resource` VALUES ('1', '10', '10');
INSERT INTO `role_resource` VALUES ('1', '11', '11');
INSERT INTO `role_resource` VALUES ('1', '12', '12');
INSERT INTO `role_resource` VALUES ('1', '13', '13');

-- ----------------------------
-- Table structure for systemlog
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_desc` longtext NOT NULL,
  `event_table` longtext NOT NULL,
  `log_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBABEF675437EC317` (`user_id`),
  CONSTRAINT `FKBABEF675437EC317` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemlog
-- ----------------------------

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) unsigned NOT NULL,
  `LOG_DESC` varchar(1000) NOT NULL,
  `EVENT_TABLE` varchar(100) NOT NULL,
  `LOG_TIME` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_log
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '用户名称，用于显示用户',
  `status` char(1) NOT NULL COMMENT '用户状态：U（可用），N（禁用），D（删除）',
  `cellphone` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT '邮件',
  `roleId` int(10) unsigned NOT NULL COMMENT '角色id',
  `companyId` int(10) unsigned NOT NULL COMMENT '公司id',
  `companyType` varchar(20) NOT NULL COMMENT '公司类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `FK285FEB9E53FF37` (`roleId`),
  KEY `FK285FEB1519B1C4` (`roleId`),
  CONSTRAINT `FK285FEB1519B1C4` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '你猜我是谁', 'U', '', null, '1', '0', 'mingsen');
INSERT INTO `user` VALUES ('3', 'lhq', 'lhq', '连惠琼', 'U', 'csasc@163.com', 'csasc@163.com', '2', '0', '0');
INSERT INTO `user` VALUES ('4', 'test', '123456', 'test', 'U', 'sdaf', '', '4', '0', '0');
INSERT INTO `user` VALUES ('5', 'yy', '123', 'vv', 'U', '', '', '3', '0', '0');
INSERT INTO `user` VALUES ('6', 'testtest', '123456', '张三', 'U', '', '', '3', '0', '0');
INSERT INTO `user` VALUES ('9', '而二', '123456', '热热', 'U', '二', '而', '3', '0', '0');
INSERT INTO `user` VALUES ('12', 'afds', '123456', 'asdffffffffdafsdfsdf', 'U', 'dfasafdsssssssssssss', 'dfas', '4', '0', '0');
INSERT INTO `user` VALUES ('15', '232323', '123456', 'dafsadfadsf', 'U', 'daf', 'sdaf', '4', '0', '0');
INSERT INTO `user` VALUES ('16', 'test111', '1234', '张洪伟', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('17', 'test33', 'test', '张宏伟', 'U', null, null, '5', '0', '0');
INSERT INTO `user` VALUES ('18', 'test44', '123', '张洪伟', 'U', null, null, '6', '0', '0');
INSERT INTO `user` VALUES ('19', '大法师', '123', '大师傅', 'U', null, null, '5', '0', '0');
INSERT INTO `user` VALUES ('20', '阿范德萨', '123456', '发大水', 'U', null, null, '5', '0', '0');
INSERT INTO `user` VALUES ('21', 'sale12', 'sale12', 'dsfa', 'U', null, 'we', '3', '0', '0');
INSERT INTO `user` VALUES ('22', 'test_adm', 'zhw', '张洪伟', 'U', '123456', 'hello@qq.com', '2', '0', '0');
INSERT INTO `user` VALUES ('23', 'test_yewuyuan', 'zhw', '张洪伟', 'U', '123', 'hello@126.com', '3', '0', '0');
INSERT INTO `user` VALUES ('24', 'test_lingdao', 'zhw', '张洪伟', 'U', null, 'hello', '4', '0', '0');
INSERT INTO `user` VALUES ('25', 'test_ppcj', 'zhw', '张洪伟ppcj', 'U', null, null, '5', '0', '0');
INSERT INTO `user` VALUES ('26', 'test_ppsh', 'zhw', '张洪伟ppsh', 'U', '123456789', 'hello@163.com', '6', '0', '0');
INSERT INTO `user` VALUES ('28', '手动阀手动阀啊是的发生地方士大夫啊四大是', '123', '是是', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('29', 'ld_lhq', 'zhw', '连惠琼', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('30', 'ld_zhw', 'zhw', '张洪伟', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('31', 'ld_lj', 'zhw', '李剑', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('32', 'ywy_zhw', 'zhw', '张洪伟', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('33', 'ywy_pxg', 'zhw', '彭雄冠', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('34', 'ywy_hj', 'zhw', '胡军', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('35', 'ld_ls', 'zhw', '李胜', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('36', 'ld_qdy', 'zhw', '齐德昱', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('37', 'ld_zz', 'zhw', '曾总', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('38', 'ywy_lqb', 'zhw', '李启邦', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('39', 'yes', '123456', 'yes1', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('40', 'yes2', '123456', 'yes2', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('41', 'yes3', '123456', 'yes3', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('42', 'hj', '123456', '123456', 'U', '1345679462536', '835564874@qq.com', '5', '0', '0');
INSERT INTO `user` VALUES ('43', 'hj123', '123456', 'hj123', 'U', null, null, '6', '0', '0');
INSERT INTO `user` VALUES ('44', 'user1', '123456', '用户1', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('45', 'aaa', '123456', 'aaa', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('48', 'bbb', '123456', 'bbb', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('49', 'ad', '123456', 'ad', 'U', '18888888888', 'XXXXXXXX163.com', '2', '0', '0');
INSERT INTO `user` VALUES ('50', 'ads', '123456', 'ads', 'U', '18888888888', 'XXXXXXXXXX163.com', '2', '0', '0');
INSERT INTO `user` VALUES ('51', '999999', '123456', '999999', 'U', null, null, '2', '0', '0');
INSERT INTO `user` VALUES ('52', '111111', '123456', '111111', 'U', '123456789', '123456@163.com', '3', '0', '0');
INSERT INTO `user` VALUES ('53', '1', '123456', '1', 'U', '1', '1', '2', '0', '0');
INSERT INTO `user` VALUES ('54', '121212', '123456', '11212', 'U', '1', '1', '2', '0', '0');
INSERT INTO `user` VALUES ('55', '121212633', '123456', '11212', 'U', '1', '1', '2', '0', '0');
INSERT INTO `user` VALUES ('56', '81801', '123456', '81801', 'U', null, null, '2', '0', '0');
INSERT INTO `user` VALUES ('57', '081802', '123456', '081802', 'N', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('58', '081803', '123456', '081803', 'N', null, null, '2', '0', '0');
INSERT INTO `user` VALUES ('59', '081804', '123456', '081804', 'N', null, null, '5', '0', '0');
INSERT INTO `user` VALUES ('60', '081805', '123456', '081805', 'U', null, null, '2', '0', '0');
INSERT INTO `user` VALUES ('61', '081801', '123456', '081801', 'U', '13549537253', '222@qq.com', '2', '0', 'cnc');
INSERT INTO `user` VALUES ('62', '081806', '123456', '081806', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('63', '081807', '123456', '081807', 'U', null, '123423423', '6', '0', '0');
INSERT INTO `user` VALUES ('64', '081808', '123456', '081808', 'U', null, null, '6', '0', '0');
INSERT INTO `user` VALUES ('65', '081809', '123456', '081809', 'U', null, null, '6', '0', '0');
INSERT INTO `user` VALUES ('66', '李胜', '123456', '李胜', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('67', '业务员1', '123456', '业务员1', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('68', '业务员2', '123456', '业务员2', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('69', '领导1', '123456', '领导1', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('70', '领导2', '123456', '领导2', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('71', '品牌创建人1', '123456', '品牌创建人1', 'U', null, null, '5', '0', '0');
INSERT INTO `user` VALUES ('72', '品牌创建人2', '123456', '品牌创建人2', 'U', null, null, '5', '0', '0');
INSERT INTO `user` VALUES ('73', '品牌审核人1', '123456', '品牌审核人1', 'U', null, null, '6', '0', '0');
INSERT INTO `user` VALUES ('74', '品牌审核人2', '123456', '品牌审核人2', 'U', null, null, '2', '0', '0');
INSERT INTO `user` VALUES ('75', '领导3', '123456', '领导3', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('76', '`12342321', '123456', '232432', 'U', null, null, '5', '0', '0');
INSERT INTO `user` VALUES ('77', '124321', '123456', '1323433', 'U', null, null, '4', '0', '0');
INSERT INTO `user` VALUES ('78', '哈喽', '123456', '哈喽', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('79', 'hujun123', '123456', '胡军123', 'U', '2134356643', '1233434546432', '3', '0', '0');
INSERT INTO `user` VALUES ('80', '彭伟华', '123456', '彭伟华', 'U', null, '11233544443267543217655432111111111111@qq.com', '3', '0', '0');
INSERT INTO `user` VALUES ('81', '123', '123456', '123', 'U', null, null, '3', '0', '0');
INSERT INTO `user` VALUES ('82', '1111', '123456', '1111', 'U', null, null, '2', '0', '0');
INSERT INTO `user` VALUES ('83', 'Mary1', '123456', 'Mary1', 'U', '123455', '443@qq.com', '3', '1', 'manufacturer');
INSERT INTO `user` VALUES ('87', 'mingsen', '123456', '明森', 'U', '13899998888', '532456@qq.com', '1', '27', '数控工厂');
INSERT INTO `user` VALUES ('88', 'zhizaoshang2', '123456', '制造商2', 'U', '13888888888', '543217890@qq.com', '1', '6', '制造商');
INSERT INTO `user` VALUES ('89', 'zhizaoshang5', '123456', '制造商5', 'U', '13888888888', '543217890@qq.com', '1', '9', '制造商');
