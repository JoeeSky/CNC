/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : cnc

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2016-01-09 11:27:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cnc`
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
  `tel` varchar(100) COMMENT '固定电话',
  `verifystatus` int(10) unsigned NOT NULL COMMENT '审核状态：0（未审核），1（审核通过），2（审核未通过）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnc
-- ----------------------------

-- ----------------------------
-- Table structure for `cnclog`
-- ----------------------------
DROP TABLE IF EXISTS `cnclog`;
CREATE TABLE `cnclog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) DEFAULT NULL,
  `logDesc` varchar(1000) DEFAULT NULL COMMENT '日志记录',
  `eventTable` varchar(100) DEFAULT NULL COMMENT '影响表',
  `logTime` date DEFAULT NULL COMMENT '日志记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数控工厂操作日志';

-- ----------------------------
-- Records of cnclog
-- ----------------------------

-- ----------------------------
-- Table structure for `cncresulttask`
-- ----------------------------
DROP TABLE IF EXISTS `cncresulttask`;
CREATE TABLE `cncresulttask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `sn` char(12) NOT NULL COMMENT '任务序列号',
  `taskName` varchar(200) NOT NULL COMMENT '任务名称',
  `demanderId` int(10) unsigned NOT NULL COMMENT '需求方公司ID',
  `demanderUserId` int(10) unsigned NOT NULL COMMENT '发布人编号',
  `issueTime` datetime NOT NULL COMMENT '发布时间',
  `modifyTime` datetime NOT NULL COMMENT '最新修改时间',
  `description` text NOT NULL COMMENT '任务描述',
  `cncId` int(10) unsigned NOT NULL COMMENT 'CNC工厂ID',
  `cncUserId` int(11) unsigned zerofill NOT NULL COMMENT 'CNC编程人员ID',
  `status` int(10) unsigned NOT NULL COMMENT '任务状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SN` (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数控工厂方->需求方 CNC返回表';

-- ----------------------------
-- Records of cncresulttask
-- ----------------------------

-- ----------------------------
-- Table structure for `cnctaskresultdetails`
-- ----------------------------
DROP TABLE IF EXISTS `cnctaskresultdetails`;
CREATE TABLE `cnctaskresultdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) NOT NULL,
  `taskId` int(11) NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  `fileName` varchar(20) NOT NULL COMMENT '文件名称',
  `type` int(11) NOT NULL COMMENT '文件类型',
  `filePath` varchar(200) NOT NULL COMMENT '文件路径',
  `isDown` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否已下载',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CNC返回详细表';

-- ----------------------------
-- Records of cnctaskresultdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `companytype`
-- ----------------------------
DROP TABLE IF EXISTS `companytype`;
CREATE TABLE `companytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公司类型表';

-- ----------------------------
-- Records of companytype
-- ----------------------------
INSERT INTO `companytype` VALUES ('1', 'mingsen');
INSERT INTO `companytype` VALUES ('2', 'cnc');
INSERT INTO `companytype` VALUES ('3', 'demander');
INSERT INTO `companytype` VALUES ('4', 'manufacturer');

-- ----------------------------
-- Table structure for `demander`
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
  `tel` varchar(100) COMMENT '固定电话',
  `verifystatus` int(10) unsigned NOT NULL COMMENT '审核状态：0（未审核），1（审核通过），2（审核未通过）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demander
-- ----------------------------

-- ----------------------------
-- Table structure for `demanderlog`
-- ----------------------------
DROP TABLE IF EXISTS `demanderlog`;
CREATE TABLE `demanderlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '生产日志序号',
  `userId` int(11) NOT NULL,
  `logDesc` varchar(1000) NOT NULL COMMENT '日志记录',
  `eventTable` varchar(100) NOT NULL COMMENT '影响表',
  `logTime` date NOT NULL COMMENT '日志记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='零件需求方日志';

-- ----------------------------
-- Records of demanderlog
-- ----------------------------

-- ----------------------------
-- Table structure for `function`
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(20) NOT NULL COMMENT '权限名称',
  `pageId` int(10) unsigned NOT NULL COMMENT '页面id',
  `desc` varchar(200) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of function
-- ----------------------------

-- ----------------------------
-- Table structure for `manufacturer`
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
  `tel` varchar(100) COMMENT '固定电话',
  `verifystatus` int(10) unsigned NOT NULL COMMENT '审核状态：0（未审核），1（审核通过），2（审核未通过）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------

-- ----------------------------
-- Table structure for `manufacturerlog`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturerlog`;
CREATE TABLE `manufacturerlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '生产日志序号',
  `userId` int(11) NOT NULL,
  `logDesc` varchar(1000) NOT NULL COMMENT '日志记录',
  `eventTable` varchar(100) NOT NULL COMMENT '影响表',
  `logTime` date NOT NULL COMMENT '日志记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机加工工厂操作日志';

-- ----------------------------
-- Records of manufacturerlog
-- ----------------------------

-- ----------------------------
-- Table structure for `manufacturertask`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturertask`;
CREATE TABLE `manufacturertask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `sn` char(12) NOT NULL COMMENT '任务序列号',
  `taskName` varchar(200) NOT NULL COMMENT '任务名称',
  `demanderId` int(10) unsigned NOT NULL COMMENT '发布人公司ID',
  `demanderUserId` int(10) unsigned NOT NULL COMMENT '发布人ID',
  `issueTime` datetime NOT NULL COMMENT '发布时间',
  `modifyTime` datetime NOT NULL COMMENT '最新修改时间',
  `description` text NOT NULL COMMENT '任务描述',
  `manufacturerId` int(10) unsigned NOT NULL COMMENT '机加工工厂ID',
  `manufacturerUserId` int(11) unsigned zerofill NOT NULL COMMENT '机加工用户Id',
  `status` int(10) unsigned NOT NULL COMMENT '任务状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SN` (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='需求方->机加工方 机加工任务表';

-- ----------------------------
-- Records of manufacturertask
-- ----------------------------

-- ----------------------------
-- Table structure for `manufacturertaskdetails`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturertaskdetails`;
CREATE TABLE `manufacturertaskdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) NOT NULL,
  `taskId` int(11) unsigned NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  `type` int(11) unsigned NOT NULL COMMENT '文件类型',
  `fileName` varchar(20) NOT NULL COMMENT '文件名称',
  `filePath` varchar(200) NOT NULL COMMENT '文件路径',
  `isDown` tinyint(1) unsigned NOT NULL COMMENT '是否已下载',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机加工任务详细表';

-- ----------------------------
-- Records of manufacturertaskdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `page`
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `name` varchar(10) NOT NULL COMMENT '页面名称',
  `url` varchar(50) NOT NULL COMMENT '页面的url',
  `parentName` varchar(10) NOT NULL COMMENT '页面在左侧菜单中分父菜单',
  `sortOrder` int(10) unsigned NOT NULL DEFAULT '20' COMMENT '页面在左侧导航中列出的顺序',
  `companyTypes` varchar(100) NOT NULL COMMENT '可以访问页面的公司类型，多种类型用逗号分隔，如cnc,demander',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='页面表';

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', '用户列表', 'userManage/userList', '用户管理', '20', '');
INSERT INTO `page` VALUES ('2', '添加用户', 'userManage/userAdd', '用户管理', '20', '');
INSERT INTO `page` VALUES ('3', '上传G代码任务', 'programTask/uploadProgramTask', 'G代码', '20', '');
INSERT INTO `page` VALUES ('4', 'G代码任务列表', 'programTask/programTaskList', 'G代码', '20', '');
INSERT INTO `page` VALUES ('5', '接收G代码任务', 'programTask/acceptProgramTask', 'G代码', '20', '');
INSERT INTO `page` VALUES ('6', '上传机加工任务', 'manufacturerTask/uploadManufacturerTask', '机加工', '20', '');
INSERT INTO `page` VALUES ('7', '机加工任务列表', 'manufacturerTask/manufacturerTaskList', '机加工', '20', '');
INSERT INTO `page` VALUES ('8', '接收机加工任务', 'manufacturerTask/acceptManufacturerTask', '机加工', '20', '');

-- ----------------------------
-- Table structure for `programtask`
-- ----------------------------
DROP TABLE IF EXISTS `programtask`;
CREATE TABLE `programtask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `sn` char(12) NOT NULL COMMENT '任务序列号',
  `taskName` varchar(200) NOT NULL COMMENT '任务名称',
  `demanderId` int(10) unsigned NOT NULL COMMENT '发布公司编号',
  `demanderUserId` int(10) unsigned NOT NULL COMMENT '发布公司发布人编号',
  `issueTime` datetime NOT NULL COMMENT '发布时间',
  `modifyTime` datetime NOT NULL COMMENT '最新修改时间',
  `description` text NOT NULL COMMENT '任务描述',
  `cncId` int(10) unsigned NOT NULL COMMENT '数控工厂ID',
  `cncUserId` int(10) unsigned zerofill NOT NULL COMMENT 'CNC工厂用户Id',
  `status` int(10) unsigned NOT NULL COMMENT '任务状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SN` (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='需求方->数控工厂 编程任务表';

-- ----------------------------
-- Records of programtask
-- ----------------------------

-- ----------------------------
-- Table structure for `programtaskattachment`
-- ----------------------------
DROP TABLE IF EXISTS `programtaskattachment`;
CREATE TABLE `programtaskattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) NOT NULL,
  `taskId` int(11) NOT NULL COMMENT '与ProgramTask表相关',
  `fileName` varchar(20) NOT NULL COMMENT '文件名',
  `type` int(11) NOT NULL COMMENT '文件类型',
  `filePath` varchar(200) NOT NULL COMMENT '文件路径',
  `isDown` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否已下载',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编程任务附件表';

-- ----------------------------
-- Records of programtaskattachment
-- ----------------------------

-- ----------------------------
-- Table structure for `programtaskdetails`
-- ----------------------------
DROP TABLE IF EXISTS `programtaskdetails`;
CREATE TABLE `programtaskdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) NOT NULL,
  `taskId` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `drawingName` varchar(100) NOT NULL COMMENT 'CAD图名称',
  `drawingPath` varchar(200) NOT NULL COMMENT 'CAD图路径',
  `description` text NOT NULL COMMENT '描述',
  `picture2d1` blob NOT NULL COMMENT '图纸2D图片1',
  `picDescription1` varchar(200) NOT NULL COMMENT '图纸2D图片1描述',
  `picture2d2` blob NOT NULL COMMENT '图纸2D图片2',
  `picDescription2` varchar(200) NOT NULL COMMENT '图纸2D图片2描述',
  `picture2d3` blob NOT NULL COMMENT '图纸2D图片3',
  `picDescription3` varchar(200) NOT NULL COMMENT '图纸2D图片3描述',
  `picture2d4` blob NOT NULL COMMENT '图纸2D图片4',
  `picDescription4` varchar(200) NOT NULL COMMENT '图纸2D图片4描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编程任务详细表';

-- ----------------------------
-- Records of programtaskdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `companyType` varchar(20) NOT NULL COMMENT '公司类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `role_function`
-- ----------------------------
DROP TABLE IF EXISTS `role_function`;
CREATE TABLE `role_function` (
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `functionId` int(11) NOT NULL COMMENT '权限id',
  `isUse` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用，默认否',
  `companyType` varchar(20) NOT NULL COMMENT '公司类型',
  `identify` tinyint(1) NOT NULL COMMENT '角色拥有的功能是否需要密码验证，默认否',
  PRIMARY KEY (`roleId`,`functionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_function
-- ----------------------------

-- ----------------------------
-- Table structure for `systemlog`
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '生产日志序号',
  `userId` int(11) unsigned NOT NULL,
  `logDesc` varchar(1000) NOT NULL COMMENT '日志记录',
  `eventTable` varchar(100) NOT NULL COMMENT '影响表',
  `logTime` date NOT NULL COMMENT '日志记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of systemlog
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '用户名称，用于显示用户',
  `enable` tinyint(1) NOT NULL COMMENT '用户是否可用',
  `cellphone` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT '邮件',
  `role_id` smallint(6) NOT NULL COMMENT '权限id',
  `companyId` int(11) NOT NULL COMMENT '公司id',
  `companyType` varchar(20) NOT NULL COMMENT '公司类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
