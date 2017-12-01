/*
Navicat MySQL Data Transfer

Source Server         : bangni
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : bangnichou

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-01 10:30:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_hospital_basic
-- ----------------------------
DROP TABLE IF EXISTS `t_hospital_basic`;
CREATE TABLE `t_hospital_basic` (
  `hospital_id` varchar(25) NOT NULL COMMENT '用户ID',
  `hospital_name` varchar(100) DEFAULT NULL,
  `hospital_num` varchar(25) DEFAULT NULL,
  `hospital_grade` varchar(20) DEFAULT NULL,
  `hospital_type` varchar(25) DEFAULT NULL,
  `found_time` varchar(25) DEFAULT NULL,
  `hospital_abstract` varchar(500) DEFAULT NULL,
  `hospital_image_url` varchar(200) DEFAULT NULL,
  `hospital_image_id` varchar(25) DEFAULT NULL,
  `description` text,
  `link_name` varchar(20) DEFAULT NULL,
  `hospital_mail` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(11) DEFAULT NULL,
  `office_tel` varchar(30) DEFAULT NULL,
  `hospital_url` varchar(100) DEFAULT NULL,
  `province` varchar(6) DEFAULT NULL,
  `city` varchar(6) DEFAULT NULL,
  `county` varchar(6) DEFAULT NULL,
  `logo_url` varchar(200) DEFAULT NULL,
  `logo_id` varchar(25) DEFAULT NULL,
  `description_image_url` varchar(200) DEFAULT NULL,
  `description_image_id` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of t_hospital_basic
-- ----------------------------
INSERT INTO `t_hospital_basic` VALUES ('101711251707099505', '千佛山', '211', '二甲', '专科', '1958年', '嘿嘿', null, null, '嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿', '李四', 'hehe@126.com', '18611111111', '0531', null, '37', '01', '02', null, null, null, null);
INSERT INTO `t_hospital_basic` VALUES ('101711271806007644', '大明湖', '985', '三甲', '综合', '1966年', '哈哈', null, null, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '张三', 'hah@163.com', '15911111111', '0531', null, '37', '01', '01', null, null, null, null);
