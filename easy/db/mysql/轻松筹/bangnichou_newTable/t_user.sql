/*
Navicat MySQL Data Transfer

Source Server         : bangnichouOnline
Source Server Version : 50719
Source Host           : 122.114.91.233:3306
Source Database       : bangnichou

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-04 13:41:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户登录用户名(此刻为手机号)',
  `hospital_id` varchar(25) DEFAULT NULL,
  `hospital_name` varchar(50) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL COMMENT '用户登录密码',
  `trade_pwd` varchar(25) DEFAULT NULL COMMENT '交易密码',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `source` char(2) NOT NULL COMMENT '1 PC \r\n       2 微信\r\n       3 安卓\r\n       4 IOS',
  `source_type` char(2) DEFAULT NULL COMMENT '1产品众筹\r\n            2股权众筹  \r\n     3房产众筹       4轻松筹',
  `date_register` datetime NOT NULL COMMENT '注册时间',
  `user_status` char(2) NOT NULL DEFAULT '1' COMMENT '1正常\r\n            2锁定\r\n            3 拉黑',
  `date_login` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `first_login` char(2) DEFAULT NULL COMMENT '1第一次\r\n            2不是第一次',
  `last_login_ip` varchar(30) NOT NULL DEFAULT '0' COMMENT '最后一次登录ip',
  `pwd_error_count` int(2) DEFAULT NULL COMMENT '当日交易密码错误次数',
  `fail_login_count` int(2) DEFAULT NULL COMMENT '当日登录失败次数',
  `user_type` char(2) NOT NULL DEFAULT '2' COMMENT '1医院用户\n2个人用户',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户总表';
