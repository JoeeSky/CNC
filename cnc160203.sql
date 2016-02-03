-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-02-03 10:39:30
-- 服务器版本： 5.6.17
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cnc`
--

-- --------------------------------------------------------

--
-- 表的结构 `cnclog`
--

CREATE TABLE IF NOT EXISTS `cnclog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_desc` longtext NOT NULL,
  `event_table` longtext NOT NULL,
  `log_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7890F6EC437EC317` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `demander`
--

CREATE TABLE IF NOT EXISTS `demander` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `demander`
--

INSERT INTO `demander` (`id`, `name`, `description`, `pinyin`, `address`, `contact`, `email`, `mobile`, `tel`, `verifystatus`, `logo`, `url`) VALUES
(1, '需求方1', NULL, '', '', '', '', '', NULL, 0, NULL, NULL),
(2, '需求方2', NULL, '', '', '', '', '', NULL, 0, NULL, NULL),
(3, '需求方3', NULL, '', '', '', '', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `demanderlog`
--

CREATE TABLE IF NOT EXISTS `demanderlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_desc` longtext NOT NULL,
  `event_table` longtext NOT NULL,
  `log_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD684B7CC437EC317` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `upperID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA9601F725F16500C` (`upperID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `department`
--

INSERT INTO `department` (`id`, `name`, `upperID`) VALUES
(1, '部门1', NULL),
(2, '部门2', 1),
(3, '部门3', 1),
(4, '部门4', 2),
(5, '部门5', 2),
(6, '部门6', 2);

-- --------------------------------------------------------

--
-- 表的结构 `dict`
--

CREATE TABLE IF NOT EXISTS `dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典项id',
  `name` varchar(40) DEFAULT NULL COMMENT '字典项名称',
  `value` varchar(40) DEFAULT NULL COMMENT '字典项值',
  `wordGroup` varchar(20) DEFAULT NULL COMMENT '字典项组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='字典表' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `dict`
--

INSERT INTO `dict` (`id`, `name`, `value`, `wordGroup`) VALUES
(1, 'mingsen', '明森管理员', 'companyType'),
(2, 'cnc', 'CNC', 'companyType'),
(3, 'demander', '需求方', 'companyType'),
(4, 'manufacturer', '机加工', 'companyType'),
(5, 'U', '可用', 'userStatus'),
(6, 'N', '禁用', 'userStatus'),
(7, 'D', '已删除', 'userStatus'),
(8, 'true', '是', 'yesNo'),
(9, 'false', '否', 'yesNo'),
(10, 'U', '启用', 'funcStatus'),
(11, 'N', '禁用', 'funcStatus'),
(13, 'U', '启用', 'requestStatus'),
(14, 'N', '禁用', 'requestStatus');

-- --------------------------------------------------------

--
-- 表的结构 `function`
--

CREATE TABLE IF NOT EXISTS `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `parentId` int(11) DEFAULT NULL COMMENT '父功能（模块）id',
  `name` varchar(20) DEFAULT NULL COMMENT '功能名',
  `description` varchar(200) DEFAULT NULL COMMENT '功能描述',
  `status` varchar(1) DEFAULT NULL COMMENT '功能状态（U：启用，N：禁用，D删除，A无权限）',
  `sortOrder` int(11) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='功能表' AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `function`
--

INSERT INTO `function` (`id`, `parentId`, `name`, `description`, `status`, `sortOrder`) VALUES
(1, 0, '用户', ' ', 'U', 20),
(2, 0, '角色', '', 'U', 20),
(3, 1, '增加', '', 'U', 20),
(4, 1, '查询', '', 'U', 21),
(5, 1, '修改', '', 'U', 22),
(6, 1, '删除', '', 'U', 23),
(7, 2, '增加', '', 'U', 20),
(8, 2, '查询', '', 'U', 20),
(9, 2, '修改', '', 'U', 20),
(10, 2, '删除', '', 'U', 20),
(11, 0, '功能', '', 'U', 20),
(12, 0, '请求', '', 'U', 20),
(13, 0, '菜单', '', 'U', 20),
(14, 11, '增加', '', 'U', 20),
(15, 11, '查询', '', 'U', 20),
(16, 11, '修改', '', 'U', 20),
(17, 11, '删除', '', 'U', 20),
(18, 12, '增加', '', 'U', 20),
(19, 12, '查询', '', 'U', 20),
(20, 12, '修改', '', 'U', 20),
(21, 12, '删除', '', 'U', 20),
(22, 13, '增加', '', 'U', 20),
(23, 13, '查询', '', 'U', 20),
(24, 13, '修改', '', 'U', 20),
(25, 13, '删除', '', 'U', 20),
(26, 0, '通用', '', 'U', 20),
(27, 26, '不需要权限', '', 'U', 20),
(28, 2, '分配功能', '', 'U', 23),
(29, 0, '测试', '', 'U', 20),
(30, 29, '测试session', '', 'U', 20),
(31, 26, '必无此功能', '', 'U', 20);

-- --------------------------------------------------------

--
-- 表的结构 `manufacturelog`
--

CREATE TABLE IF NOT EXISTS `manufacturelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_desc` longtext NOT NULL,
  `event_table` longtext NOT NULL,
  `log_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1FEABEE3437EC317` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`, `description`, `pinyin`, `address`, `contact`, `email`, `mobile`, `tel`, `verifystatus`, `logo`, `url`) VALUES
(1, '机加工1', NULL, '', '', '', '', '', NULL, 0, NULL, NULL),
(2, '机加工2', NULL, '', '', '', '', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `manufacturertask`
--

CREATE TABLE IF NOT EXISTS `manufacturertask` (
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
  KEY `FKD241C116609D4A3F` (`manufacturerUserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `manufacturertask`
--

