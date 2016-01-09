/*
Navicat MySQL Data Transfer

Source Server         : spring
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : crms

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2014-11-30 23:36:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  `upperID` bigint(20) DEFAULT NULL,
  `createTimestamp` datetime NOT NULL,
  `createUser_id` int(11) NOT NULL,
  `alterTimestamp` datetime NOT NULL,
  `alterUser_id` int(11) NOT NULL,
  `auditTimestamp` datetime NOT NULL,
  `auditUser_id` int(11) NOT NULL,
  `state` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK3D75B67891E2ADC` (`auditUser_id`),
  KEY `FK3D75B6770D6DE41` (`alterUser_id`),
  KEY `FK3D75B67662D4E9B` (`createUser_id`),
  KEY `FK3D75B672DDC4F27` (`upperID`),
  CONSTRAINT `FK3D75B672DDC4F27` FOREIGN KEY (`upperID`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK3D75B67662D4E9B` FOREIGN KEY (`createUser_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK3D75B6770D6DE41` FOREIGN KEY (`alterUser_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK3D75B67891E2ADC` FOREIGN KEY (`auditUser_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for brandaudit
-- ----------------------------
DROP TABLE IF EXISTS `brandaudit`;
CREATE TABLE `brandaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brandID` bigint(20) DEFAULT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `operTimestamp` datetime NOT NULL,
  `operUser_id` int(11) NOT NULL,
  `operType` char(1) NOT NULL,
  `upperID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC71758B4740F8909` (`operUser_id`),
  KEY `FKC71758B42DDC4F27` (`upperID`),
  CONSTRAINT `FKC71758B42DDC4F27` FOREIGN KEY (`upperID`) REFERENCES `brand` (`id`),
  CONSTRAINT `FKC71758B4740F8909` FOREIGN KEY (`operUser_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `brefName` varchar(10) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `website` varchar(40) DEFAULT NULL,
  `createTimestamp` datetime NOT NULL,
  `createUser_id` int(11) NOT NULL,
  `alterTimestamp` datetime NOT NULL,
  `alterUser_id` int(11) NOT NULL,
  `auditTimestamp` datetime NOT NULL,
  `auditUser` int(11) NOT NULL,
  `industry_id` smallint(6) DEFAULT NULL,
  `releaseTimestamp` datetime DEFAULT NULL,
  `followUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7877DFEBD380BC04` (`followUser`),
  KEY `FK7877DFEB423EBFB7` (`industry_id`),
  KEY `FK7877DFEB70D6DE41` (`alterUser_id`),
  KEY `FK7877DFEB57D0F72E` (`auditUser`),
  KEY `FK7877DFEB662D4E9B` (`createUser_id`),
  CONSTRAINT `FK7877DFEB423EBFB7` FOREIGN KEY (`industry_id`) REFERENCES `industry` (`id`),
  CONSTRAINT `FK7877DFEB57D0F72E` FOREIGN KEY (`auditUser`) REFERENCES `user` (`id`),
  CONSTRAINT `FK7877DFEB662D4E9B` FOREIGN KEY (`createUser_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK7877DFEB70D6DE41` FOREIGN KEY (`alterUser_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK7877DFEBD380BC04` FOREIGN KEY (`followUser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for client_brand
-- ----------------------------
DROP TABLE IF EXISTS `client_brand`;
CREATE TABLE `client_brand` (
  `brand_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  PRIMARY KEY (`brand_id`,`client_id`),
  KEY `FKC620C213BA0C67D7` (`client_id`),
  KEY `FKC620C21339A72EBD` (`brand_id`),
  CONSTRAINT `FKC620C21339A72EBD` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `FKC620C213BA0C67D7` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `cellphone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telphone` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `weixin` varchar(20) DEFAULT NULL,
  `education` varchar(10) DEFAULT NULL,
  `hobbies` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `constellation` varchar(10) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `picture` varchar(50) NOT NULL,
  `upperContact` varchar(50) DEFAULT NULL,
  `client_id` bigint(20) NOT NULL,
  `alterTimestamp` datetime NOT NULL,
  `alterUser_id` int(11) NOT NULL,
  `state` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BEFBC0070D6DE41` (`alterUser_id`),
  KEY `FK9BEFBC00BA0C67D7` (`client_id`),
  CONSTRAINT `FK9BEFBC0070D6DE41` FOREIGN KEY (`alterUser_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK9BEFBC00BA0C67D7` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for industry
-- ----------------------------
DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `competence` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `role_id` smallint(6) NOT NULL,
  `resource_id` smallint(6) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`position`),
  KEY `FKE25F2DB79E53FF37` (`role_id`),
  KEY `FKE25F2DB7720D51B7` (`resource_id`),
  CONSTRAINT `FKE25F2DB7720D51B7` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `FKE25F2DB79E53FF37` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `role_id` smallint(6) NOT NULL,
  `department_id` smallint(6) DEFAULT NULL,
  `state` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `FK285FEBA5B21FF7` (`department_id`),
  KEY `FK285FEB9E53FF37` (`role_id`),
  CONSTRAINT `FK285FEB9E53FF37` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK285FEBA5B21FF7` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `subject` varchar(21) NOT NULL,
  `createTimestamp` datetime NOT NULL,
  `createUser_id` int(11) NOT NULL,
  `contact_id` bigint(20) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `accessory` varchar(50) DEFAULT NULL,
  `client_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4ED5D2B5387AF5D` (`contact_id`),
  KEY `FK4ED5D2BBA0C67D7` (`client_id`),
  KEY `FK4ED5D2B662D4E9B` (`createUser_id`),
  CONSTRAINT `FK4ED5D2B5387AF5D` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `FK4ED5D2B662D4E9B` FOREIGN KEY (`createUser_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK4ED5D2BBA0C67D7` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
