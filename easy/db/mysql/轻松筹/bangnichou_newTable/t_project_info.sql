/*
Navicat MySQL Data Transfer

Source Server         : bangnichouOnline
Source Server Version : 50719
Source Host           : 122.114.91.233:3306
Source Database       : bangnichou

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-04 13:41:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_project_info
-- ----------------------------
DROP TABLE IF EXISTS `t_project_info`;
CREATE TABLE `t_project_info` (
  `project_id` varchar(25) NOT NULL COMMENT '项目ID',
  `project_no` varchar(25) NOT NULL COMMENT '项目编号',
  `project_name` varchar(60) NOT NULL COMMENT '项目名称',
  `project_type` char(2) NOT NULL COMMENT '1：大病救助\r\n            2：灾难救助\r\n            3：动物保护\r\n            4：扶贫助学\r\n            5：其他\r\n            6：回报项目\r\n            7：梦想项目',
  `project_creator_id` varchar(25) NOT NULL COMMENT '项目发起人ID',
  `target_amount` decimal(20,2) DEFAULT NULL COMMENT '筹资金额',
  `raised_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '已筹款金额',
  `project_intro` varchar(300) NOT NULL COMMENT '项目简介',
  `project_details` text COMMENT '项目详情',
  `project_status` char(2) NOT NULL COMMENT '项目状态\r\n            1:众筹中\r\n            2:众筹成功\r\n            3:众筹失败\r\n            4:已删除\r\n            ',
  `financing_days` varchar(10) NOT NULL COMMENT '筹资期限（天数）',
  `date_raised_end` datetime NOT NULL COMMENT '筹资期限(结束的具体time)',
  `freight_describe` varchar(50) DEFAULT NULL COMMENT '运费描述',
  `deliver_describe` varchar(50) DEFAULT NULL COMMENT '发货描述',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `modify_id` varchar(25) DEFAULT NULL COMMENT '修改人ID',
  `date_update` datetime DEFAULT NULL COMMENT '修改时间',
  `qr_code_addr` varchar(50) NOT NULL COMMENT '二维码地址',
  `date_success` datetime DEFAULT NULL COMMENT '项目成功时间',
  `project_label` varchar(30) DEFAULT '' COMMENT '标签',
  `is_nedd_addr` char(2) DEFAULT NULL COMMENT '是否提供收货地址:1是2否',
  `date_project_failure` datetime DEFAULT NULL COMMENT '项目失败时间',
  `failure_reason` varchar(200) DEFAULT NULL COMMENT '项目失败原因',
  `operator_failure_id` varchar(25) DEFAULT NULL COMMENT '项目失败操作人',
  `date_project_delete` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_reason` varchar(200) DEFAULT NULL COMMENT '删除原因',
  `operator_delete_id` varchar(25) DEFAULT NULL COMMENT '删除操作人',
  `cover_image_id` varchar(25) DEFAULT NULL COMMENT '封面图片ID',
  `cover_image_url` varchar(100) DEFAULT NULL COMMENT '封面图片URL',
  `shield_status` char(2) DEFAULT '2' COMMENT '项目屏蔽状态，1-屏蔽，2未屏蔽',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目信息表';