INSERT INTO `manufacturertask` (`id`, `sn`, `taskName`, `demanderId`, `demanderUserId`, `issueTime`, `modifyTime`, `description`, `manufacturerId`, `manufacturerUserId`, `statusId`, `resultStatusId`, `filePath`) VALUES
(1, NULL, '制卡1', 1, 1, '2016-01-29', '2016-01-29', NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, '制卡3', 2, 4, '2016-01-29', '2016-01-29', NULL, 1, NULL, 2, 5, NULL),
(4, NULL, '制卡4', 2, 3, '2016-01-29', '2016-01-29', NULL, 2, 3, 2, 5, NULL),
(5, NULL, '制卡5', 3, 1, '2016-01-29', '2016-01-29', NULL, 2, 4, 2, 5, NULL),
(8, NULL, '哈哈哈哈3', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵呵3', NULL, NULL, NULL, NULL, '20160130003031054_1'),
(9, NULL, '哈哈哈哈3', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵呵3', NULL, NULL, NULL, NULL, '20160130003352665_1'),
(10, NULL, '哈哈哈4', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵4', NULL, NULL, NULL, NULL, '20160130004002696_1'),
(11, NULL, '哈哈哈5', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵5', NULL, NULL, NULL, NULL, '20160130004152440_1'),
(12, NULL, '哈哈哈哈5', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵5', NULL, NULL, NULL, NULL, '20160130004458424_1'),
(13, NULL, '哈哈哈6', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵6', NULL, NULL, NULL, NULL, '20160130004655529_1'),
(14, NULL, '哈哈哈哈7', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵7', NULL, NULL, NULL, NULL, '20160130004754712_1'),
(15, NULL, '哈哈哈哈8', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵8', NULL, NULL, NULL, NULL, '20160130004923423_1'),
(16, NULL, '哈哈哈9', 1, 1, '2016-01-30', '2016-01-30', '哈哈哈10', NULL, NULL, NULL, NULL, '20160130005349871_1'),
(17, NULL, '哈哈哈哈10', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵10', NULL, NULL, NULL, NULL, '20160130005522227_1'),
(18, NULL, '哈哈哈哈11', 1, 1, '2016-01-30', '2016-01-30', '呵呵呵呵呵11', NULL, NULL, NULL, NULL, '20160130005920719_1'),
(19, NULL, '呵呵1', 1, 1, '2016-01-30', '2016-01-30', '和', NULL, NULL, NULL, NULL, '20160130010303992_1'),
(20, NULL, '111', 1, 1, '2016-01-30', '2016-01-30', '111', NULL, NULL, NULL, NULL, '20160130010930058_1'),
(21, NULL, '2222', 1, 1, '2016-01-30', '2016-01-30', '2222', NULL, NULL, NULL, NULL, '20160130011217427_1'),
(22, NULL, '3333', 1, 1, '2016-01-30', '2016-01-30', '33333', NULL, NULL, NULL, NULL, '20160130011315039_1'),
(23, NULL, '2131312', 1, 1, '2016-01-30', '2016-01-30', '31312312', NULL, NULL, NULL, NULL, '20160130011632100_1'),
(24, NULL, '132123123', 1, 1, '2016-01-30', '2016-01-30', '12312312312', NULL, NULL, NULL, NULL, '20160130011642346_1'),
(25, NULL, '4543232', 1, 1, '2016-01-30', '2016-01-30', '53423', NULL, NULL, NULL, NULL, '20160130011820684_1'),
(26, NULL, '324243', 1, 1, '2016-01-30', '2016-01-30', '41242422', NULL, NULL, NULL, NULL, '20160130011855189_1'),
(27, NULL, '2423', 1, 1, '2016-01-30', '2016-01-30', '253224', NULL, NULL, NULL, NULL, '20160130011909024_1'),
(28, NULL, 'q''e''q''e', 1, 1, '2016-01-30', '2016-01-30', 'q''e''q''we''q''w', NULL, NULL, NULL, NULL, '20160130012107554_1'),
(29, NULL, 'q''e''q''e', 1, 1, '2016-01-30', '2016-01-30', 'q''e''q''we''q''w', NULL, NULL, NULL, NULL, '20160130012113433_1'),
(30, NULL, '哈哈哈21', 1, 1, '2016-01-30', '2016-01-30', '哈哈哈12', NULL, NULL, NULL, NULL, '20160130012129019_1'),
(31, NULL, '2366532', 1, 1, '2016-01-30', '2016-01-30', '5344', NULL, NULL, NULL, NULL, '20160130012702075_1'),
(32, NULL, '99999', 1, 1, '2016-01-30', '2016-01-30', '热情完全不', NULL, NULL, NULL, NULL, '20160130012917215_1'),
(33, NULL, '231321', 1, 1, '2016-01-30', '2016-01-30', '12431312', NULL, NULL, NULL, NULL, '20160130013258666_1');

-- --------------------------------------------------------

--
-- 表的结构 `manufacturertaskdetails`
--

CREATE TABLE IF NOT EXISTS `manufacturertaskdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) DEFAULT NULL,
  `taskId` int(11) DEFAULT NULL,
  `description` longtext,
  `type` varchar(20) DEFAULT NULL,
  `fileName` varchar(256) DEFAULT NULL,
  `filePath` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC2DE844C802C6813` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parentId` int(11) NOT NULL COMMENT '父菜单项',
  `title` varchar(100) NOT NULL COMMENT '菜单标题',
  `url` varchar(256) NOT NULL COMMENT '菜单的链接',
  `functionId` int(11) NOT NULL COMMENT '该菜单所属功能的id',
  `sortOrder` int(6) unsigned NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='菜单表' AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `parentId`, `title`, `url`, `functionId`, `sortOrder`) VALUES
(1, 0, '用户管理', '', 27, 1),
(3, 1, '用户列表', 'userManage/list', 4, 10),
(4, 1, '添加用户', 'userManage/addInput', 3, 5),
(5, 0, '系统管理', '', 27, 100),
(8, 1, '角色列表', 'role/list', 8, 20),
(9, 1, '添加角色', 'role/addInput', 7, 15),
(12, 5, '功能列表', 'function/list', 15, 110),
(13, 5, '添加功能', 'function/addInput', 14, 105),
(14, 5, '请求列表', 'request/list', 19, 120),
(15, 5, '添加请求', 'request/addInput', 18, 115),
(16, 5, '菜单项列表', 'menu/list', 22, 130),
(17, 5, '添加菜单项', 'menu/addInput', 23, 125),
(18, 0, '百度', 'http://www.baidu.com', 27, 200),
(19, 0, '测试session', 'test/testSession', 27, 199),
(20, 0, '测试无权限', '', 28, 199),
(21, 0, '根节点', '', 27, 10000);

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `hasRead` bit(1) NOT NULL,
  `content` longtext,
  `receiver` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- 转存表中的数据 `message`
--

INSERT INTO `message` (`id`, `time`, `hasRead`, `content`, `receiver`) VALUES
(1, '2015-01-31 22:55:48', b'1', '新增品牌<i>testtest</i>审核通过，审核人：张洪伟ppsh', 25),
(2, '2015-02-01 00:00:41', b'0', '新增品牌[<i>test2</i>]审核通过。审核人：张洪伟ppsh 审核理由：可以增加，没问题', 25),
(3, '2015-02-01 00:01:19', b'0', '新增品牌[<i>test3</i>]审核不通过。审核人：张洪伟ppsh 审核理由：这个不行。', 25),
(4, '2015-02-01 00:04:17', b'1', '新增品牌[<i>testtt</i>]审核通过。审核人：齐德昱 审核理由：nikeyi', 32),
(5, '2015-02-01 12:54:00', b'1', '申请客户[<i>csasc</i>]通过,审核流程：<br/>连惠琼;忽略;null-->李剑;忽略;null-->齐德昱;忽略;null-->曾总;通过;他更适合', 32),
(6, '2015-02-01 12:54:00', b'0', '申请客户[<i>csasc</i>]不通过,审核流程：<br/>连惠琼;忽略;null-->李剑;忽略;null-->齐德昱;忽略;null-->曾总;不通过;他更适合', 34),
(7, '2015-02-01 12:54:00', b'0', '申请客户[<i>csasc</i>]不通过,审核流程：<br/>李剑;忽略;null-->齐德昱;忽略;null-->曾总;不通过;他更适合', 33),
(8, '2015-02-01 12:54:00', b'0', '申请客户[<i>csasc</i>]不通过,审核流程：<br/>李胜;忽略;null-->曾总;不通过;他更适合', 38),
(9, '2015-02-01 13:01:37', b'0', '申请客户[<i>lhqlhq</i>]不通过,审核流程：<br/>连惠琼;忽略;null-->李剑;忽略;null-->齐德昱;通过;-->曾总;不通过;你不行', 34),
(10, '2015-02-01 13:12:54', b'1', '申请客户[<i>test1都是</i>]通过,审核流程：<br/>连惠琼;忽略;-->李剑;忽略;-->齐德昱;忽略;-->曾总;通过;keyi', 32),
(11, '2015-03-05 10:50:32', b'1', '申请客户[<i>lhqlhq</i>]不通过,审核流程：<br/>连惠琼;忽略;-->李剑;忽略;-->齐德昱;忽略;-->曾总;不通过;', 32),
(12, '2015-03-05 10:51:40', b'0', '申请客户[<i>testtest</i>]不通过,审核流程：<br/>李剑;忽略;-->齐德昱;不通过;', 32),
(13, '2015-03-05 19:41:25', b'1', '申请客户[<i>345222</i>]通过,审核流程：<br/>连惠琼;通过;而我-->齐德昱;通过;sdf', 32),
(14, '2015-04-25 17:15:37', b'0', '新增品牌[<i>杨炯鑫</i>]审核不通过。审核人：hj123 审核理由：不值这个价', 42),
(15, '2015-04-28 10:00:56', b'0', '新增品牌[<i>鞋子</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(16, '2015-04-29 10:39:32', b'0', '新增客户[<i>000000</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(17, '2015-04-29 14:24:09', b'0', '新增客户[<i>1111111</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(18, '2015-08-18 11:18:42', b'0', '新增客户[<i>111111</i>]审核通过。审核人：081806 审核理由：', 57),
(19, '2015-08-18 11:31:10', b'0', '新增品牌[<i>加多宝</i>]审核通过。审核人：081809 审核理由：', 59),
(20, '2015-08-18 11:50:45', b'0', '新增客户[<i>广东南方新视界</i>]审核通过。审核人：081806 审核理由：', 57),
(21, '2015-08-18 11:50:54', b'0', '新增客户[<i>华南理工大学</i>]审核通过。审核人：081806 审核理由：', 57),
(22, '2015-08-19 00:58:52', b'0', '修改客户[<i>今晚</i>]审核通过。审核人：081806 审核理由：', 1),
(23, '2015-08-19 00:59:13', b'0', '新增客户[<i>rr </i>]审核通过。审核人：081806 审核理由：', 1),
(24, '2015-08-19 09:46:49', b'0', '新增客户[<i>2015.08.12</i>]审核通过。审核人：081806 审核理由：', 52),
(25, '2015-08-19 09:46:55', b'0', '修改客户[<i>1111111</i>]审核通过。审核人：081806 审核理由：', 1),
(26, '2015-08-19 09:47:29', b'0', '新增客户[<i>ww</i>]审核通过。审核人：081806 审核理由：', 1),
(27, '2015-08-19 10:04:07', b'0', '新增客户[<i>腾讯</i>]审核通过。审核人：领导2 审核理由：', 67),
(28, '2015-08-19 10:04:12', b'0', '新增客户[<i>百度</i>]审核通过。审核人：领导2 审核理由：', 67),
(29, '2015-08-19 10:04:17', b'0', '新增客户[<i>阿里巴巴</i>]审核通过。审核人：领导2 审核理由：', 67),
(30, '2015-08-19 10:14:43', b'0', '申请客户[<i>百度</i>]不通过,审核流程：<br/>领导2;不通过;', 68),
(31, '2015-08-19 10:19:24', b'0', '申请客户[<i>百度</i>]通过,审核流程：<br/>领导2;通过;-->领导1;通过;', 67),
(32, '2015-08-24 15:41:37', b'0', '新增客户[<i>南方新视界</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(33, '2015-08-25 10:26:01', b'0', '新增客户[<i>华系</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(34, '2015-08-25 11:13:32', b'0', '修改品牌[<i>tett</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(35, '2015-08-25 11:13:40', b'0', '修改品牌[<i>tett</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(36, '2015-08-25 11:13:45', b'0', '修改品牌[<i>the last</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(37, '2015-08-25 11:13:59', b'0', '修改品牌[<i>2131</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(38, '2015-08-25 11:14:02', b'0', '修改品牌[<i>2131</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(39, '2015-08-25 23:50:08', b'0', '修改客户[<i>rr </i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(40, '2015-08-28 17:19:49', b'1', '新增品牌[<i>哈喽</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(41, '2015-08-28 17:20:40', b'1', '新增客户[<i>奔驰广州</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(42, '2015-08-28 17:21:29', b'1', '新增客户[<i>奔驰</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(43, '2015-08-28 17:21:33', b'1', '新增客户[<i>奔驰</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(45, '2015-09-09 11:15:09', b'1', '新增品牌[<i>腾讯</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(46, '2015-09-09 20:49:46', b'1', '新增客户[<i>哈哈哈哈哈哈哈啊啊啊啊啊啊啊啊啊啊</i>]审核通过。审核人：你猜我是谁 审核理由：过吧过吧过吧', 1),
(47, '2015-09-09 21:14:14', b'0', '申请客户[<i>afsdddddsd</i>]通过,审核流程：<br/>领导2;通过;好哇好哇-->领导1;通过;不行不行哇', 67),
(48, '2015-09-09 21:15:27', b'0', '申请客户[<i>lhqlhq</i>]通过,审核流程：<br/>领导2;忽略;-->领导1;通过;哈哈哈', 67),
(49, '2015-09-09 23:54:09', b'0', '申请客户[<i>腾讯</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', 67),
(50, '2015-09-09 23:54:09', b'0', '申请客户[<i>腾讯</i>]通过,审核流程：<br/>领导2;忽略;-->领导1;通过;', 68),
(51, '2015-09-09 23:54:58', b'0', '申请客户[<i>阿里巴巴</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈', 67),
(52, '2015-09-09 23:54:58', b'0', '申请客户[<i>阿里巴巴</i>]通过,审核流程：<br/>领导2;忽略;-->领导1;通过;哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈', 68),
(53, '2015-09-14 14:13:24', b'0', '申请客户[<i>111111</i>]通过,审核流程：<br/>领导1;通过;', 67),
(54, '2015-09-16 09:41:57', b'0', '新增品牌[<i>华为</i>]审核通过。审核人：你猜我是谁 审核理由：哈哈哈', 1),
(55, '2015-09-16 10:09:27', b'1', '新增客户[<i>深圳华为</i>]审核通过。审核人：领导3 审核理由：', 80),
(56, '2015-09-16 10:11:30', b'0', '新增客户[<i>彭伟华</i>]审核通过。审核人：领导3 审核理由：', 80),
(57, '2015-09-16 14:56:15', b'0', '申请客户[<i>中午5</i>]通过,审核流程：<br/>领导2;通过;-->领导1;通过;', 68),
(58, '2015-09-16 16:31:15', b'0', '新增客户[<i>彭伟华</i>]审核通过。审核人：你猜我是谁 审核理由：', 80),
(59, '2015-09-16 16:31:15', b'0', '新增客户[<i>深圳华为</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(60, '2015-09-16 16:31:15', b'0', '新增客户[<i>深圳华为</i>]审核通过。审核人：你猜我是谁 审核理由：', 1),
(61, '2015-10-17 11:29:25', b'0', '申请客户[<i>1111111</i>]不通过,审核流程：<br/>领导1;不通过;', 67),
(62, '2015-11-25 16:11:04', b'0', '申请客户[<i>华南理工大学计算机系统研究生</i>]通过,审核流程：<br/>领导1;通过;1232143342734381723524313243542312543243123534313235343136452343113235324312532431324224354231245444', 70),
(63, '2015-11-25 16:11:44', b'0', '申请客户[<i>彭伟华</i>]不通过,审核流程：<br/>领导3;忽略;-->领导2;不通过;1232544556678789787654321133456789654321324345765643221334567786754324323234546787654321234356766534', 80),
(64, '2015-12-02 10:32:27', b'0', '申请客户[<i>111111</i>]不通过,审核流程：<br/>领导2;通过;通过哈-->领导1;不通过;', 75),
(65, '2015-12-02 10:32:27', b'0', '申请客户[<i>111111</i>]通过,审核流程：<br/>领导1;通过;', 70),
(66, '2015-12-02 10:33:06', b'0', '申请客户[<i>000000</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;给你', 75),
(67, '2015-12-02 10:33:06', b'0', '申请客户[<i>000000</i>]通过,审核流程：<br/>领导1;通过;给你', 70),
(68, '2015-12-02 10:51:34', b'0', '申请客户[<i>1111111</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', 75),
(69, '2015-12-02 10:51:34', b'0', '申请客户[<i>1111111</i>]通过,审核流程：<br/>领导1;通过;', 70),
(70, '2015-12-03 09:28:48', b'0', '申请客户[<i>1123</i>]通过,审核流程：<br/>领导2;通过;-->领导1;通过;', 75),
(71, '2015-12-03 09:28:48', b'0', '申请客户[<i>1123</i>]不通过,审核流程：<br/>领导1;不通过;', 70),
(72, '2015-12-03 09:52:11', b'0', '申请客户[<i>testtest</i>]通过,审核流程：<br/>领导1;通过;', 70),
(73, '2015-12-03 09:52:11', b'0', '申请客户[<i>testtest</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', 75),
(74, '2015-12-03 09:52:38', b'0', '申请客户[<i>testtt</i>]通过,审核流程：<br/>领导1;通过;', 70),
(75, '2015-12-03 09:52:38', b'0', '申请客户[<i>testtt</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', 75),
(76, '2015-12-03 09:52:54', b'0', '申请客户[<i>tyyy</i>]通过,审核流程：<br/>领导1;通过;', 70),
(77, '2015-12-03 09:52:54', b'0', '申请客户[<i>tyyy</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', 75),
(78, '2015-12-03 09:53:32', b'0', '申请客户[<i>中午2</i>]不通过,审核流程：<br/>领导1;不通过;', 67),
(79, '2015-12-03 09:53:32', b'0', '申请客户[<i>中午2</i>]通过,审核流程：<br/>领导1;通过;', 70),
(80, '2015-12-03 09:53:32', b'0', '申请客户[<i>中午2</i>]不通过,审核流程：<br/>领导2;忽略;-->领导1;不通过;', 75),
(81, '2015-12-11 20:03:45', b'0', '申请客户[<i>的沙</i>]通过,审核流程：<br/>领导2;通过;-->领导1;通过;', 75);

-- --------------------------------------------------------

--
-- 表的结构 `programtask`
--

CREATE TABLE IF NOT EXISTS `programtask` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `programtask`
--

INSERT INTO `programtask` (`id`, `sn`, `taskName`, `demanderId`, `demanderUserId`, `issueTime`, `modifyTime`, `description`, `cncId`, `cncUserId`, `resultUploadTime`, `resultModifyTime`, `resultDescription`, `statusId`, `resultStatusId`, `filePath`) VALUES
(1, NULL, '制卡1', 1, 1, '2016-01-29 14:11:03', '2016-01-29 14:11:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, '制卡2', 2, 3, '2016-01-29 14:11:00', '2016-01-29 14:11:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, '制卡4', 1, 5, '2016-01-29 14:10:54', '2016-01-29 14:11:16', NULL, 2, NULL, NULL, NULL, NULL, 2, 4, NULL),
(5, NULL, '制卡5', 1, 5, '2016-01-29 14:10:51', '2016-01-29 14:11:13', NULL, 3, 4, NULL, NULL, NULL, 2, 5, NULL),
(6, NULL, '哈哈哈', 1, 1, '2016-01-29 15:34:43', '2016-01-29 15:34:43', '13124123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'C:\\Users\\hj\\Workspaces\\MyEclipse Professional\\.metadata\\.me_tcat\\webapps\\cnc\\upload/20160129153431891_1'),
(7, NULL, '哈哈哈哈1', 1, 1, '2016-01-29 15:55:54', '2016-01-29 15:55:54', '1124334', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'C:\\Users\\hj\\Workspaces\\MyEclipse Professional\\.metadata\\.me_tcat\\webapps\\cnc\\upload/20160129155423435_1'),
(8, NULL, '呵呵', 1, 1, '2016-01-29 15:59:55', '2016-01-29 15:59:55', '123124123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'C:\\Users\\hj\\Workspaces\\MyEclipse Professional\\.metadata\\.me_tcat\\webapps\\cnc\\upload/20160129155920617_1'),
(10, NULL, '呵呵1', 1, 1, '2016-01-29 16:12:44', '2016-01-29 16:12:44', '213', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129161242079_1'),
(11, NULL, '呵呵2', 1, 1, '2016-01-29 16:13:40', '2016-01-29 16:13:40', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129161337539_1'),
(12, NULL, '嘿嘿1', 1, 1, '2016-01-29 16:16:16', '2016-01-29 16:16:16', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129161615108_1'),
(13, NULL, '哈哈哈3', 1, 1, '2016-01-29 16:22:36', '2016-01-29 16:22:36', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129162234905_1'),
(14, NULL, '哈哈哈4', 1, 1, '2016-01-29 16:34:06', '2016-01-29 16:34:06', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129163404462_1'),
(15, NULL, '哈哈哈哈1', 1, 1, '2016-01-29 16:45:02', '2016-01-29 16:45:02', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129164502074_1'),
(16, NULL, '12312', 1, 1, '2016-01-29 16:46:51', '2016-01-29 16:46:51', '1231232143', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129164651694_1'),
(17, NULL, '1231231', 1, 1, '2016-01-29 16:49:44', '2016-01-29 16:49:44', '13131', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129164944255_1'),
(18, NULL, '驱蚊器', 1, 1, '2016-01-29 16:51:16', '2016-01-29 16:51:16', '请问企鹅', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129165116583_1'),
(19, NULL, '呵呵', 1, 1, '2016-01-29 23:06:10', '2016-01-29 23:06:10', '1231231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20160129230610805_1');

-- --------------------------------------------------------

--
-- 表的结构 `programtaskattachment`
--

CREATE TABLE IF NOT EXISTS `programtaskattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(12) DEFAULT NULL,
  `taskId` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `fileName` varchar(200) DEFAULT NULL,
  `filePath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2E5F8C0C8AD83AC` (`taskId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `programtaskattachment`
--

INSERT INTO `programtaskattachment` (`id`, `sn`, `taskId`, `type`, `fileName`, `filePath`) VALUES
(2, NULL, 14, 'G代码', '1.docx', '20160129163404462_1/1.docx'),
(3, NULL, 14, 'G代码', '2222222.png', '20160129163404462_1/2222222.png'),
(4, NULL, 14, 'G代码', '1111111.jpg', '20160129163404462_1/1111111.jpg'),
(5, NULL, 14, 'G代码', NULL, '20160129163404462_1/null'),
(6, NULL, 7, 'G代码', '1.docx', '20160129164502074_1/1.docx'),
(7, NULL, 7, 'G代码', 'Cnctaskresult.hbm.xml', '20160129164502074_1/Cnctaskresult.hbm.xml'),
(8, NULL, 7, 'G代码', 'CnctaskresultDetails.hbm.xml', '20160129164502074_1/CnctaskresultDetails.hbm.xml'),
(9, NULL, 7, 'G代码', NULL, '20160129164502074_1/null'),
(10, NULL, 7, '作业指导书', 'ProgramtaskDetails.hbm.xml', '20160129164502074_1/ProgramtaskDetails.hbm.xml'),
(11, NULL, 16, 'G代码', 'CnctaskresultDetails.hbm.xml', '20160129164651694_1/CnctaskresultDetails.hbm.xml'),
(12, NULL, 16, '工艺单', 'Manufacturetask.hbm.xml', '20160129164651694_1/Manufacturetask.hbm.xml'),
(13, NULL, 16, '检验指导书', 'ManufacturetaskDetails.hbm.xml', '20160129164651694_1/ManufacturetaskDetails.hbm.xml'),
(14, NULL, 16, '其他文件', 'ProgramtaskDetails.hbm.xml', '20160129164651694_1/ProgramtaskDetails.hbm.xml'),
(15, NULL, 17, 'G代码', 'Cnctaskresult.hbm.xml', '20160129164944255_1/Cnctaskresult.hbm.xml'),
(16, NULL, 18, 'G代码', 'ProgramtaskAttachment.hbm.xml', '20160129165116583_1/ProgramtaskAttachment.hbm.xml'),
(17, NULL, 8, 'G代码', 'ProgramtaskAttachment.hbm.xml', '20160129230610805_1/ProgramtaskAttachment.hbm.xml'),
(18, NULL, 8, 'G代码', 'Manufacturetask.java', '20160129230610805_1/Manufacturetask.java');

-- --------------------------------------------------------

--
-- 表的结构 `programtaskdetails`
--

CREATE TABLE IF NOT EXISTS `programtaskdetails` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `programtaskresult`
--

CREATE TABLE IF NOT EXISTS `programtaskresult` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'action id',
  `url` varchar(60) NOT NULL COMMENT 'action的url',
  `functionId` int(11) NOT NULL COMMENT '该action所属功能的id',
  `isPage` tinyint(1) NOT NULL COMMENT '是否对应页面',
  `breadCrumb` varchar(100) NOT NULL COMMENT '当isPage为真，指页面的面包屑，以英文逗号分隔',
  `status` char(1) NOT NULL COMMENT '使用状态，U表示正常使用，N表示禁用，A表示无权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统的请求表' AUTO_INCREMENT=45 ;

--
-- 转存表中的数据 `request`
--

INSERT INTO `request` (`id`, `url`, `functionId`, `isPage`, `breadCrumb`, `status`) VALUES
(1, 'userManage/list', 4, 1, '用户管理,用户列表', 'U'),
(2, 'userManage/addInput', 3, 1, '用户管理,添加用户', 'U'),
(3, 'userManage/add', 3, 0, '', 'U'),
(4, 'userManage/listAjax', 4, 0, '', 'U'),
(5, 'userManage/updateInput', 5, 1, '用户管理,修改用户', 'U'),
(6, 'userManage/update', 5, 0, '', 'U'),
(7, 'userManage/edit', 6, 0, '', 'U'),
(9, 'userManage/info', 4, 1, '用户管理,用户详细信息', 'U'),
(10, 'role/list', 8, 1, '角色管理,角色列表', 'U'),
(11, 'role/addInput', 7, 1, '角色管理,添加角色', 'U'),
(12, 'role/add', 7, 0, '', 'U'),
(13, 'role/listAjax', 8, 0, '', 'U'),
(14, 'role/updateInput', 9, 1, '角色管理,修改角色', 'U'),
(15, 'role/update', 9, 0, '', 'U'),
(16, 'role/edit', 10, 0, '', 'U'),
(17, 'role/info', 8, 1, '角色管理,角色详细信息', 'U'),
(18, 'function/list', 15, 1, '功能管理,功能列表', 'U'),
(19, 'function/addInput', 14, 1, '功能管理,添加功能', 'U'),
(20, 'function/add', 14, 0, '', 'U'),
(21, 'function/listAjax', 15, 0, '', 'U'),
(22, 'function/updateInput', 16, 1, '功能管理,修改功能', 'U'),
(23, 'function/update', 16, 0, '', 'U'),
(24, 'function/edit', 17, 0, '', 'U'),
(25, 'function/info', 15, 1, '功能管理,功能详细信息', 'U'),
(26, 'request/list', 19, 1, '请求管理,用户请求', 'U'),
(27, 'request/addInput', 18, 1, '请求管理,添加请求', 'U'),
(28, 'request/add', 18, 0, '', 'U'),
(29, 'request/listAjax', 19, 0, '', 'U'),
(30, 'request/updateInput', 20, 1, '请求管理,修改请求', 'U'),
(31, 'request/update', 20, 0, '', 'U'),
(32, 'request/edit', 21, 0, '', 'U'),
(33, 'request/info', 19, 1, '请求管理,请求详细信息', 'U'),
(34, 'menu/list', 23, 1, '菜单管理,菜单项列表', 'U'),
(35, 'menu/addInput', 22, 1, '菜单管理,添加菜单项', 'U'),
(36, 'menu/add', 22, 0, '', 'U'),
(37, 'menu/listAjax', 23, 0, '', 'U'),
(38, 'menu/updateInput', 24, 1, '菜单管理,修改菜单项', 'U'),
(39, 'menu/update', 24, 0, '', 'U'),
(40, 'menu/edit', 25, 0, '', 'U'),
(41, 'menu/info', 23, 1, '菜单管理,菜单项详细信息', 'U'),
(42, 'role/grantInput', 28, 1, '角色管理,分配功能', 'U'),
(43, 'role/grant', 28, 0, '', 'U'),
(44, 'test/testSession', 30, 1, '测试管理,测试session', 'U');

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(40) NOT NULL COMMENT '角色名',
  `companyType` varchar(20) NOT NULL COMMENT '公司类型',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `enable` tinyint(1) NOT NULL COMMENT '是否启用',
  `sortOrder` int(6) unsigned NOT NULL DEFAULT '20' COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='角色表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `name`, `companyType`, `description`, `enable`, `sortOrder`) VALUES
(1, '超级管理员', 'mingsen', '', 1, 20),
(2, '管理员', 'demander', '', 1, 20),
(3, '业务员', 'manufacturer', '', 1, 20),
(4, '领导', 'cnc', '', 1, 20),
(5, '品牌创建修改人员', 'manufacturer', '', 1, 20),
(6, '品牌审核人员', 'cnc', '', 1, 20),
(8, '财务', 'cnc', 'xxxxx', 1, 21),
(9, '财务财务', 'mingsen', 'xcs', 1, 22),
(10, '清洁人员', 'cnc', '打扫卫生，煮饭', 1, 24);

-- --------------------------------------------------------

--
-- 表的结构 `rolefunction`
--

CREATE TABLE IF NOT EXISTS `rolefunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id，用于解决hibernate复合id的问题',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `functionId` int(11) NOT NULL COMMENT '功能id',
  `identify` bit(1) DEFAULT NULL COMMENT '是否需要在使用时验证身份',
  PRIMARY KEY (`id`),
  KEY `FKEA35D68E8B5D6188` (`functionId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='角色、功能关联表' AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `rolefunction`
--

INSERT INTO `rolefunction` (`id`, `roleId`, `functionId`, `identify`) VALUES
(2, 10, 5, b'0'),
(8, 10, 3, b'0'),
(10, 1, 10, b'0'),
(11, 1, 7, b'0'),
(12, 1, 6, b'0'),
(13, 1, 5, b'0'),
(14, 1, 4, b'0'),
(15, 1, 9, b'0'),
(16, 1, 8, b'0'),
(19, 1, 28, b'0'),
(22, 1, 17, b'0'),
(23, 1, 22, b'0'),
(25, 1, 23, b'0'),
(26, 1, 15, b'0'),
(27, 1, 24, b'0'),
(28, 1, 16, b'0'),
(29, 1, 25, b'0'),
(30, 1, 14, b'0'),
(31, 1, 27, b'0'),
(32, 1, 21, b'0'),
(33, 1, 20, b'0'),
(34, 1, 30, b'0'),
(35, 1, 19, b'0'),
(37, 1, 18, b'0');

-- --------------------------------------------------------

--
-- 表的结构 `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `status`
--

INSERT INTO `status` (`id`, `name`, `description`) VALUES
(1, '未接受', ''),
(2, '已接受', ''),
(3, '已拒绝', ''),
(4, '未完成', ''),
(5, '已完成', '');

-- --------------------------------------------------------

--
-- 表的结构 `systemlog`
--

CREATE TABLE IF NOT EXISTS `systemlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_desc` longtext NOT NULL,
  `event_table` longtext NOT NULL,
  `log_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBABEF675437EC317` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=91 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `account`, `password`, `name`, `status`, `cellphone`, `email`, `roleId`, `companyId`, `companyType`) VALUES
(1, 'admin', 'admin', '你猜我是谁', 'U', '', NULL, 1, 0, 'mingsen'),
(3, 'lhq', 'lhq', '连惠琼', 'U', 'csasc@163.com', 'csasc@163.com', 2, 0, '0'),
(4, 'test', '123456', 'test', 'U', 'sdaf', '', 4, 0, '0'),
(5, 'yy', '123', 'vv', 'U', '', '', 3, 0, '0'),
(6, 'testtest', '123456', '张三', 'U', '', '', 3, 0, '0'),
(9, '而二', '123456', '热热', 'U', '二', '而', 3, 0, '0'),
(12, 'afds', '123456', 'asdffffffffdafsdfsdf', 'U', 'dfasafdsssssssssssss', 'dfas', 4, 0, '0'),
(15, '232323', '123456', 'dafsadfadsf', 'U', 'daf', 'sdaf', 4, 0, '0'),
(16, 'test111', '1234', '张洪伟', 'U', NULL, NULL, 3, 0, '0'),
(17, 'test33', 'test', '张宏伟', 'U', NULL, NULL, 5, 0, '0'),
(18, 'test44', '123', '张洪伟', 'U', NULL, NULL, 6, 0, '0'),
(19, '大法师', '123', '大师傅', 'U', NULL, NULL, 5, 0, '0'),
(20, '阿范德萨', '123456', '发大水', 'U', NULL, NULL, 5, 0, '0'),
(21, 'sale12', 'sale12', 'dsfa', 'U', NULL, 'we', 3, 0, '0'),
(22, 'test_adm', 'zhw', '张洪伟', 'U', '123456', 'hello@qq.com', 2, 0, '0'),
(23, 'test_yewuyuan', 'zhw', '张洪伟', 'U', '123', 'hello@126.com', 3, 0, '0'),
(24, 'test_lingdao', 'zhw', '张洪伟', 'U', NULL, 'hello', 4, 0, '0'),
(25, 'test_ppcj', 'zhw', '张洪伟ppcj', 'U', NULL, NULL, 5, 0, '0'),
(26, 'test_ppsh', 'zhw', '张洪伟ppsh', 'U', '123456789', 'hello@163.com', 6, 0, '0'),
(28, '手动阀手动阀啊是的发生地方士大夫啊四大是', '123', '是是', 'U', NULL, NULL, 3, 0, '0'),
(29, 'ld_lhq', 'zhw', '连惠琼', 'U', NULL, NULL, 4, 0, '0'),
(30, 'ld_zhw', 'zhw', '张洪伟', 'U', NULL, NULL, 4, 0, '0'),
(31, 'ld_lj', 'zhw', '李剑', 'U', NULL, NULL, 4, 0, '0'),
(32, 'ywy_zhw', 'zhw', '张洪伟', 'U', NULL, NULL, 3, 0, '0'),
(33, 'ywy_pxg', 'zhw', '彭雄冠', 'U', NULL, NULL, 3, 0, '0'),
(34, 'ywy_hj', 'zhw', '胡军', 'U', NULL, NULL, 3, 0, '0'),
(35, 'ld_ls', 'zhw', '李胜', 'U', NULL, NULL, 4, 0, '0'),
(36, 'ld_qdy', 'zhw', '齐德昱', 'U', NULL, NULL, 4, 0, '0'),
(37, 'ld_zz', 'zhw', '曾总', 'U', NULL, NULL, 4, 0, '0'),
(38, 'ywy_lqb', 'zhw', '李启邦', 'U', NULL, NULL, 3, 0, '0'),
(39, 'yes', '123456', 'yes1', 'U', NULL, NULL, 3, 0, '0'),
(40, 'yes2', '123456', 'yes2', 'U', NULL, NULL, 3, 0, '0'),
(41, 'yes3', '123456', 'yes3', 'U', NULL, NULL, 3, 0, '0'),
(42, 'hj', '123456', '123456', 'U', '1345679462536', '835564874@qq.com', 5, 0, '0'),
(43, 'hj123', '123456', 'hj123', 'U', NULL, NULL, 6, 0, '0'),
(44, 'user1', '123456', '用户1', 'U', NULL, NULL, 3, 0, '0'),
(45, 'aaa', '123456', 'aaa', 'U', NULL, NULL, 3, 0, '0'),
(48, 'bbb', '123456', 'bbb', 'U', NULL, NULL, 3, 0, '0'),
(49, 'ad', '123456', 'ad', 'U', '18888888888', 'XXXXXXXX163.com', 2, 0, '0'),
(50, 'ads', '123456', 'ads', 'U', '18888888888', 'XXXXXXXXXX163.com', 2, 0, '0'),
(51, '999999', '123456', '999999', 'U', NULL, NULL, 2, 0, '0'),
(52, '111111', '123456', '111111', 'U', '123456789', '123456@163.com', 3, 0, '0'),
(53, '1', '123456', '1', 'U', '1', '1', 2, 0, '0'),
(54, '121212', '123456', '11212', 'U', '1', '1', 2, 0, '0'),
(55, '121212633', '123456', '11212', 'U', '1', '1', 2, 0, '0'),
(56, '81801', '123456', '81801', 'U', NULL, NULL, 2, 0, '0'),
(57, '081802', '123456', '081802', 'N', NULL, NULL, 3, 0, '0'),
(58, '081803', '123456', '081803', 'N', NULL, NULL, 2, 0, '0'),
(59, '081804', '123456', '081804', 'N', NULL, NULL, 5, 0, '0'),
(60, '081805', '123456', '081805', 'U', NULL, NULL, 2, 0, '0'),
(61, '081801', '123456', '081801', 'U', '13549537253', '222@qq.com', 2, 0, 'cnc'),
(62, '081806', '123456', '081806', 'U', NULL, NULL, 4, 0, '0'),
(63, '081807', '123456', '081807', 'U', NULL, '123423423', 6, 0, '0'),
(64, '081808', '123456', '081808', 'U', NULL, NULL, 6, 0, '0'),
(65, '081809', '123456', '081809', 'U', NULL, NULL, 6, 0, '0'),
(66, '李胜', '123456', '李胜', 'U', NULL, NULL, 4, 0, '0'),
(67, '业务员1', '123456', '业务员1', 'U', NULL, NULL, 3, 0, '0'),
(68, '业务员2', '123456', '业务员2', 'U', NULL, NULL, 3, 0, '0'),
(69, '领导1', '123456', '领导1', 'U', NULL, NULL, 4, 0, '0'),
(70, '领导2', '123456', '领导2', 'U', NULL, NULL, 4, 0, '0'),
(71, '品牌创建人1', '123456', '品牌创建人1', 'U', NULL, NULL, 5, 0, '0'),
(72, '品牌创建人2', '123456', '品牌创建人2', 'U', NULL, NULL, 5, 0, '0'),
(73, '品牌审核人1', '123456', '品牌审核人1', 'U', NULL, NULL, 6, 0, '0'),
(74, '品牌审核人2', '123456', '品牌审核人2', 'U', NULL, NULL, 2, 0, '0'),
(75, '领导3', '123456', '领导3', 'U', NULL, NULL, 4, 0, '0'),
(76, '`12342321', '123456', '232432', 'U', NULL, NULL, 5, 0, '0'),
(77, '124321', '123456', '1323433', 'U', NULL, NULL, 4, 0, '0'),
(78, '哈喽', '123456', '哈喽', 'U', NULL, NULL, 3, 0, '0'),
(79, 'hujun123', '123456', '胡军123', 'U', '2134356643', '1233434546432', 3, 0, '0'),
(80, '彭伟华', '123456', '彭伟华', 'U', NULL, '11233544443267543217655432111111111111@qq.com', 3, 0, '0'),
(81, '123', '123456', '123', 'U', NULL, NULL, 3, 0, '0'),
(82, '1111', '123456', '1111', 'U', NULL, NULL, 2, 0, '0'),
(83, 'Mary1', '123456', 'Mary1', 'U', '123455', '443@qq.com', 3, 1, 'manufacturer'),
(87, 'mingsen', '123456', '明森', 'U', '13899998888', '532456@qq.com', 1, 27, '数控工厂'),
(88, 'zhizaoshang2', '123456', '制造商2', 'U', '13888888888', '543217890@qq.com', 1, 6, '制造商'),
(89, 'zhizaoshang5', '123456', '制造商5', 'U', '13888888888', '543217890@qq.com', 1, 9, '制造商'),
(90, '1哈哈', '123456', '1哈哈', 'U', NULL, NULL, 1, 1, 'mingsen');

--
-- 限制导出的表
--

--
-- 限制表 `cnclog`
--
ALTER TABLE `cnclog`
  ADD CONSTRAINT `FK7890F6EC437EC317` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- 限制表 `demanderlog`
--
ALTER TABLE `demanderlog`
  ADD CONSTRAINT `FKD684B7CC437EC317` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- 限制表 `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `FKA9601F725F16500C` FOREIGN KEY (`upperID`) REFERENCES `department` (`id`);

--
-- 限制表 `manufacturelog`
--
ALTER TABLE `manufacturelog`
  ADD CONSTRAINT `FK1FEABEE3437EC317` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- 限制表 `manufacturertask`
--
ALTER TABLE `manufacturertask`
  ADD CONSTRAINT `FKD241C1163A500BA` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`id`),
  ADD CONSTRAINT `FKD241C1163A56199` FOREIGN KEY (`resultStatusId`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `FKD241C116609D4A3F` FOREIGN KEY (`manufacturerUserId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKD241C11662540248` FOREIGN KEY (`demanderId`) REFERENCES `demander` (`id`),
  ADD CONSTRAINT `FKD241C1168CB58D66` FOREIGN KEY (`demanderUserId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKD241C11695DF067C` FOREIGN KEY (`statusId`) REFERENCES `status` (`id`);

--
-- 限制表 `manufacturertaskdetails`
--
ALTER TABLE `manufacturertaskdetails`
  ADD CONSTRAINT `FKC2DE844C802C6813` FOREIGN KEY (`taskId`) REFERENCES `manufacturertask` (`id`);

--
-- 限制表 `programtask`
--
ALTER TABLE `programtask`
  ADD CONSTRAINT `FK9FA58E093A56199` FOREIGN KEY (`resultStatusId`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `FK9FA58E0941EA94EE` FOREIGN KEY (`cncId`) REFERENCES `cnc` (`id`),
  ADD CONSTRAINT `FK9FA58E0962540248` FOREIGN KEY (`demanderId`) REFERENCES `demander` (`id`),
  ADD CONSTRAINT `FK9FA58E0988B02686` FOREIGN KEY (`cncUserId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK9FA58E098CB58D66` FOREIGN KEY (`demanderUserId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK9FA58E0995DF067C` FOREIGN KEY (`statusId`) REFERENCES `status` (`id`);

--
-- 限制表 `programtaskattachment`
--
ALTER TABLE `programtaskattachment`
  ADD CONSTRAINT `FK2E5F8C0C8AD83AC` FOREIGN KEY (`taskId`) REFERENCES `programtask` (`id`);

--
-- 限制表 `programtaskdetails`
--
ALTER TABLE `programtaskdetails`
  ADD CONSTRAINT `FKBA9ACFF98AD83AC` FOREIGN KEY (`taskId`) REFERENCES `programtask` (`id`);

--
-- 限制表 `programtaskresult`
--
ALTER TABLE `programtaskresult`
  ADD CONSTRAINT `FKB28DD7868AD83AC` FOREIGN KEY (`taskId`) REFERENCES `programtask` (`id`);

--
-- 限制表 `systemlog`
--
ALTER TABLE `systemlog`
  ADD CONSTRAINT `FKBABEF675437EC317` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- 限制表 `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK285FEB1519B1C4` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
