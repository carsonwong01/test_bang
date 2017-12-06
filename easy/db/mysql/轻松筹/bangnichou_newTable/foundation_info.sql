/*
Navicat MySQL Data Transfer

Source Server         : bangni
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : bangnichou

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-06 18:45:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for foundation_info
-- ----------------------------
DROP TABLE IF EXISTS `foundation_info`;
CREATE TABLE `foundation_info` (
  `foundation_id` varchar(25) NOT NULL,
  `foundation_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`foundation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基金会\n\n';
