/*
Navicat MySQL Data Transfer

Source Server         : bangnichouOnline
Source Server Version : 50719
Source Host           : 122.114.91.233:3306
Source Database       : bangnichou

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-04 13:39:54
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

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_bus_fees_basic_set
-- ----------------------------
DROP TABLE IF EXISTS `t_bus_fees_basic_set`;
CREATE TABLE `t_bus_fees_basic_set` (
  `min_recharg` decimal(20,2) DEFAULT '0.00' COMMENT '最小充值金额',
  `max_recharg` decimal(20,2) DEFAULT '0.00' COMMENT '最大充值金额',
  `min_recharg_fees` decimal(20,2) DEFAULT '0.00' COMMENT '快捷支付最低充值手续费',
  `min_withdraw` decimal(20,2) DEFAULT '0.00' COMMENT '最小提现金额',
  `max_withdraw` decimal(20,2) DEFAULT '0.00' COMMENT '最大提现金额',
  `withdraw_highest` decimal(20,2) DEFAULT '0.00' COMMENT '最高提现手续费\r\n            (tips:如果提现手续费为10元,用户最高提现手续费为5元,剩余5元平台承担)',
  `withdraw_rate` float DEFAULT '0' COMMENT '提现收取',
  `min_withdraw_fees` decimal(20,2) DEFAULT '0.00' COMMENT '最低提现手续费'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手续费';

-- ----------------------------
-- Table structure for t_bus_withdraw_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_bus_withdraw_apply`;
CREATE TABLE `t_bus_withdraw_apply` (
  `id` varchar(25) NOT NULL COMMENT '主键id',
  `user_id` varchar(25) NOT NULL COMMENT '申请用户id',
  `withdraw_amount` decimal(20,2) NOT NULL COMMENT '提现金额',
  `bank_card_id` varchar(25) NOT NULL COMMENT '银行卡id',
  `poundage` decimal(20,2) DEFAULT NULL COMMENT '手续费',
  `date_create` datetime NOT NULL COMMENT '申请时间',
  `auditor` varchar(25) DEFAULT NULL COMMENT '审核人',
  `check_opinion` varchar(200) DEFAULT NULL COMMENT '审核意见',
  `date_check` datetime DEFAULT NULL COMMENT '审核时间',
  `loaner` varchar(25) DEFAULT NULL COMMENT '放款人(后台用户)',
  `date_loan` datetime DEFAULT NULL COMMENT '放款时间',
  `loan_opinion` varchar(200) DEFAULT NULL COMMENT '放款意见',
  `withdraw_status` char(2) NOT NULL DEFAULT '0' COMMENT '提现状态\r\n            0:待审核\r\n            1:审核通过\r\n            2:提现成功\r\n           3:提现失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户提现申请表';

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

-- ----------------------------
-- Table structure for t_operate_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_operate_feedback`;
CREATE TABLE `t_operate_feedback` (
  `feedback_id` varchar(25) NOT NULL COMMENT '反馈ID',
  `user_id` varchar(25) DEFAULT NULL COMMENT '反馈人ID',
  `contact_email` varchar(30) DEFAULT NULL COMMENT '联系邮箱',
  `feedback_details` varchar(200) DEFAULT NULL COMMENT '反馈意见',
  `date_commit` datetime DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- ----------------------------
-- Table structure for t_order_first_trade_record
-- ----------------------------
DROP TABLE IF EXISTS `t_order_first_trade_record`;
CREATE TABLE `t_order_first_trade_record` (
  `order_id` varchar(25) NOT NULL COMMENT '订单ID',
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  `amount` decimal(20,2) NOT NULL COMMENT '交易金额',
  `type` char(2) DEFAULT NULL COMMENT '1支持',
  `date_trade` datetime NOT NULL COMMENT '首次交易时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首次交易记录';

-- ----------------------------
-- Table structure for t_order_support
-- ----------------------------
DROP TABLE IF EXISTS `t_order_support`;
CREATE TABLE `t_order_support` (
  `order_id` varchar(25) NOT NULL COMMENT '支持ID',
  `project_id` varchar(25) DEFAULT NULL COMMENT '项目ID',
  `return_id` varchar(25) DEFAULT NULL COMMENT '回报ID',
  `order_no` varchar(25) DEFAULT NULL COMMENT '订单编号',
  `pay_type` char(20) DEFAULT NULL COMMENT '200:微信支付  ',
  `pay_source` char(2) DEFAULT NULL COMMENT '来源：2 微信   3安卓  4 IOS',
  `date_pay` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_flow_no` varchar(50) DEFAULT NULL COMMENT '支付流水号',
  `user_id` varchar(25) DEFAULT NULL COMMENT '支持人ID',
  `support_count` varchar(25) DEFAULT NULL COMMENT '支持份数',
  `support_amount` decimal(20,2) DEFAULT NULL COMMENT '支持金额',
  `status` char(2) DEFAULT NULL COMMENT '1:待支付\r\n            2:已取消\r\n            3:已支付\r\n            4:待发货\r\n            5:待收货\r\n            6:已收货\r\n            7:待退款\r\n            8:已退款      9:已失败   10:退款中',
  `date_invalid` datetime DEFAULT NULL COMMENT '订单失效时间',
  `receive_name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `region` varchar(100) DEFAULT NULL COMMENT '所在地区',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `date_create` datetime DEFAULT NULL COMMENT '订单创建时间',
  `refund_type` char(2) DEFAULT NULL COMMENT '1：项目删除退款   2：众筹失败退款\r\n       3：项目超额溢出退款    4：回报不足溢出退款   5：项目删除溢出退款  6:众筹失败溢出退款  ',
  `date_refund` datetime DEFAULT NULL COMMENT '退款发起时间',
  `date_refund_finish` datetime DEFAULT NULL COMMENT '退款结果时间',
  `refund_flow_no` varchar(50) DEFAULT NULL COMMENT '退款批次号/流水号',
  `refund_reason` varchar(100) DEFAULT NULL COMMENT '退款原因',
  `send_flow_no` varchar(50) DEFAULT NULL COMMENT '发货运单号',
  `logistics_name` varchar(100) DEFAULT NULL COMMENT '物流公司',
  `date_send` datetime DEFAULT NULL COMMENT '发货时间',
  `date_receive` datetime DEFAULT NULL COMMENT '确认收货时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `date_pay_check` datetime DEFAULT NULL COMMENT '支付对账时间',
  `pay_check_status` char(2) DEFAULT NULL COMMENT '支付对账状态(1:未对账2:成功3:失败)',
  `date_refund_check` datetime DEFAULT NULL COMMENT '退款对账时间',
  `refund_check_status` char(2) DEFAULT NULL COMMENT '退款对账状态(1:未对账2:成功3:失败)',
  `refund_no` varchar(25) DEFAULT NULL COMMENT '退款编号',
  `message` varchar(100) DEFAULT NULL COMMENT '支持留言',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支持订单信息表';

-- ----------------------------
-- Table structure for t_order_trans_type
-- ----------------------------
DROP TABLE IF EXISTS `t_order_trans_type`;
CREATE TABLE `t_order_trans_type` (
  `trans_type_id` varchar(25) NOT NULL COMMENT '交易类型id',
  `type_name` varchar(20) NOT NULL COMMENT '类型名称',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态 0：停用，1：启用',
  PRIMARY KEY (`trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易类型';

-- ----------------------------
-- Table structure for t_project_aduit_record
-- ----------------------------
DROP TABLE IF EXISTS `t_project_aduit_record`;
CREATE TABLE `t_project_aduit_record` (
  `aduit_id` varchar(25) NOT NULL,
  `validation_id` varchar(25) NOT NULL,
  `date_aduit` datetime NOT NULL,
  `aduit_result` char(2) NOT NULL COMMENT '1：待审核\r\n            2：审核不通过\r\n            3：审核通过',
  `aduit_user_id` varchar(25) NOT NULL,
  `aduit_option` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`aduit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证审核记录表';

-- ----------------------------
-- Table structure for t_project_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_project_attachment`;
CREATE TABLE `t_project_attachment` (
  `file_id` varchar(25) NOT NULL COMMENT '文件id',
  `name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `addr` varchar(100) NOT NULL COMMENT '文件地址',
  `creator_id` varchar(25) NOT NULL COMMENT '创建人ID',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `status` char(2) NOT NULL COMMENT '状态 \r\n            1失效\r\n            2有效',
  `extension` varchar(10) NOT NULL COMMENT '扩展名',
  `alias` varchar(30) DEFAULT NULL,
  `accessory_size` varchar(20) DEFAULT NULL,
  `associated_id` varchar(25) DEFAULT NULL COMMENT '类型与项目有关时为项目ID\r\n            类型与项目验证有关时是验证ID\r\n            类型为项目动态时为动态ID\r\n            类型为举报时为举报ID',
  `type` char(2) DEFAULT NULL COMMENT '1：项目图片\r\n            2：验证医疗证明\r\n            3：户口本照片\r\n            4：资金用途证明\r\n            5：项目相关证明材料\r\n            6：项目动态\r\n            7：举报项目            8：收款人身份证图片            9：受助人身份证图片',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多张图片附件表';

-- ----------------------------
-- Table structure for t_project_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `t_project_dynamic`;
CREATE TABLE `t_project_dynamic` (
  `dynamic_id` varchar(25) NOT NULL COMMENT '动态ID',
  `project_id` varchar(25) NOT NULL COMMENT '项目ID',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `dynamic_info` varchar(200) DEFAULT NULL COMMENT '动态内容',
  `dynamic_type` char(2) NOT NULL COMMENT '动态类型：1发布新项目；2支持项目；3更新动态；4提前结束项目；5删除项目；6项目修改(有订单时修改公益项目)；   7 众筹成功  8 众筹失败 ',
  `creator` varchar(30) NOT NULL COMMENT '操作人',
  `support_amount` decimal(20,2) DEFAULT NULL COMMENT '支持金额',
  `order_no` varchar(25) DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`dynamic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目动态表';

-- ----------------------------
-- Table structure for t_project_favorites
-- ----------------------------
DROP TABLE IF EXISTS `t_project_favorites`;
CREATE TABLE `t_project_favorites` (
  `favorite_id` varchar(25) NOT NULL COMMENT '收藏id',
  `project_id` varchar(25) NOT NULL COMMENT '项目ID',
  `user_id` varchar(25) NOT NULL COMMENT '收藏用户id',
  `type` char(2) NOT NULL DEFAULT '1' COMMENT '类型 ：1、关注 2、点赞。',
  PRIMARY KEY (`favorite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注项目';

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

-- ----------------------------
-- Table structure for t_project_label_type
-- ----------------------------
DROP TABLE IF EXISTS `t_project_label_type`;
CREATE TABLE `t_project_label_type` (
  `label_type_id` varchar(25) NOT NULL,
  `label_name` varchar(30) NOT NULL,
  `project_type` varchar(25) NOT NULL,
  `create_id` varchar(25) NOT NULL,
  `date_create` datetime NOT NULL,
  PRIMARY KEY (`label_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目标签类型表';

-- ----------------------------
-- Table structure for t_project_report
-- ----------------------------
DROP TABLE IF EXISTS `t_project_report`;
CREATE TABLE `t_project_report` (
  `report_id` varchar(25) NOT NULL,
  `project_id` varchar(25) NOT NULL,
  `report_user_id` varchar(25) NOT NULL,
  `report_reason` varchar(200) NOT NULL,
  `date_report` datetime NOT NULL,
  `report_name` varchar(50) NOT NULL,
  `report_phone` varchar(20) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目举报表';

-- ----------------------------
-- Table structure for t_project_return
-- ----------------------------
DROP TABLE IF EXISTS `t_project_return`;
CREATE TABLE `t_project_return` (
  `return_id` varchar(25) NOT NULL COMMENT '回报ID',
  `support_amount` decimal(20,2) NOT NULL COMMENT '支持金额',
  `upper_count` int(11) DEFAULT NULL COMMENT '回报数量',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `project_id` varchar(25) NOT NULL COMMENT '项目ID',
  `date_update` datetime NOT NULL COMMENT '修改时间',
  `create_id` varchar(25) NOT NULL COMMENT '创建人ID',
  `update_id` varchar(25) NOT NULL COMMENT '修改人ID',
  `return_describe` varchar(500) NOT NULL COMMENT '回报描述',
  `surplus_count` int(11) DEFAULT NULL COMMENT '剩余支持人数',
  `image_id` varchar(25) DEFAULT NULL COMMENT '回报图片ID',
  `image_url` varchar(100) DEFAULT NULL COMMENT '回报图片URL',
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目回报设置表';

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

-- ----------------------------
-- Table structure for t_q_bus_project_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_q_bus_project_comment`;
CREATE TABLE `t_q_bus_project_comment` (
  `comment_id` varchar(25) NOT NULL COMMENT '项目评论ID',
  `order_id` varchar(25) NOT NULL COMMENT '订单ID',
  `date_comment` datetime NOT NULL COMMENT '评论时间',
  `comment_content` varchar(1000) NOT NULL COMMENT '评论内容',
  `user_id` varchar(25) NOT NULL COMMENT '评论人ID',
  `support_amount` decimal(20,2) DEFAULT NULL,
  `reply_id` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目评论表';

-- ----------------------------
-- Table structure for t_q_stats_user
-- ----------------------------
DROP TABLE IF EXISTS `t_q_stats_user`;
CREATE TABLE `t_q_stats_user` (
  `date_time` datetime NOT NULL COMMENT '时间',
  `day_regest_num` int(10) NOT NULL DEFAULT '0' COMMENT '当日注册',
  `login_uesr_num` int(10) NOT NULL DEFAULT '0' COMMENT '登录用户',
  `pc_regist_num` int(10) NOT NULL DEFAULT '0' COMMENT 'PC注册量',
  `wx_regist_num` int(10) NOT NULL DEFAULT '0' COMMENT 'WX注册量',
  `app_regist_num` int(10) NOT NULL DEFAULT '0' COMMENT 'APP端注册量',
  `invest_new_num` int(10) NOT NULL DEFAULT '0' COMMENT '新增支付用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户统计';

-- ----------------------------
-- Table structure for t_q_user_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `t_q_user_bank_card`;
CREATE TABLE `t_q_user_bank_card` (
  `id` varchar(25) NOT NULL COMMENT '主键ID',
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  `card_user_name` varchar(25) NOT NULL COMMENT '开户名',
  `card_number_encrypt` varchar(100) NOT NULL COMMENT '银行卡号加密',
  `card_number` varchar(30) NOT NULL COMMENT '银行卡号,前4位,后4位保留,其他星号代替',
  `card_type` char(2) NOT NULL COMMENT '银行卡类型\r\n            1：个人银行卡\r\n            2：对公银行卡',
  `card_status` char(2) NOT NULL DEFAULT '0' COMMENT '0 启用\r\n            1 停用',
  `bank_id` varchar(25) NOT NULL COMMENT '银行ID',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `bank_region_id` varchar(25) NOT NULL,
  `branch_bank` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户银行卡';

-- ----------------------------
-- Table structure for t_q_user_basic
-- ----------------------------
DROP TABLE IF EXISTS `t_q_user_basic`;
CREATE TABLE `t_q_user_basic` (
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(50) DEFAULT NULL COMMENT '姓名(个人姓名或者法人姓名)',
  `idcard_status` char(2) DEFAULT '2' COMMENT '1已认证\r\n            2未认证',
  `id_card_audit_time` datetime DEFAULT NULL,
  `id_card` varchar(50) DEFAULT NULL COMMENT '身份证号密文',
  `id_card_2` varchar(18) DEFAULT NULL COMMENT '身份证号（中间用星号屏蔽)',
  `image_url` varchar(200) DEFAULT NULL COMMENT '用户头像url',
  `image_id` varchar(25) DEFAULT NULL COMMENT '用户头像ID',
  `sex` char(2) DEFAULT '1' COMMENT '1男\r\n            2女',
  `platform_card_bind` int(2) DEFAULT '0' COMMENT '平台账户是否绑定银行卡(0 否 1 是)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Table structure for t_site_adv_info
-- ----------------------------
DROP TABLE IF EXISTS `t_site_adv_info`;
CREATE TABLE `t_site_adv_info` (
  `id` varchar(25) NOT NULL COMMENT '广告管理ID',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `adv_type` char(2) NOT NULL COMMENT '广告类型\r\n            1电脑\r\n            2移动端',
  `picture_url` varchar(50) DEFAULT NULL COMMENT '图片url',
  `picture_id` varchar(25) DEFAULT NULL COMMENT '图片id',
  `partner_url` varchar(100) DEFAULT NULL COMMENT '点击图片链接到哪里',
  `open_type` char(2) DEFAULT '2' COMMENT '页面打开方式\r\n            1在新窗口打开\r\n            2在当前窗口打开',
  `user_id` varchar(25) DEFAULT NULL COMMENT '用户ID',
  `date_visible` datetime DEFAULT NULL COMMENT '上架时间',
  `date_invisible` datetime DEFAULT NULL COMMENT '下架时间',
  `date_create` datetime DEFAULT NULL COMMENT '创建时间',
  `date_update` datetime DEFAULT NULL COMMENT '最后修改时间',
  `status` char(2) DEFAULT NULL COMMENT '1：上架 2：下架 ',
  `position` int(10) NOT NULL DEFAULT '0' COMMENT '位置',
  `date_top` datetime DEFAULT NULL COMMENT '置顶时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告管理';

-- ----------------------------
-- Table structure for t_site_attention
-- ----------------------------
DROP TABLE IF EXISTS `t_site_attention`;
CREATE TABLE `t_site_attention` (
  `id` varchar(25) NOT NULL COMMENT '关注我们表ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `picture_id` varchar(100) NOT NULL COMMENT '图片id',
  `picture_url` varchar(200) DEFAULT NULL COMMENT '图片url',
  `user_id` varchar(25) DEFAULT NULL COMMENT '创建者, 关联后台账号表主键id',
  `date_create` datetime DEFAULT NULL COMMENT '创建时间',
  `up_down_status` int(1) NOT NULL COMMENT '1上架 0下架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注我们';

-- ----------------------------
-- Table structure for t_site_customer_service
-- ----------------------------
DROP TABLE IF EXISTS `t_site_customer_service`;
CREATE TABLE `t_site_customer_service` (
  `customer_service_id` varchar(25) NOT NULL COMMENT '系统客服id',
  `nick_name` varchar(30) NOT NULL COMMENT '客服昵称',
  `qq` varchar(25) NOT NULL COMMENT 'QQ号码',
  `picture_url` varchar(100) DEFAULT NULL COMMENT '图片链接地址',
  `seq` int(10) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`customer_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统客服';

-- ----------------------------
-- Table structure for t_site_friendship_url
-- ----------------------------
DROP TABLE IF EXISTS `t_site_friendship_url`;
CREATE TABLE `t_site_friendship_url` (
  `friendship_url_id` varchar(25) NOT NULL COMMENT '自增id',
  `title` varchar(50) DEFAULT NULL COMMENT '链接名称',
  `image_id` varchar(25) DEFAULT NULL COMMENT '图片id',
  `image_url` varchar(200) DEFAULT NULL COMMENT '图片url',
  `url` varchar(100) DEFAULT NULL COMMENT '链接url',
  `is_top` char(2) DEFAULT NULL COMMENT '是否置顶',
  `date_top` datetime DEFAULT NULL COMMENT '置顶时间',
  `user_id` varchar(25) DEFAULT NULL COMMENT '创建人ID',
  `date_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`friendship_url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Table structure for t_site_help_center
-- ----------------------------
DROP TABLE IF EXISTS `t_site_help_center`;
CREATE TABLE `t_site_help_center` (
  `id` varchar(25) NOT NULL DEFAULT '' COMMENT '资讯id',
  `user_id` varchar(25) NOT NULL COMMENT '发布者id',
  `date_create` datetime NOT NULL COMMENT '发布时间',
  `date_update` datetime DEFAULT NULL COMMENT '最后更新时间',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `type` char(2) NOT NULL COMMENT '类型\r\n            1发起项目相关问题\r\n            2项目管理相关问题           3支持项目相关问题\r\n            4其他问题\r\n            5平台规则\r\n            6常见FAQ\r\n            7关于我们\r\n            8联系方式\r\n            9版权声明\r\n            10法律服务\r\n            11合作伙伴\r\n            12加入我们'',',
  `keyword` varchar(50) DEFAULT NULL COMMENT '关键字',
  `status` char(2) NOT NULL DEFAULT '1' COMMENT '是否发布    1是 2否',
  `is_top` char(2) NOT NULL DEFAULT '2' COMMENT '是否置顶  1是2否',
  `date_top` datetime DEFAULT NULL COMMENT '置顶时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助中心';

-- ----------------------------
-- Table structure for t_site_home_project
-- ----------------------------
DROP TABLE IF EXISTS `t_site_home_project`;
CREATE TABLE `t_site_home_project` (
  `id` varchar(25) NOT NULL COMMENT '主键id',
  `project_id` varchar(25) NOT NULL COMMENT '项目id',
  `user_opt` varchar(25) DEFAULT NULL COMMENT '操作人',
  `date_opt` datetime DEFAULT NULL COMMENT '操作时间',
  `recommend_pc` char(2) DEFAULT NULL COMMENT ' 1  推荐   2 未推荐',
  `date_pc` datetime DEFAULT NULL,
  `recommend_app` char(2) DEFAULT NULL,
  `date_app` datetime DEFAULT NULL,
  `recommend_weixin` char(2) DEFAULT NULL,
  `date_weixin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页推荐项目';

-- ----------------------------
-- Table structure for t_site_image_template
-- ----------------------------
DROP TABLE IF EXISTS `t_site_image_template`;
CREATE TABLE `t_site_image_template` (
  `template_id` varchar(25) NOT NULL,
  `image_type` char(2) DEFAULT NULL,
  `image_id` varchar(25) DEFAULT NULL,
  `image_url` varchar(50) DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  `operator_id` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片模板表';

-- ----------------------------
-- Table structure for t_site_info
-- ----------------------------
DROP TABLE IF EXISTS `t_site_info`;
CREATE TABLE `t_site_info` (
  `site_name` varchar(30) NOT NULL COMMENT '站点名称',
  `home_page_title` varchar(50) NOT NULL COMMENT '首页标题,最多15个字符',
  `web_keyword` varchar(150) NOT NULL COMMENT '网站关键字,最多50个字符',
  `site_descr` varchar(500) NOT NULL COMMENT '描述,最多120个字符',
  `company_name` varchar(50) NOT NULL COMMENT '公司名称,最多15个字符',
  `company_addr` varchar(150) NOT NULL COMMENT '公司地址,最多50个字符',
  `service_phone` varchar(50) NOT NULL COMMENT '客服电话',
  `service_email` varchar(50) NOT NULL COMMENT '服务邮箱',
  `work_time` varchar(50) NOT NULL COMMENT '工作时间',
  `domain` varchar(30) DEFAULT NULL COMMENT '域名',
  `recordation` varchar(50) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(50) DEFAULT NULL COMMENT '版权信息',
  `front_logo_id` varchar(100) NOT NULL COMMENT '前台LOGO图URL',
  `back_logo_id` varchar(100) NOT NULL COMMENT '后台LOGO图URL',
  `back_home_page_id` varchar(100) NOT NULL COMMENT '后台首页LOGO图URL',
  `back_home_login_id` varchar(100) NOT NULL COMMENT '后台登录后的头部LOGO图URL',
  `promotional_video_url` varchar(100) DEFAULT NULL COMMENT '平台推广视频URL',
  `date_update` datetime NOT NULL COMMENT '修改时间',
  `modify_id` varchar(25) NOT NULL COMMENT '用户ID',
  `video_title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`modify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点信息';

-- ----------------------------
-- Table structure for t_site_investment_info
-- ----------------------------
DROP TABLE IF EXISTS `t_site_investment_info`;
CREATE TABLE `t_site_investment_info` (
  `id` varchar(25) NOT NULL COMMENT '资讯id',
  `info_title` varchar(50) NOT NULL COMMENT '资讯标题',
  `source_from` varchar(30) NOT NULL COMMENT '来源',
  `view_count` int(10) DEFAULT NULL COMMENT '浏览次数',
  `info_content` text NOT NULL COMMENT '内容',
  `investment_info_type` int(1) NOT NULL COMMENT '资讯类型\r\n            1:平台公告\r\n            2:新闻动态',
  `date_create` datetime NOT NULL COMMENT '发布时间',
  `user_id` varchar(25) NOT NULL COMMENT '发布者id',
  `date_update` datetime NOT NULL COMMENT '最后更新时间',
  `position` int(10) NOT NULL DEFAULT '0' COMMENT '位置',
  `publish_status` int(1) NOT NULL DEFAULT '1' COMMENT '是否不发 1：发布 2：未发布',
  `keyword` varchar(50) NOT NULL COMMENT '关键字',
  `date_top` datetime DEFAULT NULL COMMENT '置顶时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体资讯';

-- ----------------------------
-- Table structure for t_site_protocol_model
-- ----------------------------
DROP TABLE IF EXISTS `t_site_protocol_model`;
CREATE TABLE `t_site_protocol_model` (
  `id` varchar(25) NOT NULL COMMENT '协议ID',
  `protocol_no` varchar(25) NOT NULL COMMENT '协议编号',
  `protocol_title` varchar(100) DEFAULT NULL COMMENT '协议标题',
  `protocol_content` text NOT NULL COMMENT '协议内容',
  `date_update` datetime DEFAULT NULL COMMENT '最后修改时间',
  `modifier_id` varchar(25) DEFAULT NULL COMMENT '修改人ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='协议模板';

-- ----------------------------
-- Table structure for t_site_text_instructions
-- ----------------------------
DROP TABLE IF EXISTS `t_site_text_instructions`;
CREATE TABLE `t_site_text_instructions` (
  `text_id` varchar(25) NOT NULL,
  `text_title` varchar(50) DEFAULT NULL,
  `text_context` text,
  `date_update` datetime DEFAULT NULL,
  `operator_id` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文本说明表';

-- ----------------------------
-- Table structure for t_stats_user_online
-- ----------------------------
DROP TABLE IF EXISTS `t_stats_user_online`;
CREATE TABLE `t_stats_user_online` (
  `stat_day` datetime NOT NULL COMMENT '统计日期',
  `login_user_count` int(15) NOT NULL COMMENT '登录用户数',
  `online_users_count` int(15) NOT NULL COMMENT '在线人数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户统计';

-- ----------------------------
-- Table structure for t_stat_total
-- ----------------------------
DROP TABLE IF EXISTS `t_stat_total`;
CREATE TABLE `t_stat_total` (
  `platform_earnings_total` decimal(20,2) DEFAULT NULL COMMENT '平台累计收益',
  `support_amount_total` decimal(20,2) DEFAULT NULL COMMENT '累计支持金额',
  `support_project_total` int(15) DEFAULT NULL COMMENT '累计支持项目数',
  `success_project_total` int(15) DEFAULT NULL COMMENT '累计成功项目数',
  `failed_project_total` int(15) DEFAULT NULL COMMENT '累计失败项目数',
  `refund_amount_total` decimal(20,2) DEFAULT NULL COMMENT '累计退款金额',
  `initiate_project_total` int(15) DEFAULT NULL COMMENT '累计发起项目数',
  `withdraw_amount_total` decimal(20,2) DEFAULT NULL COMMENT '累计提现总额',
  `withdraw_count_total` int(15) DEFAULT NULL COMMENT '累计提现笔数',
  `withdraw_user_total` int(15) DEFAULT NULL COMMENT '累计提现用户数',
  `register_user_total` int(15) DEFAULT NULL COMMENT '累计注册用户',
  `pay_user_total` int(15) DEFAULT NULL COMMENT '累计支付用户',
  `weixin_register_total` int(15) DEFAULT NULL COMMENT '微信注册总量',
  `APP_register_total` int(15) DEFAULT NULL COMMENT 'app注册总量',
  `PC_register_total` int(15) DEFAULT NULL COMMENT 'pc注册总量',
  `date_update` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='累计总表(定时任务每天跑一次)';

-- ----------------------------
-- Table structure for t_stat_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `t_stat_withdraw`;
CREATE TABLE `t_stat_withdraw` (
  `date_time` datetime NOT NULL COMMENT '时间',
  `day_withdraw` decimal(20,2) NOT NULL COMMENT '平台账户当日提现',
  `withdraw_num` int(6) NOT NULL COMMENT '平台账户提现笔数',
  `withdraw_user_num` int(6) NOT NULL COMMENT '平台账户提现用户数',
  `withdraw_add_user_num` int(6) NOT NULL COMMENT '平台账户新增提现用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台账户提现统计';

-- ----------------------------
-- Table structure for t_system_adjust
-- ----------------------------
DROP TABLE IF EXISTS `t_system_adjust`;
CREATE TABLE `t_system_adjust` (
  `id` varchar(25) NOT NULL COMMENT '调账ID',
  `adjust_type` char(2) DEFAULT NULL COMMENT '1:收入调帐\r\n            2:支出调帐\r\n            ',
  `money` decimal(20,2) DEFAULT NULL COMMENT '收入支出金额',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(25) DEFAULT NULL COMMENT '创建人ID',
  `date_create` datetime DEFAULT NULL COMMENT '创建时间',
  `account_balance` decimal(20,2) DEFAULT NULL COMMENT '账户余额',
  `flow_no` varchar(25) DEFAULT NULL COMMENT '流水记录编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台调账信息表';

-- ----------------------------
-- Table structure for t_system_app_index_set
-- ----------------------------
DROP TABLE IF EXISTS `t_system_app_index_set`;
CREATE TABLE `t_system_app_index_set` (
  `id` varchar(25) NOT NULL COMMENT '主键id',
  `index_url` varchar(200) DEFAULT NULL COMMENT '启动页链接地址',
  `ios_file_id` varchar(25) DEFAULT NULL COMMENT 'ios的图片id',
  `android_file_id` varchar(25) DEFAULT NULL COMMENT 'android的图片id',
  `date_create` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(25) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app启动页设置';

-- ----------------------------
-- Table structure for t_system_console_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_console_log`;
CREATE TABLE `t_system_console_log` (
  `id` varchar(25) NOT NULL COMMENT '前台日志ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `role_name` varchar(30) NOT NULL COMMENT '管理员角色名称',
  `operate` char(2) NOT NULL COMMENT '操作: \r\n            1新增操作\r\n            2删除操作\r\n            3更新操\r\n            4查询\r\n            5登录',
  `visit_ip` varchar(50) NOT NULL COMMENT '访问ip',
  `operate_desc` varchar(200) DEFAULT NULL COMMENT '操作描述',
  `operate_status` char(2) NOT NULL COMMENT '操作状态:1 成功 2失败',
  `date_happen` datetime NOT NULL COMMENT '发生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台日志';

-- ----------------------------
-- Table structure for t_system_console_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_system_console_logs`;
CREATE TABLE `t_system_console_logs` (
  `id` int(25) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ip_addr` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `region` varchar(80) DEFAULT NULL COMMENT '地区',
  `operator` varchar(25) DEFAULT NULL COMMENT '操作人',
  `operate_desc` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `operate_params` text COMMENT '操作参数',
  `date_operate` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1949 DEFAULT CHARSET=utf8 COMMENT='后台日志';

-- ----------------------------
-- Table structure for t_system_constants
-- ----------------------------
DROP TABLE IF EXISTS `t_system_constants`;
CREATE TABLE `t_system_constants` (
  `id` varchar(25) NOT NULL COMMENT '自增id',
  `type` varchar(30) NOT NULL COMMENT '常量类型',
  `name` varchar(50) NOT NULL COMMENT '常量key',
  `value` varchar(950) NOT NULL COMMENT '常量值',
  `descr` varchar(500) DEFAULT NULL COMMENT '描述',
  `date_update` datetime DEFAULT NULL COMMENT '最后更新时间',
  `modifier_id` varchar(25) DEFAULT NULL COMMENT '最后修改人ID',
  `rank` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统常量表';

-- ----------------------------
-- Table structure for t_system_files
-- ----------------------------
DROP TABLE IF EXISTS `t_system_files`;
CREATE TABLE `t_system_files` (
  `file_id` varchar(25) NOT NULL COMMENT '文件id',
  `name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `addr` varchar(100) NOT NULL COMMENT '文件地址',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `status` char(2) NOT NULL COMMENT '状态 \r\n            1:失效\r\n            2:有效',
  `extension` varchar(10) NOT NULL COMMENT '扩展名',
  `alias` varchar(30) DEFAULT NULL,
  `accessory_size` varchar(20) DEFAULT NULL,
  `creator_id` varchar(25) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件';

-- ----------------------------
-- Table structure for t_system_front_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_front_log`;
CREATE TABLE `t_system_front_log` (
  `id` varchar(25) NOT NULL COMMENT '前台日志ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `operate` char(2) NOT NULL COMMENT '登陆',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `visit_ip` varchar(50) NOT NULL COMMENT '访问ip',
  `operate_status` char(2) NOT NULL COMMENT '操作状态:1 成功 2失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台日志';

-- ----------------------------
-- Table structure for t_system_front_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_system_front_logs`;
CREATE TABLE `t_system_front_logs` (
  `id` int(25) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ip_addr` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `region` varchar(80) DEFAULT NULL COMMENT '地区',
  `operator` varchar(25) DEFAULT NULL COMMENT '操作人',
  `operate_desc` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `operate_params` text COMMENT '操作参数',
  `date_operate` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1307 DEFAULT CHARSET=utf8 COMMENT='前台日志';

-- ----------------------------
-- Table structure for t_system_function
-- ----------------------------
DROP TABLE IF EXISTS `t_system_function`;
CREATE TABLE `t_system_function` (
  `function_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL COMMENT '功能代码（唯一）',
  `name` varchar(40) NOT NULL COMMENT '功能名称',
  `descr` varchar(200) NOT NULL COMMENT '功能描述',
  `module_id` varchar(25) NOT NULL COMMENT '所属模块id',
  `url` varchar(100) DEFAULT NULL COMMENT '访问路径',
  PRIMARY KEY (`function_id`),
  KEY `t_system_function_FK_t_system_module` (`module_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=728 DEFAULT CHARSET=utf8 COMMENT='系统功能';

-- ----------------------------
-- Table structure for t_system_message
-- ----------------------------
DROP TABLE IF EXISTS `t_system_message`;
CREATE TABLE `t_system_message` (
  `id` varchar(25) NOT NULL COMMENT 'ID',
  `sender_id` varchar(25) DEFAULT NULL COMMENT '系统发送人ID（当系统发出的时为0）,参考t_user.id',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `content` varchar(300) DEFAULT NULL COMMENT '内容',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `status` char(2) NOT NULL COMMENT '状态（0：未发送，1：发送，2：发送失败）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统短信表';

-- ----------------------------
-- Table structure for t_system_module
-- ----------------------------
DROP TABLE IF EXISTS `t_system_module`;
CREATE TABLE `t_system_module` (
  `module_id` varchar(25) NOT NULL COMMENT '模块id',
  `name` varchar(40) NOT NULL COMMENT '模块名',
  `descr` varchar(200) NOT NULL COMMENT '模块描述',
  `pid` varchar(25) NOT NULL COMMENT '自关联父id',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统模块';

-- ----------------------------
-- Table structure for t_system_promotion_message
-- ----------------------------
DROP TABLE IF EXISTS `t_system_promotion_message`;
CREATE TABLE `t_system_promotion_message` (
  `id` varchar(25) NOT NULL COMMENT 'ID',
  `content` text NOT NULL COMMENT '短信内容',
  `count` int(11) NOT NULL COMMENT '短信数量',
  `sender_id` varchar(25) NOT NULL COMMENT '发送者，参考t_system_user.id',
  `receiver` varchar(200) NOT NULL COMMENT '接收者',
  `plan_time` datetime DEFAULT NULL COMMENT '计划发送时间，为null时即立即发送',
  `type` char(2) DEFAULT '2' COMMENT '接收人类型，1:所有人;2:指定用户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广短信表';

-- ----------------------------
-- Table structure for t_system_promotion_message_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_system_promotion_message_detail`;
CREATE TABLE `t_system_promotion_message_detail` (
  `id` varchar(25) NOT NULL COMMENT 'ID',
  `msg_id` varchar(25) NOT NULL COMMENT '短信ID，参考t_system_promotion_message.id',
  `phone` varchar(11) NOT NULL COMMENT '接收者手机号码',
  `send_flag` char(2) NOT NULL DEFAULT '1' COMMENT '发送标记,1:未发送; 2:已发送',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_id` (`msg_id`,`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广短信明细表';

-- ----------------------------
-- Table structure for t_system_property
-- ----------------------------
DROP TABLE IF EXISTS `t_system_property`;
CREATE TABLE `t_system_property` (
  `id` varchar(25) NOT NULL COMMENT '主键id',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `value` varchar(950) DEFAULT NULL COMMENT 'key',
  `descr` varchar(500) DEFAULT NULL COMMENT '描述',
  `date_update` datetime DEFAULT NULL COMMENT '更新时间',
  `modifier_id` varchar(25) DEFAULT NULL COMMENT '修改人id',
  `rank` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台常量设置表';

-- ----------------------------
-- Table structure for t_system_region_info
-- ----------------------------
DROP TABLE IF EXISTS `t_system_region_info`;
CREATE TABLE `t_system_region_info` (
  `region_id` varchar(25) NOT NULL COMMENT '自增id',
  `province_id` varchar(20) DEFAULT NULL COMMENT '省级id',
  `city_id` varchar(20) DEFAULT NULL COMMENT '市级id',
  `county_id` varchar(20) DEFAULT NULL COMMENT '县级id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `province` varchar(20) DEFAULT NULL COMMENT '省级名称',
  `city` varchar(20) DEFAULT NULL COMMENT '市级名称',
  `county` varchar(20) DEFAULT NULL COMMENT '县级名称',
  `area_code` varchar(20) DEFAULT NULL COMMENT '电话区号',
  `zip_code` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `level` char(2) DEFAULT NULL COMMENT '0：省，1：市，2：县',
  `short_name` varchar(25) DEFAULT NULL COMMENT '简拼',
  `status` char(2) DEFAULT NULL COMMENT '1启用\r\n            2停用',
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政地区表';

-- ----------------------------
-- Table structure for t_system_role
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role`;
CREATE TABLE `t_system_role` (
  `role_id` varchar(25) NOT NULL COMMENT '角色ID',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(50) NOT NULL COMMENT '角色描述',
  `status` int(1) DEFAULT NULL COMMENT '0：启用，1：停用',
  `creator` varchar(25) DEFAULT NULL COMMENT '创建人id',
  `date_create` datetime DEFAULT NULL COMMENT '创建时间',
  `date_update` datetime DEFAULT NULL COMMENT '修改时间',
  `updator` varchar(25) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Table structure for t_system_role_function
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role_function`;
CREATE TABLE `t_system_role_function` (
  `role_id` varchar(25) NOT NULL COMMENT '角色id',
  `function_id` varchar(25) NOT NULL COMMENT '功能id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与功能的关系表';

-- ----------------------------
-- Table structure for t_system_send_count
-- ----------------------------
DROP TABLE IF EXISTS `t_system_send_count`;
CREATE TABLE `t_system_send_count` (
  `id` varchar(25) NOT NULL COMMENT '主键id',
  `send_object` varchar(100) DEFAULT NULL COMMENT '发送对象(手机、邮箱、ip地址)',
  `send_count` int(3) DEFAULT NULL COMMENT '发送次数',
  `send_model` char(2) DEFAULT NULL COMMENT '发送类型\r\n            1：注册  \r\n            2：登录\r\n            3：修改手机或邮箱绑定验证旧的手机或邮箱 \r\n            4： 修改手机或邮箱绑定验证新的手机或邮箱 \r\n            5：找回登陆密码              58:绑定手机                 59：绑定邮箱          60:修改手机第一步            61：修改手机第二步              62：修改邮箱第一步                63：修改邮箱第二步',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信邮件发送次数(每天会清空)';

-- ----------------------------
-- Table structure for t_system_site_template
-- ----------------------------
DROP TABLE IF EXISTS `t_system_site_template`;
CREATE TABLE `t_system_site_template` (
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态1启用2停用',
  `site_template_id` varchar(25) NOT NULL COMMENT '模板id',
  `type` int(1) NOT NULL COMMENT '类型\r\n            1：短信 2：邮箱 3：站内信',
  `template_content` text NOT NULL COMMENT '模板内容',
  `template_type` int(1) NOT NULL COMMENT '充值成功 ，充值失败 等等',
  `modifier_id` varchar(25) DEFAULT NULL COMMENT '修改人ID',
  `date_modify` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信、短信、邮箱模板';

-- ----------------------------
-- Table structure for t_system_user
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user`;
CREATE TABLE `t_system_user` (
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `gender` char(2) DEFAULT NULL COMMENT '性别1男2女',
  `real_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户登录账号',
  `password` varchar(40) NOT NULL COMMENT '用户登录密码',
  `date_login` datetime NOT NULL COMMENT '最后登录时间',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `creator_id` varchar(25) NOT NULL COMMENT '创建人',
  `name` varchar(30) DEFAULT NULL COMMENT '创建人名称',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT '最后登录ip',
  `user_status` char(2) DEFAULT NULL COMMENT '1启用\r\n            2停用',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户总表';

-- ----------------------------
-- Table structure for t_system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user_role`;
CREATE TABLE `t_system_user_role` (
  `role_id` varchar(25) NOT NULL COMMENT '角色ID',
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色的关系表';

-- ----------------------------
-- Table structure for t_system_verify_code
-- ----------------------------
DROP TABLE IF EXISTS `t_system_verify_code`;
CREATE TABLE `t_system_verify_code` (
  `id` varchar(25) NOT NULL COMMENT '主键id',
  `verify_method` varchar(100) DEFAULT NULL COMMENT '验证时的手机号或email地址',
  `type_code` char(4) DEFAULT NULL COMMENT '1：手机注册/登录\r\n2: 找回交易密码',
  `verify_code` varchar(10) DEFAULT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '验证码失效时间',
  `fail_count` int(2) DEFAULT NULL COMMENT '失败次数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证码记录表';

-- ----------------------------
-- Table structure for t_system_version_management
-- ----------------------------
DROP TABLE IF EXISTS `t_system_version_management`;
CREATE TABLE `t_system_version_management` (
  `id` varchar(25) NOT NULL COMMENT '主键id',
  `type` char(2) DEFAULT NULL COMMENT '客户端类型:\r\n            1安卓 \r\n            2苹果',
  `version` varchar(20) DEFAULT NULL COMMENT '版本号',
  `name` varchar(50) DEFAULT NULL COMMENT '版本名称',
  `network_path` varchar(200) DEFAULT NULL COMMENT '网络路径',
  `app_file_id` varchar(25) DEFAULT NULL COMMENT '上传app软件包Id',
  `mandatory_update` char(2) DEFAULT NULL COMMENT '1是，\r\n            2否',
  `description` varchar(500) DEFAULT NULL COMMENT '升级描述',
  `status` char(2) DEFAULT NULL COMMENT '1启用，\r\n            2停用',
  `app_url` varchar(50) DEFAULT NULL COMMENT 'appURL',
  `date_create` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(25) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app版本管理表';

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

-- ----------------------------
-- Table structure for t_user_account_flow_record
-- ----------------------------
DROP TABLE IF EXISTS `t_user_account_flow_record`;
CREATE TABLE `t_user_account_flow_record` (
  `id` varchar(25) NOT NULL COMMENT 'ID',
  `trade_type` char(2) NOT NULL COMMENT '交易类型表:\r\n      1:支付      2：提现\r\n     3：提现手续费\r\n   4：调帐\r\n  5:退款       ',
  `capital_direction` char(2) NOT NULL COMMENT '资金方向：\r\n            1收入\r\n            2支出',
  `trade_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '交易金额',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `order_id` varchar(25) DEFAULT NULL COMMENT '订单ID',
  `user_id` varchar(25) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `account_balance` decimal(20,2) DEFAULT NULL COMMENT '账户结余',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资金流水表';

-- ----------------------------
-- Table structure for t_user_account_record
-- ----------------------------
DROP TABLE IF EXISTS `t_user_account_record`;
CREATE TABLE `t_user_account_record` (
  `id` varchar(25) NOT NULL COMMENT 'ID',
  `user_id` varchar(25) NOT NULL COMMENT '账户所属用户ID',
  `trade_type` char(2) NOT NULL COMMENT '交易类型表:\r\n            1：众筹成功未验证\r\n            2：众筹成功已验证\r\n            3：提现申请\r\n            4：提现失败',
  `capital_direction` char(2) NOT NULL COMMENT '资金方向：\r\n            1收入\r\n            2支出',
  `trade_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '交易金额',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `project_id` varchar(25) DEFAULT NULL COMMENT '项目ID',
  `account_type` char(2) NOT NULL COMMENT '1：可用金额账户\r\n            2：冻结金额账户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户交易流水表';

-- ----------------------------
-- Table structure for t_user_bank
-- ----------------------------
DROP TABLE IF EXISTS `t_user_bank`;
CREATE TABLE `t_user_bank` (
  `id` varchar(25) NOT NULL COMMENT 'ID',
  `bank_name` varchar(100) NOT NULL COMMENT '银行名称',
  `bank_status` char(2) NOT NULL DEFAULT '0' COMMENT '1启用\r\n            2停用',
  `bank_code` char(10) NOT NULL COMMENT '代码',
  `image_url` varchar(50) DEFAULT NULL COMMENT '图片url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行列表';

-- ----------------------------
-- Table structure for t_user_capital_account
-- ----------------------------
DROP TABLE IF EXISTS `t_user_capital_account`;
CREATE TABLE `t_user_capital_account` (
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  `available_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '可用余额（单位 元）',
  `frozen_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '锁定余额（单位 元 ）',
  `date_update` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户资金账户表';

-- ----------------------------
-- Table structure for t_user_notify
-- ----------------------------
DROP TABLE IF EXISTS `t_user_notify`;
CREATE TABLE `t_user_notify` (
  `user_id` varchar(25) NOT NULL,
  `pro_status_notify` char(2) NOT NULL DEFAULT '1' COMMENT '项目状态变更通知   0 关闭  1开启  默认1',
  `oth_people_pay_notify` char(2) NOT NULL DEFAULT '1' COMMENT '他人支付通知  0 关闭  1开启   ',
  `people_pay_notify` char(2) NOT NULL DEFAULT '1' COMMENT '支付通知 0 关闭  1开启  ',
  `reply_notify` char(2) NOT NULL DEFAULT '1' COMMENT '回复通知 0 关闭  1开启  ',
  `withdraw_notify` char(2) NOT NULL DEFAULT '1' COMMENT '提现通知 0 关闭  1开启 ',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户免打扰设置通知';

-- ----------------------------
-- Table structure for t_user_shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `t_user_shipping_address`;
CREATE TABLE `t_user_shipping_address` (
  `addr_id` varchar(25) NOT NULL,
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  `consignee_name` varchar(25) NOT NULL COMMENT '收件人名称',
  `consignee_phone` varchar(25) NOT NULL COMMENT '收件人手机号',
  `consignee_city` varchar(25) NOT NULL COMMENT '收件人所在地区',
  `consignee_address` varchar(100) NOT NULL COMMENT '收件人详细地址',
  `is_default` char(2) NOT NULL COMMENT '是否默认此地址\r\n            1:是\r\n            2:否',
  PRIMARY KEY (`addr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收货地址记录表';

-- ----------------------------
-- Table structure for t_user_third_party
-- ----------------------------
DROP TABLE IF EXISTS `t_user_third_party`;
CREATE TABLE `t_user_third_party` (
  `id` varchar(25) NOT NULL,
  `user_id` varchar(25) NOT NULL COMMENT '用户id',
  `open_id` varchar(100) NOT NULL,
  `token` varchar(520) NOT NULL,
  `authorize_time` datetime DEFAULT NULL COMMENT '授权时间',
  `fail_time` datetime DEFAULT NULL COMMENT 'token失效时间',
  `head_img` varchar(250) NOT NULL,
  `nick_name` varchar(100) NOT NULL,
  `type` char(2) NOT NULL COMMENT '类型：（为了和user表类型一致，所以从2开始-1是手机）\r\n         2 微信\r\n         3  微博\r\n         4  qq  5公众号用户',
  `union_id` varchar(100) DEFAULT NULL COMMENT 'UnionID 用于关联微信开放平台下面的用户唯一表示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户绑定的第三方账户信息表';
