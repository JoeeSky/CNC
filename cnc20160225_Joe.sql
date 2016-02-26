/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : cnc

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2016-02-25 09:01:58
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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnc
-- ----------------------------
INSERT INTO `cnc` VALUES ('27', '明森', '数控工厂', 'mingsen', '天河长湴', '明森', '532456333@qq.com', '13899998888', '02038392345', '1', '', 'www.mingsen333.com');
INSERT INTO `cnc` VALUES ('28', '明森1', '数控工厂', 'mingsen1', '天河长湴', '明森', '532456@qq.com', '13899998888', '02038392345', '1', '', 'www.mingsen.com');
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
-- Table structure for demander
-- ----------------------------
DROP TABLE IF EXISTS `demander`;
CREATE TABLE `demander` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` longtext,
  `pinyin` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `verifystatus` int(11) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demander
-- ----------------------------
INSERT INTO `demander` VALUES ('1', '需求方1', null, '', '', '', '', '', null, '0', null, null);
INSERT INTO `demander` VALUES ('2', '需求方2', null, '', '', '', '', '', null, '0', null, null);
INSERT INTO `demander` VALUES ('3', '需求方3', null, '', '', '', '', '', null, '0', null, null);
INSERT INTO `demander` VALUES ('5', '需求商1', '需求商', 'xuqiushang1', '天河上面', '需求商1', '543217@qq.com', '13888888888', '02039384567', '1', null, 'www');
INSERT INTO `demander` VALUES ('6', '需求商2', '需求商', 'xuqiushang2', '天河上面', '需求商2', '543217890@qq.com', '13888888888', '02039384567', '1', '', '');
INSERT INTO `demander` VALUES ('7', '需求商3', '需求商', 'xuqiushang3', '天河上面', '需求商3', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `demander` VALUES ('8', '需求商4', '需求商', 'xuqiushang4', '天河上面', '需求商4', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `demander` VALUES ('9', '需求商5', '需求商', 'xuqiushang5', '天河上面', '需求商5', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `demander` VALUES ('10', '需求商6', '需求商', 'xuqiushang6', '天河上面', '需求商6', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `demander` VALUES ('11', '需求商7', '需求商', 'xuqiushang7', '天河隔壁', '需求商7', '567812345@qq.com', '13888888888', '02038399999', '2', '', 'www.www.www');

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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典项id',
  `name` varchar(40) DEFAULT NULL COMMENT '字典项名称',
  `value` varchar(40) DEFAULT NULL COMMENT '字典项值',
  `wordGroup` varchar(20) DEFAULT NULL COMMENT '字典项组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='字典表';

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
INSERT INTO `dict` VALUES ('13', 'U', '启用', 'requestStatus');
INSERT INTO `dict` VALUES ('14', 'N', '禁用', 'requestStatus');
INSERT INTO `dict` VALUES ('15', 'freeAccessFunctionId', '27', 'system');
INSERT INTO `dict` VALUES ('16', 'tryUserRoleId', '11', 'system');
INSERT INTO `dict` VALUES ('17', 'initialPassword', '123456', 'system');

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `parentId` int(11) DEFAULT NULL COMMENT '父功能（模块）id',
  `name` varchar(20) DEFAULT NULL COMMENT '功能名',
  `description` varchar(200) DEFAULT NULL COMMENT '功能描述',
  `status` varchar(1) DEFAULT NULL COMMENT '功能状态（U：启用，N：禁用，D删除，A无权限）',
  `sortOrder` int(11) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='功能表';

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES ('1', '0', '用户', ' ', 'U', '20');
INSERT INTO `function` VALUES ('2', '0', '角色', '', 'U', '20');
INSERT INTO `function` VALUES ('3', '1', '增加', '', 'U', '20');
INSERT INTO `function` VALUES ('4', '1', '查询', '', 'U', '21');
INSERT INTO `function` VALUES ('5', '1', '修改', '', 'U', '22');
INSERT INTO `function` VALUES ('6', '1', '删除', '', 'U', '23');
INSERT INTO `function` VALUES ('7', '2', '增加', '', 'U', '20');
INSERT INTO `function` VALUES ('8', '2', '查询', '', 'U', '20');
INSERT INTO `function` VALUES ('9', '2', '修改', '', 'U', '20');
INSERT INTO `function` VALUES ('10', '2', '删除', '', 'U', '20');
INSERT INTO `function` VALUES ('11', '0', '功能', '', 'U', '20');
INSERT INTO `function` VALUES ('12', '0', '请求', '', 'U', '20');
INSERT INTO `function` VALUES ('13', '0', '菜单', '', 'U', '20');
INSERT INTO `function` VALUES ('14', '11', '增加', '', 'U', '20');
INSERT INTO `function` VALUES ('15', '11', '查询', '', 'U', '20');
INSERT INTO `function` VALUES ('16', '11', '修改', '', 'U', '20');
INSERT INTO `function` VALUES ('17', '11', '删除', '', 'U', '20');
INSERT INTO `function` VALUES ('18', '12', '增加', '', 'U', '20');
INSERT INTO `function` VALUES ('19', '12', '查询', '', 'U', '20');
INSERT INTO `function` VALUES ('20', '12', '修改', '', 'U', '20');
INSERT INTO `function` VALUES ('21', '12', '删除', '', 'U', '20');
INSERT INTO `function` VALUES ('22', '13', '增加', '', 'U', '20');
INSERT INTO `function` VALUES ('23', '13', '查询', '', 'U', '20');
INSERT INTO `function` VALUES ('24', '13', '修改', '', 'U', '20');
INSERT INTO `function` VALUES ('25', '13', '删除', '', 'U', '20');
INSERT INTO `function` VALUES ('26', '0', '通用', '', 'U', '20');
INSERT INTO `function` VALUES ('27', '26', '不需要权限', '', 'U', '20');
INSERT INTO `function` VALUES ('28', '2', '分配功能', '', 'U', '23');
INSERT INTO `function` VALUES ('29', '0', '测试', '', 'U', '20');
INSERT INTO `function` VALUES ('30', '29', '测试session', '', 'U', '20');
INSERT INTO `function` VALUES ('31', '26', '必无此功能', '', 'U', '20');
INSERT INTO `function` VALUES ('32', '33', '公司注册', null, 'U', '20');
INSERT INTO `function` VALUES ('33', '0', '公司管理', null, 'U', '20');
INSERT INTO `function` VALUES ('34', '33', '公司审核', null, 'U', '20');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` longtext,
  `pinyin` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `verifystatus` int(11) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------
