/*
Navicat MySQL Data Transfer

Source Server         : bangnichouOnline
Source Server Version : 50719
Source Host           : 122.114.91.233:3306
Source Database       : bangnichou

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-04 13:41:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cooperation_partner
-- ----------------------------
DROP TABLE IF EXISTS `cooperation_partner`;
CREATE TABLE `cooperation_partner` (
  `partner_id` varchar(25) NOT NULL,
  `partner_type` varchar(50) DEFAULT NULL,
  `partner_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合作伙伴';
