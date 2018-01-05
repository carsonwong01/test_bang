/*
Navicat MySQL Data Transfer

Source Server         : bangnichouOnline
Source Server Version : 50719
Source Host           : 122.114.91.233:3306
Source Database       : bangnichou

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-04 13:41:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_hospital_basic
-- ----------------------------
DROP TABLE IF EXISTS `t_hospital_basic`;
CREATE TABLE `t_hospital_basic` (
  `user_id` varchar(25) NOT NULL,
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
  `addr` varchar(100) DEFAULT NULL,
  `logo_url` varchar(200) DEFAULT NULL,
  `logo_id` varchar(25) DEFAULT NULL,
  `description_image_url` varchar(200) DEFAULT NULL,
  `description_image_id` varchar(25) DEFAULT NULL,
  `organization_aptitude_url` varchar(100) DEFAULT NULL COMMENT '组织机构资质证明url',
  `organization_aptitude_id` varchar(25) DEFAULT NULL COMMENT '组织机构证明id',
  `publish_status` char(2) COMMENT '1发布\n2不发布',
  `recommend_status` char(2) DEFAULT NULL COMMENT '1推荐\n2不推荐'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院用户基本信息表';