INSERT INTO `manufacturer` VALUES ('1', '机加工1', null, '', '', '', '', '', null, '0', null, null);
INSERT INTO `manufacturer` VALUES ('2', '机加工2', null, '', '', '', '', '', null, '0', null, null);
INSERT INTO `manufacturer` VALUES ('4', '制造商1', '制造商', 'zhizaoshang1', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `manufacturer` VALUES ('6', '制造商2', '制造商', 'zhizaoshang2', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '1', '', 'qqqq');
INSERT INTO `manufacturer` VALUES ('7', '制造商3', '制造商', 'zhizaoshang3', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `manufacturer` VALUES ('8', '制造商4', '制造商', 'zhizaoshang4', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '0', '', '');
INSERT INTO `manufacturer` VALUES ('9', '制造商5', '制造商', 'zhizaoshang5', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '1', '', '');
INSERT INTO `manufacturer` VALUES ('10', '制造商6', '制造商', 'zhizaoshang6', '天河下面', '制造商', '543217890@qq.com', '13888888888', '02039384567', '2', '', '');

-- ----------------------------
-- Table structure for manufacturertask
-- ----------------------------
DROP TABLE IF EXISTS `manufacturertask`;
CREATE TABLE `manufacturertask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) DEFAULT NULL,
  `taskName` varchar(200) NOT NULL,
  `demanderId` int(11) DEFAULT NULL,
  `demanderUserId` int(11) DEFAULT NULL,
  `issueTime` date DEFAULT NULL,
  `modifyTime` date DEFAULT NULL,
  `description` longtext,
  `manufacturerId` int(11) DEFAULT NULL,
  `manufacturerUserId` int(11) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  `resultStatusId` int(11) DEFAULT NULL,
  `filePath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD241C1163A56199` (`resultStatusId`),
  KEY `FKD241C1168CB58D66` (`demanderUserId`),
  KEY `FKD241C1163A500BA` (`manufacturerId`),
  KEY `FKD241C11662540248` (`demanderId`),
  KEY `FKD241C11695DF067C` (`statusId`),
  KEY `FKD241C116609D4A3F` (`manufacturerUserId`),
  CONSTRAINT `FKD241C1163A500BA` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`id`),
  CONSTRAINT `FKD241C1163A56199` FOREIGN KEY (`resultStatusId`) REFERENCES `status` (`id`),
  CONSTRAINT `FKD241C116609D4A3F` FOREIGN KEY (`manufacturerUserId`) REFERENCES `user` (`id`),
  CONSTRAINT `FKD241C11662540248` FOREIGN KEY (`demanderId`) REFERENCES `demander` (`id`),
  CONSTRAINT `FKD241C1168CB58D66` FOREIGN KEY (`demanderUserId`) REFERENCES `user` (`id`),
  CONSTRAINT `FKD241C11695DF067C` FOREIGN KEY (`statusId`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturertask
-- ----------------------------
INSERT INTO `manufacturertask` VALUES ('1', null, '制卡1', '1', '1', '2016-01-29', '2016-01-29', null, null, null, null, null, null);
INSERT INTO `manufacturertask` VALUES ('3', null, '制卡3', '2', '4', '2016-01-29', '2016-01-29', null, '1', null, '2', '5', null);
INSERT INTO `manufacturertask` VALUES ('4', null, '制卡4', '2', '3', '2016-01-29', '2016-01-29', null, '2', '3', '2', '5', null);
INSERT INTO `manufacturertask` VALUES ('5', null, '制卡5', '3', '1', '2016-01-29', '2016-01-29', null, '2', '4', '2', '5', null);
INSERT INTO `manufacturertask` VALUES ('8', null, '哈哈哈哈3', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵呵3', null, null, null, null, '20160130003031054_1');
INSERT INTO `manufacturertask` VALUES ('9', null, '哈哈哈哈3', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵呵3', null, null, null, null, '20160130003352665_1');
INSERT INTO `manufacturertask` VALUES ('10', null, '哈哈哈4', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵4', null, null, null, null, '20160130004002696_1');
INSERT INTO `manufacturertask` VALUES ('11', null, '哈哈哈5', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵5', null, null, null, null, '20160130004152440_1');
INSERT INTO `manufacturertask` VALUES ('12', null, '哈哈哈哈5', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵5', null, null, null, null, '20160130004458424_1');
INSERT INTO `manufacturertask` VALUES ('13', null, '哈哈哈6', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵6', null, null, null, null, '20160130004655529_1');
INSERT INTO `manufacturertask` VALUES ('14', null, '哈哈哈哈7', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵7', null, null, null, null, '20160130004754712_1');
INSERT INTO `manufacturertask` VALUES ('15', null, '哈哈哈哈8', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵8', null, null, null, null, '20160130004923423_1');
INSERT INTO `manufacturertask` VALUES ('16', null, '哈哈哈9', '1', '1', '2016-01-30', '2016-01-30', '哈哈哈10', null, null, null, null, '20160130005349871_1');
INSERT INTO `manufacturertask` VALUES ('17', null, '哈哈哈哈10', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵10', null, null, null, null, '20160130005522227_1');
INSERT INTO `manufacturertask` VALUES ('18', null, '哈哈哈哈11', '1', '1', '2016-01-30', '2016-01-30', '呵呵呵呵呵11', null, null, null, null, '20160130005920719_1');
INSERT INTO `manufacturertask` VALUES ('19', null, '呵呵1', '1', '1', '2016-01-30', '2016-01-30', '和', null, null, null, null, '20160130010303992_1');
INSERT INTO `manufacturertask` VALUES ('20', null, '111', '1', '1', '2016-01-30', '2016-01-30', '111', null, null, null, null, '20160130010930058_1');
INSERT INTO `manufacturertask` VALUES ('21', null, '2222', '1', '1', '2016-01-30', '2016-01-30', '2222', null, null, null, null, '20160130011217427_1');
INSERT INTO `manufacturertask` VALUES ('22', null, '3333', '1', '1', '2016-01-30', '2016-01-30', '33333', null, null, null, null, '20160130011315039_1');
INSERT INTO `manufacturertask` VALUES ('23', null, '2131312', '1', '1', '2016-01-30', '2016-01-30', '31312312', null, null, null, null, '20160130011632100_1');
INSERT INTO `manufacturertask` VALUES ('24', null, '132123123', '1', '1', '2016-01-30', '2016-01-30', '12312312312', null, null, null, null, '20160130011642346_1');
INSERT INTO `manufacturertask` VALUES ('25', null, '4543232', '1', '1', '2016-01-30', '2016-01-30', '53423', null, null, null, null, '20160130011820684_1');
INSERT INTO `manufacturertask` VALUES ('26', null, '324243', '1', '1', '2016-01-30', '2016-01-30', '41242422', null, null, null, null, '20160130011855189_1');
INSERT INTO `manufacturertask` VALUES ('27', null, '2423', '1', '1', '2016-01-30', '2016-01-30', '253224', null, null, null, null, '20160130011909024_1');
INSERT INTO `manufacturertask` VALUES ('28', null, 'q\'e\'q\'e', '1', '1', '2016-01-30', '2016-01-30', 'q\'e\'q\'we\'q\'w', null, null, null, null, '20160130012107554_1');
INSERT INTO `manufacturertask` VALUES ('29', null, 'q\'e\'q\'e', '1', '1', '2016-01-30', '2016-01-30', 'q\'e\'q\'we\'q\'w', null, null, null, null, '20160130012113433_1');
INSERT INTO `manufacturertask` VALUES ('30', null, '哈哈哈21', '1', '1', '2016-01-30', '2016-01-30', '哈哈哈12', null, null, null, null, '20160130012129019_1');
INSERT INTO `manufacturertask` VALUES ('31', null, '2366532', '1', '1', '2016-01-30', '2016-01-30', '5344', null, null, null, null, '20160130012702075_1');
INSERT INTO `manufacturertask` VALUES ('32', null, '99999', '1', '1', '2016-01-30', '2016-01-30', '热情完全不', null, null, null, null, '20160130012917215_1');
INSERT INTO `manufacturertask` VALUES ('33', null, '231321', '1', '1', '2016-01-30', '2016-01-30', '12431312', null, null, null, null, '20160130013258666_1');

-- ----------------------------
-- Table structure for manufacturertaskdetails
-- ----------------------------
DROP TABLE IF EXISTS `manufacturertaskdetails`;
CREATE TABLE `manufacturertaskdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) DEFAULT NULL,
  `taskId` int(11) DEFAULT NULL,
  `description` longtext,
  `type` varchar(20) DEFAULT NULL,
  `fileName` varchar(256) DEFAULT NULL,
  `filePath` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC2DE844C802C6813` (`taskId`),
  CONSTRAINT `FKC2DE844C802C6813` FOREIGN KEY (`taskId`) REFERENCES `manufacturertask` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturertaskdetails
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parentId` int(11) NOT NULL COMMENT '父菜单项',
  `title` varchar(100) NOT NULL COMMENT '菜单标题',
  `url` varchar(256) NOT NULL COMMENT '菜单的链接',
  `functionId` int(11) NOT NULL COMMENT '该菜单所属功能的id',
  `sortOrder` int(6) unsigned NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('0', '0', '根节点', '', '27', '10000');
INSERT INTO `menu` VALUES ('1', '0', '用户管理', '', '27', '1');
INSERT INTO `menu` VALUES ('3', '1', '用户列表', 'userManage/list', '4', '10');
INSERT INTO `menu` VALUES ('4', '1', '添加用户', 'userManage/addInput', '3', '5');
INSERT INTO `menu` VALUES ('5', '0', '系统管理', '', '27', '100');
INSERT INTO `menu` VALUES ('8', '1', '角色列表', 'role/list', '8', '20');
INSERT INTO `menu` VALUES ('9', '1', '添加角色', 'role/addInput', '7', '15');
INSERT INTO `menu` VALUES ('12', '5', '功能列表', 'function/list', '15', '110');
INSERT INTO `menu` VALUES ('13', '5', '添加功能', 'function/addInput', '14', '105');
INSERT INTO `menu` VALUES ('14', '5', '请求列表', 'request/list', '19', '120');
INSERT INTO `menu` VALUES ('15', '5', '添加请求', 'request/addInput', '18', '115');
INSERT INTO `menu` VALUES ('16', '5', '菜单项列表', 'menu/list', '22', '130');
INSERT INTO `menu` VALUES ('17', '5', '添加菜单项', 'menu/addInput', '23', '125');
INSERT INTO `menu` VALUES ('18', '0', '百度', 'http://www.baidu.com', '27', '200');
INSERT INTO `menu` VALUES ('19', '0', '测试session', 'test/testSession', '27', '199');
INSERT INTO `menu` VALUES ('20', '0', '测试无权限', '', '28', '199');
INSERT INTO `menu` VALUES ('23', '0', '公司管理', '', '27', '20');
INSERT INTO `menu` VALUES ('24', '23', '公司注册', 'register/add', '32', '20');
INSERT INTO `menu` VALUES ('25', '23', '公司审核', 'verify/list', '34', '20');

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
-- Table structure for programtask
-- ----------------------------
DROP TABLE IF EXISTS `programtask`;
CREATE TABLE `programtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) DEFAULT NULL,
  `taskName` varchar(50) NOT NULL,
  `demanderId` int(11) DEFAULT NULL,
  `demanderUserId` int(11) DEFAULT NULL,
  `issueTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `description` longtext,
  `cncId` int(11) DEFAULT NULL,
  `cncUserId` int(11) DEFAULT NULL,
  `resultUploadTime` datetime DEFAULT NULL,
  `resultModifyTime` datetime DEFAULT NULL,
  `resultDescription` longtext,
  `statusId` int(11) DEFAULT NULL,
  `resultStatusId` int(11) DEFAULT NULL,
  `filePath` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9FA58E093A56199` (`resultStatusId`),
  KEY `FK9FA58E098CB58D66` (`demanderUserId`),
  KEY `FK9FA58E0962540248` (`demanderId`),
  KEY `FK9FA58E0995DF067C` (`statusId`),
  KEY `FK9FA58E0988B02686` (`cncUserId`),
  KEY `FK9FA58E0941EA94EE` (`cncId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programtask
-- ----------------------------
INSERT INTO `programtask` VALUES ('1', null, '制卡1', '1', '1', '2016-01-29 14:11:03', '2016-01-29 14:11:25', null, null, null, null, null, null, null, null, null);
INSERT INTO `programtask` VALUES ('2', null, '制卡2', '2', '3', '2016-01-29 14:11:00', '2016-01-29 14:11:22', null, null, null, null, null, null, null, null, null);
INSERT INTO `programtask` VALUES ('4', null, '制卡4', '1', '5', '2016-01-29 14:10:54', '2016-01-29 14:11:16', null, '2', null, null, null, null, '2', '4', null);
INSERT INTO `programtask` VALUES ('5', null, '制卡5', '1', '5', '2016-01-29 14:10:51', '2016-01-29 14:11:13', null, '3', '4', null, null, null, '2', '5', null);
INSERT INTO `programtask` VALUES ('6', null, '哈哈哈', '1', '1', '2016-01-29 15:34:43', '2016-01-29 15:34:43', '13124123', null, null, null, null, null, null, null, 'C:\\Users\\hj\\Workspaces\\MyEclipse Professional\\.metadata\\.me_tcat\\webapps\\cnc\\upload/20160129153431891_1');
INSERT INTO `programtask` VALUES ('7', null, '哈哈哈哈1', '1', '1', '2016-01-29 15:55:54', '2016-01-29 15:55:54', '1124334', null, null, null, null, null, null, null, 'C:\\Users\\hj\\Workspaces\\MyEclipse Professional\\.metadata\\.me_tcat\\webapps\\cnc\\upload/20160129155423435_1');
INSERT INTO `programtask` VALUES ('8', null, '呵呵', '1', '1', '2016-01-29 15:59:55', '2016-01-29 15:59:55', '123124123', null, null, null, null, null, null, null, 'C:\\Users\\hj\\Workspaces\\MyEclipse Professional\\.metadata\\.me_tcat\\webapps\\cnc\\upload/20160129155920617_1');
INSERT INTO `programtask` VALUES ('10', null, '呵呵1', '1', '1', '2016-01-29 16:12:44', '2016-01-29 16:12:44', '213', null, null, null, null, null, null, null, '20160129161242079_1');
INSERT INTO `programtask` VALUES ('11', null, '呵呵2', '1', '1', '2016-01-29 16:13:40', '2016-01-29 16:13:40', '123456', null, null, null, null, null, null, null, '20160129161337539_1');
INSERT INTO `programtask` VALUES ('12', null, '嘿嘿1', '1', '1', '2016-01-29 16:16:16', '2016-01-29 16:16:16', '123456', null, null, null, null, null, null, null, '20160129161615108_1');
INSERT INTO `programtask` VALUES ('13', null, '哈哈哈3', '1', '1', '2016-01-29 16:22:36', '2016-01-29 16:22:36', '123456', null, null, null, null, null, null, null, '20160129162234905_1');
INSERT INTO `programtask` VALUES ('14', null, '哈哈哈4', '1', '1', '2016-01-29 16:34:06', '2016-01-29 16:34:06', '123456', null, null, null, null, null, null, null, '20160129163404462_1');
INSERT INTO `programtask` VALUES ('15', null, '哈哈哈哈1', '1', '1', '2016-01-29 16:45:02', '2016-01-29 16:45:02', '123456', null, null, null, null, null, null, null, '20160129164502074_1');
INSERT INTO `programtask` VALUES ('16', null, '12312', '1', '1', '2016-01-29 16:46:51', '2016-01-29 16:46:51', '1231232143', null, null, null, null, null, null, null, '20160129164651694_1');
INSERT INTO `programtask` VALUES ('17', null, '1231231', '1', '1', '2016-01-29 16:49:44', '2016-01-29 16:49:44', '13131', null, null, null, null, null, null, null, '20160129164944255_1');
INSERT INTO `programtask` VALUES ('18', null, '驱蚊器', '1', '1', '2016-01-29 16:51:16', '2016-01-29 16:51:16', '请问企鹅', null, null, null, null, null, null, null, '20160129165116583_1');
INSERT INTO `programtask` VALUES ('19', null, '呵呵', '1', '1', '2016-01-29 23:06:10', '2016-01-29 23:06:10', '1231231', null, null, null, null, null, null, null, '20160129230610805_1');

-- ----------------------------
-- Table structure for programtaskattachment
-- ----------------------------
DROP TABLE IF EXISTS `programtaskattachment`;
CREATE TABLE `programtaskattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) DEFAULT NULL,
  `taskId` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `fileName` varchar(200) DEFAULT NULL,
  `filePath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2E5F8C0C8AD83AC` (`taskId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programtaskattachment
-- ----------------------------
INSERT INTO `programtaskattachment` VALUES ('2', null, '14', 'G代码', '1.docx', '20160129163404462_1/1.docx');
INSERT INTO `programtaskattachment` VALUES ('3', null, '14', 'G代码', '2222222.png', '20160129163404462_1/2222222.png');
INSERT INTO `programtaskattachment` VALUES ('4', null, '14', 'G代码', '1111111.jpg', '20160129163404462_1/1111111.jpg');
INSERT INTO `programtaskattachment` VALUES ('5', null, '14', 'G代码', null, '20160129163404462_1/null');
INSERT INTO `programtaskattachment` VALUES ('6', null, '7', 'G代码', '1.docx', '20160129164502074_1/1.docx');
INSERT INTO `programtaskattachment` VALUES ('7', null, '7', 'G代码', 'Cnctaskresult.hbm.xml', '20160129164502074_1/Cnctaskresult.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('8', null, '7', 'G代码', 'CnctaskresultDetails.hbm.xml', '20160129164502074_1/CnctaskresultDetails.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('9', null, '7', 'G代码', null, '20160129164502074_1/null');
INSERT INTO `programtaskattachment` VALUES ('10', null, '7', '作业指导书', 'ProgramtaskDetails.hbm.xml', '20160129164502074_1/ProgramtaskDetails.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('11', null, '16', 'G代码', 'CnctaskresultDetails.hbm.xml', '20160129164651694_1/CnctaskresultDetails.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('12', null, '16', '工艺单', 'Manufacturetask.hbm.xml', '20160129164651694_1/Manufacturetask.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('13', null, '16', '检验指导书', 'ManufacturetaskDetails.hbm.xml', '20160129164651694_1/ManufacturetaskDetails.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('14', null, '16', '其他文件', 'ProgramtaskDetails.hbm.xml', '20160129164651694_1/ProgramtaskDetails.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('15', null, '17', 'G代码', 'Cnctaskresult.hbm.xml', '20160129164944255_1/Cnctaskresult.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('16', null, '18', 'G代码', 'ProgramtaskAttachment.hbm.xml', '20160129165116583_1/ProgramtaskAttachment.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('17', null, '8', 'G代码', 'ProgramtaskAttachment.hbm.xml', '20160129230610805_1/ProgramtaskAttachment.hbm.xml');
INSERT INTO `programtaskattachment` VALUES ('18', null, '8', 'G代码', 'Manufacturetask.java', '20160129230610805_1/Manufacturetask.java');

-- ----------------------------
-- Table structure for programtaskdetails
-- ----------------------------
DROP TABLE IF EXISTS `programtaskdetails`;
CREATE TABLE `programtaskdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) DEFAULT NULL,
  `taskId` int(11) DEFAULT NULL,
  `type` longtext,
  `drawingName` longtext,
  `drawingPath` longtext,
  `description` longtext,
  `picture_2d_1` longblob,
  `picDescription_1` longtext,
  `picture_2d_2` longblob,
  `picDescription_2` longtext,
  `picture_2d_3` longblob NOT NULL,
  `picDescription_3` longtext NOT NULL,
  `picture_2d_4` longblob NOT NULL,
  `picDescription_4` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA9ACFF98AD83AC` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programtaskdetails
-- ----------------------------

-- ----------------------------
-- Table structure for programtaskresult
-- ----------------------------
DROP TABLE IF EXISTS `programtaskresult`;
CREATE TABLE `programtaskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) DEFAULT NULL,
  `taskId` int(11) NOT NULL,
  `description` longtext,
  `type` int(11) DEFAULT NULL,
  `fileName` varchar(20) DEFAULT NULL,
  `filePath` varchar(200) DEFAULT NULL,
  `isDown` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB28DD7868AD83AC` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programtaskresult
-- ----------------------------

-- ----------------------------
-- Table structure for request
-- ----------------------------
DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'action id',
  `url` varchar(256) NOT NULL COMMENT 'action的url',
  `functionId` int(11) NOT NULL COMMENT '该action所属功能的id',
  `isPage` tinyint(1) NOT NULL COMMENT '是否对应页面',
  `breadCrumb` varchar(100) NOT NULL COMMENT '当isPage为真，指页面的面包屑，以英文逗号分隔',
  `status` char(1) NOT NULL COMMENT '使用状态，U表示正常使用，N表示禁用，A表示无权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='系统的请求表';

-- ----------------------------
-- Records of request
-- ----------------------------
INSERT INTO `request` VALUES ('1', 'userManage/list', '4', '1', '用户管理,用户列表', 'U');
INSERT INTO `request` VALUES ('2', 'userManage/addInput', '3', '1', '用户管理,添加用户', 'U');
INSERT INTO `request` VALUES ('3', 'userManage/add', '3', '0', '', 'U');
INSERT INTO `request` VALUES ('4', 'userManage/listAjax', '4', '0', '', 'U');
INSERT INTO `request` VALUES ('5', 'userManage/updateInput', '5', '1', '用户管理,修改用户', 'U');
INSERT INTO `request` VALUES ('6', 'userManage/update', '5', '0', '', 'U');
INSERT INTO `request` VALUES ('7', 'userManage/edit', '6', '0', '', 'U');
INSERT INTO `request` VALUES ('9', 'userManage/info', '4', '1', '用户管理,用户详细信息', 'U');
INSERT INTO `request` VALUES ('10', 'role/list', '8', '1', '角色管理,角色列表', 'U');
INSERT INTO `request` VALUES ('11', 'role/addInput', '7', '1', '角色管理,添加角色', 'U');
INSERT INTO `request` VALUES ('12', 'role/add', '7', '0', '', 'U');
INSERT INTO `request` VALUES ('13', 'role/listAjax', '8', '0', '', 'U');
INSERT INTO `request` VALUES ('14', 'role/updateInput', '9', '1', '角色管理,修改角色', 'U');
INSERT INTO `request` VALUES ('15', 'role/update', '9', '0', '', 'U');
INSERT INTO `request` VALUES ('16', 'role/edit', '10', '0', '', 'U');
INSERT INTO `request` VALUES ('17', 'role/info', '8', '1', '角色管理,角色详细信息', 'U');
INSERT INTO `request` VALUES ('18', 'function/list', '15', '1', '功能管理,功能列表', 'U');
INSERT INTO `request` VALUES ('19', 'function/addInput', '14', '1', '功能管理,添加功能', 'U');
INSERT INTO `request` VALUES ('20', 'function/add', '14', '0', '', 'U');
INSERT INTO `request` VALUES ('21', 'function/listAjax', '15', '0', '', 'U');
INSERT INTO `request` VALUES ('22', 'function/updateInput', '16', '1', '功能管理,修改功能', 'U');
INSERT INTO `request` VALUES ('23', 'function/update', '16', '0', '', 'U');
INSERT INTO `request` VALUES ('24', 'function/edit', '17', '0', '', 'U');
INSERT INTO `request` VALUES ('25', 'function/info', '15', '1', '功能管理,功能详细信息', 'U');
INSERT INTO `request` VALUES ('26', 'request/list', '19', '1', '请求管理,用户请求', 'U');
INSERT INTO `request` VALUES ('27', 'request/addInput', '18', '1', '请求管理,添加请求', 'U');
INSERT INTO `request` VALUES ('28', 'request/add', '18', '0', '', 'U');
INSERT INTO `request` VALUES ('29', 'request/listAjax', '19', '0', '', 'U');
INSERT INTO `request` VALUES ('30', 'request/updateInput', '20', '1', '请求管理,修改请求', 'U');
INSERT INTO `request` VALUES ('31', 'request/update', '20', '0', '', 'U');
INSERT INTO `request` VALUES ('32', 'request/edit', '21', '0', '', 'U');
INSERT INTO `request` VALUES ('33', 'request/info', '19', '1', '请求管理,请求详细信息', 'U');
INSERT INTO `request` VALUES ('34', 'menu/list', '23', '1', '菜单管理,菜单项列表', 'U');
INSERT INTO `request` VALUES ('35', 'menu/addInput', '22', '1', '菜单管理,添加菜单项', 'U');
INSERT INTO `request` VALUES ('36', 'menu/add', '22', '0', '', 'U');
INSERT INTO `request` VALUES ('37', 'menu/listAjax', '23', '0', '', 'U');
INSERT INTO `request` VALUES ('38', 'menu/updateInput', '24', '1', '菜单管理,修改菜单项', 'U');
INSERT INTO `request` VALUES ('39', 'menu/update', '24', '0', '', 'U');
INSERT INTO `request` VALUES ('40', 'menu/edit', '25', '0', '', 'U');
INSERT INTO `request` VALUES ('41', 'menu/info', '23', '1', '菜单管理,菜单项详细信息', 'U');
INSERT INTO `request` VALUES ('42', 'role/grantInput', '28', '1', '角色管理,分配功能', 'U');
INSERT INTO `request` VALUES ('43', 'role/grant', '28', '0', '', 'U');
INSERT INTO `request` VALUES ('44', 'test/testSession', '30', '1', '测试管理,测试session', 'U');
INSERT INTO `request` VALUES ('45', 'register/add', '27', '1', '公司注册', 'U');
INSERT INTO `request` VALUES ('46', 'verify/list', '34', '1', '公司管理,公司审核', 'U');
INSERT INTO `request` VALUES ('47', 'verify/getCompanyListByCondition', '34', '0', '', 'U');
INSERT INTO `request` VALUES ('48', 'verify/cncInfo', '34', '0', '', 'U');
INSERT INTO `request` VALUES ('49', 'verify/demanderInfo', '34', '0', '', 'U');
INSERT INTO `request` VALUES ('50', 'verify/manufacturerInfo', '34', '0', '', 'U');
INSERT INTO `request` VALUES ('51', 'verify/updateDemanderVerifyStatus', '34', '0', '', 'U');
INSERT INTO `request` VALUES ('52', 'verify/updateCncVerifyStatus', '34', '0', '', 'U');
INSERT INTO `request` VALUES ('53', 'verify/updateManufacturerVerifyStatus', '34', '0', '', 'U');
INSERT INTO `request` VALUES ('54', 'register/addCnc', '32', '0', '', 'U');
INSERT INTO `request` VALUES ('55', 'register/checkCncName', '32', '0', '', 'U');
INSERT INTO `request` VALUES ('56', 'register/checkCncPinyin', '32', '0', '', 'U');
INSERT INTO `request` VALUES ('57', 'register/checkDemanderPinyin', '32', '0', '', 'U');
INSERT INTO `request` VALUES ('58', 'register/checkManufacturerPinyin', '32', '0', '', 'U');
INSERT INTO `request` VALUES ('59', 'register/addDemander', '32', '0', '', 'U');
INSERT INTO `request` VALUES ('60', 'register/checkDemanderName', '32', '0', '', 'U');
INSERT INTO `request` VALUES ('61', 'register/addManufacturer', '32', '0', '', 'U');
INSERT INTO `request` VALUES ('62', 'register/checkManufacturerName', '32', '0', '', 'U');
INSERT INTO `request` VALUES ('63', 'test/testSession', '30', '1', '测试管理,测试session', 'U');
INSERT INTO `request` VALUES ('64', 'request/copy', '18', '1', '请求管理,添加请求', 'U');
INSERT INTO `request` VALUES ('65', 'menu/copy', '22', '1', '菜单管理,添加菜单项', 'U');
INSERT INTO `request` VALUES ('66', 'test/testNoLogin', '27', '1', '', 'U');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(40) NOT NULL COMMENT '角色名',
  `companyType` varchar(20) NOT NULL COMMENT '公司类型',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `enable` tinyint(1) NOT NULL COMMENT '是否启用',
  `sortOrder` int(6) unsigned NOT NULL DEFAULT '20' COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='角色表';

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
INSERT INTO `role` VALUES ('11', '试用用户', 'mingsen', '公司注册所使用的临时用户', '1', '20');

-- ----------------------------
-- Table structure for rolefunction
-- ----------------------------
DROP TABLE IF EXISTS `rolefunction`;
CREATE TABLE `rolefunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id，用于解决hibernate复合id的问题',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `functionId` int(11) NOT NULL COMMENT '功能id',
  `identify` bit(1) DEFAULT NULL COMMENT '是否需要在使用时验证身份',
  PRIMARY KEY (`id`),
  KEY `FKEA35D68E8B5D6188` (`functionId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='角色、功能关联表';

-- ----------------------------
-- Records of rolefunction
-- ----------------------------
INSERT INTO `rolefunction` VALUES ('2', '10', '5', '\0');
INSERT INTO `rolefunction` VALUES ('8', '10', '3', '\0');
INSERT INTO `rolefunction` VALUES ('10', '1', '10', '\0');
INSERT INTO `rolefunction` VALUES ('11', '1', '7', '\0');
INSERT INTO `rolefunction` VALUES ('12', '1', '6', '\0');
INSERT INTO `rolefunction` VALUES ('13', '1', '5', '\0');
INSERT INTO `rolefunction` VALUES ('14', '1', '4', '\0');
INSERT INTO `rolefunction` VALUES ('15', '1', '9', '\0');
INSERT INTO `rolefunction` VALUES ('16', '1', '8', '\0');
INSERT INTO `rolefunction` VALUES ('19', '1', '28', '\0');
INSERT INTO `rolefunction` VALUES ('22', '1', '17', '\0');
INSERT INTO `rolefunction` VALUES ('23', '1', '22', '\0');
INSERT INTO `rolefunction` VALUES ('25', '1', '23', '\0');
INSERT INTO `rolefunction` VALUES ('26', '1', '15', '\0');
INSERT INTO `rolefunction` VALUES ('27', '1', '24', '\0');
INSERT INTO `rolefunction` VALUES ('28', '1', '16', '\0');
INSERT INTO `rolefunction` VALUES ('29', '1', '25', '\0');
INSERT INTO `rolefunction` VALUES ('30', '1', '14', '\0');
INSERT INTO `rolefunction` VALUES ('31', '1', '27', '\0');
INSERT INTO `rolefunction` VALUES ('32', '1', '21', '\0');
INSERT INTO `rolefunction` VALUES ('33', '1', '20', '\0');
INSERT INTO `rolefunction` VALUES ('34', '1', '30', '\0');
INSERT INTO `rolefunction` VALUES ('35', '1', '19', '\0');
INSERT INTO `rolefunction` VALUES ('37', '1', '18', '\0');
INSERT INTO `rolefunction` VALUES ('38', '1', '32', '\0');
INSERT INTO `rolefunction` VALUES ('39', '1', '34', '\0');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', '未接受', '');
INSERT INTO `status` VALUES ('2', '已接受', '');
INSERT INTO `status` VALUES ('3', '已拒绝', '');
INSERT INTO `status` VALUES ('4', '未完成', '');
INSERT INTO `status` VALUES ('5', '已完成', '');

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
  KEY `FKBABEF675437EC317` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemlog
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
  KEY `FK285FEB1519B1C4` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='用户表';

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
INSERT INTO `user` VALUES ('90', '1哈哈', '123456', '1哈哈', 'U', null, null, '1', '1', 'mingsen');
INSERT INTO `user` VALUES ('91', 'xuqiushang2', '123456', '需求商2', 'U', '13888888888', '543217890@qq.com', '1', '6', '需求商');
INSERT INTO `user` VALUES ('92', 'mingsen1', '123456', '明森1', 'U', '13899998888', '532456@qq.com', '1', '28', '数控工厂');
