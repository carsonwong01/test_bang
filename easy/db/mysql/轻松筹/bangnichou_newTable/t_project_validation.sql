/*
Navicat MySQL Data Transfer

Source Server         : bangnichouOnline
Source Server Version : 50719
Source Host           : 122.114.91.233:3306
Source Database       : bangnichou

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-04 13:46:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_project_validation
-- ----------------------------
DROP TABLE IF EXISTS `t_project_validation`;
CREATE TABLE `t_project_validation` (
  `validation_id` varchar(25) NOT NULL COMMENT '验证ID',
  `project_id` varchar(25) NOT NULL COMMENT '项目ID',
  `validation_type` char(2) NOT NULL COMMENT '1:本人验证\r\n            2:亲属验证\r\n            3:夫妻验证\r\n            4:组织验证(企业验证)',
  `receive_real_name` varchar(50) DEFAULT NULL COMMENT '收款人真实姓名',
  `receive_id_card` varchar(50) DEFAULT NULL COMMENT '收款人身份证号',
  `receive_id_card2` varchar(50) DEFAULT NULL COMMENT '收款人身份证号(星号屏蔽)',
  `receive_phone` varchar(25) DEFAULT NULL COMMENT '收款人联系电话',
  `disease` varchar(100) DEFAULT NULL COMMENT '所患疾病',
  `hospital_region_id` varchar(25) DEFAULT NULL COMMENT '医院省市ID',
  `hospital_name` varchar(50) DEFAULT NULL COMMENT '医院名称',
  `recipient_real_name` varchar(50) DEFAULT NULL COMMENT '受助人真实姓名',
  `recipient` varchar(50) DEFAULT NULL COMMENT '受助人身份证号',
  `recipient_id_card` varchar(50) DEFAULT NULL COMMENT '受助人身份证号(星号屏蔽)',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '组织名称',
  `organization_phone` varchar(25) DEFAULT NULL COMMENT '组织联系电话',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `date_update` datetime DEFAULT NULL COMMENT '修改时间',
  `audit_status` char(2) NOT NULL DEFAULT '1' COMMENT '1:审核待审核\r\n            2:审核不通过\r\n            3:审核通过',
  `date_aduit` datetime DEFAULT NULL COMMENT '审核时间',
  `aduit_user_id` varchar(25) DEFAULT NULL COMMENT '审核人ID',
  `receive_card_image_id` varchar(25) DEFAULT NULL COMMENT '收款人手持身份证照片ID',
  `receive_card_image_url` varchar(50) DEFAULT NULL COMMENT '收款人手持身份证照片URL',
  `recipient_card_image_id` varchar(25) DEFAULT NULL COMMENT '受助人手持身份证照片ID',
  `recipient_card_image_url` varchar(50) DEFAULT NULL COMMENT '受助人手持身份证照片URL',
  `wedding_picture_id` varchar(25) DEFAULT NULL COMMENT '结婚证照片ID',
  `wedding_picture_url` varchar(50) DEFAULT NULL COMMENT '结婚证照片URL',
  `organization_aptitude_id` varchar(25) DEFAULT NULL COMMENT '组织机构资质/营业执照图片ID',
  `organization_aptitude_url` varchar(50) DEFAULT NULL COMMENT '组织机构资质/营业执照图片URL',
  `foundation_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`validation_id`),
  UNIQUE KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目验证表';
