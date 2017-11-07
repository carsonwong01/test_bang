  SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
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
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
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
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
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
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
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
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_bus_fees_basic_set`
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
-- Records of t_bus_fees_basic_set
-- ----------------------------
INSERT INTO `t_bus_fees_basic_set` VALUES ('0.00', '0.00', '0.00', '11.00', '10000.00', '16.00', '1', '0.00');

-- ----------------------------
-- Table structure for `t_bus_withdraw_apply`
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
-- Records of t_bus_withdraw_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `t_operate_feedback`
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
-- Records of t_operate_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order_first_trade_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_first_trade_record`;
CREATE TABLE `t_order_first_trade_record` (
  `order_id` varchar(25) NOT NULL COMMENT '订单ID/提现ID',
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  `amount` decimal(20,2) NOT NULL COMMENT '交易金额',
  `type` char(2) DEFAULT NULL COMMENT '1支持   2提现',
  `date_trade` datetime NOT NULL COMMENT '首次交易时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首次交易记录';

-- ----------------------------
-- Records of t_order_first_trade_record
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order_support`
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
-- Records of t_order_support
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order_trans_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_trans_type`;
CREATE TABLE `t_order_trans_type` (
  `trans_type_id` varchar(25) NOT NULL COMMENT '交易类型id',
  `type_name` varchar(20) NOT NULL COMMENT '类型名称',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态 0：停用，1：启用',
  PRIMARY KEY (`trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易类型';

-- ----------------------------
-- Records of t_order_trans_type
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_aduit_record`
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
-- Records of t_project_aduit_record
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_attachment`
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
-- Records of t_project_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_dynamic`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_dynamic`;
CREATE TABLE `t_project_dynamic` (
  `dynamic_id` varchar(25) NOT NULL COMMENT '动态ID',
  `project_id` varchar(25) NOT NULL COMMENT '项目ID',
  `date_create` datetime NOT NULL COMMENT '创建时间',
  `dynamic_info` varchar(200) DEFAULT NULL COMMENT '动态内容',
  `dynamic_type` char(2) NOT NULL COMMENT '动态类型：1发布新项目；2支持项目；3更新动态；4提前结束项目；5删除项目；6项目修改(有订单时修改个人求助)；   7 众筹成功  8 众筹失败 ',
  `creator` varchar(30) NOT NULL COMMENT '操作人',
  `support_amount` decimal(20,2) DEFAULT NULL COMMENT '支持金额',
  `order_no` varchar(25) DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`dynamic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目动态表';

-- ----------------------------
-- Records of t_project_dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_favorites`;
CREATE TABLE `t_project_favorites` (
  `favorite_id` varchar(25) NOT NULL COMMENT '收藏id',
  `project_id` varchar(25) NOT NULL COMMENT '项目ID',
  `user_id` varchar(25) NOT NULL COMMENT '收藏用户id',
  `type` char(2) NOT NULL DEFAULT '1' COMMENT '类型 ：1、关注 2、点赞。',
  PRIMARY KEY (`favorite_id`),
  UNIQUE KEY `project_favorites_unique` (`project_id`,`user_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注项目';

-- ----------------------------
-- Records of t_project_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_info`;
CREATE TABLE `t_project_info` (
  `project_id` varchar(25) NOT NULL COMMENT '项目ID',
  `project_no` varchar(25) NOT NULL COMMENT '项目编号',
  `project_name` varchar(60) NOT NULL COMMENT '项目名称',
  `project_type` char(2) NOT NULL COMMENT '1：大病救助\r\n            2：灾难救助\r\n            3：动物保护\r\n            4：扶贫助学\r\n            5：其他\r\n            6：产品急销\r\n            7：实现梦想',
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
  `project_label` varchar(30) DEFAULT NULL COMMENT '标签',
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
-- Records of t_project_info
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_label_type`
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
-- Records of t_project_label_type
-- ----------------------------
INSERT INTO `t_project_label_type` VALUES ('101609282005481712', '水果', '1', '0', '2016-09-28 20:05:48');
INSERT INTO `t_project_label_type` VALUES ('101609282040449251', '蔬菜', '1', '0', '2016-09-28 20:40:45');
INSERT INTO `t_project_label_type` VALUES ('101609282041272792', '梦想', '2', '0', '2016-09-28 20:41:27');
INSERT INTO `t_project_label_type` VALUES ('101610101005310456', '艺术', '2', '0', '2016-10-10 10:05:31');

-- ----------------------------
-- Table structure for `t_project_report`
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
-- Records of t_project_report
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_return`
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
-- Records of t_project_return
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_validation`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_validation`;
CREATE TABLE `t_project_validation` (
  `validation_id` varchar(25) NOT NULL COMMENT '验证ID',
  `project_id` varchar(25) NOT NULL UNIQUE COMMENT '项目ID',
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
  PRIMARY KEY (`validation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目验证表';

-- ----------------------------
-- Records of t_project_validation
-- ----------------------------

-- ----------------------------
-- Table structure for `t_q_bus_project_comment`
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
-- Records of t_q_bus_project_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_q_stats_user`
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
-- Records of t_q_stats_user
-- ----------------------------
INSERT INTO `t_q_stats_user` VALUES ('2016-11-08 00:00:00', '1', '1', '0', '1', '0', '0');
INSERT INTO `t_q_stats_user` VALUES ('2016-11-09 00:00:00', '2', '2', '0', '2', '0', '0');
INSERT INTO `t_q_stats_user` VALUES ('2016-11-10 00:00:00', '3', '4', '0', '1', '2', '0');

-- ----------------------------
-- Table structure for `t_q_user_bank_card`
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
-- Records of t_q_user_bank_card
-- ----------------------------

-- ----------------------------
-- Table structure for `t_q_user_basic`
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
-- Records of t_q_user_basic
-- ----------------------------

-- ----------------------------
-- Table structure for `t_site_adv_info`
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
-- Records of t_site_adv_info
-- ----------------------------

-- ----------------------------
-- Table structure for `t_site_attention`
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
-- Records of t_site_attention
-- ----------------------------
INSERT INTO `t_site_attention` VALUES ('1', '微信公众号', '101610231701201484', '/fileStore/2016/10/23/17/jpg/1477213280146.jpg', '0', '2016-10-23 17:01:20', '1');
INSERT INTO `t_site_attention` VALUES ('2', '新浪微博', '101610231701279295', '/fileStore/2016/10/23/17/jpg/1477213287928.jpg', '0', '2016-10-23 17:01:28', '1');
INSERT INTO `t_site_attention` VALUES ('3', '安卓app', '101610231701350446', '/fileStore/2016/10/23/17/jpg/1477213295043.jpg', '0', '2016-10-23 17:01:35', '1');
INSERT INTO `t_site_attention` VALUES ('4', 'IOSapp', '101610231701350446', '/fileStore/2016/10/23/17/jpg/1477213295043.jpg', '0', '2016-10-23 17:01:35', '1');

-- ----------------------------
-- Table structure for `t_site_customer_service`
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
-- Records of t_site_customer_service
-- ----------------------------
INSERT INTO `t_site_customer_service` VALUES ('101611081023379612', '1', '1', '', '0');

-- ----------------------------
-- Table structure for `t_site_friendship_url`
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
-- Records of t_site_friendship_url
-- ----------------------------

-- ----------------------------
-- Table structure for `t_site_help_center`
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



INSERT INTO `t_site_help_center` VALUES ('101610111531167711', '0', '2016-10-11 15:31:17', '2016-11-23 09:51:09', '关于我们', '', '7', null, '1', '2', '2016-10-11 15:31:17');
INSERT INTO `t_site_help_center` VALUES ('101610111531254782', '0', '2016-10-11 15:31:25', '2016-10-18 14:54:06', '联系方式', '', '8', null, '1', '2', '2016-10-11 15:31:25');
INSERT INTO `t_site_help_center` VALUES ('101610181454497143', '0', '2016-10-18 14:54:50', null, '加入我们', '', '12', null, '1', '2', '2016-10-18 14:54:50');
INSERT INTO `t_site_help_center` VALUES ('101610181504310844', '0', '2016-10-18 15:04:31', null, '版权申明', '', '9', null, '1', '2', '2016-10-18 15:04:31');
INSERT INTO `t_site_help_center` VALUES ('101610181504434945', '0', '2016-10-18 15:04:43', null, '法律服务', '', '10', null, '1', '2', '2016-10-18 15:04:43');

-- ----------------------------
-- Records of t_site_help_center
-- ----------------------------

-- ----------------------------
-- Table structure for `t_site_home_project`
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
-- Records of t_site_home_project
-- ----------------------------

-- ----------------------------
-- Table structure for `t_site_image_template`
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
-- Records of t_site_image_template
-- ----------------------------
INSERT INTO `t_site_image_template` VALUES ('1', '1', '', '', '2016-11-03 10:59:46', '0');
INSERT INTO `t_site_image_template` VALUES ('2', '2', '', '', '2016-11-03 10:59:51', '0');
INSERT INTO `t_site_image_template` VALUES ('3', '3', '', '', '2016-11-03 10:59:57', '0');
INSERT INTO `t_site_image_template` VALUES ('4', '4', '', '', '2016-11-03 11:00:03', '0');
INSERT INTO `t_site_image_template` VALUES ('5', '5', '', '', '2016-11-03 11:00:10', '0');

-- ----------------------------
-- Table structure for `t_site_info`
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
-- Records of t_site_info
-- ----------------------------
INSERT INTO `t_site_info` VALUES ('轻众筹', '轻众筹平台', '迪蒙网贷，p2p,网贷，p2p网贷，网络融资，融资，', '迪蒙网贷，中国第1网贷系统品牌迪蒙网贷，中国第1网贷系统品牌迪蒙网贷，中国第1网贷系统品牌', '深圳市XXXXXXXX有限公司', '广东省深圳市罗湖区大剧院振业大厦4楼', '4006667799', 'dimeng@dimeng.com', '08:00-22:00', 'http://127.0.0.1:8080/', '1', '1', '/fileStore/2016/9/23/16/png/1474620349681.png', '/fileStore/2016/6/16/15/jpg/1466061038145.jpg', '/fileStore/2016/6/16/15/png/1466060565436.png', '/fileStore/2016/6/16/15/jpg/1466060911435.jpg', '/upload/2016/1/28/11/AVI/1453951814437.AVI', '2016-01-28 11:24:15', 'xx', 'dfgdfg');

-- ----------------------------
-- Table structure for `t_site_investment_info`
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
-- Records of t_site_investment_info
-- ----------------------------

-- ----------------------------
-- Table structure for `t_site_protocol_model`
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
-- Records of t_site_protocol_model
-- ----------------------------
INSERT INTO `t_site_protocol_model` VALUES ('1', 'XYZC1001', '《迪蒙众筹注册协议》', '', '2016-10-27 11:32:31', '0');
INSERT INTO `t_site_protocol_model` VALUES ('2', 'XYZC1002', '《迪蒙众筹平台发起协议》', '', '2016-10-27 11:33:09', '0');
INSERT INTO `t_site_protocol_model` VALUES ('3', 'XYZC1003', '《迪蒙众筹平台订单服务协议》', '', '2016-10-27 11:33:40', '0');

-- ----------------------------
-- Table structure for `t_site_text_instructions`
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
-- Records of t_site_text_instructions
-- ----------------------------
INSERT INTO `t_site_text_instructions` VALUES ('1', '发起须知', '', '2016-10-27 11:36:05', '0');
INSERT INTO `t_site_text_instructions` VALUES ('2', '筹款攻略', '', '2016-10-27 11:36:24', '0');
INSERT INTO `t_site_text_instructions` VALUES ('3', '个人求助筹款说明', '', '2016-10-28 09:25:29', '0');
INSERT INTO `t_site_text_instructions` VALUES ('4', '产品急销筹款说明', '', '2016-10-28 09:24:21', '0');
INSERT INTO `t_site_text_instructions` VALUES ('5', '实现梦想筹款说明', '', '2016-10-28 09:26:21', '0');
INSERT INTO `t_site_text_instructions` VALUES ('6', '提现温馨提示', '', '2016-10-27 11:37:04', '0');
INSERT INTO `t_site_text_instructions` VALUES ('7', '中华人民共和国民法通则', '', '2016-10-27 11:38:11', '0');
INSERT INTO `t_site_text_instructions` VALUES ('8', '中华人民共和国刑法', '', '2016-10-27 11:38:21', '0');

-- ----------------------------
-- Table structure for `t_stat_withdraw`
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
-- Records of t_stat_withdraw
-- ----------------------------
INSERT INTO `t_stat_withdraw` VALUES ('2016-11-08 00:00:00', '0.00', '0', '0', '0');
INSERT INTO `t_stat_withdraw` VALUES ('2016-11-09 00:00:00', '0.00', '0', '0', '0');
INSERT INTO `t_stat_withdraw` VALUES ('2016-11-10 00:00:00', '0.00', '0', '0', '0');

-- ----------------------------
-- Table structure for `t_stats_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `t_stats_user_online`;
CREATE TABLE `t_stats_user_online` (
  `stat_day` datetime NOT NULL COMMENT '统计日期',
  `login_user_count` int(15) NOT NULL COMMENT '登录用户数',
  `online_users_count` int(15) NOT NULL COMMENT '在线人数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户统计';

-- ----------------------------
-- Records of t_stats_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_adjust`
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
-- Table structure for `t_system_app_index_set`
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
-- Records of t_system_app_index_set
-- ----------------------------
INSERT INTO `t_system_app_index_set` VALUES ('1', '', null, null, null, null);

-- ----------------------------
-- Table structure for `t_system_console_log`
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
-- Records of t_system_console_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_console_logs`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台日志';

-- ----------------------------
-- Table structure for `t_system_constants`
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
-- Records of t_system_constants
-- ----------------------------
INSERT INTO `t_system_constants` VALUES ('101606271712491101', 'SITE', 'SITE_INTERFACE_URL', 'http://127.0.0.1:8080/platform/', '接口访问链接地址', '2016-06-28 09:38:34', '0', null);
INSERT INTO `t_system_constants` VALUES ('101606271712491102', 'SITE', 'SITE_INDEX_TXWB_URL', 'http://t.qq.com/', '腾讯微博地址', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('101606271712491103', 'SITE', 'SITE_INDEX_XLWB_URL', 'http://weibo.com/', '新浪微博地址', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('1016062717124918010', 'SYSTEM', 'SETTING_TRADE_PASSWORD', 'true', '是否开启交易密码，true 开启，false 关闭', '2016-08-15 15:24:24', '0', null);
INSERT INTO `t_system_constants` VALUES ('1016062717124918011', 'SYSTEM', 'UPDATE_BIND_NEW_COUNT', '50', '修改绑定手机或邮箱时验证新的手机或邮箱验证码发送次数', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('1016062717124918012', 'SYSTEM', 'USER_LOGIN_PWD_ERROR_COUNT', '100', '用户登录密码允许最多错误次数', '2016-07-27 15:22:55', '0', null);
INSERT INTO `t_system_constants` VALUES ('1016062717124918013', 'SYSTEM', 'USER_TRADE_PWD_ERROR_COUNT', '8', '用户交易密码允许最多错误次数', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('1016062717124918014', 'SYSTEM', 'USER_IDENTITY_DAY_ERROR_MAX_COUNT', '0', '身份认证一天最大错误次数', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('1016062717124918015', 'SYSTEM', 'VERIFY_CODE_ERROR_MAX_COUNT', '5', '验证码验证失败最大次数', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('1016062717124918016', 'SYSTEM', 'VERIFICATION_CODE_IS_OPEN', 'false', '是否打开验证码', '2016-07-25 14:17:24', '0', null);
INSERT INTO `t_system_constants` VALUES ('1016062717124918017', 'SYSTEM', 'ESCROW_TYPE', 'shuangqian', '托管类型:双乾托管填：shuangqian', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('101606271712491804', 'SYSTEM', 'SMS_CODE_DISABLED_DATE', '3', '短信验证码失效时间（分钟）', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('101606271712491805', 'SYSTEM', 'EAIL_CODE_DISABLED_DATE', '3', '邮件验证码失效时间（分钟）', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('101606271712491806', 'SYSTEM', 'PHONE_REGISTER_COUNT', '50', '注册时短信验证码发送次数', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('101606271712491807', 'SYSTEM', 'BACK_PASSWORD_COUNT', '50', '找回密码时验证码发送次数', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('101606271712491808', 'SYSTEM', 'BIND_PHONE_OR_EMAIL_COUNT', '50', '绑定手机或邮箱验证码发送次数', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('101606271712491809', 'SYSTEM', 'UPDATE_BIND_OLD_COUNT', '50', '修改绑定手机或邮箱时验证旧的手机或邮箱验证码发送次数', '2016-06-27 17:12:49', null, null);
INSERT INTO `t_system_constants` VALUES ('101607051414540501', 'SYSTEM', 'CONSOLELOGIN_MSGCODE_IS_OPEN', 'false', '后台登录是否打开短信验证码', '2016-07-25 14:17:32', '0', null);
INSERT INTO `t_system_constants` VALUES ('101607051414540502', 'SYSTEM', 'CONSOLE_LOGIG_MSGCODE_ERROR_COUNT', '10', '后台登录验证码错误最大次数', '2016-07-05 14:14:54', null, null);
INSERT INTO `t_system_constants` VALUES ('101607121638385941', 'SYSTEM', 'SLITHER_CHECKCODE_IS_OPEN', 'false', '滑动验证码是否开启', '2016-08-06 11:21:55', '0', null);
INSERT INTO `t_system_constants` VALUES ('101607121638385952', 'SYSTEM', 'FRONT_LOGIN_ERROR_COUNT_SHOW_CODE', '2', '前台登录错误次数显示验证码', '2016-07-27 15:23:12', '0', null);
INSERT INTO `t_system_constants` VALUES ('1016071811052709823', 'SYSTEM', 'IS_NCIIC', 'false', '是否实名认证', '2016-07-18 11:05:27', null, null);
INSERT INTO `t_system_constants` VALUES ('1016071811052709825', 'SYSTEM', 'BIND_BANK_CARD_MAX_NUM', '8', '绑定银行卡最大张数', '2016-07-18 11:05:27', null, null);
INSERT INTO `t_system_constants` VALUES ('1016071811052709826', 'SYSTEM', 'CONSOLE_LOGIG_MSGCODE_SEND_COUNT', '10', '后台登录验证码发送最大次数', '2016-07-18 11:05:27', null, null);
INSERT INTO `t_system_constants` VALUES ('101608171004226021', 'SYSTEM', 'VERIFY_CODE_IP_MAX_COUNT', '100', 'IP地址获取验证码最大次数', '2016-08-17 10:04:23', null, null);
INSERT INTO `t_system_constants` VALUES ('101608230944072871', 'SYSTEM', 'EXPORTMAXRECORD', '500', '导出最大记录数', '2016-08-23 09:44:07', null, null);
INSERT INTO `t_system_constants` VALUES ('101610090957320861', 'EASY_SYSTEM', 'PLATFORM_ADDR', 'http://112.95.233.249:8505', '平台地址', '2016-10-09 09:57:32', null, null);
INSERT INTO `t_system_constants` VALUES ('101610181644103121', 'EASY_SYSTEM', 'WX_APPID', 'wxedddeef262cbed11', '微信APPID', '2016-11-01 16:58:48', '0', null);
INSERT INTO `t_system_constants` VALUES ('101610181644103122', 'EASY_SYSTEM', 'WX_SECRET', 'fa7877a8b71ae40d2e2d337995470d97', '微信秘钥', '2016-11-01 17:02:25', '0', null);
INSERT INTO `t_system_constants` VALUES ('101610181644103123', 'EASY_SYSTEM', 'WB_APPID', '4214554843', '微博APPID', '2016-11-01 15:03:29', '0', null);
INSERT INTO `t_system_constants` VALUES ('101610181644103124', 'EASY_SYSTEM', 'WB_SECRET', '116ec67e09f728cfb78eb15777d14913', '微博秘钥', '2016-11-01 15:14:07', '0', null);
INSERT INTO `t_system_constants` VALUES ('101610181644103125', 'EASY_SYSTEM', 'QQ_APPID', '101362108', 'QQAPPID', '2016-11-01 15:03:16', '0', null);
INSERT INTO `t_system_constants` VALUES ('101610181644103126', 'EASY_SYSTEM', 'QQ_SECRET', 'fa61706fa7d39911384857327398cbf0', 'QQ秘钥', '2016-11-01 15:02:43', '0', null);
INSERT INTO `t_system_constants` VALUES ('101610201425289911', 'EASY_SYSTEM', 'ORDER_OVERDUE_TIME', '120', '订单有效时间(分钟)', '2016-10-20 14:25:29', null, null);
INSERT INTO `t_system_constants` VALUES ('101610231347071081', 'EASY_SYSTEM', 'DEFAULT_RECEIPT_PERIOD', '20', '默认收货期限(天数)', '2016-10-23 15:02:26', '0', null);
INSERT INTO `t_system_constants` VALUES ('101611090946404281', 'EASY_SYSTEM', 'ADDRESS_MAX_COUNT', '5', '收货地址最大设置个数', '2016-11-09 09:46:40', null, null);
INSERT INTO `t_system_constants` VALUES ('101611111018516471', 'EASY_SYSTEM', 'REFUND_AFTER_DAYS', '3', '多少天之后退款', '2016-11-11 10:18:52', null, null);

-- ----------------------------
-- Table structure for `t_system_files`
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
-- Records of t_system_files
-- ----------------------------
INSERT INTO `t_system_files` VALUES ('101611081022331281', 'banner.jpg', '/fileStore/2016/11/8/10/jpg/1478571753102.jpg', '2016-11-08 10:22:33', '1', 'jpg', '1478571753102.jpg', '356474', '0');
INSERT INTO `t_system_files` VALUES ('1016110916174781311', '108-108.png', '/fileStore/2016/11/9/16/png/1478679467809.png', '2016-11-09 16:17:48', '1', 'png', '1478679467809.png', '7246', '101611091611454334');
INSERT INTO `t_system_files` VALUES ('101611091919580891', 'banner03.jpg', '/fileStore/2016/11/9/19/jpg/1478690398083.jpg', '2016-11-09 19:19:58', '1', 'jpg', '1478690398083.jpg', '79838', '0');
INSERT INTO `t_system_files` VALUES ('101611091920272242', 'banner01.jpg', '/fileStore/2016/11/9/19/jpg/1478690427223.jpg', '2016-11-09 19:20:27', '1', 'jpg', '1478690427223.jpg', '94215', '0');
INSERT INTO `t_system_files` VALUES ('101611091949007329', 'u=128811874,840272376&fm=116&gp=0.jpg', '/fileStore/2016/11/9/19/jpg/1478692140720.jpg', '2016-11-09 19:49:01', '1', 'jpg', '1478692140720.jpg', '10782', '101611091920517516');
INSERT INTO `t_system_files` VALUES ('1016110919502651814', 'u=1183223528,3058066243&fm=116&gp=0.jpg', '/fileStore/2016/11/9/19/jpg/1478692226517.jpg', '2016-11-09 19:50:27', '1', 'jpg', '1478692226517.jpg', '10870', '101611091920517516');

-- ----------------------------
-- Table structure for `t_system_front_log`
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
-- Records of t_system_front_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_front_logs`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台日志';

-- ----------------------------
-- Records of t_system_front_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_function`
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
-- Records of t_system_function
-- ----------------------------
INSERT INTO `t_system_function` VALUES ('101', 'YHGL_YHXX_GRXX_MU', '个人信息', '个人信息', '101', null);
INSERT INTO `t_system_function` VALUES ('102', 'YHGL_YHXX_GRXX_DC', '导出', '导出', '101', null);
INSERT INTO `t_system_function` VALUES ('103', 'YHGL_YHXX_GRXX_CK', '查看', '查看', '101', null);
INSERT INTO `t_system_function` VALUES ('104', 'YHGL_YHXX_GRXX_SD', '锁定', '锁定', '101', null);
INSERT INTO `t_system_function` VALUES ('105', 'YHGL_YHXX_GRXX_JS', '解锁', '解锁', '101', null);
INSERT INTO `t_system_function` VALUES ('106', 'YHGL_YHXX_GRXX_LH', '拉黑', '拉黑', '101', null);
INSERT INTO `t_system_function` VALUES ('107', 'YHGL_YHXX_GRXX_JH', '解黑', '解黑', '101', null);
INSERT INTO `t_system_function` VALUES ('201', 'YWGL_XMGL_SYXM_MU', '所有项目', '所有项目列表', '201', null);
INSERT INTO `t_system_function` VALUES ('202', 'YWGL_XMGL_SYXM_DC', '导出', '导出所有项目列表', '201', null);
INSERT INTO `t_system_function` VALUES ('203', 'YWGL_XMGL_SYXM_CK', '查看', '查看项目详情', '201', null);
INSERT INTO `t_system_function` VALUES ('204', 'YWGL_XMGL_SYXM_DDGL', '订单管理', '订单管理', '201', null);
INSERT INTO `t_system_function` VALUES ('205', 'YWGL_XMGL_ZCZ_MU', '众筹中', '众筹中项目列表', '202', null);
INSERT INTO `t_system_function` VALUES ('206', 'YWGL_XMGL_ZCZ_DC', '导出', '导出众筹中项目列表', '202', null);
INSERT INTO `t_system_function` VALUES ('207', 'YWGL_XMGL_ZCZ_CK', '查看', '查看众筹中项目详情', '202', null);
INSERT INTO `t_system_function` VALUES ('208', 'YWGL_XMGL_ZCZ_QX', '取消', '取消众筹中项目', '202', null);
INSERT INTO `t_system_function` VALUES ('209', 'YWGL_XMGL_ZCZ_SC', '删除', '删除众筹中项目', '202', null);
INSERT INTO `t_system_function` VALUES ('210', 'YWGL_XMGL_ZCCG_MU', '众筹成功', '众筹成功项目列表', '203', null);
INSERT INTO `t_system_function` VALUES ('211', 'YWGL_XMGL_ZCCG_DC', '导出', '导出众筹成功项目列表', '203', null);
INSERT INTO `t_system_function` VALUES ('212', 'YWGL_XMGL_ZCCG_CK', '查看', '查看众筹成功项目详情', '203', null);
INSERT INTO `t_system_function` VALUES ('213', 'YWGL_XMGL_ZCCG_QX', '取消', '众筹成功项目取消', '203', null);
INSERT INTO `t_system_function` VALUES ('214', 'YWGL_XMGL_ZCCG_XJ', '下架', '众筹成功项目下架', '203', null);
INSERT INTO `t_system_function` VALUES ('215', 'YWGL_XMGL_ZCSB_MU', '众筹失败', '众筹失败项目列表', '204', null);
INSERT INTO `t_system_function` VALUES ('216', 'YWGL_XMGL_ZCSB_DC', '导出', '导出众筹失败项目列表', '204', null);
INSERT INTO `t_system_function` VALUES ('217', 'YWGL_XMGL_ZCSB_CK', '查看', '查看众筹失败项目详情', '204', null);
INSERT INTO `t_system_function` VALUES ('218', 'YWGL_XMGL_ZCSB_QX', '取消', '众筹失败项目取消', '204', null);
INSERT INTO `t_system_function` VALUES ('219', 'YWGL_XMGL_ZCSB_XJ', '下架', '众筹失败项目下架', '204', null);
INSERT INTO `t_system_function` VALUES ('220', 'YWGL_XMGL_ZCSB_SBYY', '失败原因', '查看项目失败原因', '204', null);
INSERT INTO `t_system_function` VALUES ('221', 'YWGL_XMGL_YSC_MU', '已删除', '已删除项目列表', '205', null);
INSERT INTO `t_system_function` VALUES ('222', 'YWGL_XMGL_YSC_DC', '导出', '导出已删除项目列表', '205', null);
INSERT INTO `t_system_function` VALUES ('223', 'YWGL_XMGL_YSC_CK', '查看', '查看已删除项目详情', '205', null);
INSERT INTO `t_system_function` VALUES ('224', 'YWGL_XMGL_YSC_SCYY', '删除原因', '查看项目删除原因', '205', null);
INSERT INTO `t_system_function` VALUES ('225', 'YWGL_DDGL_SYDD_MU', '所有订单', '所有订单列表', '206', null);
INSERT INTO `t_system_function` VALUES ('226', 'YWGL_DDGL_SYDD_DC', '导出', '导出所有订单列表', '206', null);
INSERT INTO `t_system_function` VALUES ('227', 'YWGL_DDGL_SYDD_DDXQ', '订单详情', '查看订单详情', '206', null);
INSERT INTO `t_system_function` VALUES ('228', 'YWGL_SHGL_XMYZSH_MU', '项目验证审核', '项目验证审核列表', '207', null);
INSERT INTO `t_system_function` VALUES ('229', 'YWGL_SHGL_XMYZSH_DC', '导出', '导出项目验证审核列表', '207', null);
INSERT INTO `t_system_function` VALUES ('230', 'YWGL_SHGL_XMYZSH_YZXQ', '审核详情', '项目验证审核详情', '207', null);
INSERT INTO `t_system_function` VALUES ('231', 'YWGL_SHGL_XMYZSH_YZSH', '审核', '项目验证审核', '207', null);
INSERT INTO `t_system_function` VALUES ('232', 'YWGL_SHGL_XMDTGL_MU', '项目动态管理', '项目动态管理列表', '208', null);
INSERT INTO `t_system_function` VALUES ('233', 'YWGL_SHGL_XMDTGL_DTXQ', '动态详情', '查看动态详情', '208', null);
INSERT INTO `t_system_function` VALUES ('234', 'YWGL_SHGL_XMDTGL_SC', '删除', '删除动态详情', '208', null);
INSERT INTO `t_system_function` VALUES ('235', 'YWGL_SHGL_PLGL_MU', '评论管理', '评论管理列表', '209', null);
INSERT INTO `t_system_function` VALUES ('236', 'YWGL_SHGL_PLGL_CK', '查看', '查看项目评论详情', '209', null);
INSERT INTO `t_system_function` VALUES ('237', 'YWGL_SHGL_PLGL_SC', '删除', '删除项目评论', '209', null);
INSERT INTO `t_system_function` VALUES ('238', 'YWGL_SHGL_JBGL_MU', '举报管理', '举报管理列表', '210', null);
INSERT INTO `t_system_function` VALUES ('239', 'YWGL_SHGL_JBGL_DC', '导出', '导出举报管理列表', '210', null);
INSERT INTO `t_system_function` VALUES ('240', 'YWGL_SHGL_JBGL_JBXQ', '举报详情', '查看项目举报详情', '210', null);
INSERT INTO `t_system_function` VALUES ('301', 'CWGL_ZFJL_ZFJL_MU', '支付记录', '支付记录', '301', null);
INSERT INTO `t_system_function` VALUES ('302', 'CWGL_ZFJL_ZFJL_DC', '导出', '支付记录导出', '301', null);
INSERT INTO `t_system_function` VALUES ('303', 'CWGL_TXGL_DSH_MU', '待审核', '提现待审核列表', '302', null);
INSERT INTO `t_system_function` VALUES ('304', 'CWGL_TXGL_DSH_DC', '导出', '提现待审核列表导出', '302', null);
INSERT INTO `t_system_function` VALUES ('305', 'CWGL_TXGL_DSH_SH', '审核', '提现审核', '302', null);
INSERT INTO `t_system_function` VALUES ('306', 'CWGL_TXGL_DFK_MU', '待放款', '提现待放款列表', '303', null);
INSERT INTO `t_system_function` VALUES ('307', 'CWGL_TXGL_DFK_DC', '导出', '提现待放款列表导出', '303', null);
INSERT INTO `t_system_function` VALUES ('308', 'CWGL_TXGL_DFK_FKSH', '放款审核', '提现放款审核', '303', null);
INSERT INTO `t_system_function` VALUES ('309', 'CWGL_TXGL_TXCG_MU', '提现成功', '提现成功列表', '304', null);
INSERT INTO `t_system_function` VALUES ('310', 'CWGL_TXGL_TXCG_DC', '导出', '提现成功列表导出', '304', null);
INSERT INTO `t_system_function` VALUES ('311', 'CWGL_TXGL_TXSB_MU', '提现失败', '提现失败列表', '305', null);
INSERT INTO `t_system_function` VALUES ('312', 'CWGL_TXGL_TXSB_DC', '导出', '提现失败列表导出', '305', null);
INSERT INTO `t_system_function` VALUES ('313', 'CWGL_TXGL_TXSB_SBYY', '查看', '查看提现失败原因', '305', null);
INSERT INTO `t_system_function` VALUES ('314', 'CWGL_TKGL_DDDTK_MU', '订单待退款', '订单待退款列表', '306', null);
INSERT INTO `t_system_function` VALUES ('315', 'CWGL_TKGL_DDDTK_DC', '导出', '订单待退款列表导出', '306', null);
INSERT INTO `t_system_function` VALUES ('316', 'CWGL_TKGL_DDDTK_CK', '查看', '查看订单详情', '306', null);
INSERT INTO `t_system_function` VALUES ('317', 'CWGL_TKGL_DDTKSB_MU', '订单退款失败', '订单退款失败列表', '307', null);
INSERT INTO `t_system_function` VALUES ('318', 'CWGL_TKGL_DDTKSB_DC', '导出', '订单退款失败列表导出', '307', null);
INSERT INTO `t_system_function` VALUES ('319', 'CWGL_TKGL_DDTKSB_TK', '退款', '订单退款', '307', null);
INSERT INTO `t_system_function` VALUES ('320', 'CWGL_TKGL_DDTKJL_MU', '订单退款记录', '订单退款记录列表', '308', null);
INSERT INTO `t_system_function` VALUES ('321', 'CWGL_TKGL_DDTKJL_DC', '导出', '订单退款记录列表导出', '308', null);
INSERT INTO `t_system_function` VALUES ('322', 'CWGL_TKGL_PTTZGL_MU', '平台调账管理', '平台调账管理', '309', null);
INSERT INTO `t_system_function` VALUES ('323', 'CWGL_TKGL_PTTZGL_DC', '导出', '导出平台调账列表', '309', null);
INSERT INTO `t_system_function` VALUES ('324', 'CWGL_TKGL_PTTZGL_TZ', '调账', '平台调账', '309', null);
INSERT INTO `t_system_function` VALUES ('325', 'CWGL_TKGL_PTTZGL_CK', '查看', '查看平台调账备注', '309', null);
INSERT INTO `t_system_function` VALUES ('326', 'CWGL_TKGL_PTZJMX_MU', '平台资金明细', '平台资金明细', '310', null);
INSERT INTO `t_system_function` VALUES ('327', 'CWGL_TKGL_PTZJMX_DC', '导出', '导出平台资金明细列表', '310', null);
INSERT INTO `t_system_function` VALUES ('328', 'CWGL_TKGL_YHZJMX_MU', '用户资金明细', '用户资金明细', '311', null);
INSERT INTO `t_system_function` VALUES ('329', 'CWGL_TKGL_YHZJMX_DC', '导出', '导出用户资金明细列表', '311', null);
INSERT INTO `t_system_function` VALUES ('330', 'CWGL_DZGL_ZFYCDZ_MU', '支付异常对账', '支付异常对账列表', '312', null);
INSERT INTO `t_system_function` VALUES ('331', 'CWGL_DZGL_ZFYCDZ_DC', '导出', '导出支付异常对账列表', '312', null);
INSERT INTO `t_system_function` VALUES ('332', 'CWGL_DZGL_ZFYCDZ_DZ', '对账', '支付对账', '312', null);
INSERT INTO `t_system_function` VALUES ('333', 'CWGL_DZGL_TKYCDZ_MU', '退款异常对账', '退款异常对账列表', '313', null);
INSERT INTO `t_system_function` VALUES ('334', 'CWGL_DZGL_TKYCDZ_DC', '导出', '导出退款异常对账列表', '313', null);
INSERT INTO `t_system_function` VALUES ('335', 'CWGL_DZGL_TKYCDZ_DZ', '对账', '退款对账', '313', null);
INSERT INTO `t_system_function` VALUES ('401', 'TJGL_ZJTJ_PTSY_MU', '平台收益统计', '平台收益统计', '401', null);
INSERT INTO `t_system_function` VALUES ('402', 'TJGL_ZJTJ_PTSY_DC', '导出', '导出', '401', null);
INSERT INTO `t_system_function` VALUES ('403', 'TJGL_ZJTJ_YHZC_MU', '用户支持统计', '用户支持统计', '402', null);
INSERT INTO `t_system_function` VALUES ('404', 'TJGL_ZJTJ_YHZC_DC', '导出', '导出', '402', null);
INSERT INTO `t_system_function` VALUES ('405', 'TJGL_ZJTJ_YHFQ_MU', '用户发起统计', '用户发起统计', '403', null);
INSERT INTO `t_system_function` VALUES ('406', 'TJGL_ZJTJ_YHFQ_DC', '导出', '导出', '403', null);
INSERT INTO `t_system_function` VALUES ('407', 'TJGL_ZJTJ_TXTJ_MU', '提现统计', '提现统计', '404', null);
INSERT INTO `t_system_function` VALUES ('408', 'TJGL_ZJTJ_TXTJ_DC', '导出', '导出', '404', null);
INSERT INTO `t_system_function` VALUES ('409', 'TJGL_YHTJ_ZXYH_MU', '在线用户统计', '在线用户统计', '405', null);
INSERT INTO `t_system_function` VALUES ('410', 'TJGL_YHTJ_YHTJ_MU', '用户统计', '用户统计', '406', null);
INSERT INTO `t_system_function` VALUES ('411', 'TJGL_YHTJ_YHTJ_DC', '导出', '导出', '406', null);
INSERT INTO `t_system_function` VALUES ('501', 'ZDGL_BZZX_FQXM_MU', '发起项目相关问题', '发起项目相关问题', '501', null);
INSERT INTO `t_system_function` VALUES ('502', 'ZDGL_BZZX_FQXM_XZ', '新增', '新增', '501', null);
INSERT INTO `t_system_function` VALUES ('503', 'ZDGL_BZZX_FQXM_SC', '删除', '删除', '501', null);
INSERT INTO `t_system_function` VALUES ('504', 'ZDGL_BZZX_FQXM_XG', '修改', '修改', '501', null);
INSERT INTO `t_system_function` VALUES ('505', 'ZDGL_BZZX_FQXM_CK', '查看', '查看', '501', null);
INSERT INTO `t_system_function` VALUES ('506', 'ZDGL_BZZX_FQXM_ZD', '置顶', '置顶', '501', null);
INSERT INTO `t_system_function` VALUES ('507', 'ZDGL_BZZX_XMGL_MU', '项目管理相关问题', '项目管理相关问题', '502', null);
INSERT INTO `t_system_function` VALUES ('508', 'ZDGL_BZZX_XMGL_XZ', '新增', '新增', '502', null);
INSERT INTO `t_system_function` VALUES ('509', 'ZDGL_BZZX_XMGL_SC', '删除', '删除', '502', null);
INSERT INTO `t_system_function` VALUES ('510', 'ZDGL_BZZX_XMGL_XG', '修改', '修改', '502', null);
INSERT INTO `t_system_function` VALUES ('511', 'ZDGL_BZZX_XMGL_CK', '查看', '查看', '502', null);
INSERT INTO `t_system_function` VALUES ('512', 'ZDGL_BZZX_XMGL_ZD', '置顶', '置顶', '502', null);
INSERT INTO `t_system_function` VALUES ('513', 'ZDGL_BZZX_ZCXM_MU', '支持项目相关问题', '支持项目相关问题', '503', null);
INSERT INTO `t_system_function` VALUES ('514', 'ZDGL_BZZX_ZCXM_XZ', '新增', '新增', '503', null);
INSERT INTO `t_system_function` VALUES ('515', 'ZDGL_BZZX_ZCXM_SC', '删除', '删除', '503', null);
INSERT INTO `t_system_function` VALUES ('516', 'ZDGL_BZZX_ZCXM_XG', '修改', '修改', '503', null);
INSERT INTO `t_system_function` VALUES ('517', 'ZDGL_BZZX_ZCXM_CK', '查看', '查看', '503', null);
INSERT INTO `t_system_function` VALUES ('518', 'ZDGL_BZZX_ZCXM_ZD', '置顶', '置顶', '503', null);
INSERT INTO `t_system_function` VALUES ('519', 'ZDGL_BZZX_QTWT_MU', '其他问题', '其他问题', '504', null);
INSERT INTO `t_system_function` VALUES ('520', 'ZDGL_BZZX_QTWT_XZ', '新增', '新增', '504', null);
INSERT INTO `t_system_function` VALUES ('521', 'ZDGL_BZZX_QTWT_SC', '删除', '删除', '504', null);
INSERT INTO `t_system_function` VALUES ('522', 'ZDGL_BZZX_QTWT_XG', '修改', '修改', '504', null);
INSERT INTO `t_system_function` VALUES ('523', 'ZDGL_BZZX_QTWT_CK', '查看', '查看', '504', null);
INSERT INTO `t_system_function` VALUES ('524', 'ZDGL_BZZX_QTWT_ZD', '置顶', '置顶', '504', null);
INSERT INTO `t_system_function` VALUES ('525', 'ZDGL_GYWM_GYWM_MU', '关于我们', '关于我们', '505', null);
INSERT INTO `t_system_function` VALUES ('526', 'ZDGL_GYWM_GYWM_XG', '修改', '修改', '505', null);
INSERT INTO `t_system_function` VALUES ('527', 'ZDGL_GYWM_GYWM_YL', '预览', '预览', '505', null);
INSERT INTO `t_system_function` VALUES ('528', 'ZDGL_GYWM_LXFS_MU', '联系方式', '联系方式', '506', null);
INSERT INTO `t_system_function` VALUES ('529', 'ZDGL_GYWM_LXFS_XG', '修改', '修改', '506', null);
INSERT INTO `t_system_function` VALUES ('530', 'ZDGL_GYWM_LXFS_YL', '预览', '预览', '506', null);
INSERT INTO `t_system_function` VALUES ('531', 'ZDGL_GYWM_BQSM_MU', '版权申明', '版权申明', '507', null);
INSERT INTO `t_system_function` VALUES ('532', 'ZDGL_GYWM_BQSM_XG', '修改', '修改', '507', null);
INSERT INTO `t_system_function` VALUES ('533', 'ZDGL_GYWM_BQSM_YL', '预览', '预览', '507', null);
INSERT INTO `t_system_function` VALUES ('534', 'ZDGL_GYWM_FLFW_MU', '法律服务', '法律服务', '508', null);
INSERT INTO `t_system_function` VALUES ('535', 'ZDGL_GYWM_FLFW_XG', '修改', '修改', '508', null);
INSERT INTO `t_system_function` VALUES ('536', 'ZDGL_GYWM_FLFW_YL', '预览', '预览', '508', null);
INSERT INTO `t_system_function` VALUES ('537', 'ZDGL_GYWM_JRWM_MU', '加入我们', '加入我们', '509', null);
INSERT INTO `t_system_function` VALUES ('538', 'ZDGL_GYWM_JRWM_XG', '修改', '修改', '509', null);
INSERT INTO `t_system_function` VALUES ('539', 'ZDGL_GYWM_JRWM_YL', '预览', '预览', '509', null);
INSERT INTO `t_system_function` VALUES ('540', 'ZDGL_HZHB_HZHB_MU', '合作伙伴', '合作伙伴', '510', null);
INSERT INTO `t_system_function` VALUES ('541', 'ZDGL_HZHB_HZHB_XZ', '新增', '新增', '510', null);
INSERT INTO `t_system_function` VALUES ('542', 'ZDGL_HZHB_HZHB_SC', '删除', '删除', '510', null);
INSERT INTO `t_system_function` VALUES ('543', 'ZDGL_HZHB_HZHB_XG', '修改', '修改', '510', null);
INSERT INTO `t_system_function` VALUES ('544', 'ZDGL_HZHB_HZHB_CK', '查看', '查看', '510', null);
INSERT INTO `t_system_function` VALUES ('545', 'ZDGL_HZHB_HZHB_ZD', '置顶', '置顶', '510', null);
INSERT INTO `t_system_function` VALUES ('546', 'ZDGL_GG_GGTP_MU', '广告图片', '广告图片', '511', null);
INSERT INTO `t_system_function` VALUES ('547', 'ZDGL_GG_GGTP_XZ', '新增', '新增', '511', null);
INSERT INTO `t_system_function` VALUES ('548', 'ZDGL_GG_GGTP_SC', '删除', '删除', '511', null);
INSERT INTO `t_system_function` VALUES ('549', 'ZDGL_GG_GGTP_XG', '修改', '修改', '511', null);
INSERT INTO `t_system_function` VALUES ('550', 'ZDGL_GG_GGTP_ZD', '置顶', '置顶', '511', null);
INSERT INTO `t_system_function` VALUES ('551', 'ZDGL_GG_GZWM_MU', '关注我们', '关注我们', '512', null);
INSERT INTO `t_system_function` VALUES ('552', 'ZDGL_GG_GZWM_XG', '修改', '修改', '512', null);
INSERT INTO `t_system_function` VALUES ('553', 'ZDGL_MTZX_PTGG_MU', '平台公告', '平台公告', '513', null);
INSERT INTO `t_system_function` VALUES ('554', 'ZDGL_MTZX_PTGG_XZ', '新增', '新增', '513', null);
INSERT INTO `t_system_function` VALUES ('555', 'ZDGL_MTZX_PTGG_SC', '删除', '删除', '513', null);
INSERT INTO `t_system_function` VALUES ('556', 'ZDGL_MTZX_PTGG_XG', '修改', '修改', '513', null);
INSERT INTO `t_system_function` VALUES ('557', 'ZDGL_MTZX_PTGG_CK', '查看', '查看', '513', null);
INSERT INTO `t_system_function` VALUES ('558', 'ZDGL_MTZX_PTGG_ZD', '置顶', '置顶', '513', null);
INSERT INTO `t_system_function` VALUES ('559', 'ZDGL_MTZX_XWZX_MU', '新闻资讯', '新闻资讯', '514', null);
INSERT INTO `t_system_function` VALUES ('560', 'ZDGL_MTZX_XWZX_XZ', '新增', '新增', '514', null);
INSERT INTO `t_system_function` VALUES ('561', 'ZDGL_MTZX_XWZX_SC', '删除', '删除', '514', null);
INSERT INTO `t_system_function` VALUES ('562', 'ZDGL_MTZX_XWZX_XG', '修改', '修改', '514', null);
INSERT INTO `t_system_function` VALUES ('563', 'ZDGL_MTZX_XWZX_CK', '查看', '查看', '514', null);
INSERT INTO `t_system_function` VALUES ('564', 'ZDGL_MTZX_XWZX_ZD', '置顶', '置顶', '514', null);
INSERT INTO `t_system_function` VALUES ('565', 'ZDGL_SYXM_XMTJ_MU', '项目推荐管理', '项目推荐管理', '515', null);
INSERT INTO `t_system_function` VALUES ('566', 'ZDGL_SYXM_XMTJ_XQ', '详情', '详情', '515', null);
INSERT INTO `t_system_function` VALUES ('567', 'ZDGL_SYXM_XMTJ_TJ', '推荐', '推荐', '515', null);
INSERT INTO `t_system_function` VALUES ('568', 'ZDGL_SYXM_XMTJ_TJXQ', '推荐详情', '推荐详情', '515', null);
INSERT INTO `t_system_function` VALUES ('569', 'ZDGL_SYXM_XMTJ_DC', '导出', '导出', '515', null);
INSERT INTO `t_system_function` VALUES ('570', 'ZDGL_ZDSZ_ZDXX_MU', '站点信息设置', '站点信息设置', '516', null);
INSERT INTO `t_system_function` VALUES ('571', 'ZDGL_ZDSZ_ZDXX_XG', '修改', '修改', '516', null);
INSERT INTO `t_system_function` VALUES ('572', 'ZDGL_ZDSZ_ZDLG_MU', '站点logo', '站点logo', '517', null);
INSERT INTO `t_system_function` VALUES ('573', 'ZDGL_ZDSZ_ZDLG_XG', '修改', '修改', '517', null);
INSERT INTO `t_system_function` VALUES ('601', 'YYGL_JBSZ_XMHY_MU', '项目标签设置', '项目标签设置', '601', null);
INSERT INTO `t_system_function` VALUES ('602', 'YYGL_JBSZ_XMHY_XZ', '新增', '新增', '601', null);
INSERT INTO `t_system_function` VALUES ('603', 'YYGL_JBSZ_XMHY_SC', '删除', '删除', '601', null);
INSERT INTO `t_system_function` VALUES ('604', 'YYGL_JBSZ_XMHY_XG', '修改', '修改', '601', null);
INSERT INTO `t_system_function` VALUES ('605', 'YYGL_JBSZ_SFSZ_MU', '平台收费设置', '平台收费设置', '602', null);
INSERT INTO `t_system_function` VALUES ('606', 'YYGL_JBSZ_SFSZ_XG', '修改', '修改', '602', null);
INSERT INTO `t_system_function` VALUES ('607', 'YYGL_JBSZ_DXMB_MU', '短信模板', '短信模板', '603', null);
INSERT INTO `t_system_function` VALUES ('608', 'YYGL_XXMB_DXMB_CK', '查看', '查看', '603', null);
INSERT INTO `t_system_function` VALUES ('609', 'YYGL_XXMB_DXMB_QY', '启用', '启用', '603', null);
INSERT INTO `t_system_function` VALUES ('610', 'YYGL_XXMB_DXMB_TY', '停用', '停用', '603', null);
INSERT INTO `t_system_function` VALUES ('611', 'YYGL_JBSZ_TPMB_MU', '图片模板', '图片模板', '604', null);
INSERT INTO `t_system_function` VALUES ('612', 'YYGL_JBSZ_TPMB_XG', '修改', '修改', '604', null);
INSERT INTO `t_system_function` VALUES ('613', 'YYGL_ZLGL_XYTK_MU', '协议条款', '协议条款', '605', null);
INSERT INTO `t_system_function` VALUES ('614', 'YYGL_ZLGL_XYTK_XG', '修改', '修改', '605', null);
INSERT INTO `t_system_function` VALUES ('615', 'YYGL_ZLGL_XYTK_CK', '查看', '查看', '605', null);
INSERT INTO `t_system_function` VALUES ('616', 'YYGL_ZLGL_WBSM_MU', '文本说明', '文本说明', '606', null);
INSERT INTO `t_system_function` VALUES ('617', 'YYGL_ZLGL_WBSM_XG', '修改', '修改', '606', null);
INSERT INTO `t_system_function` VALUES ('618', 'YYGL_ZLGL_WBSM_CK', '查看', '查看', '606', null);
INSERT INTO `t_system_function` VALUES ('619', 'YYGL_XXGL_DX_MU', '短信', '短信', '607', null);
INSERT INTO `t_system_function` VALUES ('620', 'YYGL_XXGL_DX_XZ', '新增', '新增', '607', null);
INSERT INTO `t_system_function` VALUES ('621', 'YYGL_XXGL_DX_CK', '查看', '查看', '607', null);
INSERT INTO `t_system_function` VALUES ('622', 'YYGL_XXGL_DX_BJ', '再次编辑', '再次编辑', '607', null);
INSERT INTO `t_system_function` VALUES ('623', 'YYGL_YJFK_YJFK_MU', '意见反馈', '意见反馈', '608', null);
INSERT INTO `t_system_function` VALUES ('624', 'YYGL_YJFK_YJFK_DC', '导出', '导出', '608', null);
INSERT INTO `t_system_function` VALUES ('701', 'XTGL_HTZH_ZHLB_MU', '账号列表', '账号列表', '701', null);
INSERT INTO `t_system_function` VALUES ('702', 'XTGL_HTZH_ZHLB_XZ', '新增', '新增', '701', null);
INSERT INTO `t_system_function` VALUES ('703', 'XTGL_HTZH_ZHLB_SC', '删除', '删除', '701', null);
INSERT INTO `t_system_function` VALUES ('704', 'XTGL_HTZH_ZHLB_XG', '修改', '修改', '701', null);
INSERT INTO `t_system_function` VALUES ('705', 'XTGL_HTZH_ZHLB_FPJS', '分配角色', '分配角色', '701', null);
INSERT INTO `t_system_function` VALUES ('706', 'XTGL_HTZH_YHZ_MU', '用户组管理', '用户组管理', '702', null);
INSERT INTO `t_system_function` VALUES ('707', 'XTGL_HTZH_YHZ_XZ', '新增', '新增', '702', null);
INSERT INTO `t_system_function` VALUES ('708', 'XTGL_HTZH_YHZ_SC', '删除', '删除', '702', null);
INSERT INTO `t_system_function` VALUES ('709', 'XTGL_HTZH_YHZ_XG', '修改', '修改', '702', null);
INSERT INTO `t_system_function` VALUES ('710', 'XTGL_HTZH_YHZ_FPYH', '分配用户', '用户', '702', null);
INSERT INTO `t_system_function` VALUES ('711', 'XTGL_XTCS_PTCL_MU', '平台常量设置', '平台常量设置', '703', null);
INSERT INTO `t_system_function` VALUES ('712', 'XTGL_XTCS_PTCL_BJ', '编辑', '编辑', '703', null);
INSERT INTO `t_system_function` VALUES ('713', 'XTGL_XTCS_XTSX_MU', '平台常量设置', '平台常量设置', '704', null);
INSERT INTO `t_system_function` VALUES ('714', 'XTGL_XTCS_XTSX_BJ', '编辑', '编辑', '704', null);
INSERT INTO `t_system_function` VALUES ('715', 'XTGL_XTRZ_QTRZ_MU', '前台日志', '前台日志', '705', null);
INSERT INTO `t_system_function` VALUES ('716', 'XTGL_XTRZ_QTRZ_DC', '导出', '导出', '705', null);
INSERT INTO `t_system_function` VALUES ('717', 'XTGL_XTRZ_HTRZ_MU', '后台日志', '后台日志', '706', null);
INSERT INTO `t_system_function` VALUES ('718', 'XTGL_XTRZ_HTRZ_DC', '导出', '导出', '706', null);
INSERT INTO `t_system_function` VALUES ('719', 'XTGL_SJBF_BFSJ_MU', '备份数据库', '备份数据库', '707', null);
INSERT INTO `t_system_function` VALUES ('720', 'XTGL_SJBF_BFSJ_BF', '备份', '备份', '707', null);
INSERT INTO `t_system_function` VALUES ('721', 'XTGL_APP_APP_MU', 'APP版本管理', 'APP版本管理', '708', null);
INSERT INTO `t_system_function` VALUES ('722', 'XTGL_APP_APP_XZ', '新增', '新增', '708', null);
INSERT INTO `t_system_function` VALUES ('723', 'XTGL_APP_APP_SC', '删除', '删除', '708', null);
INSERT INTO `t_system_function` VALUES ('724', 'XTGL_APP_APP_CK', '查看', '查看', '708', null);
INSERT INTO `t_system_function` VALUES ('725', 'XTGL_APP_APP_XG', '修改', '修改', '708', null);
INSERT INTO `t_system_function` VALUES ('726', 'XTGL_APP_QDY_MU', 'APP启动页设置', 'APP启动页设置', '709', null);
INSERT INTO `t_system_function` VALUES ('727', 'XTGL_APP_QDY_XG', '修改', '修改', '709', null);

-- ----------------------------
-- Table structure for `t_system_message`
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
-- Records of t_system_message
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_module`
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
-- Records of t_system_module
-- ----------------------------
INSERT INTO `t_system_module` VALUES ('1', '用户管理', '用户管理', '0');
INSERT INTO `t_system_module` VALUES ('101', '用户信息', '用户信息', '11');
INSERT INTO `t_system_module` VALUES ('11', '用户信息', '用户信息', '1');
INSERT INTO `t_system_module` VALUES ('2', '业务管理', '业务管理', '0');
INSERT INTO `t_system_module` VALUES ('201', '所有项目', '所有项目', '21');
INSERT INTO `t_system_module` VALUES ('202', '众筹中', '众筹中项目列表', '21');
INSERT INTO `t_system_module` VALUES ('203', '众筹成功', '众筹成功项目列表', '21');
INSERT INTO `t_system_module` VALUES ('204', '众筹失败', '众筹失败项目列表', '21');
INSERT INTO `t_system_module` VALUES ('205', '已删除', '已删除项目列表', '21');
INSERT INTO `t_system_module` VALUES ('206', '所有订单', '所有订单', '22');
INSERT INTO `t_system_module` VALUES ('207', '项目验证审核', '项目验证审核', '23');
INSERT INTO `t_system_module` VALUES ('208', '项目动态管理', '项目动态管理', '23');
INSERT INTO `t_system_module` VALUES ('209', '评论管理', '评论管理', '23');
INSERT INTO `t_system_module` VALUES ('21', '项目管理', '项目管理', '2');
INSERT INTO `t_system_module` VALUES ('210', '举报管理', '举报管理', '23');
INSERT INTO `t_system_module` VALUES ('22', '订单管理', '订单管理', '2');
INSERT INTO `t_system_module` VALUES ('23', '审核管理', '审核管理', '2');
INSERT INTO `t_system_module` VALUES ('3', '财务管理', '财务管理', '0');
INSERT INTO `t_system_module` VALUES ('301', '支付记录', '支付记录', '31');
INSERT INTO `t_system_module` VALUES ('302', '待审核', '待审核提现列表', '32');
INSERT INTO `t_system_module` VALUES ('303', '待放款', '待放款提现列表', '32');
INSERT INTO `t_system_module` VALUES ('304', '提现成功', '提现成功列表', '32');
INSERT INTO `t_system_module` VALUES ('305', '提现失败', '提现失败列表', '32');
INSERT INTO `t_system_module` VALUES ('306', '订单待退款', '订单待退款列表', '33');
INSERT INTO `t_system_module` VALUES ('307', '订单退款失败', '订单退款失败列表', '33');
INSERT INTO `t_system_module` VALUES ('308', '订单退款记录', '订单退款记录列表', '33');
INSERT INTO `t_system_module` VALUES ('309', '平台调账管理', '平台调账管理', '34');
INSERT INTO `t_system_module` VALUES ('31', '支付记录', '支付记录', '3');
INSERT INTO `t_system_module` VALUES ('310', '平台资金明细', '平台资金明细', '34');
INSERT INTO `t_system_module` VALUES ('311', '用户资金明细', '用户资金明细', '34');
INSERT INTO `t_system_module` VALUES ('312', '支付对账', '支付对账列表', '35');
INSERT INTO `t_system_module` VALUES ('313', '退款对账', '退款对账列表', '35');
INSERT INTO `t_system_module` VALUES ('32', '提现管理', '提现管理', '3');
INSERT INTO `t_system_module` VALUES ('33', '退款管理', '退款管理', '3');
INSERT INTO `t_system_module` VALUES ('34', '账务管理', '账务管理', '3');
INSERT INTO `t_system_module` VALUES ('35', '对账管理', '对账管理', '3');
INSERT INTO `t_system_module` VALUES ('4', '统计管理', '统计管理', '0');
INSERT INTO `t_system_module` VALUES ('401', '平台收益统计', '平台收益统计列表', '41');
INSERT INTO `t_system_module` VALUES ('402', '用户支持统计', '用户支持统计列表', '41');
INSERT INTO `t_system_module` VALUES ('403', '用户发起统计', '用户发起项目统计列表', '41');
INSERT INTO `t_system_module` VALUES ('404', '提现统计', '提现统计列表', '41');
INSERT INTO `t_system_module` VALUES ('405', '在线用户统计', '在线用户统计列表', '42');
INSERT INTO `t_system_module` VALUES ('406', '用户统计', '用户统计列表', '42');
INSERT INTO `t_system_module` VALUES ('41', '资金统计', '资金统计', '4');
INSERT INTO `t_system_module` VALUES ('42', '用户统计', '用户统计', '4');
INSERT INTO `t_system_module` VALUES ('5', '站点管理', '站点管理', '0');
INSERT INTO `t_system_module` VALUES ('501', '发起项目相关问题', '发起项目相关问题', '51');
INSERT INTO `t_system_module` VALUES ('502', '项目管理相关问题', '项目管理相关问题', '51');
INSERT INTO `t_system_module` VALUES ('503', '支持项目相关问题', '支持项目相关问题', '51');
INSERT INTO `t_system_module` VALUES ('504', '其他问题', '其他问题', '51');
INSERT INTO `t_system_module` VALUES ('505', '关于我们', '关于我们', '52');
INSERT INTO `t_system_module` VALUES ('506', '联系方式', '联系方式', '52');
INSERT INTO `t_system_module` VALUES ('507', '版权声明', '版权声明', '52');
INSERT INTO `t_system_module` VALUES ('508', '法律服务', '法律服务', '52');
INSERT INTO `t_system_module` VALUES ('509', '加入我们', '加入我们', '52');
INSERT INTO `t_system_module` VALUES ('51', '帮助中心', '帮助中心', '5');
INSERT INTO `t_system_module` VALUES ('510', '合作伙伴', '合作伙伴', '52');
INSERT INTO `t_system_module` VALUES ('511', '广告图片', '广告图片', '53');
INSERT INTO `t_system_module` VALUES ('512', '关注我们', '关注我们', '53');
INSERT INTO `t_system_module` VALUES ('513', '平台公告', '平台公告', '54');
INSERT INTO `t_system_module` VALUES ('514', '新闻资讯', '新闻资讯', '54');
INSERT INTO `t_system_module` VALUES ('515', '项目推荐管理', '项目推荐管理', '55');
INSERT INTO `t_system_module` VALUES ('516', '站点信息设置', '站点信息设置', '56');
INSERT INTO `t_system_module` VALUES ('517', '站点logo', '站点logo', '56');
INSERT INTO `t_system_module` VALUES ('52', '关于我们', '关于我们', '5');
INSERT INTO `t_system_module` VALUES ('53', '广告', '广告', '5');
INSERT INTO `t_system_module` VALUES ('54', '媒体资讯', '媒体资讯', '5');
INSERT INTO `t_system_module` VALUES ('55', '首页项目展示管理', '首页项目展示管理', '5');
INSERT INTO `t_system_module` VALUES ('56', '站点设置', '站点设置', '5');
INSERT INTO `t_system_module` VALUES ('6', '运营管理', '运营管理', '0');
INSERT INTO `t_system_module` VALUES ('601', '项目标签设置', '项目标签设置', '61');
INSERT INTO `t_system_module` VALUES ('602', '平台提现设置', '平台提现设置', '61');
INSERT INTO `t_system_module` VALUES ('603', '短信模板', '短信模板', '61');
INSERT INTO `t_system_module` VALUES ('604', '图片模板', '图片模板', '61');
INSERT INTO `t_system_module` VALUES ('605', '协议条款', '协议条款', '62');
INSERT INTO `t_system_module` VALUES ('606', '文本说明', '文本说明', '62');
INSERT INTO `t_system_module` VALUES ('607', '短信', '短信', '63');
INSERT INTO `t_system_module` VALUES ('608', '意见反馈', '意见反馈', '64');
INSERT INTO `t_system_module` VALUES ('61', '基本设置', '基本设置', '6');
INSERT INTO `t_system_module` VALUES ('62', '资料管理', '资料管理', '6');
INSERT INTO `t_system_module` VALUES ('63', '消息管理', '消息管理', '6');
INSERT INTO `t_system_module` VALUES ('64', '意见反馈', '意见反馈', '6');
INSERT INTO `t_system_module` VALUES ('7', '系统管理', '系统管理', '0');
INSERT INTO `t_system_module` VALUES ('701', '账号列表', '账号列表', '71');
INSERT INTO `t_system_module` VALUES ('702', '用户组管理', '用户组管理', '71');
INSERT INTO `t_system_module` VALUES ('703', '平台常量设置', '平台常量设置', '72');
INSERT INTO `t_system_module` VALUES ('704', '系统属性设置', '系统属性设置', '72');
INSERT INTO `t_system_module` VALUES ('705', '前台日志', '前台日志', '73');
INSERT INTO `t_system_module` VALUES ('706', '后台日志', '后台日志', '73');
INSERT INTO `t_system_module` VALUES ('707', '备份数据库', '备份数据库', '74');
INSERT INTO `t_system_module` VALUES ('708', 'APP版本管理', 'APP版本管理', '75');
INSERT INTO `t_system_module` VALUES ('709', 'APP启动页设置', 'APP启动页设置', '75');
INSERT INTO `t_system_module` VALUES ('71', '后台账号管理', '后台账号管理', '7');
INSERT INTO `t_system_module` VALUES ('72', '系统参数设置', '系统参数设置', '7');
INSERT INTO `t_system_module` VALUES ('73', '系统日志', '系统日志', '7');
INSERT INTO `t_system_module` VALUES ('74', '数据库备份', '数据库备份', '7');
INSERT INTO `t_system_module` VALUES ('75', 'APP版本管理', 'APP版本管理', '7');

-- ----------------------------
-- Table structure for `t_system_promotion_message`
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
-- Records of t_system_promotion_message
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_promotion_message_detail`
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
-- Records of t_system_promotion_message_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_property`
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
-- Records of t_system_property
-- ----------------------------
INSERT INTO `t_system_property` VALUES ('1016050517360042245', 'COMMON', 'COMMON.IS_TRUST', 'true', '是否是托管', '2016-08-15 14:40:33', '0', '1');
INSERT INTO `t_system_property` VALUES ('1016050517360042246', 'COMMON', 'COMMON.PLATFORM_ID', '1', '平台帐号ID', '2016-05-05 17:36:00', null, '1');
INSERT INTO `t_system_property` VALUES ('1016050517360042298', 'WECHAT', 'WECHAT.WECHAT_DOMAIN_URL', 'http://192.168.0.217:8080', '第三方回调url', '2016-08-15 14:40:33', '0', '1');
INSERT INTO `t_system_property` VALUES ('101606041548533711', 'WEILAIWUXIAN', 'WLWX_SMS_URI', 'http://218.207.201.87:8860/sendSms.do', '未来无限短信发送地址', '2016-06-04 15:48:53', null, '1');
INSERT INTO `t_system_property` VALUES ('101606041548533712', 'WEILAIWUXIAN', 'WLWX_SMS_USER_PASSWORD', 'LHKZNP6XHJ', '未来无限短信发送用户密码', '2016-06-04 15:48:53', null, '1');
INSERT INTO `t_system_property` VALUES ('101606041548533713', 'WEILAIWUXIAN', 'WLWX_SMS_USER_ID', '530109', '未来无限短信发送用户名', '2016-06-04 15:48:53', null, '1');
INSERT INTO `t_system_property` VALUES ('101606081748212551', 'NZTNCIIC', 'MALL_ID', '110351', '商家id', '2016-06-08 17:48:21', null, '1');
INSERT INTO `t_system_property` VALUES ('101606081748212562', 'NZTNCIIC', 'APP_KEY', 'ca9aaae2eeb574e41cd42815b0d86a88', 'md5加密key', '2016-06-08 17:48:21', null, '1');
INSERT INTO `t_system_property` VALUES ('101606081748212563', 'NZTNCIIC', 'URL', 'http://121.41.42.121:8080/v2/id-server', '诺证通实名认证地址', '2016-06-08 17:48:21', null, '1');
INSERT INTO `t_system_property` VALUES ('101606081748212574', 'NZTNCIIC', 'BANKCARD_URL', 'http://121.41.42.121:8080/v3/card2-server', '诺证通银行卡认证地址', '2016-06-08 17:48:21', null, '1');
INSERT INTO `t_system_property` VALUES ('101606081748212575', 'NZTNCIIC', 'CHECKCARD_ENABLE', 'true', '是否启用银行卡认证：true启用；false不启用', '2016-06-08 17:48:21', null, '1');
INSERT INTO `t_system_property` VALUES ('101611011655549331', 'EASY_TRUST', 'EASY_TRUST.WX_SERVICE_ADDR', 'http://localhost:8080', '微信服务地址', '2016-11-01 17:05:55', '0', '1');
INSERT INTO `t_system_property` VALUES ('101611091802552681', 'EASY_TRUST', 'EASY_TRUST.PAY_TYPE', '200', '支付方式：微信 200', '2016-11-09 18:02:55', null, '1');

-- ----------------------------
-- Table structure for `t_system_region_info`
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
-- Records of t_system_region_info
-- ----------------------------
INSERT INTO `t_system_region_info` VALUES ('110000', '11', '0', '0', '北京市', '北京市', '', '', '', '0', '0', 'BJS', '0');
INSERT INTO `t_system_region_info` VALUES ('110100', '11', '1', '0', '北京市', '北京市', '北京市', '', '', '0', '1', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110101', '11', '1', '1', '东城区', '北京市', '市辖区', '东城区', '', '0', '2', 'DCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110102', '11', '1', '2', '西城区', '北京市', '市辖区', '西城区', '', '0', '2', 'XCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110105', '11', '1', '5', '朝阳区', '北京市', '市辖区', '朝阳区', '', '0', '2', 'CYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110106', '11', '1', '6', '丰台区', '北京市', '市辖区', '丰台区', '', '0', '2', 'FTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110107', '11', '1', '7', '石景山区', '北京市', '市辖区', '石景山区', '', '0', '2', 'SJSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110108', '11', '1', '8', '海淀区', '北京市', '市辖区', '海淀区', '', '0', '2', 'HDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110109', '11', '1', '9', '门头沟区', '北京市', '市辖区', '门头沟区', '', '0', '2', 'MTGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110111', '11', '1', '11', '房山区', '北京市', '市辖区', '房山区', '', '0', '2', 'FSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110112', '11', '1', '12', '通州区', '北京市', '市辖区', '通州区', '', '0', '2', 'TZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110113', '11', '1', '13', '顺义区', '北京市', '市辖区', '顺义区', '', '0', '2', 'SYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110114', '11', '1', '14', '昌平区', '北京市', '市辖区', '昌平区', '', '0', '2', 'CPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110115', '11', '1', '15', '大兴区', '北京市', '市辖区', '大兴区', '', '0', '2', 'DXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110116', '11', '1', '16', '怀柔区', '北京市', '市辖区', '怀柔区', '', '0', '2', 'HRQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110117', '11', '1', '17', '平谷区', '北京市', '市辖区', '平谷区', '', '0', '2', 'PGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110118', '11', '1', '18', '宣武区', '北京市', '市辖区', '宣武区', '010', '0', '2', 'XWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('110200', '11', '2', '0', '县', '北京市', '县', '', '', '0', '2', 'X', '0');
INSERT INTO `t_system_region_info` VALUES ('110228', '11', '2', '28', '密云县', '北京市', '县', '密云县', '', '0', '2', 'MYX', '0');
INSERT INTO `t_system_region_info` VALUES ('110229', '11', '2', '29', '延庆县', '北京市', '县', '延庆县', '', '0', '2', 'YQX', '0');
INSERT INTO `t_system_region_info` VALUES ('120000', '12', '0', '0', '天津市', '天津市', '', '', '', '0', '0', 'TJS', '0');
INSERT INTO `t_system_region_info` VALUES ('120100', '12', '1', '0', '天津市', '天津市', '天津市', '', '', '0', '1', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120101', '12', '1', '1', '和平区', '天津市', '市辖区', '和平区', '', '0', '2', 'HPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120102', '12', '1', '2', '河东区', '天津市', '市辖区', '河东区', '', '0', '2', 'HDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120103', '12', '1', '3', '河西区', '天津市', '市辖区', '河西区', '', '0', '2', 'HXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120104', '12', '1', '4', '南开区', '天津市', '市辖区', '南开区', '', '0', '2', 'NKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120105', '12', '1', '5', '河北区', '天津市', '市辖区', '河北区', '', '0', '2', 'HBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120106', '12', '1', '6', '红桥区', '天津市', '市辖区', '红桥区', '', '0', '2', 'GQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120110', '12', '1', '10', '东丽区', '天津市', '市辖区', '东丽区', '', '0', '2', 'DLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120111', '12', '1', '11', '西青区', '天津市', '市辖区', '西青区', '', '0', '2', 'XQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120112', '12', '1', '12', '津南区', '天津市', '市辖区', '津南区', '', '0', '2', 'JNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120113', '12', '1', '13', '北辰区', '天津市', '市辖区', '北辰区', '', '0', '2', 'BCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120114', '12', '1', '14', '武清区', '天津市', '市辖区', '武清区', '', '0', '2', 'WQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120115', '12', '1', '15', '宝坻区', '天津市', '市辖区', '宝坻区', '', '0', '2', 'BCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120116', '12', '1', '16', '滨海新区', '天津市', '市辖区', '滨海新区', '', '0', '2', 'BHXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('120200', '12', '2', '0', '县', '天津市', '县', '', '', '0', '2', 'X', '0');
INSERT INTO `t_system_region_info` VALUES ('120221', '12', '2', '21', '宁河县', '天津市', '县', '宁河县', '', '0', '2', 'NHX', '0');
INSERT INTO `t_system_region_info` VALUES ('120223', '12', '2', '23', '静海县', '天津市', '县', '静海县', '', '0', '2', 'JHX', '0');
INSERT INTO `t_system_region_info` VALUES ('120225', '12', '2', '25', '蓟县', '天津市', '县', '蓟县', '', '0', '2', 'JX', '0');
INSERT INTO `t_system_region_info` VALUES ('130000', '13', '0', '0', '河北省', '河北省', '', '', '', '0', '0', 'HBS', '0');
INSERT INTO `t_system_region_info` VALUES ('130100', '13', '1', '0', '石家庄市', '河北省', '石家庄市', '', '', '0', '1', 'SJZS', '0');
INSERT INTO `t_system_region_info` VALUES ('130101', '13', '1', '1', '市辖区', '河北省', '石家庄市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130102', '13', '1', '2', '长安区', '河北省', '石家庄市', '长安区', '', '0', '2', 'CAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130103', '13', '1', '3', '桥东区', '河北省', '石家庄市', '桥东区', '', '0', '2', 'QDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130104', '13', '1', '4', '桥西区', '河北省', '石家庄市', '桥西区', '', '0', '2', 'QXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130105', '13', '1', '5', '新华区', '河北省', '石家庄市', '新华区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130107', '13', '1', '7', '井陉矿区', '河北省', '石家庄市', '井陉矿区', '', '0', '2', 'JXKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130108', '13', '1', '8', '裕华区', '河北省', '石家庄市', '裕华区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130121', '13', '1', '21', '井陉县', '河北省', '石家庄市', '井陉县', '', '0', '2', 'JXX', '0');
INSERT INTO `t_system_region_info` VALUES ('130123', '13', '1', '23', '正定县', '河北省', '石家庄市', '正定县', '', '0', '2', 'ZDX', '0');
INSERT INTO `t_system_region_info` VALUES ('130124', '13', '1', '24', '栾城县', '河北省', '石家庄市', '栾城县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('130125', '13', '1', '25', '行唐县', '河北省', '石家庄市', '行唐县', '', '0', '2', 'HTX', '0');
INSERT INTO `t_system_region_info` VALUES ('130126', '13', '1', '26', '灵寿县', '河北省', '石家庄市', '灵寿县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('130127', '13', '1', '27', '高邑县', '河北省', '石家庄市', '高邑县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130128', '13', '1', '28', '深泽县', '河北省', '石家庄市', '深泽县', '', '0', '2', 'SZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130129', '13', '1', '29', '赞皇县', '河北省', '石家庄市', '赞皇县', '', '0', '2', 'ZHX', '0');
INSERT INTO `t_system_region_info` VALUES ('130130', '13', '1', '30', '无极县', '河北省', '石家庄市', '无极县', '', '0', '2', 'MJX', '0');
INSERT INTO `t_system_region_info` VALUES ('130131', '13', '1', '31', '平山县', '河北省', '石家庄市', '平山县', '', '0', '2', 'PSX', '0');
INSERT INTO `t_system_region_info` VALUES ('130132', '13', '1', '32', '元氏县', '河北省', '石家庄市', '元氏县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('130133', '13', '1', '33', '赵县', '河北省', '石家庄市', '赵县', '', '0', '2', 'ZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130181', '13', '1', '81', '辛集市', '河北省', '石家庄市', '辛集市', '', '0', '2', 'XJS', '0');
INSERT INTO `t_system_region_info` VALUES ('130182', '13', '1', '82', '藁城市', '河北省', '石家庄市', '藁城市', '', '0', '2', 'GCS', '0');
INSERT INTO `t_system_region_info` VALUES ('130183', '13', '1', '83', '晋州市', '河北省', '石家庄市', '晋州市', '', '0', '2', 'JZS', '0');
INSERT INTO `t_system_region_info` VALUES ('130184', '13', '1', '84', '新乐市', '河北省', '石家庄市', '新乐市', '', '0', '2', 'XLS', '0');
INSERT INTO `t_system_region_info` VALUES ('130185', '13', '1', '85', '鹿泉市', '河北省', '石家庄市', '鹿泉市', '', '0', '2', 'LQS', '0');
INSERT INTO `t_system_region_info` VALUES ('130200', '13', '2', '0', '唐山市', '河北省', '唐山市', '', '', '0', '1', 'TSS', '0');
INSERT INTO `t_system_region_info` VALUES ('130201', '13', '2', '1', '市辖区', '河北省', '唐山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130202', '13', '2', '2', '路南区', '河北省', '唐山市', '路南区', '', '0', '2', 'LNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130203', '13', '2', '3', '路北区', '河北省', '唐山市', '路北区', '', '0', '2', 'LBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130204', '13', '2', '4', '古冶区', '河北省', '唐山市', '古冶区', '', '0', '2', 'GYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130205', '13', '2', '5', '开平区', '河北省', '唐山市', '开平区', '', '0', '2', 'KPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130207', '13', '2', '7', '丰南区', '河北省', '唐山市', '丰南区', '', '0', '2', 'FNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130208', '13', '2', '8', '丰润区', '河北省', '唐山市', '丰润区', '', '0', '2', 'FRQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130223', '13', '2', '23', '滦县', '河北省', '唐山市', '滦县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('130224', '13', '2', '24', '滦南县', '河北省', '唐山市', '滦南县', '', '0', '2', 'LNX', '0');
INSERT INTO `t_system_region_info` VALUES ('130225', '13', '2', '25', '乐亭县', '河北省', '唐山市', '乐亭县', '', '0', '2', 'LTX', '0');
INSERT INTO `t_system_region_info` VALUES ('130227', '13', '2', '27', '迁西县', '河北省', '唐山市', '迁西县', '', '0', '2', 'QXX', '0');
INSERT INTO `t_system_region_info` VALUES ('130229', '13', '2', '29', '玉田县', '河北省', '唐山市', '玉田县', '', '0', '2', 'YTX', '0');
INSERT INTO `t_system_region_info` VALUES ('130230', '13', '2', '30', '唐海县', '河北省', '唐山市', '唐海县', '', '0', '2', 'THX', '0');
INSERT INTO `t_system_region_info` VALUES ('130281', '13', '2', '81', '遵化市', '河北省', '唐山市', '遵化市', '', '0', '2', 'ZHS', '0');
INSERT INTO `t_system_region_info` VALUES ('130283', '13', '2', '83', '迁安市', '河北省', '唐山市', '迁安市', '', '0', '2', 'QAS', '0');
INSERT INTO `t_system_region_info` VALUES ('130300', '13', '3', '0', '秦皇岛市', '河北省', '秦皇岛市', '', '', '0', '1', 'QHDS', '0');
INSERT INTO `t_system_region_info` VALUES ('130301', '13', '3', '1', '市辖区', '河北省', '秦皇岛市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130302', '13', '3', '2', '海港区', '河北省', '秦皇岛市', '海港区', '', '0', '2', 'HGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130303', '13', '3', '3', '山海关区', '河北省', '秦皇岛市', '山海关区', '', '0', '2', 'SHGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130304', '13', '3', '4', '北戴河区', '河北省', '秦皇岛市', '北戴河区', '', '0', '2', 'BDHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130321', '13', '3', '21', '青龙满族自治县', '河北省', '秦皇岛市', '青龙满族自治县', '', '0', '2', 'QLMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130322', '13', '3', '22', '昌黎县', '河北省', '秦皇岛市', '昌黎县', '', '0', '2', 'CLX', '0');
INSERT INTO `t_system_region_info` VALUES ('130323', '13', '3', '23', '抚宁县', '河北省', '秦皇岛市', '抚宁县', '', '0', '2', 'FNX', '0');
INSERT INTO `t_system_region_info` VALUES ('130324', '13', '3', '24', '卢龙县', '河北省', '秦皇岛市', '卢龙县', '', '0', '2', 'LLX', '0');
INSERT INTO `t_system_region_info` VALUES ('130400', '13', '4', '0', '邯郸市', '河北省', '邯郸市', '', '', '0', '1', 'HDS', '0');
INSERT INTO `t_system_region_info` VALUES ('130401', '13', '4', '1', '市辖区', '河北省', '邯郸市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130402', '13', '4', '2', '邯山区', '河北省', '邯郸市', '邯山区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130403', '13', '4', '3', '丛台区', '河北省', '邯郸市', '丛台区', '', '0', '2', 'CTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130404', '13', '4', '4', '复兴区', '河北省', '邯郸市', '复兴区', '', '0', '2', 'FXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130406', '13', '4', '6', '峰峰矿区', '河北省', '邯郸市', '峰峰矿区', '', '0', '2', 'FFKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130421', '13', '4', '21', '邯郸县', '河北省', '邯郸市', '邯郸县', '', '0', '2', 'HDX', '0');
INSERT INTO `t_system_region_info` VALUES ('130423', '13', '4', '23', '临漳县', '河北省', '邯郸市', '临漳县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130424', '13', '4', '24', '成安县', '河北省', '邯郸市', '成安县', '', '0', '2', 'CAX', '0');
INSERT INTO `t_system_region_info` VALUES ('130425', '13', '4', '25', '大名县', '河北省', '邯郸市', '大名县', '', '0', '2', 'DMX', '0');
INSERT INTO `t_system_region_info` VALUES ('130426', '13', '4', '26', '涉县', '河北省', '邯郸市', '涉县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('130427', '13', '4', '27', '磁县', '河北省', '邯郸市', '磁县', '', '0', '2', 'CX', '0');
INSERT INTO `t_system_region_info` VALUES ('130428', '13', '4', '28', '肥乡县', '河北省', '邯郸市', '肥乡县', '', '0', '2', 'FXX', '0');
INSERT INTO `t_system_region_info` VALUES ('130429', '13', '4', '29', '永年县', '河北省', '邯郸市', '永年县', '', '0', '2', 'YNX', '0');
INSERT INTO `t_system_region_info` VALUES ('130430', '13', '4', '30', '邱县', '河北省', '邯郸市', '邱县', '', '0', '2', 'QX', '0');
INSERT INTO `t_system_region_info` VALUES ('130431', '13', '4', '31', '鸡泽县', '河北省', '邯郸市', '鸡泽县', '', '0', '2', 'JZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130432', '13', '4', '32', '广平县', '河北省', '邯郸市', '广平县', '', '0', '2', 'APX', '0');
INSERT INTO `t_system_region_info` VALUES ('130433', '13', '4', '33', '馆陶县', '河北省', '邯郸市', '馆陶县', '', '0', '2', 'GTX', '0');
INSERT INTO `t_system_region_info` VALUES ('130434', '13', '4', '34', '魏县', '河北省', '邯郸市', '魏县', '', '0', '2', 'WX', '0');
INSERT INTO `t_system_region_info` VALUES ('130435', '13', '4', '35', '曲周县', '河北省', '邯郸市', '曲周县', '', '0', '2', 'QZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130481', '13', '4', '81', '武安市', '河北省', '邯郸市', '武安市', '', '0', '2', 'WAS', '0');
INSERT INTO `t_system_region_info` VALUES ('130500', '13', '5', '0', '邢台市', '河北省', '邢台市', '', '', '0', '1', 'XTS', '0');
INSERT INTO `t_system_region_info` VALUES ('130501', '13', '5', '1', '市辖区', '河北省', '邢台市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130502', '13', '5', '2', '桥东区', '河北省', '邢台市', '桥东区', '', '0', '2', 'QDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130503', '13', '5', '3', '桥西区', '河北省', '邢台市', '桥西区', '', '0', '2', 'QXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130521', '13', '5', '21', '邢台县', '河北省', '邢台市', '邢台县', '', '0', '2', 'XTX', '0');
INSERT INTO `t_system_region_info` VALUES ('130522', '13', '5', '22', '临城县', '河北省', '邢台市', '临城县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('130523', '13', '5', '23', '内丘县', '河北省', '邢台市', '内丘县', '', '0', '2', 'NQX', '0');
INSERT INTO `t_system_region_info` VALUES ('130524', '13', '5', '24', '柏乡县', '河北省', '邢台市', '柏乡县', '', '0', '2', 'BXX', '0');
INSERT INTO `t_system_region_info` VALUES ('130525', '13', '5', '25', '隆尧县', '河北省', '邢台市', '隆尧县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130526', '13', '5', '26', '任县', '河北省', '邢台市', '任县', '', '0', '2', 'RX', '0');
INSERT INTO `t_system_region_info` VALUES ('130527', '13', '5', '27', '南和县', '河北省', '邢台市', '南和县', '', '0', '2', 'NHX', '0');
INSERT INTO `t_system_region_info` VALUES ('130528', '13', '5', '28', '宁晋县', '河北省', '邢台市', '宁晋县', '', '0', '2', 'NJX', '0');
INSERT INTO `t_system_region_info` VALUES ('130529', '13', '5', '29', '巨鹿县', '河北省', '邢台市', '巨鹿县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('130530', '13', '5', '30', '新河县', '河北省', '邢台市', '新河县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('130531', '13', '5', '31', '广宗县', '河北省', '邢台市', '广宗县', '', '0', '2', 'AZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130532', '13', '5', '32', '平乡县', '河北省', '邢台市', '平乡县', '', '0', '2', 'PXX', '0');
INSERT INTO `t_system_region_info` VALUES ('130533', '13', '5', '33', '威县', '河北省', '邢台市', '威县', '', '0', '2', 'WX', '0');
INSERT INTO `t_system_region_info` VALUES ('130534', '13', '5', '34', '清河县', '河北省', '邢台市', '清河县', '', '0', '2', 'QHX', '0');
INSERT INTO `t_system_region_info` VALUES ('130535', '13', '5', '35', '临西县', '河北省', '邢台市', '临西县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('130581', '13', '5', '81', '南宫市', '河北省', '邢台市', '南宫市', '', '0', '2', 'NGS', '0');
INSERT INTO `t_system_region_info` VALUES ('130582', '13', '5', '82', '沙河市', '河北省', '邢台市', '沙河市', '', '0', '2', 'SHS', '0');
INSERT INTO `t_system_region_info` VALUES ('130600', '13', '6', '0', '保定市', '河北省', '保定市', '', '', '0', '1', 'BDS', '0');
INSERT INTO `t_system_region_info` VALUES ('130601', '13', '6', '1', '市辖区', '河北省', '保定市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130602', '13', '6', '2', '新市区', '河北省', '保定市', '新市区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130603', '13', '6', '3', '北市区', '河北省', '保定市', '北市区', '', '0', '2', 'BSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130604', '13', '6', '4', '南市区', '河北省', '保定市', '南市区', '', '0', '2', 'NSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130621', '13', '6', '21', '满城县', '河北省', '保定市', '满城县', '', '0', '2', 'MCX', '0');
INSERT INTO `t_system_region_info` VALUES ('130622', '13', '6', '22', '清苑县', '河北省', '保定市', '清苑县', '', '0', '2', 'QYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130623', '13', '6', '23', '涞水县', '河北省', '保定市', '涞水县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('130624', '13', '6', '24', '阜平县', '河北省', '保定市', '阜平县', '', '0', '2', 'FPX', '0');
INSERT INTO `t_system_region_info` VALUES ('130625', '13', '6', '25', '徐水县', '河北省', '保定市', '徐水县', '', '0', '2', 'XSX', '0');
INSERT INTO `t_system_region_info` VALUES ('130626', '13', '6', '26', '定兴县', '河北省', '保定市', '定兴县', '', '0', '2', 'DXX', '0');
INSERT INTO `t_system_region_info` VALUES ('130627', '13', '6', '27', '唐县', '河北省', '保定市', '唐县', '', '0', '2', 'TX', '0');
INSERT INTO `t_system_region_info` VALUES ('130628', '13', '6', '28', '高阳县', '河北省', '保定市', '高阳县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130629', '13', '6', '29', '容城县', '河北省', '保定市', '容城县', '', '0', '2', 'RCX', '0');
INSERT INTO `t_system_region_info` VALUES ('130630', '13', '6', '30', '涞源县', '河北省', '保定市', '涞源县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130631', '13', '6', '31', '望都县', '河北省', '保定市', '望都县', '', '0', '2', 'WDX', '0');
INSERT INTO `t_system_region_info` VALUES ('130632', '13', '6', '32', '安新县', '河北省', '保定市', '安新县', '', '0', '2', 'AXX', '0');
INSERT INTO `t_system_region_info` VALUES ('130633', '13', '6', '33', '易县', '河北省', '保定市', '易县', '', '0', '2', 'YX', '0');
INSERT INTO `t_system_region_info` VALUES ('130634', '13', '6', '34', '曲阳县', '河北省', '保定市', '曲阳县', '', '0', '2', 'QYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130635', '13', '6', '35', '蠡县', '河北省', '保定市', '蠡县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('130636', '13', '6', '36', '顺平县', '河北省', '保定市', '顺平县', '', '0', '2', 'SPX', '0');
INSERT INTO `t_system_region_info` VALUES ('130637', '13', '6', '37', '博野县', '河北省', '保定市', '博野县', '', '0', '2', 'BYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130638', '13', '6', '38', '雄县', '河北省', '保定市', '雄县', '', '0', '2', 'XX', '0');
INSERT INTO `t_system_region_info` VALUES ('130681', '13', '6', '81', '涿州市', '河北省', '保定市', '涿州市', '', '0', '2', 'ZZS', '0');
INSERT INTO `t_system_region_info` VALUES ('130682', '13', '6', '82', '定州市', '河北省', '保定市', '定州市', '', '0', '2', 'DZS', '0');
INSERT INTO `t_system_region_info` VALUES ('130683', '13', '6', '83', '安国市', '河北省', '保定市', '安国市', '', '0', '2', 'AGS', '0');
INSERT INTO `t_system_region_info` VALUES ('130684', '13', '6', '84', '高碑店市', '河北省', '保定市', '高碑店市', '', '0', '2', 'GBDS', '0');
INSERT INTO `t_system_region_info` VALUES ('130700', '13', '7', '0', '张家口市', '河北省', '张家口市', '', '', '0', '1', 'ZJKS', '0');
INSERT INTO `t_system_region_info` VALUES ('130701', '13', '7', '1', '市辖区', '河北省', '张家口市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130702', '13', '7', '2', '桥东区', '河北省', '张家口市', '桥东区', '', '0', '2', 'QDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130703', '13', '7', '3', '桥西区', '河北省', '张家口市', '桥西区', '', '0', '2', 'QXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130705', '13', '7', '5', '宣化区', '河北省', '张家口市', '宣化区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130706', '13', '7', '6', '下花园区', '河北省', '张家口市', '下花园区', '', '0', '2', 'XHYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130721', '13', '7', '21', '宣化县', '河北省', '张家口市', '宣化县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('130722', '13', '7', '22', '张北县', '河北省', '张家口市', '张北县', '', '0', '2', 'ZBX', '0');
INSERT INTO `t_system_region_info` VALUES ('130723', '13', '7', '23', '康保县', '河北省', '张家口市', '康保县', '', '0', '2', 'KBX', '0');
INSERT INTO `t_system_region_info` VALUES ('130724', '13', '7', '24', '沽源县', '河北省', '张家口市', '沽源县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130725', '13', '7', '25', '尚义县', '河北省', '张家口市', '尚义县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130726', '13', '7', '26', '蔚县', '河北省', '张家口市', '蔚县', '', '0', '2', 'WX', '0');
INSERT INTO `t_system_region_info` VALUES ('130727', '13', '7', '27', '阳原县', '河北省', '张家口市', '阳原县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('130728', '13', '7', '28', '怀安县', '河北省', '张家口市', '怀安县', '', '0', '2', 'HAX', '0');
INSERT INTO `t_system_region_info` VALUES ('130729', '13', '7', '29', '万全县', '河北省', '张家口市', '万全县', '', '0', '2', 'MQX', '0');
INSERT INTO `t_system_region_info` VALUES ('130730', '13', '7', '30', '怀来县', '河北省', '张家口市', '怀来县', '', '0', '2', 'HLX', '0');
INSERT INTO `t_system_region_info` VALUES ('130731', '13', '7', '31', '涿鹿县', '河北省', '张家口市', '涿鹿县', '', '0', '2', 'ZLX', '0');
INSERT INTO `t_system_region_info` VALUES ('130732', '13', '7', '32', '赤城县', '河北省', '张家口市', '赤城县', '', '0', '2', 'CCX', '0');
INSERT INTO `t_system_region_info` VALUES ('130733', '13', '7', '33', '崇礼县', '河北省', '张家口市', '崇礼县', '', '0', '2', 'CLX', '0');
INSERT INTO `t_system_region_info` VALUES ('130800', '13', '8', '0', '承德市', '河北省', '承德市', '', '', '0', '1', 'CDS', '0');
INSERT INTO `t_system_region_info` VALUES ('130801', '13', '8', '1', '市辖区', '河北省', '承德市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130802', '13', '8', '2', '双桥区', '河北省', '承德市', '双桥区', '', '0', '2', 'SQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130803', '13', '8', '3', '双滦区', '河北省', '承德市', '双滦区', '', '0', '2', 'SLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130804', '13', '8', '4', '鹰手营子矿区', '河北省', '承德市', '鹰手营子矿区', '', '0', '2', 'YSYZKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130821', '13', '8', '21', '承德县', '河北省', '承德市', '承德县', '', '0', '2', 'CDX', '0');
INSERT INTO `t_system_region_info` VALUES ('130822', '13', '8', '22', '兴隆县', '河北省', '承德市', '兴隆县', '', '0', '2', 'XLX', '0');
INSERT INTO `t_system_region_info` VALUES ('130823', '13', '8', '23', '平泉县', '河北省', '承德市', '平泉县', '', '0', '2', 'PQX', '0');
INSERT INTO `t_system_region_info` VALUES ('130824', '13', '8', '24', '滦平县', '河北省', '承德市', '滦平县', '', '0', '2', 'LPX', '0');
INSERT INTO `t_system_region_info` VALUES ('130825', '13', '8', '25', '隆化县', '河北省', '承德市', '隆化县', '', '0', '2', 'LHX', '0');
INSERT INTO `t_system_region_info` VALUES ('130826', '13', '8', '26', '丰宁满族自治县', '河北省', '承德市', '丰宁满族自治县', '', '0', '2', 'FNMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130827', '13', '8', '27', '宽城满族自治县', '河北省', '承德市', '宽城满族自治县', '', '0', '2', 'KCMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130828', '13', '8', '28', '围场满族蒙古族自治县', '河北省', '承德市', '围场满族蒙古族自治县', '', '0', '2', 'WCMZMGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130900', '13', '9', '0', '沧州市', '河北省', '沧州市', '', '', '0', '1', 'CZS', '0');
INSERT INTO `t_system_region_info` VALUES ('130901', '13', '9', '1', '市辖区', '河北省', '沧州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130902', '13', '9', '2', '新华区', '河北省', '沧州市', '新华区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130903', '13', '9', '3', '运河区', '河北省', '沧州市', '运河区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('130921', '13', '9', '21', '沧县', '河北省', '沧州市', '沧县', '', '0', '2', 'CX', '0');
INSERT INTO `t_system_region_info` VALUES ('130922', '13', '9', '22', '青县', '河北省', '沧州市', '青县', '', '0', '2', 'QX', '0');
INSERT INTO `t_system_region_info` VALUES ('130923', '13', '9', '23', '东光县', '河北省', '沧州市', '东光县', '', '0', '2', 'DGX', '0');
INSERT INTO `t_system_region_info` VALUES ('130924', '13', '9', '24', '海兴县', '河北省', '沧州市', '海兴县', '', '0', '2', 'HXX', '0');
INSERT INTO `t_system_region_info` VALUES ('130925', '13', '9', '25', '盐山县', '河北省', '沧州市', '盐山县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('130926', '13', '9', '26', '肃宁县', '河北省', '沧州市', '肃宁县', '', '0', '2', 'SNX', '0');
INSERT INTO `t_system_region_info` VALUES ('130927', '13', '9', '27', '南皮县', '河北省', '沧州市', '南皮县', '', '0', '2', 'NPX', '0');
INSERT INTO `t_system_region_info` VALUES ('130928', '13', '9', '28', '吴桥县', '河北省', '沧州市', '吴桥县', '', '0', '2', 'WQX', '0');
INSERT INTO `t_system_region_info` VALUES ('130929', '13', '9', '29', '献县', '河北省', '沧州市', '献县', '', '0', '2', 'XX', '0');
INSERT INTO `t_system_region_info` VALUES ('130930', '13', '9', '30', '孟村回族自治县', '河北省', '沧州市', '孟村回族自治县', '', '0', '2', 'MCHZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('130981', '13', '9', '81', '泊头市', '河北省', '沧州市', '泊头市', '', '0', '2', 'BTS', '0');
INSERT INTO `t_system_region_info` VALUES ('130982', '13', '9', '82', '任丘市', '河北省', '沧州市', '任丘市', '', '0', '2', 'RQS', '0');
INSERT INTO `t_system_region_info` VALUES ('130983', '13', '9', '83', '黄骅市', '河北省', '沧州市', '黄骅市', '', '0', '2', 'HHS', '0');
INSERT INTO `t_system_region_info` VALUES ('130984', '13', '9', '84', '河间市', '河北省', '沧州市', '河间市', '', '0', '2', 'HJS', '0');
INSERT INTO `t_system_region_info` VALUES ('131000', '13', '10', '0', '廊坊市', '河北省', '廊坊市', '', '', '0', '1', 'LFS', '0');
INSERT INTO `t_system_region_info` VALUES ('131001', '13', '10', '1', '市辖区', '河北省', '廊坊市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('131002', '13', '10', '2', '安次区', '河北省', '廊坊市', '安次区', '', '0', '2', 'ACQ', '0');
INSERT INTO `t_system_region_info` VALUES ('131003', '13', '10', '3', '广阳区', '河北省', '廊坊市', '广阳区', '', '0', '2', 'AYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('131022', '13', '10', '22', '固安县', '河北省', '廊坊市', '固安县', '', '0', '2', 'GAX', '0');
INSERT INTO `t_system_region_info` VALUES ('131023', '13', '10', '23', '永清县', '河北省', '廊坊市', '永清县', '', '0', '2', 'YQX', '0');
INSERT INTO `t_system_region_info` VALUES ('131024', '13', '10', '24', '香河县', '河北省', '廊坊市', '香河县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('131025', '13', '10', '25', '大城县', '河北省', '廊坊市', '大城县', '', '0', '2', 'DCX', '0');
INSERT INTO `t_system_region_info` VALUES ('131026', '13', '10', '26', '文安县', '河北省', '廊坊市', '文安县', '', '0', '2', 'WAX', '0');
INSERT INTO `t_system_region_info` VALUES ('131028', '13', '10', '28', '大厂回族自治县', '河北省', '廊坊市', '大厂回族自治县', '', '0', '2', 'DAHZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('131081', '13', '10', '81', '霸州市', '河北省', '廊坊市', '霸州市', '', '0', '2', 'BZS', '0');
INSERT INTO `t_system_region_info` VALUES ('131082', '13', '10', '82', '三河市', '河北省', '廊坊市', '三河市', '', '0', '2', 'SHS', '0');
INSERT INTO `t_system_region_info` VALUES ('131100', '13', '11', '0', '衡水市', '河北省', '衡水市', '', '', '0', '1', 'HSS', '0');
INSERT INTO `t_system_region_info` VALUES ('131101', '13', '11', '1', '市辖区', '河北省', '衡水市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('131102', '13', '11', '2', '桃城区', '河北省', '衡水市', '桃城区', '', '0', '2', 'TCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('131121', '13', '11', '21', '枣强县', '河北省', '衡水市', '枣强县', '', '0', '2', 'ZJX', '0');
INSERT INTO `t_system_region_info` VALUES ('131122', '13', '11', '22', '武邑县', '河北省', '衡水市', '武邑县', '', '0', '2', 'WYX', '0');
INSERT INTO `t_system_region_info` VALUES ('131123', '13', '11', '23', '武强县', '河北省', '衡水市', '武强县', '', '0', '2', 'WJX', '0');
INSERT INTO `t_system_region_info` VALUES ('131124', '13', '11', '24', '饶阳县', '河北省', '衡水市', '饶阳县', '', '0', '2', 'RYX', '0');
INSERT INTO `t_system_region_info` VALUES ('131125', '13', '11', '25', '安平县', '河北省', '衡水市', '安平县', '', '0', '2', 'APX', '0');
INSERT INTO `t_system_region_info` VALUES ('131126', '13', '11', '26', '故城县', '河北省', '衡水市', '故城县', '', '0', '2', 'GCX', '0');
INSERT INTO `t_system_region_info` VALUES ('131127', '13', '11', '27', '景县', '河北省', '衡水市', '景县', '', '0', '2', 'JX', '0');
INSERT INTO `t_system_region_info` VALUES ('131128', '13', '11', '28', '阜城县', '河北省', '衡水市', '阜城县', '', '0', '2', 'FCX', '0');
INSERT INTO `t_system_region_info` VALUES ('131181', '13', '11', '81', '冀州市', '河北省', '衡水市', '冀州市', '', '0', '2', 'JZS', '0');
INSERT INTO `t_system_region_info` VALUES ('131182', '13', '11', '82', '深州市', '河北省', '衡水市', '深州市', '', '0', '2', 'SZS', '0');
INSERT INTO `t_system_region_info` VALUES ('140000', '14', '0', '0', '山西省', '山西省', '', '', '', '0', '0', 'SXS', '0');
INSERT INTO `t_system_region_info` VALUES ('140100', '14', '1', '0', '太原市', '山西省', '太原市', '', '', '0', '1', 'TYS', '0');
INSERT INTO `t_system_region_info` VALUES ('140101', '14', '1', '1', '市辖区', '山西省', '太原市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140105', '14', '1', '5', '小店区', '山西省', '太原市', '小店区', '', '0', '2', 'XDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140106', '14', '1', '6', '迎泽区', '山西省', '太原市', '迎泽区', '', '0', '2', 'YZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140107', '14', '1', '7', '杏花岭区', '山西省', '太原市', '杏花岭区', '', '0', '2', 'XHLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140108', '14', '1', '8', '尖草坪区', '山西省', '太原市', '尖草坪区', '', '0', '2', 'JCPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140109', '14', '1', '9', '万柏林区', '山西省', '太原市', '万柏林区', '', '0', '2', 'MBLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140110', '14', '1', '10', '晋源区', '山西省', '太原市', '晋源区', '', '0', '2', 'JYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140121', '14', '1', '21', '清徐县', '山西省', '太原市', '清徐县', '', '0', '2', 'QXX', '0');
INSERT INTO `t_system_region_info` VALUES ('140122', '14', '1', '22', '阳曲县', '山西省', '太原市', '阳曲县', '', '0', '2', 'YQX', '0');
INSERT INTO `t_system_region_info` VALUES ('140123', '14', '1', '23', '娄烦县', '山西省', '太原市', '娄烦县', '', '0', '2', 'LFX', '0');
INSERT INTO `t_system_region_info` VALUES ('140181', '14', '1', '81', '古交市', '山西省', '太原市', '古交市', '', '0', '2', 'GJS', '0');
INSERT INTO `t_system_region_info` VALUES ('140200', '14', '2', '0', '大同市', '山西省', '大同市', '', '', '0', '1', 'DTS', '0');
INSERT INTO `t_system_region_info` VALUES ('140201', '14', '2', '1', '市辖区', '山西省', '大同市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140202', '14', '2', '2', '城区', '山西省', '大同市', '城区', '', '0', '2', 'CQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140203', '14', '2', '3', '矿区', '山西省', '大同市', '矿区', '', '0', '2', 'KQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140211', '14', '2', '11', '南郊区', '山西省', '大同市', '南郊区', '', '0', '2', 'NJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140212', '14', '2', '12', '新荣区', '山西省', '大同市', '新荣区', '', '0', '2', 'XRQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140221', '14', '2', '21', '阳高县', '山西省', '大同市', '阳高县', '', '0', '2', 'YGX', '0');
INSERT INTO `t_system_region_info` VALUES ('140222', '14', '2', '22', '天镇县', '山西省', '大同市', '天镇县', '', '0', '2', 'TZX', '0');
INSERT INTO `t_system_region_info` VALUES ('140223', '14', '2', '23', '广灵县', '山西省', '大同市', '广灵县', '', '0', '2', 'ALX', '0');
INSERT INTO `t_system_region_info` VALUES ('140224', '14', '2', '24', '灵丘县', '山西省', '大同市', '灵丘县', '', '0', '2', 'LQX', '0');
INSERT INTO `t_system_region_info` VALUES ('140225', '14', '2', '25', '浑源县', '山西省', '大同市', '浑源县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140226', '14', '2', '26', '左云县', '山西省', '大同市', '左云县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140227', '14', '2', '27', '大同县', '山西省', '大同市', '大同县', '', '0', '2', 'DTX', '0');
INSERT INTO `t_system_region_info` VALUES ('140300', '14', '3', '0', '阳泉市', '山西省', '阳泉市', '', '', '0', '1', 'YQS', '0');
INSERT INTO `t_system_region_info` VALUES ('140301', '14', '3', '1', '市辖区', '山西省', '阳泉市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140302', '14', '3', '2', '城区', '山西省', '阳泉市', '城区', '', '0', '2', 'CQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140303', '14', '3', '3', '矿区', '山西省', '阳泉市', '矿区', '', '0', '2', 'KQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140311', '14', '3', '11', '郊区', '山西省', '阳泉市', '郊区', '', '0', '2', 'JQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140321', '14', '3', '21', '平定县', '山西省', '阳泉市', '平定县', '', '0', '2', 'PDX', '0');
INSERT INTO `t_system_region_info` VALUES ('140322', '14', '3', '22', '盂县', '山西省', '阳泉市', '盂县', '', '0', '2', 'YX', '0');
INSERT INTO `t_system_region_info` VALUES ('140400', '14', '4', '0', '长治市', '山西省', '长治市', '', '', '0', '1', 'CZS', '0');
INSERT INTO `t_system_region_info` VALUES ('140401', '14', '4', '1', '市辖区', '山西省', '长治市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140402', '14', '4', '2', '城区', '山西省', '长治市', '城区', '', '0', '2', 'CQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140411', '14', '4', '11', '郊区', '山西省', '长治市', '郊区', '', '0', '2', 'JQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140421', '14', '4', '21', '长治县', '山西省', '长治市', '长治县', '', '0', '2', 'CZX', '0');
INSERT INTO `t_system_region_info` VALUES ('140423', '14', '4', '23', '襄垣县', '山西省', '长治市', '襄垣县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140424', '14', '4', '24', '屯留县', '山西省', '长治市', '屯留县', '', '0', '2', 'TLX', '0');
INSERT INTO `t_system_region_info` VALUES ('140425', '14', '4', '25', '平顺县', '山西省', '长治市', '平顺县', '', '0', '2', 'PSX', '0');
INSERT INTO `t_system_region_info` VALUES ('140426', '14', '4', '26', '黎城县', '山西省', '长治市', '黎城县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('140427', '14', '4', '27', '壶关县', '山西省', '长治市', '壶关县', '', '0', '2', 'HGX', '0');
INSERT INTO `t_system_region_info` VALUES ('140428', '14', '4', '28', '长子县', '山西省', '长治市', '长子县', '', '0', '2', 'CZX', '0');
INSERT INTO `t_system_region_info` VALUES ('140429', '14', '4', '29', '武乡县', '山西省', '长治市', '武乡县', '', '0', '2', 'WXX', '0');
INSERT INTO `t_system_region_info` VALUES ('140430', '14', '4', '30', '沁县', '山西省', '长治市', '沁县', '', '0', '2', 'QX', '0');
INSERT INTO `t_system_region_info` VALUES ('140431', '14', '4', '31', '沁源县', '山西省', '长治市', '沁源县', '', '0', '2', 'QYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140481', '14', '4', '81', '潞城市', '山西省', '长治市', '潞城市', '', '0', '2', 'LCS', '0');
INSERT INTO `t_system_region_info` VALUES ('140500', '14', '5', '0', '晋城市', '山西省', '晋城市', '', '', '0', '1', 'JCS', '0');
INSERT INTO `t_system_region_info` VALUES ('140501', '14', '5', '1', '市辖区', '山西省', '晋城市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140502', '14', '5', '2', '城区', '山西省', '晋城市', '城区', '', '0', '2', 'CQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140521', '14', '5', '21', '沁水县', '山西省', '晋城市', '沁水县', '', '0', '2', 'QSX', '0');
INSERT INTO `t_system_region_info` VALUES ('140522', '14', '5', '22', '阳城县', '山西省', '晋城市', '阳城县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('140524', '14', '5', '24', '陵川县', '山西省', '晋城市', '陵川县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('140525', '14', '5', '25', '泽州县', '山西省', '晋城市', '泽州县', '', '0', '2', 'ZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('140581', '14', '5', '81', '高平市', '山西省', '晋城市', '高平市', '', '0', '2', 'GPS', '0');
INSERT INTO `t_system_region_info` VALUES ('140600', '14', '6', '0', '朔州市', '山西省', '朔州市', '', '', '0', '1', 'SZS', '0');
INSERT INTO `t_system_region_info` VALUES ('140601', '14', '6', '1', '市辖区', '山西省', '朔州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140602', '14', '6', '2', '朔城区', '山西省', '朔州市', '朔城区', '', '0', '2', 'SCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140603', '14', '6', '3', '平鲁区', '山西省', '朔州市', '平鲁区', '', '0', '2', 'PLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140621', '14', '6', '21', '山阴县', '山西省', '朔州市', '山阴县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140622', '14', '6', '22', '应县', '山西省', '朔州市', '应县', '', '0', '2', 'YX', '0');
INSERT INTO `t_system_region_info` VALUES ('140623', '14', '6', '23', '右玉县', '山西省', '朔州市', '右玉县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140624', '14', '6', '24', '怀仁县', '山西省', '朔州市', '怀仁县', '', '0', '2', 'HRX', '0');
INSERT INTO `t_system_region_info` VALUES ('140700', '14', '7', '0', '晋中市', '山西省', '晋中市', '', '', '0', '1', 'JZS', '0');
INSERT INTO `t_system_region_info` VALUES ('140701', '14', '7', '1', '市辖区', '山西省', '晋中市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140702', '14', '7', '2', '榆次区', '山西省', '晋中市', '榆次区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140721', '14', '7', '21', '榆社县', '山西省', '晋中市', '榆社县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('140722', '14', '7', '22', '左权县', '山西省', '晋中市', '左权县', '', '0', '2', 'ZQX', '0');
INSERT INTO `t_system_region_info` VALUES ('140723', '14', '7', '23', '和顺县', '山西省', '晋中市', '和顺县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('140724', '14', '7', '24', '昔阳县', '山西省', '晋中市', '昔阳县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140725', '14', '7', '25', '寿阳县', '山西省', '晋中市', '寿阳县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140726', '14', '7', '26', '太谷县', '山西省', '晋中市', '太谷县', '', '0', '2', 'TGX', '0');
INSERT INTO `t_system_region_info` VALUES ('140727', '14', '7', '27', '祁县', '山西省', '晋中市', '祁县', '', '0', '2', 'QX', '0');
INSERT INTO `t_system_region_info` VALUES ('140728', '14', '7', '28', '平遥县', '山西省', '晋中市', '平遥县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140729', '14', '7', '29', '灵石县', '山西省', '晋中市', '灵石县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('140781', '14', '7', '81', '介休市', '山西省', '晋中市', '介休市', '', '0', '2', 'JXS', '0');
INSERT INTO `t_system_region_info` VALUES ('140800', '14', '8', '0', '运城市', '山西省', '运城市', '', '', '0', '1', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('140801', '14', '8', '1', '市辖区', '山西省', '运城市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140802', '14', '8', '2', '盐湖区', '山西省', '运城市', '盐湖区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140821', '14', '8', '21', '临猗县', '山西省', '运城市', '临猗县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('140822', '14', '8', '22', '万荣县', '山西省', '运城市', '万荣县', '', '0', '2', 'MRX', '0');
INSERT INTO `t_system_region_info` VALUES ('140823', '14', '8', '23', '闻喜县', '山西省', '运城市', '闻喜县', '', '0', '2', 'WXX', '0');
INSERT INTO `t_system_region_info` VALUES ('140824', '14', '8', '24', '稷山县', '山西省', '运城市', '稷山县', '', '0', '2', 'JSX', '0');
INSERT INTO `t_system_region_info` VALUES ('140825', '14', '8', '25', '新绛县', '山西省', '运城市', '新绛县', '', '0', '2', 'XJX', '0');
INSERT INTO `t_system_region_info` VALUES ('140826', '14', '8', '26', '绛县', '山西省', '运城市', '绛县', '', '0', '2', 'JX', '0');
INSERT INTO `t_system_region_info` VALUES ('140827', '14', '8', '27', '垣曲县', '山西省', '运城市', '垣曲县', '', '0', '2', 'YQX', '0');
INSERT INTO `t_system_region_info` VALUES ('140828', '14', '8', '28', '夏县', '山西省', '运城市', '夏县', '', '0', '2', 'XX', '0');
INSERT INTO `t_system_region_info` VALUES ('140829', '14', '8', '29', '平陆县', '山西省', '运城市', '平陆县', '', '0', '2', 'PLX', '0');
INSERT INTO `t_system_region_info` VALUES ('140830', '14', '8', '30', '芮城县', '山西省', '运城市', '芮城县', '', '0', '2', 'RCX', '0');
INSERT INTO `t_system_region_info` VALUES ('140881', '14', '8', '81', '永济市', '山西省', '运城市', '永济市', '', '0', '2', 'YJS', '0');
INSERT INTO `t_system_region_info` VALUES ('140882', '14', '8', '82', '河津市', '山西省', '运城市', '河津市', '', '0', '2', 'HJS', '0');
INSERT INTO `t_system_region_info` VALUES ('140900', '14', '9', '0', '忻州市', '山西省', '忻州市', '', '', '0', '1', 'XZS', '0');
INSERT INTO `t_system_region_info` VALUES ('140901', '14', '9', '1', '市辖区', '山西省', '忻州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140902', '14', '9', '2', '忻府区', '山西省', '忻州市', '忻府区', '', '0', '2', 'XFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('140921', '14', '9', '21', '定襄县', '山西省', '忻州市', '定襄县', '', '0', '2', 'DXX', '0');
INSERT INTO `t_system_region_info` VALUES ('140922', '14', '9', '22', '五台县', '山西省', '忻州市', '五台县', '', '0', '2', 'WTX', '0');
INSERT INTO `t_system_region_info` VALUES ('140923', '14', '9', '23', '代县', '山西省', '忻州市', '代县', '', '0', '2', 'DX', '0');
INSERT INTO `t_system_region_info` VALUES ('140924', '14', '9', '24', '繁峙县', '山西省', '忻州市', '繁峙县', '', '0', '2', 'FSX', '0');
INSERT INTO `t_system_region_info` VALUES ('140925', '14', '9', '25', '宁武县', '山西省', '忻州市', '宁武县', '', '0', '2', 'NWX', '0');
INSERT INTO `t_system_region_info` VALUES ('140926', '14', '9', '26', '静乐县', '山西省', '忻州市', '静乐县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('140927', '14', '9', '27', '神池县', '山西省', '忻州市', '神池县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('140928', '14', '9', '28', '五寨县', '山西省', '忻州市', '五寨县', '', '0', '2', 'WZX', '0');
INSERT INTO `t_system_region_info` VALUES ('140929', '14', '9', '29', '岢岚县', '山西省', '忻州市', '岢岚县', '', '0', '2', 'KLX', '0');
INSERT INTO `t_system_region_info` VALUES ('140930', '14', '9', '30', '河曲县', '山西省', '忻州市', '河曲县', '', '0', '2', 'HQX', '0');
INSERT INTO `t_system_region_info` VALUES ('140931', '14', '9', '31', '保德县', '山西省', '忻州市', '保德县', '', '0', '2', 'BDX', '0');
INSERT INTO `t_system_region_info` VALUES ('140932', '14', '9', '32', '偏关县', '山西省', '忻州市', '偏关县', '', '0', '2', 'PGX', '0');
INSERT INTO `t_system_region_info` VALUES ('140981', '14', '9', '81', '原平市', '山西省', '忻州市', '原平市', '', '0', '2', 'YPS', '0');
INSERT INTO `t_system_region_info` VALUES ('141000', '14', '10', '0', '临汾市', '山西省', '临汾市', '', '', '0', '1', 'LFS', '0');
INSERT INTO `t_system_region_info` VALUES ('141001', '14', '10', '1', '市辖区', '山西省', '临汾市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('141002', '14', '10', '2', '尧都区', '山西省', '临汾市', '尧都区', '', '0', '2', 'YDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('141021', '14', '10', '21', '曲沃县', '山西省', '临汾市', '曲沃县', '', '0', '2', 'QWX', '0');
INSERT INTO `t_system_region_info` VALUES ('141022', '14', '10', '22', '翼城县', '山西省', '临汾市', '翼城县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('141023', '14', '10', '23', '襄汾县', '山西省', '临汾市', '襄汾县', '', '0', '2', 'XFX', '0');
INSERT INTO `t_system_region_info` VALUES ('141024', '14', '10', '24', '洪洞县', '山西省', '临汾市', '洪洞县', '', '0', '2', 'HDX', '0');
INSERT INTO `t_system_region_info` VALUES ('141025', '14', '10', '25', '古县', '山西省', '临汾市', '古县', '', '0', '2', 'GX', '0');
INSERT INTO `t_system_region_info` VALUES ('141026', '14', '10', '26', '安泽县', '山西省', '临汾市', '安泽县', '', '0', '2', 'AZX', '0');
INSERT INTO `t_system_region_info` VALUES ('141027', '14', '10', '27', '浮山县', '山西省', '临汾市', '浮山县', '', '0', '2', 'FSX', '0');
INSERT INTO `t_system_region_info` VALUES ('141028', '14', '10', '28', '吉县', '山西省', '临汾市', '吉县', '', '0', '2', 'JX', '0');
INSERT INTO `t_system_region_info` VALUES ('141029', '14', '10', '29', '乡宁县', '山西省', '临汾市', '乡宁县', '', '0', '2', 'XNX', '0');
INSERT INTO `t_system_region_info` VALUES ('141030', '14', '10', '30', '大宁县', '山西省', '临汾市', '大宁县', '', '0', '2', 'DNX', '0');
INSERT INTO `t_system_region_info` VALUES ('141031', '14', '10', '31', '隰县', '山西省', '临汾市', '隰县', '', '0', '2', 'XX', '0');
INSERT INTO `t_system_region_info` VALUES ('141032', '14', '10', '32', '永和县', '山西省', '临汾市', '永和县', '', '0', '2', 'YHX', '0');
INSERT INTO `t_system_region_info` VALUES ('141033', '14', '10', '33', '蒲县', '山西省', '临汾市', '蒲县', '', '0', '2', 'PX', '0');
INSERT INTO `t_system_region_info` VALUES ('141034', '14', '10', '34', '汾西县', '山西省', '临汾市', '汾西县', '', '0', '2', 'FXX', '0');
INSERT INTO `t_system_region_info` VALUES ('141081', '14', '10', '81', '侯马市', '山西省', '临汾市', '侯马市', '', '0', '2', 'HMS', '0');
INSERT INTO `t_system_region_info` VALUES ('141082', '14', '10', '82', '霍州市', '山西省', '临汾市', '霍州市', '', '0', '2', 'HZS', '0');
INSERT INTO `t_system_region_info` VALUES ('141100', '14', '11', '0', '吕梁市', '山西省', '吕梁市', '', '', '0', '1', 'LLS', '0');
INSERT INTO `t_system_region_info` VALUES ('141101', '14', '11', '1', '市辖区', '山西省', '吕梁市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('141102', '14', '11', '2', '离石区', '山西省', '吕梁市', '离石区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('141121', '14', '11', '21', '文水县', '山西省', '吕梁市', '文水县', '', '0', '2', 'WSX', '0');
INSERT INTO `t_system_region_info` VALUES ('141122', '14', '11', '22', '交城县', '山西省', '吕梁市', '交城县', '', '0', '2', 'JCX', '0');
INSERT INTO `t_system_region_info` VALUES ('141123', '14', '11', '23', '兴县', '山西省', '吕梁市', '兴县', '', '0', '2', 'XX', '0');
INSERT INTO `t_system_region_info` VALUES ('141124', '14', '11', '24', '临县', '山西省', '吕梁市', '临县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('141125', '14', '11', '25', '柳林县', '山西省', '吕梁市', '柳林县', '', '0', '2', 'LLX', '0');
INSERT INTO `t_system_region_info` VALUES ('141126', '14', '11', '26', '石楼县', '山西省', '吕梁市', '石楼县', '', '0', '2', 'SLX', '0');
INSERT INTO `t_system_region_info` VALUES ('141127', '14', '11', '27', '岚县', '山西省', '吕梁市', '岚县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('141128', '14', '11', '28', '方山县', '山西省', '吕梁市', '方山县', '', '0', '2', 'FSX', '0');
INSERT INTO `t_system_region_info` VALUES ('141129', '14', '11', '29', '中阳县', '山西省', '吕梁市', '中阳县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('141130', '14', '11', '30', '交口县', '山西省', '吕梁市', '交口县', '', '0', '2', 'JKX', '0');
INSERT INTO `t_system_region_info` VALUES ('141181', '14', '11', '81', '孝义市', '山西省', '吕梁市', '孝义市', '', '0', '2', 'XYS', '0');
INSERT INTO `t_system_region_info` VALUES ('141182', '14', '11', '82', '汾阳市', '山西省', '吕梁市', '汾阳市', '', '0', '2', 'FYS', '0');
INSERT INTO `t_system_region_info` VALUES ('150000', '15', '0', '0', '内蒙古自治区', '内蒙古自治区', '', '', '', '0', '0', 'NMGZZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150100', '15', '1', '0', '呼和浩特市', '内蒙古自治区', '呼和浩特市', '', '', '0', '1', 'HHHTS', '0');
INSERT INTO `t_system_region_info` VALUES ('150101', '15', '1', '1', '市辖区', '内蒙古自治区', '呼和浩特市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150102', '15', '1', '2', '新城区', '内蒙古自治区', '呼和浩特市', '新城区', '', '0', '2', 'XCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150103', '15', '1', '3', '回民区', '内蒙古自治区', '呼和浩特市', '回民区', '', '0', '2', 'HMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150104', '15', '1', '4', '玉泉区', '内蒙古自治区', '呼和浩特市', '玉泉区', '', '0', '2', 'YQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150105', '15', '1', '5', '赛罕区', '内蒙古自治区', '呼和浩特市', '赛罕区', '', '0', '2', 'SHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150121', '15', '1', '21', '土默特左旗', '内蒙古自治区', '呼和浩特市', '土默特左旗', '', '0', '2', 'TMTZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150122', '15', '1', '22', '托克托县', '内蒙古自治区', '呼和浩特市', '托克托县', '', '0', '2', 'TKTX', '0');
INSERT INTO `t_system_region_info` VALUES ('150123', '15', '1', '23', '和林格尔县', '内蒙古自治区', '呼和浩特市', '和林格尔县', '', '0', '2', 'HLGEX', '0');
INSERT INTO `t_system_region_info` VALUES ('150124', '15', '1', '24', '清水河县', '内蒙古自治区', '呼和浩特市', '清水河县', '', '0', '2', 'QSHX', '0');
INSERT INTO `t_system_region_info` VALUES ('150125', '15', '1', '25', '武川县', '内蒙古自治区', '呼和浩特市', '武川县', '', '0', '2', 'WCX', '0');
INSERT INTO `t_system_region_info` VALUES ('150200', '15', '2', '0', '包头市', '内蒙古自治区', '包头市', '', '', '0', '1', 'BTS', '0');
INSERT INTO `t_system_region_info` VALUES ('150201', '15', '2', '1', '市辖区', '内蒙古自治区', '包头市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150202', '15', '2', '2', '东河区', '内蒙古自治区', '包头市', '东河区', '', '0', '2', 'DHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150203', '15', '2', '3', '昆都仑区', '内蒙古自治区', '包头市', '昆都仑区', '', '0', '2', 'KDLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150204', '15', '2', '4', '青山区', '内蒙古自治区', '包头市', '青山区', '', '0', '2', 'QSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150205', '15', '2', '5', '石拐区', '内蒙古自治区', '包头市', '石拐区', '', '0', '2', 'SGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150206', '15', '2', '6', '白云鄂博矿区', '内蒙古自治区', '包头市', '白云鄂博矿区', '', '0', '2', 'BYEBKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150207', '15', '2', '7', '九原区', '内蒙古自治区', '包头市', '九原区', '', '0', '2', 'JYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150221', '15', '2', '21', '土默特右旗', '内蒙古自治区', '包头市', '土默特右旗', '', '0', '2', 'TMTYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150222', '15', '2', '22', '固阳县', '内蒙古自治区', '包头市', '固阳县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('150223', '15', '2', '23', '达尔罕茂明安联合旗', '内蒙古自治区', '包头市', '达尔罕茂明安联合旗', '', '0', '2', 'DEHMMALGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150300', '15', '3', '0', '乌海市', '内蒙古自治区', '乌海市', '', '', '0', '1', 'WHS', '0');
INSERT INTO `t_system_region_info` VALUES ('150301', '15', '3', '1', '市辖区', '内蒙古自治区', '乌海市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150302', '15', '3', '2', '海勃湾区', '内蒙古自治区', '乌海市', '海勃湾区', '', '0', '2', 'HBWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150303', '15', '3', '3', '海南区', '内蒙古自治区', '乌海市', '海南区', '', '0', '2', 'HNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150304', '15', '3', '4', '乌达区', '内蒙古自治区', '乌海市', '乌达区', '', '0', '2', 'WDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150400', '15', '4', '0', '赤峰市', '内蒙古自治区', '赤峰市', '', '', '0', '1', 'CFS', '0');
INSERT INTO `t_system_region_info` VALUES ('150401', '15', '4', '1', '市辖区', '内蒙古自治区', '赤峰市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150402', '15', '4', '2', '红山区', '内蒙古自治区', '赤峰市', '红山区', '', '0', '2', 'GSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150403', '15', '4', '3', '元宝山区', '内蒙古自治区', '赤峰市', '元宝山区', '', '0', '2', 'YBSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150404', '15', '4', '4', '松山区', '内蒙古自治区', '赤峰市', '松山区', '', '0', '2', 'SSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150421', '15', '4', '21', '阿鲁科尔沁旗', '内蒙古自治区', '赤峰市', '阿鲁科尔沁旗', '', '0', '2', 'ALKEQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150422', '15', '4', '22', '巴林左旗', '内蒙古自治区', '赤峰市', '巴林左旗', '', '0', '2', 'BLZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150423', '15', '4', '23', '巴林右旗', '内蒙古自治区', '赤峰市', '巴林右旗', '', '0', '2', 'BLYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150424', '15', '4', '24', '林西县', '内蒙古自治区', '赤峰市', '林西县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('150425', '15', '4', '25', '克什克腾旗', '内蒙古自治区', '赤峰市', '克什克腾旗', '', '0', '2', 'KSKTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150426', '15', '4', '26', '翁牛特旗', '内蒙古自治区', '赤峰市', '翁牛特旗', '', '0', '2', 'WNTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150428', '15', '4', '28', '喀喇沁旗', '内蒙古自治区', '赤峰市', '喀喇沁旗', '', '0', '2', 'KLQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150429', '15', '4', '29', '宁城县', '内蒙古自治区', '赤峰市', '宁城县', '', '0', '2', 'NCX', '0');
INSERT INTO `t_system_region_info` VALUES ('150430', '15', '4', '30', '敖汉旗', '内蒙古自治区', '赤峰市', '敖汉旗', '', '0', '2', 'AHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150500', '15', '5', '0', '通辽市', '内蒙古自治区', '通辽市', '', '', '0', '1', 'TLS', '0');
INSERT INTO `t_system_region_info` VALUES ('150501', '15', '5', '1', '市辖区', '内蒙古自治区', '通辽市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150502', '15', '5', '2', '科尔沁区', '内蒙古自治区', '通辽市', '科尔沁区', '', '0', '2', 'KEQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150521', '15', '5', '21', '科尔沁左翼中旗', '内蒙古自治区', '通辽市', '科尔沁左翼中旗', '', '0', '2', 'KEQZYZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150522', '15', '5', '22', '科尔沁左翼后旗', '内蒙古自治区', '通辽市', '科尔沁左翼后旗', '', '0', '2', 'KEQZYHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150523', '15', '5', '23', '开鲁县', '内蒙古自治区', '通辽市', '开鲁县', '', '0', '2', 'KLX', '0');
INSERT INTO `t_system_region_info` VALUES ('150524', '15', '5', '24', '库伦旗', '内蒙古自治区', '通辽市', '库伦旗', '', '0', '2', 'KLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150525', '15', '5', '25', '奈曼旗', '内蒙古自治区', '通辽市', '奈曼旗', '', '0', '2', 'NMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150526', '15', '5', '26', '扎鲁特旗', '内蒙古自治区', '通辽市', '扎鲁特旗', '', '0', '2', 'ZLTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150581', '15', '5', '81', '霍林郭勒市', '内蒙古自治区', '通辽市', '霍林郭勒市', '', '0', '2', 'HLGLS', '0');
INSERT INTO `t_system_region_info` VALUES ('150600', '15', '6', '0', '鄂尔多斯市', '内蒙古自治区', '鄂尔多斯市', '', '', '0', '1', 'EEDSS', '0');
INSERT INTO `t_system_region_info` VALUES ('150601', '15', '6', '1', '市辖区', '内蒙古自治区', '鄂尔多斯市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150602', '15', '6', '2', '东胜区', '内蒙古自治区', '鄂尔多斯市', '东胜区', '', '0', '2', 'DSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150621', '15', '6', '21', '达拉特旗', '内蒙古自治区', '鄂尔多斯市', '达拉特旗', '', '0', '2', 'DLTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150622', '15', '6', '22', '准格尔旗', '内蒙古自治区', '鄂尔多斯市', '准格尔旗', '', '0', '2', 'ZGEQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150623', '15', '6', '23', '鄂托克前旗', '内蒙古自治区', '鄂尔多斯市', '鄂托克前旗', '', '0', '2', 'ETKQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150624', '15', '6', '24', '鄂托克旗', '内蒙古自治区', '鄂尔多斯市', '鄂托克旗', '', '0', '2', 'ETKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150625', '15', '6', '25', '杭锦旗', '内蒙古自治区', '鄂尔多斯市', '杭锦旗', '', '0', '2', 'HJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150626', '15', '6', '26', '乌审旗', '内蒙古自治区', '鄂尔多斯市', '乌审旗', '', '0', '2', 'WSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150627', '15', '6', '27', '伊金霍洛旗', '内蒙古自治区', '鄂尔多斯市', '伊金霍洛旗', '', '0', '2', 'YJHLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150700', '15', '7', '0', '呼伦贝尔市', '内蒙古自治区', '呼伦贝尔市', '', '', '0', '1', 'HLBES', '0');
INSERT INTO `t_system_region_info` VALUES ('150701', '15', '7', '1', '市辖区', '内蒙古自治区', '呼伦贝尔市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150702', '15', '7', '2', '海拉尔区', '内蒙古自治区', '呼伦贝尔市', '海拉尔区', '', '0', '2', 'HLEQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150721', '15', '7', '21', '阿荣旗', '内蒙古自治区', '呼伦贝尔市', '阿荣旗', '', '0', '2', 'ARQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150722', '15', '7', '22', '莫力达瓦达斡尔族自治旗', '内蒙古自治区', '呼伦贝尔市', '莫力达瓦达斡尔族自治旗', '', '0', '2', 'MLDWDWEZZZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150723', '15', '7', '23', '鄂伦春自治旗', '内蒙古自治区', '呼伦贝尔市', '鄂伦春自治旗', '', '0', '2', 'ELCZZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150724', '15', '7', '24', '鄂温克族自治旗', '内蒙古自治区', '呼伦贝尔市', '鄂温克族自治旗', '', '0', '2', 'EWKZZZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150725', '15', '7', '25', '陈巴尔虎旗', '内蒙古自治区', '呼伦贝尔市', '陈巴尔虎旗', '', '0', '2', 'CBEHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150726', '15', '7', '26', '新巴尔虎左旗', '内蒙古自治区', '呼伦贝尔市', '新巴尔虎左旗', '', '0', '2', 'XBEHZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150727', '15', '7', '27', '新巴尔虎右旗', '内蒙古自治区', '呼伦贝尔市', '新巴尔虎右旗', '', '0', '2', 'XBEHYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150781', '15', '7', '81', '满洲里市', '内蒙古自治区', '呼伦贝尔市', '满洲里市', '', '0', '2', 'MZLS', '0');
INSERT INTO `t_system_region_info` VALUES ('150782', '15', '7', '82', '牙克石市', '内蒙古自治区', '呼伦贝尔市', '牙克石市', '', '0', '2', 'YKSS', '0');
INSERT INTO `t_system_region_info` VALUES ('150783', '15', '7', '83', '扎兰屯市', '内蒙古自治区', '呼伦贝尔市', '扎兰屯市', '', '0', '2', 'ZLTS', '0');
INSERT INTO `t_system_region_info` VALUES ('150784', '15', '7', '84', '额尔古纳市', '内蒙古自治区', '呼伦贝尔市', '额尔古纳市', '', '0', '2', 'EEGNS', '0');
INSERT INTO `t_system_region_info` VALUES ('150785', '15', '7', '85', '根河市', '内蒙古自治区', '呼伦贝尔市', '根河市', '', '0', '2', 'GHS', '0');
INSERT INTO `t_system_region_info` VALUES ('150800', '15', '8', '0', '巴彦淖尔市', '内蒙古自治区', '巴彦淖尔市', '', '', '0', '1', 'BYNES', '0');
INSERT INTO `t_system_region_info` VALUES ('150801', '15', '8', '1', '市辖区', '内蒙古自治区', '巴彦淖尔市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150802', '15', '8', '2', '临河区', '内蒙古自治区', '巴彦淖尔市', '临河区', '', '0', '2', 'LHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150821', '15', '8', '21', '五原县', '内蒙古自治区', '巴彦淖尔市', '五原县', '', '0', '2', 'WYX', '0');
INSERT INTO `t_system_region_info` VALUES ('150822', '15', '8', '22', '磴口县', '内蒙古自治区', '巴彦淖尔市', '磴口县', '', '0', '2', 'DKX', '0');
INSERT INTO `t_system_region_info` VALUES ('150823', '15', '8', '23', '乌拉特前旗', '内蒙古自治区', '巴彦淖尔市', '乌拉特前旗', '', '0', '2', 'WLTQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150824', '15', '8', '24', '乌拉特中旗', '内蒙古自治区', '巴彦淖尔市', '乌拉特中旗', '', '0', '2', 'WLTZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150825', '15', '8', '25', '乌拉特后旗', '内蒙古自治区', '巴彦淖尔市', '乌拉特后旗', '', '0', '2', 'WLTHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150826', '15', '8', '26', '杭锦后旗', '内蒙古自治区', '巴彦淖尔市', '杭锦后旗', '', '0', '2', 'HJHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150900', '15', '9', '0', '乌兰察布市', '内蒙古自治区', '乌兰察布市', '', '', '0', '1', 'WLCBS', '0');
INSERT INTO `t_system_region_info` VALUES ('150901', '15', '9', '1', '市辖区', '内蒙古自治区', '乌兰察布市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150902', '15', '9', '2', '集宁区', '内蒙古自治区', '乌兰察布市', '集宁区', '', '0', '2', 'JNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150921', '15', '9', '21', '卓资县', '内蒙古自治区', '乌兰察布市', '卓资县', '', '0', '2', 'ZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('150922', '15', '9', '22', '化德县', '内蒙古自治区', '乌兰察布市', '化德县', '', '0', '2', 'HDX', '0');
INSERT INTO `t_system_region_info` VALUES ('150923', '15', '9', '23', '商都县', '内蒙古自治区', '乌兰察布市', '商都县', '', '0', '2', 'SDX', '0');
INSERT INTO `t_system_region_info` VALUES ('150924', '15', '9', '24', '兴和县', '内蒙古自治区', '乌兰察布市', '兴和县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('150925', '15', '9', '25', '凉城县', '内蒙古自治区', '乌兰察布市', '凉城县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('150926', '15', '9', '26', '察哈尔右翼前旗', '内蒙古自治区', '乌兰察布市', '察哈尔右翼前旗', '', '0', '2', 'CHEYYQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150927', '15', '9', '27', '察哈尔右翼中旗', '内蒙古自治区', '乌兰察布市', '察哈尔右翼中旗', '', '0', '2', 'CHEYYZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150928', '15', '9', '28', '察哈尔右翼后旗', '内蒙古自治区', '乌兰察布市', '察哈尔右翼后旗', '', '0', '2', 'CHEYYHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150929', '15', '9', '29', '四子王旗', '内蒙古自治区', '乌兰察布市', '四子王旗', '', '0', '2', 'SZWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('150981', '15', '9', '81', '丰镇市', '内蒙古自治区', '乌兰察布市', '丰镇市', '', '0', '2', 'FZS', '0');
INSERT INTO `t_system_region_info` VALUES ('152200', '15', '22', '0', '兴安盟', '内蒙古自治区', '兴安盟', '', '', '0', '1', 'XAM', '0');
INSERT INTO `t_system_region_info` VALUES ('152201', '15', '22', '1', '乌兰浩特市', '内蒙古自治区', '兴安盟', '乌兰浩特市', '', '0', '2', 'WLHTS', '0');
INSERT INTO `t_system_region_info` VALUES ('152202', '15', '22', '2', '阿尔山市', '内蒙古自治区', '兴安盟', '阿尔山市', '', '0', '2', 'AESS', '0');
INSERT INTO `t_system_region_info` VALUES ('152221', '15', '22', '21', '科尔沁右翼前旗', '内蒙古自治区', '兴安盟', '科尔沁右翼前旗', '', '0', '2', 'KEQYYQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152222', '15', '22', '22', '科尔沁右翼中旗', '内蒙古自治区', '兴安盟', '科尔沁右翼中旗', '', '0', '2', 'KEQYYZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152223', '15', '22', '23', '扎赉特旗', '内蒙古自治区', '兴安盟', '扎赉特旗', '', '0', '2', 'ZLTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152224', '15', '22', '24', '突泉县', '内蒙古自治区', '兴安盟', '突泉县', '', '0', '2', 'TQX', '0');
INSERT INTO `t_system_region_info` VALUES ('152500', '15', '25', '0', '锡林郭勒盟', '内蒙古自治区', '锡林郭勒盟', '', '', '0', '1', 'XLGLM', '0');
INSERT INTO `t_system_region_info` VALUES ('152501', '15', '25', '1', '二连浩特市', '内蒙古自治区', '锡林郭勒盟', '二连浩特市', '', '0', '2', 'ELHTS', '0');
INSERT INTO `t_system_region_info` VALUES ('152502', '15', '25', '2', '锡林浩特市', '内蒙古自治区', '锡林郭勒盟', '锡林浩特市', '', '0', '2', 'XLHTS', '0');
INSERT INTO `t_system_region_info` VALUES ('152522', '15', '25', '22', '阿巴嘎旗', '内蒙古自治区', '锡林郭勒盟', '阿巴嘎旗', '', '0', '2', 'ABGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152523', '15', '25', '23', '苏尼特左旗', '内蒙古自治区', '锡林郭勒盟', '苏尼特左旗', '', '0', '2', 'SNTZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152524', '15', '25', '24', '苏尼特右旗', '内蒙古自治区', '锡林郭勒盟', '苏尼特右旗', '', '0', '2', 'SNTYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152525', '15', '25', '25', '东乌珠穆沁旗', '内蒙古自治区', '锡林郭勒盟', '东乌珠穆沁旗', '', '0', '2', 'DWZMQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152526', '15', '25', '26', '西乌珠穆沁旗', '内蒙古自治区', '锡林郭勒盟', '西乌珠穆沁旗', '', '0', '2', 'XWZMQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152527', '15', '25', '27', '太仆寺旗', '内蒙古自治区', '锡林郭勒盟', '太仆寺旗', '', '0', '2', 'TPSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152528', '15', '25', '28', '镶黄旗', '内蒙古自治区', '锡林郭勒盟', '镶黄旗', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152529', '15', '25', '29', '正镶白旗', '内蒙古自治区', '锡林郭勒盟', '正镶白旗', '', '0', '2', 'ZXBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152530', '15', '25', '30', '正蓝旗', '内蒙古自治区', '锡林郭勒盟', '正蓝旗', '', '0', '2', 'ZLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152531', '15', '25', '31', '多伦县', '内蒙古自治区', '锡林郭勒盟', '多伦县', '', '0', '2', 'DLX', '0');
INSERT INTO `t_system_region_info` VALUES ('152900', '15', '29', '0', '阿拉善盟', '内蒙古自治区', '阿拉善盟', '', '', '0', '1', 'ALSM', '0');
INSERT INTO `t_system_region_info` VALUES ('152921', '15', '29', '21', '阿拉善左旗', '内蒙古自治区', '阿拉善盟', '阿拉善左旗', '', '0', '2', 'ALSZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152922', '15', '29', '22', '阿拉善右旗', '内蒙古自治区', '阿拉善盟', '阿拉善右旗', '', '0', '2', 'ALSYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('152923', '15', '29', '23', '额济纳旗', '内蒙古自治区', '阿拉善盟', '额济纳旗', '', '0', '2', 'EJNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210000', '21', '0', '0', '辽宁省', '辽宁省', '', '', '', '0', '0', 'LNS', '0');
INSERT INTO `t_system_region_info` VALUES ('210100', '21', '1', '0', '沈阳市', '辽宁省', '沈阳市', '', '', '0', '1', 'CYS', '0');
INSERT INTO `t_system_region_info` VALUES ('210101', '21', '1', '1', '市辖区', '辽宁省', '沈阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210102', '21', '1', '2', '和平区', '辽宁省', '沈阳市', '和平区', '', '0', '2', 'HPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210103', '21', '1', '3', '沈河区', '辽宁省', '沈阳市', '沈河区', '', '0', '2', 'CHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210104', '21', '1', '4', '大东区', '辽宁省', '沈阳市', '大东区', '', '0', '2', 'DDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210105', '21', '1', '5', '皇姑区', '辽宁省', '沈阳市', '皇姑区', '', '0', '2', 'HGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210106', '21', '1', '6', '铁西区', '辽宁省', '沈阳市', '铁西区', '', '0', '2', 'TXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210111', '21', '1', '11', '苏家屯区', '辽宁省', '沈阳市', '苏家屯区', '', '0', '2', 'SJTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210112', '21', '1', '12', '东陵区', '辽宁省', '沈阳市', '东陵区', '', '0', '2', 'DLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210113', '21', '1', '13', '沈北新区', '辽宁省', '沈阳市', '沈北新区', '', '0', '2', 'CBXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210114', '21', '1', '14', '于洪区', '辽宁省', '沈阳市', '于洪区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210122', '21', '1', '22', '辽中县', '辽宁省', '沈阳市', '辽中县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('210123', '21', '1', '23', '康平县', '辽宁省', '沈阳市', '康平县', '', '0', '2', 'KPX', '0');
INSERT INTO `t_system_region_info` VALUES ('210124', '21', '1', '24', '法库县', '辽宁省', '沈阳市', '法库县', '', '0', '2', 'FKX', '0');
INSERT INTO `t_system_region_info` VALUES ('210181', '21', '1', '81', '新民市', '辽宁省', '沈阳市', '新民市', '', '0', '2', 'XMS', '0');
INSERT INTO `t_system_region_info` VALUES ('210200', '21', '2', '0', '大连市', '辽宁省', '大连市', '', '', '0', '1', 'DLS', '0');
INSERT INTO `t_system_region_info` VALUES ('210201', '21', '2', '1', '市辖区', '辽宁省', '大连市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210202', '21', '2', '2', '中山区', '辽宁省', '大连市', '中山区', '', '0', '2', 'ZSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210203', '21', '2', '3', '西岗区', '辽宁省', '大连市', '西岗区', '', '0', '2', 'XGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210204', '21', '2', '4', '沙河口区', '辽宁省', '大连市', '沙河口区', '', '0', '2', 'SHKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210211', '21', '2', '11', '甘井子区', '辽宁省', '大连市', '甘井子区', '', '0', '2', 'GJZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210212', '21', '2', '12', '旅顺口区', '辽宁省', '大连市', '旅顺口区', '', '0', '2', 'LSKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210213', '21', '2', '13', '金州区', '辽宁省', '大连市', '金州区', '', '0', '2', 'JZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210224', '21', '2', '24', '长海县', '辽宁省', '大连市', '长海县', '', '0', '2', 'CHX', '0');
INSERT INTO `t_system_region_info` VALUES ('210281', '21', '2', '81', '瓦房店市', '辽宁省', '大连市', '瓦房店市', '', '0', '2', 'WFDS', '0');
INSERT INTO `t_system_region_info` VALUES ('210282', '21', '2', '82', '普兰店市', '辽宁省', '大连市', '普兰店市', '', '0', '2', 'PLDS', '0');
INSERT INTO `t_system_region_info` VALUES ('210283', '21', '2', '83', '庄河市', '辽宁省', '大连市', '庄河市', '', '0', '2', 'ZHS', '0');
INSERT INTO `t_system_region_info` VALUES ('210300', '21', '3', '0', '鞍山市', '辽宁省', '鞍山市', '', '', '0', '1', 'ASS', '0');
INSERT INTO `t_system_region_info` VALUES ('210301', '21', '3', '1', '市辖区', '辽宁省', '鞍山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210302', '21', '3', '2', '铁东区', '辽宁省', '鞍山市', '铁东区', '', '0', '2', 'TDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210303', '21', '3', '3', '铁西区', '辽宁省', '鞍山市', '铁西区', '', '0', '2', 'TXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210304', '21', '3', '4', '立山区', '辽宁省', '鞍山市', '立山区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210311', '21', '3', '11', '千山区', '辽宁省', '鞍山市', '千山区', '', '0', '2', 'QSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210321', '21', '3', '21', '台安县', '辽宁省', '鞍山市', '台安县', '', '0', '2', 'TAX', '0');
INSERT INTO `t_system_region_info` VALUES ('210323', '21', '3', '23', '岫岩满族自治县', '辽宁省', '鞍山市', '岫岩满族自治县', '', '0', '2', 'XYMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('210381', '21', '3', '81', '海城市', '辽宁省', '鞍山市', '海城市', '', '0', '2', 'HCS', '0');
INSERT INTO `t_system_region_info` VALUES ('210400', '21', '4', '0', '抚顺市', '辽宁省', '抚顺市', '', '', '0', '1', 'FSS', '0');
INSERT INTO `t_system_region_info` VALUES ('210401', '21', '4', '1', '市辖区', '辽宁省', '抚顺市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210402', '21', '4', '2', '新抚区', '辽宁省', '抚顺市', '新抚区', '', '0', '2', 'XFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210403', '21', '4', '3', '东洲区', '辽宁省', '抚顺市', '东洲区', '', '0', '2', 'DZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210404', '21', '4', '4', '望花区', '辽宁省', '抚顺市', '望花区', '', '0', '2', 'WHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210411', '21', '4', '11', '顺城区', '辽宁省', '抚顺市', '顺城区', '', '0', '2', 'SCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210421', '21', '4', '21', '抚顺县', '辽宁省', '抚顺市', '抚顺县', '', '0', '2', 'FSX', '0');
INSERT INTO `t_system_region_info` VALUES ('210422', '21', '4', '22', '新宾满族自治县', '辽宁省', '抚顺市', '新宾满族自治县', '', '0', '2', 'XBMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('210423', '21', '4', '23', '清原满族自治县', '辽宁省', '抚顺市', '清原满族自治县', '', '0', '2', 'QYMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('210500', '21', '5', '0', '本溪市', '辽宁省', '本溪市', '', '', '0', '1', 'BXS', '0');
INSERT INTO `t_system_region_info` VALUES ('210501', '21', '5', '1', '市辖区', '辽宁省', '本溪市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210502', '21', '5', '2', '平山区', '辽宁省', '本溪市', '平山区', '', '0', '2', 'PSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210503', '21', '5', '3', '溪湖区', '辽宁省', '本溪市', '溪湖区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210504', '21', '5', '4', '明山区', '辽宁省', '本溪市', '明山区', '', '0', '2', 'MSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210505', '21', '5', '5', '南芬区', '辽宁省', '本溪市', '南芬区', '', '0', '2', 'NFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210521', '21', '5', '21', '本溪满族自治县', '辽宁省', '本溪市', '本溪满族自治县', '', '0', '2', 'BXMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('210522', '21', '5', '22', '桓仁满族自治县', '辽宁省', '本溪市', '桓仁满族自治县', '', '0', '2', 'HRMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('210600', '21', '6', '0', '丹东市', '辽宁省', '丹东市', '', '', '0', '1', 'DDS', '0');
INSERT INTO `t_system_region_info` VALUES ('210601', '21', '6', '1', '市辖区', '辽宁省', '丹东市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210602', '21', '6', '2', '元宝区', '辽宁省', '丹东市', '元宝区', '', '0', '2', 'YBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210603', '21', '6', '3', '振兴区', '辽宁省', '丹东市', '振兴区', '', '0', '2', 'ZXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210604', '21', '6', '4', '振安区', '辽宁省', '丹东市', '振安区', '', '0', '2', 'ZAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210624', '21', '6', '24', '宽甸满族自治县', '辽宁省', '丹东市', '宽甸满族自治县', '', '0', '2', 'KDMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('210681', '21', '6', '81', '东港市', '辽宁省', '丹东市', '东港市', '', '0', '2', 'DGS', '0');
INSERT INTO `t_system_region_info` VALUES ('210682', '21', '6', '82', '凤城市', '辽宁省', '丹东市', '凤城市', '', '0', '2', 'FCS', '0');
INSERT INTO `t_system_region_info` VALUES ('210700', '21', '7', '0', '锦州市', '辽宁省', '锦州市', '', '', '0', '1', 'JZS', '0');
INSERT INTO `t_system_region_info` VALUES ('210701', '21', '7', '1', '市辖区', '辽宁省', '锦州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210702', '21', '7', '2', '古塔区', '辽宁省', '锦州市', '古塔区', '', '0', '2', 'GDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210703', '21', '7', '3', '凌河区', '辽宁省', '锦州市', '凌河区', '', '0', '2', 'LHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210711', '21', '7', '11', '太和区', '辽宁省', '锦州市', '太和区', '', '0', '2', 'THQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210726', '21', '7', '26', '黑山县', '辽宁省', '锦州市', '黑山县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('210727', '21', '7', '27', '义县', '辽宁省', '锦州市', '义县', '', '0', '2', 'YX', '0');
INSERT INTO `t_system_region_info` VALUES ('210781', '21', '7', '81', '凌海市', '辽宁省', '锦州市', '凌海市', '', '0', '2', 'LHS', '0');
INSERT INTO `t_system_region_info` VALUES ('210782', '21', '7', '82', '北镇市', '辽宁省', '锦州市', '北镇市', '', '0', '2', 'BZS', '0');
INSERT INTO `t_system_region_info` VALUES ('210800', '21', '8', '0', '营口市', '辽宁省', '营口市', '', '', '0', '1', 'YKS', '0');
INSERT INTO `t_system_region_info` VALUES ('210801', '21', '8', '1', '市辖区', '辽宁省', '营口市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210802', '21', '8', '2', '站前区', '辽宁省', '营口市', '站前区', '', '0', '2', 'ZQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210803', '21', '8', '3', '西市区', '辽宁省', '营口市', '西市区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210804', '21', '8', '4', '鲅鱼圈区', '辽宁省', '营口市', '鲅鱼圈区', '', '0', '2', 'BYJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210811', '21', '8', '11', '老边区', '辽宁省', '营口市', '老边区', '', '0', '2', 'LBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210881', '21', '8', '81', '盖州市', '辽宁省', '营口市', '盖州市', '', '0', '2', 'GZS', '0');
INSERT INTO `t_system_region_info` VALUES ('210882', '21', '8', '82', '大石桥市', '辽宁省', '营口市', '大石桥市', '', '0', '2', 'DSQS', '0');
INSERT INTO `t_system_region_info` VALUES ('210900', '21', '9', '0', '阜新市', '辽宁省', '阜新市', '', '', '0', '1', 'FXS', '0');
INSERT INTO `t_system_region_info` VALUES ('210901', '21', '9', '1', '市辖区', '辽宁省', '阜新市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210902', '21', '9', '2', '海州区', '辽宁省', '阜新市', '海州区', '', '0', '2', 'HZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210903', '21', '9', '3', '新邱区', '辽宁省', '阜新市', '新邱区', '', '0', '2', 'XQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210904', '21', '9', '4', '太平区', '辽宁省', '阜新市', '太平区', '', '0', '2', 'TPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210905', '21', '9', '5', '清河门区', '辽宁省', '阜新市', '清河门区', '', '0', '2', 'QHMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210911', '21', '9', '11', '细河区', '辽宁省', '阜新市', '细河区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('210921', '21', '9', '21', '阜新蒙古族自治县', '辽宁省', '阜新市', '阜新蒙古族自治县', '', '0', '2', 'FXMGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('210922', '21', '9', '22', '彰武县', '辽宁省', '阜新市', '彰武县', '', '0', '2', 'ZWX', '0');
INSERT INTO `t_system_region_info` VALUES ('211000', '21', '10', '0', '辽阳市', '辽宁省', '辽阳市', '', '', '0', '1', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('211001', '21', '10', '1', '市辖区', '辽宁省', '辽阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211002', '21', '10', '2', '白塔区', '辽宁省', '辽阳市', '白塔区', '', '0', '2', 'BDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211003', '21', '10', '3', '文圣区', '辽宁省', '辽阳市', '文圣区', '', '0', '2', 'WSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211004', '21', '10', '4', '宏伟区', '辽宁省', '辽阳市', '宏伟区', '', '0', '2', 'HWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211005', '21', '10', '5', '弓长岭区', '辽宁省', '辽阳市', '弓长岭区', '', '0', '2', 'GCLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211011', '21', '10', '11', '太子河区', '辽宁省', '辽阳市', '太子河区', '', '0', '2', 'TZHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211021', '21', '10', '21', '辽阳县', '辽宁省', '辽阳市', '辽阳县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('211081', '21', '10', '81', '灯塔市', '辽宁省', '辽阳市', '灯塔市', '', '0', '2', 'DDS', '0');
INSERT INTO `t_system_region_info` VALUES ('211100', '21', '11', '0', '盘锦市', '辽宁省', '盘锦市', '', '', '0', '1', 'PJS', '0');
INSERT INTO `t_system_region_info` VALUES ('211101', '21', '11', '1', '市辖区', '辽宁省', '盘锦市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211102', '21', '11', '2', '双台子区', '辽宁省', '盘锦市', '双台子区', '', '0', '2', 'STZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211103', '21', '11', '3', '兴隆台区', '辽宁省', '盘锦市', '兴隆台区', '', '0', '2', 'XLTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211121', '21', '11', '21', '大洼县', '辽宁省', '盘锦市', '大洼县', '', '0', '2', 'DWX', '0');
INSERT INTO `t_system_region_info` VALUES ('211122', '21', '11', '22', '盘山县', '辽宁省', '盘锦市', '盘山县', '', '0', '2', 'PSX', '0');
INSERT INTO `t_system_region_info` VALUES ('211200', '21', '12', '0', '铁岭市', '辽宁省', '铁岭市', '', '', '0', '1', 'TLS', '0');
INSERT INTO `t_system_region_info` VALUES ('211201', '21', '12', '1', '市辖区', '辽宁省', '铁岭市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211202', '21', '12', '2', '银州区', '辽宁省', '铁岭市', '银州区', '', '0', '2', 'YZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211204', '21', '12', '4', '清河区', '辽宁省', '铁岭市', '清河区', '', '0', '2', 'QHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211221', '21', '12', '21', '铁岭县', '辽宁省', '铁岭市', '铁岭县', '', '0', '2', 'TLX', '0');
INSERT INTO `t_system_region_info` VALUES ('211223', '21', '12', '23', '西丰县', '辽宁省', '铁岭市', '西丰县', '', '0', '2', 'XFX', '0');
INSERT INTO `t_system_region_info` VALUES ('211224', '21', '12', '24', '昌图县', '辽宁省', '铁岭市', '昌图县', '', '0', '2', 'CTX', '0');
INSERT INTO `t_system_region_info` VALUES ('211281', '21', '12', '81', '调兵山市', '辽宁省', '铁岭市', '调兵山市', '', '0', '2', 'DBSS', '0');
INSERT INTO `t_system_region_info` VALUES ('211282', '21', '12', '82', '开原市', '辽宁省', '铁岭市', '开原市', '', '0', '2', 'KYS', '0');
INSERT INTO `t_system_region_info` VALUES ('211300', '21', '13', '0', '朝阳市', '辽宁省', '朝阳市', '', '', '0', '1', 'CYS', '0');
INSERT INTO `t_system_region_info` VALUES ('211301', '21', '13', '1', '市辖区', '辽宁省', '朝阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211302', '21', '13', '2', '双塔区', '辽宁省', '朝阳市', '双塔区', '', '0', '2', 'SDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211303', '21', '13', '3', '龙城区', '辽宁省', '朝阳市', '龙城区', '', '0', '2', 'LCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211321', '21', '13', '21', '朝阳县', '辽宁省', '朝阳市', '朝阳县', '', '0', '2', 'CYX', '0');
INSERT INTO `t_system_region_info` VALUES ('211322', '21', '13', '22', '建平县', '辽宁省', '朝阳市', '建平县', '', '0', '2', 'JPX', '0');
INSERT INTO `t_system_region_info` VALUES ('211324', '21', '13', '24', '喀喇沁左翼蒙古族自治县', '辽宁省', '朝阳市', '喀喇沁左翼蒙古族自治县', '', '0', '2', 'KLQZYMGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('211381', '21', '13', '81', '北票市', '辽宁省', '朝阳市', '北票市', '', '0', '2', 'BPS', '0');
INSERT INTO `t_system_region_info` VALUES ('211382', '21', '13', '82', '凌源市', '辽宁省', '朝阳市', '凌源市', '', '0', '2', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('211400', '21', '14', '0', '葫芦岛市', '辽宁省', '葫芦岛市', '', '', '0', '1', 'HLDS', '0');
INSERT INTO `t_system_region_info` VALUES ('211401', '21', '14', '1', '市辖区', '辽宁省', '葫芦岛市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211402', '21', '14', '2', '连山区', '辽宁省', '葫芦岛市', '连山区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211403', '21', '14', '3', '龙港区', '辽宁省', '葫芦岛市', '龙港区', '', '0', '2', 'LGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211404', '21', '14', '4', '南票区', '辽宁省', '葫芦岛市', '南票区', '', '0', '2', 'NPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('211421', '21', '14', '21', '绥中县', '辽宁省', '葫芦岛市', '绥中县', '', '0', '2', 'SZX', '0');
INSERT INTO `t_system_region_info` VALUES ('211422', '21', '14', '22', '建昌县', '辽宁省', '葫芦岛市', '建昌县', '', '0', '2', 'JCX', '0');
INSERT INTO `t_system_region_info` VALUES ('211481', '21', '14', '81', '兴城市', '辽宁省', '葫芦岛市', '兴城市', '', '0', '2', 'XCS', '0');
INSERT INTO `t_system_region_info` VALUES ('220000', '22', '0', '0', '吉林省', '吉林省', '', '', '', '0', '0', 'JLS', '0');
INSERT INTO `t_system_region_info` VALUES ('220100', '22', '1', '0', '长春市', '吉林省', '长春市', '', '', '0', '1', 'CCS', '0');
INSERT INTO `t_system_region_info` VALUES ('220101', '22', '1', '1', '市辖区', '吉林省', '长春市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220102', '22', '1', '2', '南关区', '吉林省', '长春市', '南关区', '', '0', '2', 'NGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220103', '22', '1', '3', '宽城区', '吉林省', '长春市', '宽城区', '', '0', '2', 'KCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220104', '22', '1', '4', '朝阳区', '吉林省', '长春市', '朝阳区', '', '0', '2', 'CYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220105', '22', '1', '5', '二道区', '吉林省', '长春市', '二道区', '', '0', '2', 'EDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220106', '22', '1', '6', '绿园区', '吉林省', '长春市', '绿园区', '', '0', '2', 'LYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220112', '22', '1', '12', '双阳区', '吉林省', '长春市', '双阳区', '', '0', '2', 'SYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220122', '22', '1', '22', '农安县', '吉林省', '长春市', '农安县', '', '0', '2', 'NAX', '0');
INSERT INTO `t_system_region_info` VALUES ('220181', '22', '1', '81', '九台市', '吉林省', '长春市', '九台市', '', '0', '2', 'JTS', '0');
INSERT INTO `t_system_region_info` VALUES ('220182', '22', '1', '82', '榆树市', '吉林省', '长春市', '榆树市', '', '0', '2', 'YSS', '0');
INSERT INTO `t_system_region_info` VALUES ('220183', '22', '1', '83', '德惠市', '吉林省', '长春市', '德惠市', '', '0', '2', 'DHS', '0');
INSERT INTO `t_system_region_info` VALUES ('220200', '22', '2', '0', '吉林市', '吉林省', '吉林市', '', '', '0', '1', 'JLS', '0');
INSERT INTO `t_system_region_info` VALUES ('220201', '22', '2', '1', '市辖区', '吉林省', '吉林市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220202', '22', '2', '2', '昌邑区', '吉林省', '吉林市', '昌邑区', '', '0', '2', 'CYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220203', '22', '2', '3', '龙潭区', '吉林省', '吉林市', '龙潭区', '', '0', '2', 'LTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220204', '22', '2', '4', '船营区', '吉林省', '吉林市', '船营区', '', '0', '2', 'CYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220211', '22', '2', '11', '丰满区', '吉林省', '吉林市', '丰满区', '', '0', '2', 'FMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220221', '22', '2', '21', '永吉县', '吉林省', '吉林市', '永吉县', '', '0', '2', 'YJX', '0');
INSERT INTO `t_system_region_info` VALUES ('220281', '22', '2', '81', '蛟河市', '吉林省', '吉林市', '蛟河市', '', '0', '2', 'JHS', '0');
INSERT INTO `t_system_region_info` VALUES ('220282', '22', '2', '82', '桦甸市', '吉林省', '吉林市', '桦甸市', '', '0', '2', 'HDS', '0');
INSERT INTO `t_system_region_info` VALUES ('220283', '22', '2', '83', '舒兰市', '吉林省', '吉林市', '舒兰市', '', '0', '2', 'SLS', '0');
INSERT INTO `t_system_region_info` VALUES ('220284', '22', '2', '84', '磐石市', '吉林省', '吉林市', '磐石市', '', '0', '2', 'PSS', '0');
INSERT INTO `t_system_region_info` VALUES ('220300', '22', '3', '0', '四平市', '吉林省', '四平市', '', '', '0', '1', 'SPS', '0');
INSERT INTO `t_system_region_info` VALUES ('220301', '22', '3', '1', '市辖区', '吉林省', '四平市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220302', '22', '3', '2', '铁西区', '吉林省', '四平市', '铁西区', '', '0', '2', 'TXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220303', '22', '3', '3', '铁东区', '吉林省', '四平市', '铁东区', '', '0', '2', 'TDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220322', '22', '3', '22', '梨树县', '吉林省', '四平市', '梨树县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('220323', '22', '3', '23', '伊通满族自治县', '吉林省', '四平市', '伊通满族自治县', '', '0', '2', 'YTMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('220381', '22', '3', '81', '公主岭市', '吉林省', '四平市', '公主岭市', '', '0', '2', 'GZLS', '0');
INSERT INTO `t_system_region_info` VALUES ('220382', '22', '3', '82', '双辽市', '吉林省', '四平市', '双辽市', '', '0', '2', 'SLS', '0');
INSERT INTO `t_system_region_info` VALUES ('220400', '22', '4', '0', '辽源市', '吉林省', '辽源市', '', '', '0', '1', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('220401', '22', '4', '1', '市辖区', '吉林省', '辽源市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220402', '22', '4', '2', '龙山区', '吉林省', '辽源市', '龙山区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220403', '22', '4', '3', '西安区', '吉林省', '辽源市', '西安区', '', '0', '2', 'XAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220421', '22', '4', '21', '东丰县', '吉林省', '辽源市', '东丰县', '', '0', '2', 'DFX', '0');
INSERT INTO `t_system_region_info` VALUES ('220422', '22', '4', '22', '东辽县', '吉林省', '辽源市', '东辽县', '', '0', '2', 'DLX', '0');
INSERT INTO `t_system_region_info` VALUES ('220500', '22', '5', '0', '通化市', '吉林省', '通化市', '', '', '0', '1', 'THS', '0');
INSERT INTO `t_system_region_info` VALUES ('220501', '22', '5', '1', '市辖区', '吉林省', '通化市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220502', '22', '5', '2', '东昌区', '吉林省', '通化市', '东昌区', '', '0', '2', 'DCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220503', '22', '5', '3', '二道江区', '吉林省', '通化市', '二道江区', '', '0', '2', 'EDJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220521', '22', '5', '21', '通化县', '吉林省', '通化市', '通化县', '', '0', '2', 'THX', '0');
INSERT INTO `t_system_region_info` VALUES ('220523', '22', '5', '23', '辉南县', '吉林省', '通化市', '辉南县', '', '0', '2', 'HNX', '0');
INSERT INTO `t_system_region_info` VALUES ('220524', '22', '5', '24', '柳河县', '吉林省', '通化市', '柳河县', '', '0', '2', 'LHX', '0');
INSERT INTO `t_system_region_info` VALUES ('220581', '22', '5', '81', '梅河口市', '吉林省', '通化市', '梅河口市', '', '0', '2', 'MHKS', '0');
INSERT INTO `t_system_region_info` VALUES ('220582', '22', '5', '82', '集安市', '吉林省', '通化市', '集安市', '', '0', '2', 'JAS', '0');
INSERT INTO `t_system_region_info` VALUES ('220600', '22', '6', '0', '白山市', '吉林省', '白山市', '', '', '0', '1', 'BSS', '0');
INSERT INTO `t_system_region_info` VALUES ('220601', '22', '6', '1', '市辖区', '吉林省', '白山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220602', '22', '6', '2', '八道江区', '吉林省', '白山市', '八道江区', '', '0', '2', 'BDJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220605', '22', '6', '5', '江源区', '吉林省', '白山市', '江源区', '', '0', '2', 'JYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220621', '22', '6', '21', '抚松县', '吉林省', '白山市', '抚松县', '', '0', '2', 'FSX', '0');
INSERT INTO `t_system_region_info` VALUES ('220622', '22', '6', '22', '靖宇县', '吉林省', '白山市', '靖宇县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('220623', '22', '6', '23', '长白朝鲜族自治县', '吉林省', '白山市', '长白朝鲜族自治县', '', '0', '2', 'CBCXZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('220681', '22', '6', '81', '临江市', '吉林省', '白山市', '临江市', '', '0', '2', 'LJS', '0');
INSERT INTO `t_system_region_info` VALUES ('220700', '22', '7', '0', '松原市', '吉林省', '松原市', '', '', '0', '1', 'SYS', '0');
INSERT INTO `t_system_region_info` VALUES ('220701', '22', '7', '1', '市辖区', '吉林省', '松原市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220702', '22', '7', '2', '宁江区', '吉林省', '松原市', '宁江区', '', '0', '2', 'NJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220721', '22', '7', '21', '前郭尔罗斯蒙古族自治县', '吉林省', '松原市', '前郭尔罗斯蒙古族自治县', '', '0', '2', 'QGELSMGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('220722', '22', '7', '22', '长岭县', '吉林省', '松原市', '长岭县', '', '0', '2', 'CLX', '0');
INSERT INTO `t_system_region_info` VALUES ('220723', '22', '7', '23', '乾安县', '吉林省', '松原市', '乾安县', '', '0', '2', 'GAX', '0');
INSERT INTO `t_system_region_info` VALUES ('220724', '22', '7', '24', '扶余县', '吉林省', '松原市', '扶余县', '', '0', '2', 'FYX', '0');
INSERT INTO `t_system_region_info` VALUES ('220800', '22', '8', '0', '白城市', '吉林省', '白城市', '', '', '0', '1', 'BCS', '0');
INSERT INTO `t_system_region_info` VALUES ('220801', '22', '8', '1', '市辖区', '吉林省', '白城市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220802', '22', '8', '2', '洮北区', '吉林省', '白城市', '洮北区', '', '0', '2', 'TBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('220821', '22', '8', '21', '镇赉县', '吉林省', '白城市', '镇赉县', '', '0', '2', 'ZLX', '0');
INSERT INTO `t_system_region_info` VALUES ('220822', '22', '8', '22', '通榆县', '吉林省', '白城市', '通榆县', '', '0', '2', 'TYX', '0');
INSERT INTO `t_system_region_info` VALUES ('220881', '22', '8', '81', '洮南市', '吉林省', '白城市', '洮南市', '', '0', '2', 'TNS', '0');
INSERT INTO `t_system_region_info` VALUES ('220882', '22', '8', '82', '大安市', '吉林省', '白城市', '大安市', '', '0', '2', 'DAS', '0');
INSERT INTO `t_system_region_info` VALUES ('222400', '22', '24', '0', '延边朝鲜族自治州', '吉林省', '延边朝鲜族自治州', '', '', '0', '1', 'YBCXZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('222401', '22', '24', '1', '延吉市', '吉林省', '延边朝鲜族自治州', '延吉市', '', '0', '2', 'YJS', '0');
INSERT INTO `t_system_region_info` VALUES ('222402', '22', '24', '2', '图们市', '吉林省', '延边朝鲜族自治州', '图们市', '', '0', '2', 'TMS', '0');
INSERT INTO `t_system_region_info` VALUES ('222403', '22', '24', '3', '敦化市', '吉林省', '延边朝鲜族自治州', '敦化市', '', '0', '2', 'DHS', '0');
INSERT INTO `t_system_region_info` VALUES ('222404', '22', '24', '4', '珲春市', '吉林省', '延边朝鲜族自治州', '珲春市', '', '0', '2', 'HCS', '0');
INSERT INTO `t_system_region_info` VALUES ('222405', '22', '24', '5', '龙井市', '吉林省', '延边朝鲜族自治州', '龙井市', '', '0', '2', 'LJS', '0');
INSERT INTO `t_system_region_info` VALUES ('222406', '22', '24', '6', '和龙市', '吉林省', '延边朝鲜族自治州', '和龙市', '', '0', '2', 'HLS', '0');
INSERT INTO `t_system_region_info` VALUES ('222424', '22', '24', '24', '汪清县', '吉林省', '延边朝鲜族自治州', '汪清县', '', '0', '2', 'WQX', '0');
INSERT INTO `t_system_region_info` VALUES ('222426', '22', '24', '26', '安图县', '吉林省', '延边朝鲜族自治州', '安图县', '', '0', '2', 'ATX', '0');
INSERT INTO `t_system_region_info` VALUES ('230000', '23', '0', '0', '黑龙江省', '黑龙江省', '', '', '', '0', '0', 'HLJS', '0');
INSERT INTO `t_system_region_info` VALUES ('230100', '23', '1', '0', '哈尔滨市', '黑龙江省', '哈尔滨市', '', '', '0', '1', 'HEBS', '0');
INSERT INTO `t_system_region_info` VALUES ('230101', '23', '1', '1', '市辖区', '黑龙江省', '哈尔滨市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230102', '23', '1', '2', '道里区', '黑龙江省', '哈尔滨市', '道里区', '', '0', '2', 'DLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230103', '23', '1', '3', '南岗区', '黑龙江省', '哈尔滨市', '南岗区', '', '0', '2', 'NGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230104', '23', '1', '4', '道外区', '黑龙江省', '哈尔滨市', '道外区', '', '0', '2', 'DWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230108', '23', '1', '8', '平房区', '黑龙江省', '哈尔滨市', '平房区', '', '0', '2', 'PFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230109', '23', '1', '9', '松北区', '黑龙江省', '哈尔滨市', '松北区', '', '0', '2', 'SBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230110', '23', '1', '10', '香坊区', '黑龙江省', '哈尔滨市', '香坊区', '', '0', '2', 'XFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230111', '23', '1', '11', '呼兰区', '黑龙江省', '哈尔滨市', '呼兰区', '', '0', '2', 'HLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230112', '23', '1', '12', '阿城区', '黑龙江省', '哈尔滨市', '阿城区', '', '0', '2', 'ACQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230123', '23', '1', '23', '依兰县', '黑龙江省', '哈尔滨市', '依兰县', '', '0', '2', 'YLX', '0');
INSERT INTO `t_system_region_info` VALUES ('230124', '23', '1', '24', '方正县', '黑龙江省', '哈尔滨市', '方正县', '', '0', '2', 'FZX', '0');
INSERT INTO `t_system_region_info` VALUES ('230125', '23', '1', '25', '宾县', '黑龙江省', '哈尔滨市', '宾县', '', '0', '2', 'BX', '0');
INSERT INTO `t_system_region_info` VALUES ('230126', '23', '1', '26', '巴彦县', '黑龙江省', '哈尔滨市', '巴彦县', '', '0', '2', 'BYX', '0');
INSERT INTO `t_system_region_info` VALUES ('230127', '23', '1', '27', '木兰县', '黑龙江省', '哈尔滨市', '木兰县', '', '0', '2', 'MLX', '0');
INSERT INTO `t_system_region_info` VALUES ('230128', '23', '1', '28', '通河县', '黑龙江省', '哈尔滨市', '通河县', '', '0', '2', 'THX', '0');
INSERT INTO `t_system_region_info` VALUES ('230129', '23', '1', '29', '延寿县', '黑龙江省', '哈尔滨市', '延寿县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('230182', '23', '1', '82', '双城市', '黑龙江省', '哈尔滨市', '双城市', '', '0', '2', 'SCS', '0');
INSERT INTO `t_system_region_info` VALUES ('230183', '23', '1', '83', '尚志市', '黑龙江省', '哈尔滨市', '尚志市', '', '0', '2', 'SZS', '0');
INSERT INTO `t_system_region_info` VALUES ('230184', '23', '1', '84', '五常市', '黑龙江省', '哈尔滨市', '五常市', '', '0', '2', 'WCS', '0');
INSERT INTO `t_system_region_info` VALUES ('230200', '23', '2', '0', '齐齐哈尔市', '黑龙江省', '齐齐哈尔市', '', '', '0', '1', 'JJHES', '0');
INSERT INTO `t_system_region_info` VALUES ('230201', '23', '2', '1', '市辖区', '黑龙江省', '齐齐哈尔市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230202', '23', '2', '2', '龙沙区', '黑龙江省', '齐齐哈尔市', '龙沙区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230203', '23', '2', '3', '建华区', '黑龙江省', '齐齐哈尔市', '建华区', '', '0', '2', 'JHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230204', '23', '2', '4', '铁锋区', '黑龙江省', '齐齐哈尔市', '铁锋区', '', '0', '2', 'TFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230205', '23', '2', '5', '昂昂溪区', '黑龙江省', '齐齐哈尔市', '昂昂溪区', '', '0', '2', 'AAXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230206', '23', '2', '6', '富拉尔基区', '黑龙江省', '齐齐哈尔市', '富拉尔基区', '', '0', '2', 'FLEJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230207', '23', '2', '7', '碾子山区', '黑龙江省', '齐齐哈尔市', '碾子山区', '', '0', '2', 'NZSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230208', '23', '2', '8', '梅里斯达斡尔族区', '黑龙江省', '齐齐哈尔市', '梅里斯达斡尔族区', '', '0', '2', 'MLSDWEZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230221', '23', '2', '21', '龙江县', '黑龙江省', '齐齐哈尔市', '龙江县', '', '0', '2', 'LJX', '0');
INSERT INTO `t_system_region_info` VALUES ('230223', '23', '2', '23', '依安县', '黑龙江省', '齐齐哈尔市', '依安县', '', '0', '2', 'YAX', '0');
INSERT INTO `t_system_region_info` VALUES ('230224', '23', '2', '24', '泰来县', '黑龙江省', '齐齐哈尔市', '泰来县', '', '0', '2', 'TLX', '0');
INSERT INTO `t_system_region_info` VALUES ('230225', '23', '2', '25', '甘南县', '黑龙江省', '齐齐哈尔市', '甘南县', '', '0', '2', 'GNX', '0');
INSERT INTO `t_system_region_info` VALUES ('230227', '23', '2', '27', '富裕县', '黑龙江省', '齐齐哈尔市', '富裕县', '', '0', '2', 'FYX', '0');
INSERT INTO `t_system_region_info` VALUES ('230229', '23', '2', '29', '克山县', '黑龙江省', '齐齐哈尔市', '克山县', '', '0', '2', 'KSX', '0');
INSERT INTO `t_system_region_info` VALUES ('230230', '23', '2', '30', '克东县', '黑龙江省', '齐齐哈尔市', '克东县', '', '0', '2', 'KDX', '0');
INSERT INTO `t_system_region_info` VALUES ('230231', '23', '2', '31', '拜泉县', '黑龙江省', '齐齐哈尔市', '拜泉县', '', '0', '2', 'BQX', '0');
INSERT INTO `t_system_region_info` VALUES ('230281', '23', '2', '81', '讷河市', '黑龙江省', '齐齐哈尔市', '讷河市', '', '0', '2', 'NHS', '0');
INSERT INTO `t_system_region_info` VALUES ('230300', '23', '3', '0', '鸡西市', '黑龙江省', '鸡西市', '', '', '0', '1', 'JXS', '0');
INSERT INTO `t_system_region_info` VALUES ('230301', '23', '3', '1', '市辖区', '黑龙江省', '鸡西市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230302', '23', '3', '2', '鸡冠区', '黑龙江省', '鸡西市', '鸡冠区', '', '0', '2', 'JGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230303', '23', '3', '3', '恒山区', '黑龙江省', '鸡西市', '恒山区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230304', '23', '3', '4', '滴道区', '黑龙江省', '鸡西市', '滴道区', '', '0', '2', 'DDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230305', '23', '3', '5', '梨树区', '黑龙江省', '鸡西市', '梨树区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230306', '23', '3', '6', '城子河区', '黑龙江省', '鸡西市', '城子河区', '', '0', '2', 'CZHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230307', '23', '3', '7', '麻山区', '黑龙江省', '鸡西市', '麻山区', '', '0', '2', 'MSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230321', '23', '3', '21', '鸡东县', '黑龙江省', '鸡西市', '鸡东县', '', '0', '2', 'JDX', '0');
INSERT INTO `t_system_region_info` VALUES ('230381', '23', '3', '81', '虎林市', '黑龙江省', '鸡西市', '虎林市', '', '0', '2', 'HLS', '0');
INSERT INTO `t_system_region_info` VALUES ('230382', '23', '3', '82', '密山市', '黑龙江省', '鸡西市', '密山市', '', '0', '2', 'MSS', '0');
INSERT INTO `t_system_region_info` VALUES ('230400', '23', '4', '0', '鹤岗市', '黑龙江省', '鹤岗市', '', '', '0', '1', 'HGS', '0');
INSERT INTO `t_system_region_info` VALUES ('230401', '23', '4', '1', '市辖区', '黑龙江省', '鹤岗市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230402', '23', '4', '2', '向阳区', '黑龙江省', '鹤岗市', '向阳区', '', '0', '2', 'XYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230403', '23', '4', '3', '工农区', '黑龙江省', '鹤岗市', '工农区', '', '0', '2', 'GNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230404', '23', '4', '4', '南山区', '黑龙江省', '鹤岗市', '南山区', '', '0', '2', 'NSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230405', '23', '4', '5', '兴安区', '黑龙江省', '鹤岗市', '兴安区', '', '0', '2', 'XAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230406', '23', '4', '6', '东山区', '黑龙江省', '鹤岗市', '东山区', '', '0', '2', 'DSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230407', '23', '4', '7', '兴山区', '黑龙江省', '鹤岗市', '兴山区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230421', '23', '4', '21', '萝北县', '黑龙江省', '鹤岗市', '萝北县', '', '0', '2', 'LBX', '0');
INSERT INTO `t_system_region_info` VALUES ('230422', '23', '4', '22', '绥滨县', '黑龙江省', '鹤岗市', '绥滨县', '', '0', '2', 'SBX', '0');
INSERT INTO `t_system_region_info` VALUES ('230500', '23', '5', '0', '双鸭山市', '黑龙江省', '双鸭山市', '', '', '0', '1', 'SYSS', '0');
INSERT INTO `t_system_region_info` VALUES ('230501', '23', '5', '1', '市辖区', '黑龙江省', '双鸭山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230502', '23', '5', '2', '尖山区', '黑龙江省', '双鸭山市', '尖山区', '', '0', '2', 'JSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230503', '23', '5', '3', '岭东区', '黑龙江省', '双鸭山市', '岭东区', '', '0', '2', 'LDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230505', '23', '5', '5', '四方台区', '黑龙江省', '双鸭山市', '四方台区', '', '0', '2', 'SFTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230506', '23', '5', '6', '宝山区', '黑龙江省', '双鸭山市', '宝山区', '', '0', '2', 'BSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230521', '23', '5', '21', '集贤县', '黑龙江省', '双鸭山市', '集贤县', '', '0', '2', 'JXX', '0');
INSERT INTO `t_system_region_info` VALUES ('230522', '23', '5', '22', '友谊县', '黑龙江省', '双鸭山市', '友谊县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('230523', '23', '5', '23', '宝清县', '黑龙江省', '双鸭山市', '宝清县', '', '0', '2', 'BQX', '0');
INSERT INTO `t_system_region_info` VALUES ('230524', '23', '5', '24', '饶河县', '黑龙江省', '双鸭山市', '饶河县', '', '0', '2', 'RHX', '0');
INSERT INTO `t_system_region_info` VALUES ('230600', '23', '6', '0', '大庆市', '黑龙江省', '大庆市', '', '', '0', '1', 'DQS', '0');
INSERT INTO `t_system_region_info` VALUES ('230601', '23', '6', '1', '市辖区', '黑龙江省', '大庆市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230602', '23', '6', '2', '萨尔图区', '黑龙江省', '大庆市', '萨尔图区', '', '0', '2', 'SETQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230603', '23', '6', '3', '龙凤区', '黑龙江省', '大庆市', '龙凤区', '', '0', '2', 'LFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230604', '23', '6', '4', '让胡路区', '黑龙江省', '大庆市', '让胡路区', '', '0', '2', 'RHLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230605', '23', '6', '5', '红岗区', '黑龙江省', '大庆市', '红岗区', '', '0', '2', 'GGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230606', '23', '6', '6', '大同区', '黑龙江省', '大庆市', '大同区', '', '0', '2', 'DTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230621', '23', '6', '21', '肇州县', '黑龙江省', '大庆市', '肇州县', '', '0', '2', 'ZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('230622', '23', '6', '22', '肇源县', '黑龙江省', '大庆市', '肇源县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('230623', '23', '6', '23', '林甸县', '黑龙江省', '大庆市', '林甸县', '', '0', '2', 'LDX', '0');
INSERT INTO `t_system_region_info` VALUES ('230624', '23', '6', '24', '杜尔伯特蒙古族自治县', '黑龙江省', '大庆市', '杜尔伯特蒙古族自治县', '', '0', '2', 'DEBTMGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('230700', '23', '7', '0', '伊春市', '黑龙江省', '伊春市', '', '', '0', '1', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('230701', '23', '7', '1', '市辖区', '黑龙江省', '伊春市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230702', '23', '7', '2', '伊春区', '黑龙江省', '伊春市', '伊春区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230703', '23', '7', '3', '南岔区', '黑龙江省', '伊春市', '南岔区', '', '0', '2', 'NCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230704', '23', '7', '4', '友好区', '黑龙江省', '伊春市', '友好区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230705', '23', '7', '5', '西林区', '黑龙江省', '伊春市', '西林区', '', '0', '2', 'XLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230706', '23', '7', '6', '翠峦区', '黑龙江省', '伊春市', '翠峦区', '', '0', '2', 'CLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230707', '23', '7', '7', '新青区', '黑龙江省', '伊春市', '新青区', '', '0', '2', 'XQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230708', '23', '7', '8', '美溪区', '黑龙江省', '伊春市', '美溪区', '', '0', '2', 'MXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230709', '23', '7', '9', '金山屯区', '黑龙江省', '伊春市', '金山屯区', '', '0', '2', 'JSTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230710', '23', '7', '10', '五营区', '黑龙江省', '伊春市', '五营区', '', '0', '2', 'WYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230711', '23', '7', '11', '乌马河区', '黑龙江省', '伊春市', '乌马河区', '', '0', '2', 'WMHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230712', '23', '7', '12', '汤旺河区', '黑龙江省', '伊春市', '汤旺河区', '', '0', '2', 'SWHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230713', '23', '7', '13', '带岭区', '黑龙江省', '伊春市', '带岭区', '', '0', '2', 'DLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230714', '23', '7', '14', '乌伊岭区', '黑龙江省', '伊春市', '乌伊岭区', '', '0', '2', 'WYLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230715', '23', '7', '15', '红星区', '黑龙江省', '伊春市', '红星区', '', '0', '2', 'GXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230716', '23', '7', '16', '上甘岭区', '黑龙江省', '伊春市', '上甘岭区', '', '0', '2', 'SGLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230722', '23', '7', '22', '嘉荫县', '黑龙江省', '伊春市', '嘉荫县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('230781', '23', '7', '81', '铁力市', '黑龙江省', '伊春市', '铁力市', '', '0', '2', 'TLS', '0');
INSERT INTO `t_system_region_info` VALUES ('230800', '23', '8', '0', '佳木斯市', '黑龙江省', '佳木斯市', '', '', '0', '1', 'JMSS', '0');
INSERT INTO `t_system_region_info` VALUES ('230801', '23', '8', '1', '市辖区', '黑龙江省', '佳木斯市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230803', '23', '8', '3', '向阳区', '黑龙江省', '佳木斯市', '向阳区', '', '0', '2', 'XYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230804', '23', '8', '4', '前进区', '黑龙江省', '佳木斯市', '前进区', '', '0', '2', 'QJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230805', '23', '8', '5', '东风区', '黑龙江省', '佳木斯市', '东风区', '', '0', '2', 'DFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230811', '23', '8', '11', '郊区', '黑龙江省', '佳木斯市', '郊区', '', '0', '2', 'JQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230822', '23', '8', '22', '桦南县', '黑龙江省', '佳木斯市', '桦南县', '', '0', '2', 'HNX', '0');
INSERT INTO `t_system_region_info` VALUES ('230826', '23', '8', '26', '桦川县', '黑龙江省', '佳木斯市', '桦川县', '', '0', '2', 'HCX', '0');
INSERT INTO `t_system_region_info` VALUES ('230828', '23', '8', '28', '汤原县', '黑龙江省', '佳木斯市', '汤原县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('230833', '23', '8', '33', '抚远县', '黑龙江省', '佳木斯市', '抚远县', '', '0', '2', 'FYX', '0');
INSERT INTO `t_system_region_info` VALUES ('230881', '23', '8', '81', '同江市', '黑龙江省', '佳木斯市', '同江市', '', '0', '2', 'TJS', '0');
INSERT INTO `t_system_region_info` VALUES ('230882', '23', '8', '82', '富锦市', '黑龙江省', '佳木斯市', '富锦市', '', '0', '2', 'FJS', '0');
INSERT INTO `t_system_region_info` VALUES ('230900', '23', '9', '0', '七台河市', '黑龙江省', '七台河市', '', '', '0', '1', 'QTHS', '0');
INSERT INTO `t_system_region_info` VALUES ('230901', '23', '9', '1', '市辖区', '黑龙江省', '七台河市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230902', '23', '9', '2', '新兴区', '黑龙江省', '七台河市', '新兴区', '', '0', '2', 'XXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230903', '23', '9', '3', '桃山区', '黑龙江省', '七台河市', '桃山区', '', '0', '2', 'TSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230904', '23', '9', '4', '茄子河区', '黑龙江省', '七台河市', '茄子河区', '', '0', '2', 'JZHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('230921', '23', '9', '21', '勃利县', '黑龙江省', '七台河市', '勃利县', '', '0', '2', 'BLX', '0');
INSERT INTO `t_system_region_info` VALUES ('231000', '23', '10', '0', '牡丹江市', '黑龙江省', '牡丹江市', '', '', '0', '1', 'MDJS', '0');
INSERT INTO `t_system_region_info` VALUES ('231001', '23', '10', '1', '市辖区', '黑龙江省', '牡丹江市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('231002', '23', '10', '2', '东安区', '黑龙江省', '牡丹江市', '东安区', '', '0', '2', 'DAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('231003', '23', '10', '3', '阳明区', '黑龙江省', '牡丹江市', '阳明区', '', '0', '2', 'YMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('231004', '23', '10', '4', '爱民区', '黑龙江省', '牡丹江市', '爱民区', '', '0', '2', 'AMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('231005', '23', '10', '5', '西安区', '黑龙江省', '牡丹江市', '西安区', '', '0', '2', 'XAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('231024', '23', '10', '24', '东宁县', '黑龙江省', '牡丹江市', '东宁县', '', '0', '2', 'DNX', '0');
INSERT INTO `t_system_region_info` VALUES ('231025', '23', '10', '25', '林口县', '黑龙江省', '牡丹江市', '林口县', '', '0', '2', 'LKX', '0');
INSERT INTO `t_system_region_info` VALUES ('231081', '23', '10', '81', '绥芬河市', '黑龙江省', '牡丹江市', '绥芬河市', '', '0', '2', 'SFHS', '0');
INSERT INTO `t_system_region_info` VALUES ('231083', '23', '10', '83', '海林市', '黑龙江省', '牡丹江市', '海林市', '', '0', '2', 'HLS', '0');
INSERT INTO `t_system_region_info` VALUES ('231084', '23', '10', '84', '宁安市', '黑龙江省', '牡丹江市', '宁安市', '', '0', '2', 'NAS', '0');
INSERT INTO `t_system_region_info` VALUES ('231085', '23', '10', '85', '穆棱市', '黑龙江省', '牡丹江市', '穆棱市', '', '0', '2', 'MLS', '0');
INSERT INTO `t_system_region_info` VALUES ('231100', '23', '11', '0', '黑河市', '黑龙江省', '黑河市', '', '', '0', '1', 'HHS', '0');
INSERT INTO `t_system_region_info` VALUES ('231101', '23', '11', '1', '市辖区', '黑龙江省', '黑河市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('231102', '23', '11', '2', '爱辉区', '黑龙江省', '黑河市', '爱辉区', '', '0', '2', 'AHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('231121', '23', '11', '21', '嫩江县', '黑龙江省', '黑河市', '嫩江县', '', '0', '2', 'NJX', '0');
INSERT INTO `t_system_region_info` VALUES ('231123', '23', '11', '23', '逊克县', '黑龙江省', '黑河市', '逊克县', '', '0', '2', 'XKX', '0');
INSERT INTO `t_system_region_info` VALUES ('231124', '23', '11', '24', '孙吴县', '黑龙江省', '黑河市', '孙吴县', '', '0', '2', 'SWX', '0');
INSERT INTO `t_system_region_info` VALUES ('231181', '23', '11', '81', '北安市', '黑龙江省', '黑河市', '北安市', '', '0', '2', 'BAS', '0');
INSERT INTO `t_system_region_info` VALUES ('231182', '23', '11', '82', '五大连池市', '黑龙江省', '黑河市', '五大连池市', '', '0', '2', 'WDLCS', '0');
INSERT INTO `t_system_region_info` VALUES ('231200', '23', '12', '0', '绥化市', '黑龙江省', '绥化市', '', '', '0', '1', 'SHS', '0');
INSERT INTO `t_system_region_info` VALUES ('231201', '23', '12', '1', '市辖区', '黑龙江省', '绥化市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('231202', '23', '12', '2', '北林区', '黑龙江省', '绥化市', '北林区', '', '0', '2', 'BLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('231221', '23', '12', '21', '望奎县', '黑龙江省', '绥化市', '望奎县', '', '0', '2', 'WKX', '0');
INSERT INTO `t_system_region_info` VALUES ('231222', '23', '12', '22', '兰西县', '黑龙江省', '绥化市', '兰西县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('231223', '23', '12', '23', '青冈县', '黑龙江省', '绥化市', '青冈县', '', '0', '2', 'QGX', '0');
INSERT INTO `t_system_region_info` VALUES ('231224', '23', '12', '24', '庆安县', '黑龙江省', '绥化市', '庆安县', '', '0', '2', 'QAX', '0');
INSERT INTO `t_system_region_info` VALUES ('231225', '23', '12', '25', '明水县', '黑龙江省', '绥化市', '明水县', '', '0', '2', 'MSX', '0');
INSERT INTO `t_system_region_info` VALUES ('231226', '23', '12', '26', '绥棱县', '黑龙江省', '绥化市', '绥棱县', '', '0', '2', 'SLX', '0');
INSERT INTO `t_system_region_info` VALUES ('231281', '23', '12', '81', '安达市', '黑龙江省', '绥化市', '安达市', '', '0', '2', 'ADS', '0');
INSERT INTO `t_system_region_info` VALUES ('231282', '23', '12', '82', '肇东市', '黑龙江省', '绥化市', '肇东市', '', '0', '2', 'ZDS', '0');
INSERT INTO `t_system_region_info` VALUES ('231283', '23', '12', '83', '海伦市', '黑龙江省', '绥化市', '海伦市', '', '0', '2', 'HLS', '0');
INSERT INTO `t_system_region_info` VALUES ('232700', '23', '27', '0', '大兴安岭地区', '黑龙江省', '大兴安岭地区', '', '', '0', '1', 'DXALDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('232721', '23', '27', '21', '呼玛县', '黑龙江省', '大兴安岭地区', '呼玛县', '', '0', '2', 'HMX', '0');
INSERT INTO `t_system_region_info` VALUES ('232722', '23', '27', '22', '塔河县', '黑龙江省', '大兴安岭地区', '塔河县', '', '0', '2', 'DHX', '0');
INSERT INTO `t_system_region_info` VALUES ('232723', '23', '27', '23', '漠河县', '黑龙江省', '大兴安岭地区', '漠河县', '', '0', '2', 'MHX', '0');
INSERT INTO `t_system_region_info` VALUES ('310000', '31', '0', '0', '上海市', '上海市', '', '', '', '0', '0', 'SHS', '0');
INSERT INTO `t_system_region_info` VALUES ('310100', '31', '1', '0', '上海市', '上海市', '上海市', '', '', '0', '1', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310101', '31', '1', '1', '黄浦区', '上海市', '市辖区', '黄浦区', '', '0', '2', 'HPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310104', '31', '1', '4', '徐汇区', '上海市', '市辖区', '徐汇区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310105', '31', '1', '5', '长宁区', '上海市', '市辖区', '长宁区', '', '0', '2', 'CNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310106', '31', '1', '6', '静安区', '上海市', '市辖区', '静安区', '', '0', '2', 'JAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310107', '31', '1', '7', '普陀区', '上海市', '市辖区', '普陀区', '', '0', '2', 'PTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310108', '31', '1', '8', '闸北区', '上海市', '市辖区', '闸北区', '', '0', '2', 'ZBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310109', '31', '1', '9', '虹口区', '上海市', '市辖区', '虹口区', '', '0', '2', 'HKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310110', '31', '1', '10', '杨浦区', '上海市', '市辖区', '杨浦区', '', '0', '2', 'YPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310112', '31', '1', '12', '闵行区', '上海市', '市辖区', '闵行区', '', '0', '2', 'MHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310113', '31', '1', '13', '宝山区', '上海市', '市辖区', '宝山区', '', '0', '2', 'BSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310114', '31', '1', '14', '嘉定区', '上海市', '市辖区', '嘉定区', '', '0', '2', 'JDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310115', '31', '1', '15', '浦东新区', '上海市', '市辖区', '浦东新区', '', '0', '2', 'PDXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310116', '31', '1', '16', '金山区', '上海市', '市辖区', '金山区', '', '0', '2', 'JSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310117', '31', '1', '17', '松江区', '上海市', '市辖区', '松江区', '', '0', '2', 'SJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310118', '31', '1', '18', '青浦区', '上海市', '市辖区', '青浦区', '', '0', '2', 'QPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310120', '31', '1', '20', '奉贤区', '上海市', '市辖区', '奉贤区', '', '0', '2', 'FXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('310200', '31', '2', '0', '县', '上海市', '县', '', '', '0', '2', 'X', '0');
INSERT INTO `t_system_region_info` VALUES ('310230', '31', '2', '30', '崇明县', '上海市', '县', '崇明县', '', '0', '2', 'CMX', '0');
INSERT INTO `t_system_region_info` VALUES ('320000', '32', '0', '0', '江苏省', '江苏省', '', '', '', '0', '0', 'JSS', '0');
INSERT INTO `t_system_region_info` VALUES ('320100', '32', '1', '0', '南京市', '江苏省', '南京市', '', '', '0', '1', 'NJS', '0');
INSERT INTO `t_system_region_info` VALUES ('320101', '32', '1', '1', '市辖区', '江苏省', '南京市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320102', '32', '1', '2', '玄武区', '江苏省', '南京市', '玄武区', '', '0', '2', 'XWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320103', '32', '1', '3', '白下区', '江苏省', '南京市', '白下区', '', '0', '2', 'BXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320104', '32', '1', '4', '秦淮区', '江苏省', '南京市', '秦淮区', '', '0', '2', 'QHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320105', '32', '1', '5', '建邺区', '江苏省', '南京市', '建邺区', '', '0', '2', 'JYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320106', '32', '1', '6', '鼓楼区', '江苏省', '南京市', '鼓楼区', '', '0', '2', 'GLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320107', '32', '1', '7', '下关区', '江苏省', '南京市', '下关区', '', '0', '2', 'XGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320111', '32', '1', '11', '浦口区', '江苏省', '南京市', '浦口区', '', '0', '2', 'PKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320113', '32', '1', '13', '栖霞区', '江苏省', '南京市', '栖霞区', '', '0', '2', 'QXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320114', '32', '1', '14', '雨花台区', '江苏省', '南京市', '雨花台区', '', '0', '2', 'YHTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320115', '32', '1', '15', '江宁区', '江苏省', '南京市', '江宁区', '', '0', '2', 'JNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320116', '32', '1', '16', '六合区', '江苏省', '南京市', '六合区', '', '0', '2', 'LGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320124', '32', '1', '24', '溧水县', '江苏省', '南京市', '溧水县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('320125', '32', '1', '25', '高淳县', '江苏省', '南京市', '高淳县', '', '0', '2', 'GCX', '0');
INSERT INTO `t_system_region_info` VALUES ('320200', '32', '2', '0', '无锡市', '江苏省', '无锡市', '', '', '0', '1', 'MXS', '0');
INSERT INTO `t_system_region_info` VALUES ('320201', '32', '2', '1', '市辖区', '江苏省', '无锡市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320202', '32', '2', '2', '崇安区', '江苏省', '无锡市', '崇安区', '', '0', '2', 'CAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320203', '32', '2', '3', '南长区', '江苏省', '无锡市', '南长区', '', '0', '2', 'NCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320204', '32', '2', '4', '北塘区', '江苏省', '无锡市', '北塘区', '', '0', '2', 'BTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320205', '32', '2', '5', '锡山区', '江苏省', '无锡市', '锡山区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320206', '32', '2', '6', '惠山区', '江苏省', '无锡市', '惠山区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320211', '32', '2', '11', '滨湖区', '江苏省', '无锡市', '滨湖区', '', '0', '2', 'BHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320281', '32', '2', '81', '江阴市', '江苏省', '无锡市', '江阴市', '', '0', '2', 'JYS', '0');
INSERT INTO `t_system_region_info` VALUES ('320282', '32', '2', '82', '宜兴市', '江苏省', '无锡市', '宜兴市', '', '0', '2', 'YXS', '0');
INSERT INTO `t_system_region_info` VALUES ('320300', '32', '3', '0', '徐州市', '江苏省', '徐州市', '', '', '0', '1', 'XZS', '0');
INSERT INTO `t_system_region_info` VALUES ('320301', '32', '3', '1', '市辖区', '江苏省', '徐州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320302', '32', '3', '2', '鼓楼区', '江苏省', '徐州市', '鼓楼区', '', '0', '2', 'GLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320303', '32', '3', '3', '云龙区', '江苏省', '徐州市', '云龙区', '', '0', '2', 'YLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320305', '32', '3', '5', '贾汪区', '江苏省', '徐州市', '贾汪区', '', '0', '2', 'GWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320311', '32', '3', '11', '泉山区', '江苏省', '徐州市', '泉山区', '', '0', '2', 'QSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320312', '32', '3', '12', '铜山区', '江苏省', '徐州市', '铜山区', '', '0', '2', 'TSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320321', '32', '3', '21', '丰县', '江苏省', '徐州市', '丰县', '', '0', '2', 'FX', '0');
INSERT INTO `t_system_region_info` VALUES ('320322', '32', '3', '22', '沛县', '江苏省', '徐州市', '沛县', '', '0', '2', 'PX', '0');
INSERT INTO `t_system_region_info` VALUES ('320324', '32', '3', '24', '睢宁县', '江苏省', '徐州市', '睢宁县', '', '0', '2', 'SNX', '0');
INSERT INTO `t_system_region_info` VALUES ('320381', '32', '3', '81', '新沂市', '江苏省', '徐州市', '新沂市', '', '0', '2', 'XYS', '0');
INSERT INTO `t_system_region_info` VALUES ('320382', '32', '3', '82', '邳州市', '江苏省', '徐州市', '邳州市', '', '0', '2', 'PZS', '0');
INSERT INTO `t_system_region_info` VALUES ('320400', '32', '4', '0', '常州市', '江苏省', '常州市', '', '', '0', '1', 'CZS', '0');
INSERT INTO `t_system_region_info` VALUES ('320401', '32', '4', '1', '市辖区', '江苏省', '常州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320402', '32', '4', '2', '天宁区', '江苏省', '常州市', '天宁区', '', '0', '2', 'TNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320404', '32', '4', '4', '钟楼区', '江苏省', '常州市', '钟楼区', '', '0', '2', 'ZLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320405', '32', '4', '5', '戚墅堰区', '江苏省', '常州市', '戚墅堰区', '', '0', '2', 'QSYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320411', '32', '4', '11', '新北区', '江苏省', '常州市', '新北区', '', '0', '2', 'XBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320412', '32', '4', '12', '武进区', '江苏省', '常州市', '武进区', '', '0', '2', 'WJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320481', '32', '4', '81', '溧阳市', '江苏省', '常州市', '溧阳市', '', '0', '2', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('320482', '32', '4', '82', '金坛市', '江苏省', '常州市', '金坛市', '', '0', '2', 'JTS', '0');
INSERT INTO `t_system_region_info` VALUES ('320500', '32', '5', '0', '苏州市', '江苏省', '苏州市', '', '', '0', '1', 'SZS', '0');
INSERT INTO `t_system_region_info` VALUES ('320501', '32', '5', '1', '市辖区', '江苏省', '苏州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320502', '32', '5', '2', '沧浪区', '江苏省', '苏州市', '沧浪区', '', '0', '2', 'CLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320503', '32', '5', '3', '平江区', '江苏省', '苏州市', '平江区', '', '0', '2', 'PJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320504', '32', '5', '4', '金阊区', '江苏省', '苏州市', '金阊区', '', '0', '2', 'JCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320505', '32', '5', '5', '虎丘区', '江苏省', '苏州市', '虎丘区', '', '0', '2', 'HQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320506', '32', '5', '6', '吴中区', '江苏省', '苏州市', '吴中区', '', '0', '2', 'WZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320507', '32', '5', '7', '相城区', '江苏省', '苏州市', '相城区', '', '0', '2', 'XCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320581', '32', '5', '81', '常熟市', '江苏省', '苏州市', '常熟市', '', '0', '2', 'CSS', '0');
INSERT INTO `t_system_region_info` VALUES ('320582', '32', '5', '82', '张家港市', '江苏省', '苏州市', '张家港市', '', '0', '2', 'ZJGS', '0');
INSERT INTO `t_system_region_info` VALUES ('320583', '32', '5', '83', '昆山市', '江苏省', '苏州市', '昆山市', '', '0', '1', 'KSS', '0');
INSERT INTO `t_system_region_info` VALUES ('320584', '32', '5', '84', '吴江市', '江苏省', '苏州市', '吴江市', '', '0', '2', 'WJS', '0');
INSERT INTO `t_system_region_info` VALUES ('320585', '32', '5', '85', '太仓市', '江苏省', '苏州市', '太仓市', '', '0', '2', 'TCS', '0');
INSERT INTO `t_system_region_info` VALUES ('320600', '32', '6', '0', '南通市', '江苏省', '南通市', '', '', '0', '1', 'NTS', '0');
INSERT INTO `t_system_region_info` VALUES ('320601', '32', '6', '1', '市辖区', '江苏省', '南通市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320602', '32', '6', '2', '崇川区', '江苏省', '南通市', '崇川区', '', '0', '2', 'CCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320611', '32', '6', '11', '港闸区', '江苏省', '南通市', '港闸区', '', '0', '2', 'GZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320612', '32', '6', '12', '通州区', '江苏省', '南通市', '通州区', '', '0', '2', 'TZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320621', '32', '6', '21', '海安县', '江苏省', '南通市', '海安县', '', '0', '2', 'HAX', '0');
INSERT INTO `t_system_region_info` VALUES ('320623', '32', '6', '23', '如东县', '江苏省', '南通市', '如东县', '', '0', '2', 'RDX', '0');
INSERT INTO `t_system_region_info` VALUES ('320681', '32', '6', '81', '启东市', '江苏省', '南通市', '启东市', '', '0', '2', 'QDS', '0');
INSERT INTO `t_system_region_info` VALUES ('320682', '32', '6', '82', '如皋市', '江苏省', '南通市', '如皋市', '', '0', '2', 'RGS', '0');
INSERT INTO `t_system_region_info` VALUES ('320684', '32', '6', '84', '海门市', '江苏省', '南通市', '海门市', '', '0', '2', 'HMS', '0');
INSERT INTO `t_system_region_info` VALUES ('320700', '32', '7', '0', '连云港市', '江苏省', '连云港市', '', '', '0', '1', 'LYGS', '0');
INSERT INTO `t_system_region_info` VALUES ('320701', '32', '7', '1', '市辖区', '江苏省', '连云港市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320703', '32', '7', '3', '连云区', '江苏省', '连云港市', '连云区', '', '0', '2', 'LYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320705', '32', '7', '5', '新浦区', '江苏省', '连云港市', '新浦区', '', '0', '2', 'XPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320706', '32', '7', '6', '海州区', '江苏省', '连云港市', '海州区', '', '0', '2', 'HZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320721', '32', '7', '21', '赣榆县', '江苏省', '连云港市', '赣榆县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('320722', '32', '7', '22', '东海县', '江苏省', '连云港市', '东海县', '', '0', '2', 'DHX', '0');
INSERT INTO `t_system_region_info` VALUES ('320723', '32', '7', '23', '灌云县', '江苏省', '连云港市', '灌云县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('320724', '32', '7', '24', '灌南县', '江苏省', '连云港市', '灌南县', '', '0', '2', 'GNX', '0');
INSERT INTO `t_system_region_info` VALUES ('320800', '32', '8', '0', '淮安市', '江苏省', '淮安市', '', '', '0', '1', 'HAS', '0');
INSERT INTO `t_system_region_info` VALUES ('320801', '32', '8', '1', '市辖区', '江苏省', '淮安市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320802', '32', '8', '2', '清河区', '江苏省', '淮安市', '清河区', '', '0', '2', 'QHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320803', '32', '8', '3', '楚州区', '江苏省', '淮安市', '楚州区', '', '0', '2', 'CZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320804', '32', '8', '4', '淮阴区', '江苏省', '淮安市', '淮阴区', '', '0', '2', 'HYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320811', '32', '8', '11', '清浦区', '江苏省', '淮安市', '清浦区', '', '0', '2', 'QPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320826', '32', '8', '26', '涟水县', '江苏省', '淮安市', '涟水县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('320829', '32', '8', '29', '洪泽县', '江苏省', '淮安市', '洪泽县', '', '0', '2', 'HZX', '0');
INSERT INTO `t_system_region_info` VALUES ('320830', '32', '8', '30', '盱眙县', '江苏省', '淮安市', '盱眙县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('320831', '32', '8', '31', '金湖县', '江苏省', '淮安市', '金湖县', '', '0', '2', 'JHX', '0');
INSERT INTO `t_system_region_info` VALUES ('320900', '32', '9', '0', '盐城市', '江苏省', '盐城市', '', '', '0', '1', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('320901', '32', '9', '1', '市辖区', '江苏省', '盐城市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320902', '32', '9', '2', '亭湖区', '江苏省', '盐城市', '亭湖区', '', '0', '2', 'THQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320903', '32', '9', '3', '盐都区', '江苏省', '盐城市', '盐都区', '', '0', '2', 'YDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('320921', '32', '9', '21', '响水县', '江苏省', '盐城市', '响水县', '', '0', '2', 'XSX', '0');
INSERT INTO `t_system_region_info` VALUES ('320922', '32', '9', '22', '滨海县', '江苏省', '盐城市', '滨海县', '', '0', '2', 'BHX', '0');
INSERT INTO `t_system_region_info` VALUES ('320923', '32', '9', '23', '阜宁县', '江苏省', '盐城市', '阜宁县', '', '0', '2', 'FNX', '0');
INSERT INTO `t_system_region_info` VALUES ('320924', '32', '9', '24', '射阳县', '江苏省', '盐城市', '射阳县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('320925', '32', '9', '25', '建湖县', '江苏省', '盐城市', '建湖县', '', '0', '2', 'JHX', '0');
INSERT INTO `t_system_region_info` VALUES ('320981', '32', '9', '81', '东台市', '江苏省', '盐城市', '东台市', '', '0', '2', 'DTS', '0');
INSERT INTO `t_system_region_info` VALUES ('320982', '32', '9', '82', '大丰市', '江苏省', '盐城市', '大丰市', '', '0', '2', 'DFS', '0');
INSERT INTO `t_system_region_info` VALUES ('321000', '32', '10', '0', '扬州市', '江苏省', '扬州市', '', '', '0', '1', 'YZS', '0');
INSERT INTO `t_system_region_info` VALUES ('321001', '32', '10', '1', '市辖区', '江苏省', '扬州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321002', '32', '10', '2', '广陵区', '江苏省', '扬州市', '广陵区', '', '0', '2', 'ALQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321003', '32', '10', '3', '邗江区', '江苏省', '扬州市', '邗江区', '', '0', '2', 'HJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321012', '32', '10', '12', '江都区', '江苏省', '扬州市', '江都区', '', '0', '2', 'JDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321023', '32', '10', '23', '宝应县', '江苏省', '扬州市', '宝应县', '', '0', '2', 'BYX', '0');
INSERT INTO `t_system_region_info` VALUES ('321081', '32', '10', '81', '仪征市', '江苏省', '扬州市', '仪征市', '', '0', '2', 'YZS', '0');
INSERT INTO `t_system_region_info` VALUES ('321084', '32', '10', '84', '高邮市', '江苏省', '扬州市', '高邮市', '', '0', '2', 'GYS', '0');
INSERT INTO `t_system_region_info` VALUES ('321100', '32', '11', '0', '镇江市', '江苏省', '镇江市', '', '', '0', '1', 'ZJS', '0');
INSERT INTO `t_system_region_info` VALUES ('321101', '32', '11', '1', '市辖区', '江苏省', '镇江市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321102', '32', '11', '2', '京口区', '江苏省', '镇江市', '京口区', '', '0', '2', 'JKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321111', '32', '11', '11', '润州区', '江苏省', '镇江市', '润州区', '', '0', '2', 'RZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321112', '32', '11', '12', '丹徒区', '江苏省', '镇江市', '丹徒区', '', '0', '2', 'DTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321181', '32', '11', '81', '丹阳市', '江苏省', '镇江市', '丹阳市', '', '0', '2', 'DYS', '0');
INSERT INTO `t_system_region_info` VALUES ('321182', '32', '11', '82', '扬中市', '江苏省', '镇江市', '扬中市', '', '0', '2', 'YZS', '0');
INSERT INTO `t_system_region_info` VALUES ('321183', '32', '11', '83', '句容市', '江苏省', '镇江市', '句容市', '', '0', '2', 'GRS', '0');
INSERT INTO `t_system_region_info` VALUES ('321200', '32', '12', '0', '泰州市', '江苏省', '泰州市', '', '', '0', '1', 'TZS', '0');
INSERT INTO `t_system_region_info` VALUES ('321201', '32', '12', '1', '市辖区', '江苏省', '泰州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321202', '32', '12', '2', '海陵区', '江苏省', '泰州市', '海陵区', '', '0', '2', 'HLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321203', '32', '12', '3', '高港区', '江苏省', '泰州市', '高港区', '', '0', '2', 'GGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321281', '32', '12', '81', '兴化市', '江苏省', '泰州市', '兴化市', '', '0', '2', 'XHS', '0');
INSERT INTO `t_system_region_info` VALUES ('321282', '32', '12', '82', '靖江市', '江苏省', '泰州市', '靖江市', '', '0', '2', 'JJS', '0');
INSERT INTO `t_system_region_info` VALUES ('321283', '32', '12', '83', '泰兴市', '江苏省', '泰州市', '泰兴市', '', '0', '2', 'TXS', '0');
INSERT INTO `t_system_region_info` VALUES ('321284', '32', '12', '84', '姜堰市', '江苏省', '泰州市', '姜堰市', '', '0', '2', 'JYS', '0');
INSERT INTO `t_system_region_info` VALUES ('321300', '32', '13', '0', '宿迁市', '江苏省', '宿迁市', '', '', '0', '1', 'SQS', '0');
INSERT INTO `t_system_region_info` VALUES ('321301', '32', '13', '1', '市辖区', '江苏省', '宿迁市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321302', '32', '13', '2', '宿城区', '江苏省', '宿迁市', '宿城区', '', '0', '2', 'SCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321311', '32', '13', '11', '宿豫区', '江苏省', '宿迁市', '宿豫区', '', '0', '2', 'SYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('321322', '32', '13', '22', '沭阳县', '江苏省', '宿迁市', '沭阳县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('321323', '32', '13', '23', '泗阳县', '江苏省', '宿迁市', '泗阳县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('321324', '32', '13', '24', '泗洪县', '江苏省', '宿迁市', '泗洪县', '', '0', '2', 'SHX', '0');
INSERT INTO `t_system_region_info` VALUES ('330000', '33', '0', '0', '浙江省', '浙江省', '', '', '', '0', '0', 'ZJS', '0');
INSERT INTO `t_system_region_info` VALUES ('330100', '33', '1', '0', '杭州市', '浙江省', '杭州市', '', '', '0', '1', 'HZS', '0');
INSERT INTO `t_system_region_info` VALUES ('330101', '33', '1', '1', '市辖区', '浙江省', '杭州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330102', '33', '1', '2', '上城区', '浙江省', '杭州市', '上城区', '', '0', '2', 'SCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330103', '33', '1', '3', '下城区', '浙江省', '杭州市', '下城区', '', '0', '2', 'XCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330104', '33', '1', '4', '江干区', '浙江省', '杭州市', '江干区', '', '0', '2', 'JGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330105', '33', '1', '5', '拱墅区', '浙江省', '杭州市', '拱墅区', '', '0', '2', 'GSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330106', '33', '1', '6', '西湖区', '浙江省', '杭州市', '西湖区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330108', '33', '1', '8', '滨江区', '浙江省', '杭州市', '滨江区', '', '0', '2', 'BJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330109', '33', '1', '9', '萧山区', '浙江省', '杭州市', '萧山区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330110', '33', '1', '10', '余杭区', '浙江省', '杭州市', '余杭区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330122', '33', '1', '22', '桐庐县', '浙江省', '杭州市', '桐庐县', '', '0', '2', 'TLX', '0');
INSERT INTO `t_system_region_info` VALUES ('330127', '33', '1', '27', '淳安县', '浙江省', '杭州市', '淳安县', '', '0', '2', 'CAX', '0');
INSERT INTO `t_system_region_info` VALUES ('330182', '33', '1', '82', '建德市', '浙江省', '杭州市', '建德市', '', '0', '2', 'JDS', '0');
INSERT INTO `t_system_region_info` VALUES ('330183', '33', '1', '83', '富阳市', '浙江省', '杭州市', '富阳市', '', '0', '2', 'FYS', '0');
INSERT INTO `t_system_region_info` VALUES ('330185', '33', '1', '85', '临安市', '浙江省', '杭州市', '临安市', '', '0', '2', 'LAS', '0');
INSERT INTO `t_system_region_info` VALUES ('330200', '33', '2', '0', '宁波市', '浙江省', '宁波市', '', '', '0', '1', 'NBS', '0');
INSERT INTO `t_system_region_info` VALUES ('330201', '33', '2', '1', '市辖区', '浙江省', '宁波市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330203', '33', '2', '3', '海曙区', '浙江省', '宁波市', '海曙区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330204', '33', '2', '4', '江东区', '浙江省', '宁波市', '江东区', '', '0', '2', 'JDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330205', '33', '2', '5', '江北区', '浙江省', '宁波市', '江北区', '', '0', '2', 'JBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330206', '33', '2', '6', '北仑区', '浙江省', '宁波市', '北仑区', '', '0', '2', 'BLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330211', '33', '2', '11', '镇海区', '浙江省', '宁波市', '镇海区', '', '0', '2', 'ZHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330212', '33', '2', '12', '鄞州区', '浙江省', '宁波市', '鄞州区', '', '0', '2', 'YZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330225', '33', '2', '25', '象山县', '浙江省', '宁波市', '象山县', '', '0', '2', 'XSX', '0');
INSERT INTO `t_system_region_info` VALUES ('330226', '33', '2', '26', '宁海县', '浙江省', '宁波市', '宁海县', '', '0', '2', 'NHX', '0');
INSERT INTO `t_system_region_info` VALUES ('330281', '33', '2', '81', '余姚市', '浙江省', '宁波市', '余姚市', '', '0', '2', 'YYS', '0');
INSERT INTO `t_system_region_info` VALUES ('330282', '33', '2', '82', '慈溪市', '浙江省', '宁波市', '慈溪市', '', '0', '2', 'CXS', '0');
INSERT INTO `t_system_region_info` VALUES ('330283', '33', '2', '83', '奉化市', '浙江省', '宁波市', '奉化市', '', '0', '2', 'FHS', '0');
INSERT INTO `t_system_region_info` VALUES ('330300', '33', '3', '0', '温州市', '浙江省', '温州市', '', '', '0', '1', 'WZS', '0');
INSERT INTO `t_system_region_info` VALUES ('330301', '33', '3', '1', '市辖区', '浙江省', '温州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330302', '33', '3', '2', '鹿城区', '浙江省', '温州市', '鹿城区', '', '0', '2', 'LCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330303', '33', '3', '3', '龙湾区', '浙江省', '温州市', '龙湾区', '', '0', '2', 'LWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330304', '33', '3', '4', '瓯海区', '浙江省', '温州市', '瓯海区', '', '0', '2', 'OHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330322', '33', '3', '22', '洞头县', '浙江省', '温州市', '洞头县', '', '0', '2', 'DTX', '0');
INSERT INTO `t_system_region_info` VALUES ('330324', '33', '3', '24', '永嘉县', '浙江省', '温州市', '永嘉县', '', '0', '2', 'YJX', '0');
INSERT INTO `t_system_region_info` VALUES ('330326', '33', '3', '26', '平阳县', '浙江省', '温州市', '平阳县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('330327', '33', '3', '27', '苍南县', '浙江省', '温州市', '苍南县', '', '0', '2', 'CNX', '0');
INSERT INTO `t_system_region_info` VALUES ('330328', '33', '3', '28', '文成县', '浙江省', '温州市', '文成县', '', '0', '2', 'WCX', '0');
INSERT INTO `t_system_region_info` VALUES ('330329', '33', '3', '29', '泰顺县', '浙江省', '温州市', '泰顺县', '', '0', '2', 'TSX', '0');
INSERT INTO `t_system_region_info` VALUES ('330381', '33', '3', '81', '瑞安市', '浙江省', '温州市', '瑞安市', '', '0', '2', 'RAS', '0');
INSERT INTO `t_system_region_info` VALUES ('330382', '33', '3', '82', '乐清市', '浙江省', '温州市', '乐清市', '', '0', '2', 'LQS', '0');
INSERT INTO `t_system_region_info` VALUES ('330400', '33', '4', '0', '嘉兴市', '浙江省', '嘉兴市', '', '', '0', '1', 'JXS', '0');
INSERT INTO `t_system_region_info` VALUES ('330401', '33', '4', '1', '市辖区', '浙江省', '嘉兴市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330402', '33', '4', '2', '南湖区', '浙江省', '嘉兴市', '南湖区', '', '0', '2', 'NHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330411', '33', '4', '11', '秀洲区', '浙江省', '嘉兴市', '秀洲区', '', '0', '2', 'XZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330421', '33', '4', '21', '嘉善县', '浙江省', '嘉兴市', '嘉善县', '', '0', '2', 'JSX', '0');
INSERT INTO `t_system_region_info` VALUES ('330424', '33', '4', '24', '海盐县', '浙江省', '嘉兴市', '海盐县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('330481', '33', '4', '81', '海宁市', '浙江省', '嘉兴市', '海宁市', '', '0', '2', 'HNS', '0');
INSERT INTO `t_system_region_info` VALUES ('330482', '33', '4', '82', '平湖市', '浙江省', '嘉兴市', '平湖市', '', '0', '2', 'PHS', '0');
INSERT INTO `t_system_region_info` VALUES ('330483', '33', '4', '83', '桐乡市', '浙江省', '嘉兴市', '桐乡市', '', '0', '2', 'TXS', '0');
INSERT INTO `t_system_region_info` VALUES ('330500', '33', '5', '0', '湖州市', '浙江省', '湖州市', '', '', '0', '1', 'HZS', '0');
INSERT INTO `t_system_region_info` VALUES ('330501', '33', '5', '1', '市辖区', '浙江省', '湖州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330502', '33', '5', '2', '吴兴区', '浙江省', '湖州市', '吴兴区', '', '0', '2', 'WXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330503', '33', '5', '3', '南浔区', '浙江省', '湖州市', '南浔区', '', '0', '2', 'NXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330521', '33', '5', '21', '德清县', '浙江省', '湖州市', '德清县', '', '0', '2', 'DQX', '0');
INSERT INTO `t_system_region_info` VALUES ('330522', '33', '5', '22', '长兴县', '浙江省', '湖州市', '长兴县', '', '0', '2', 'CXX', '0');
INSERT INTO `t_system_region_info` VALUES ('330523', '33', '5', '23', '安吉县', '浙江省', '湖州市', '安吉县', '', '0', '2', 'AJX', '0');
INSERT INTO `t_system_region_info` VALUES ('330600', '33', '6', '0', '绍兴市', '浙江省', '绍兴市', '', '', '0', '1', 'SXS', '0');
INSERT INTO `t_system_region_info` VALUES ('330601', '33', '6', '1', '市辖区', '浙江省', '绍兴市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330602', '33', '6', '2', '越城区', '浙江省', '绍兴市', '越城区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330621', '33', '6', '21', '绍兴县', '浙江省', '绍兴市', '绍兴县', '', '0', '2', 'SXX', '0');
INSERT INTO `t_system_region_info` VALUES ('330624', '33', '6', '24', '新昌县', '浙江省', '绍兴市', '新昌县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('330681', '33', '6', '81', '诸暨市', '浙江省', '绍兴市', '诸暨市', '', '0', '2', 'ZJS', '0');
INSERT INTO `t_system_region_info` VALUES ('330682', '33', '6', '82', '上虞市', '浙江省', '绍兴市', '上虞市', '', '0', '2', 'SYS', '0');
INSERT INTO `t_system_region_info` VALUES ('330683', '33', '6', '83', '嵊州市', '浙江省', '绍兴市', '嵊州市', '', '0', '2', 'SZS', '0');
INSERT INTO `t_system_region_info` VALUES ('330700', '33', '7', '0', '金华市', '浙江省', '金华市', '', '', '0', '1', 'JHS', '0');
INSERT INTO `t_system_region_info` VALUES ('330701', '33', '7', '1', '市辖区', '浙江省', '金华市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330702', '33', '7', '2', '婺城区', '浙江省', '金华市', '婺城区', '', '0', '2', 'WCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330703', '33', '7', '3', '金东区', '浙江省', '金华市', '金东区', '', '0', '2', 'JDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330723', '33', '7', '23', '武义县', '浙江省', '金华市', '武义县', '', '0', '2', 'WYX', '0');
INSERT INTO `t_system_region_info` VALUES ('330726', '33', '7', '26', '浦江县', '浙江省', '金华市', '浦江县', '', '0', '2', 'PJX', '0');
INSERT INTO `t_system_region_info` VALUES ('330727', '33', '7', '27', '磐安县', '浙江省', '金华市', '磐安县', '', '0', '2', 'PAX', '0');
INSERT INTO `t_system_region_info` VALUES ('330781', '33', '7', '81', '兰溪市', '浙江省', '金华市', '兰溪市', '', '0', '2', 'LXS', '0');
INSERT INTO `t_system_region_info` VALUES ('330782', '33', '7', '82', '义乌市', '浙江省', '金华市', '义乌市', '', '0', '2', 'YWS', '0');
INSERT INTO `t_system_region_info` VALUES ('330783', '33', '7', '83', '东阳市', '浙江省', '金华市', '东阳市', '', '0', '2', 'DYS', '0');
INSERT INTO `t_system_region_info` VALUES ('330784', '33', '7', '84', '永康市', '浙江省', '金华市', '永康市', '', '0', '2', 'YKS', '0');
INSERT INTO `t_system_region_info` VALUES ('330800', '33', '8', '0', '衢州市', '浙江省', '衢州市', '', '', '0', '1', 'QZS', '0');
INSERT INTO `t_system_region_info` VALUES ('330801', '33', '8', '1', '市辖区', '浙江省', '衢州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330802', '33', '8', '2', '柯城区', '浙江省', '衢州市', '柯城区', '', '0', '2', 'KCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330803', '33', '8', '3', '衢江区', '浙江省', '衢州市', '衢江区', '', '0', '2', 'QJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330822', '33', '8', '22', '常山县', '浙江省', '衢州市', '常山县', '', '0', '2', 'CSX', '0');
INSERT INTO `t_system_region_info` VALUES ('330824', '33', '8', '24', '开化县', '浙江省', '衢州市', '开化县', '', '0', '2', 'KHX', '0');
INSERT INTO `t_system_region_info` VALUES ('330825', '33', '8', '25', '龙游县', '浙江省', '衢州市', '龙游县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('330881', '33', '8', '81', '江山市', '浙江省', '衢州市', '江山市', '', '0', '2', 'JSS', '0');
INSERT INTO `t_system_region_info` VALUES ('330900', '33', '9', '0', '舟山市', '浙江省', '舟山市', '', '', '0', '1', 'ZSS', '0');
INSERT INTO `t_system_region_info` VALUES ('330901', '33', '9', '1', '市辖区', '浙江省', '舟山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330902', '33', '9', '2', '定海区', '浙江省', '舟山市', '定海区', '', '0', '2', 'DHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330903', '33', '9', '3', '普陀区', '浙江省', '舟山市', '普陀区', '', '0', '2', 'PTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('330921', '33', '9', '21', '岱山县', '浙江省', '舟山市', '岱山县', '', '0', '2', 'DSX', '0');
INSERT INTO `t_system_region_info` VALUES ('330922', '33', '9', '22', '嵊泗县', '浙江省', '舟山市', '嵊泗县', '', '0', '2', 'SSX', '0');
INSERT INTO `t_system_region_info` VALUES ('331000', '33', '10', '0', '台州市', '浙江省', '台州市', '', '', '0', '1', 'TZS', '0');
INSERT INTO `t_system_region_info` VALUES ('331001', '33', '10', '1', '市辖区', '浙江省', '台州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('331002', '33', '10', '2', '椒江区', '浙江省', '台州市', '椒江区', '', '0', '2', 'JJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('331003', '33', '10', '3', '黄岩区', '浙江省', '台州市', '黄岩区', '', '0', '2', 'HYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('331004', '33', '10', '4', '路桥区', '浙江省', '台州市', '路桥区', '', '0', '2', 'LQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('331021', '33', '10', '21', '玉环县', '浙江省', '台州市', '玉环县', '', '0', '2', 'YHX', '0');
INSERT INTO `t_system_region_info` VALUES ('331022', '33', '10', '22', '三门县', '浙江省', '台州市', '三门县', '', '0', '2', 'SMX', '0');
INSERT INTO `t_system_region_info` VALUES ('331023', '33', '10', '23', '天台县', '浙江省', '台州市', '天台县', '', '0', '2', 'TTX', '0');
INSERT INTO `t_system_region_info` VALUES ('331024', '33', '10', '24', '仙居县', '浙江省', '台州市', '仙居县', '', '0', '2', 'XJX', '0');
INSERT INTO `t_system_region_info` VALUES ('331081', '33', '10', '81', '温岭市', '浙江省', '台州市', '温岭市', '', '0', '2', 'WLS', '0');
INSERT INTO `t_system_region_info` VALUES ('331082', '33', '10', '82', '临海市', '浙江省', '台州市', '临海市', '', '0', '2', 'LHS', '0');
INSERT INTO `t_system_region_info` VALUES ('331100', '33', '11', '0', '丽水市', '浙江省', '丽水市', '', '', '0', '1', 'LSS', '0');
INSERT INTO `t_system_region_info` VALUES ('331101', '33', '11', '1', '市辖区', '浙江省', '丽水市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('331102', '33', '11', '2', '莲都区', '浙江省', '丽水市', '莲都区', '', '0', '2', 'LDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('331121', '33', '11', '21', '青田县', '浙江省', '丽水市', '青田县', '', '0', '2', 'QTX', '0');
INSERT INTO `t_system_region_info` VALUES ('331122', '33', '11', '22', '缙云县', '浙江省', '丽水市', '缙云县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('331123', '33', '11', '23', '遂昌县', '浙江省', '丽水市', '遂昌县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('331124', '33', '11', '24', '松阳县', '浙江省', '丽水市', '松阳县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('331125', '33', '11', '25', '云和县', '浙江省', '丽水市', '云和县', '', '0', '2', 'YHX', '0');
INSERT INTO `t_system_region_info` VALUES ('331126', '33', '11', '26', '庆元县', '浙江省', '丽水市', '庆元县', '', '0', '2', 'QYX', '0');
INSERT INTO `t_system_region_info` VALUES ('331127', '33', '11', '27', '景宁畲族自治县', '浙江省', '丽水市', '景宁畲族自治县', '', '0', '2', 'JNSZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('331181', '33', '11', '81', '龙泉市', '浙江省', '丽水市', '龙泉市', '', '0', '2', 'LQS', '0');
INSERT INTO `t_system_region_info` VALUES ('340000', '34', '0', '0', '安徽省', '安徽省', '', '', '', '0', '0', 'AHS', '0');
INSERT INTO `t_system_region_info` VALUES ('340100', '34', '1', '0', '合肥市', '安徽省', '合肥市', '', '', '0', '1', 'GFS', '0');
INSERT INTO `t_system_region_info` VALUES ('340101', '34', '1', '1', '市辖区', '安徽省', '合肥市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340102', '34', '1', '2', '瑶海区', '安徽省', '合肥市', '瑶海区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340103', '34', '1', '3', '庐阳区', '安徽省', '合肥市', '庐阳区', '', '0', '2', 'LYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340104', '34', '1', '4', '蜀山区', '安徽省', '合肥市', '蜀山区', '', '0', '2', 'SSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340111', '34', '1', '11', '包河区', '安徽省', '合肥市', '包河区', '', '0', '2', 'BHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340121', '34', '1', '21', '长丰县', '安徽省', '合肥市', '长丰县', '', '0', '2', 'CFX', '0');
INSERT INTO `t_system_region_info` VALUES ('340122', '34', '1', '22', '肥东县', '安徽省', '合肥市', '肥东县', '', '0', '2', 'FDX', '0');
INSERT INTO `t_system_region_info` VALUES ('340123', '34', '1', '23', '肥西县', '安徽省', '合肥市', '肥西县', '', '0', '2', 'FXX', '0');
INSERT INTO `t_system_region_info` VALUES ('340124', '34', '1', '24', '庐江县', '安徽省', '合肥市', '庐江县', '', '0', '2', 'LJX', '0');
INSERT INTO `t_system_region_info` VALUES ('340181', '34', '1', '81', '巢湖市', '安徽省', '合肥市', '巢湖市', '', '0', '2', 'CHS', '0');
INSERT INTO `t_system_region_info` VALUES ('340200', '34', '2', '0', '芜湖市', '安徽省', '芜湖市', '', '', '0', '1', 'WHS', '0');
INSERT INTO `t_system_region_info` VALUES ('340201', '34', '2', '1', '市辖区', '安徽省', '芜湖市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340202', '34', '2', '2', '镜湖区', '安徽省', '芜湖市', '镜湖区', '', '0', '2', 'JHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340203', '34', '2', '3', '弋江区', '安徽省', '芜湖市', '弋江区', '', '0', '2', 'YJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340207', '34', '2', '7', '鸠江区', '安徽省', '芜湖市', '鸠江区', '', '0', '2', 'JJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340208', '34', '2', '8', '三山区', '安徽省', '芜湖市', '三山区', '', '0', '2', 'SSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340221', '34', '2', '21', '芜湖县', '安徽省', '芜湖市', '芜湖县', '', '0', '2', 'WHX', '0');
INSERT INTO `t_system_region_info` VALUES ('340222', '34', '2', '22', '繁昌县', '安徽省', '芜湖市', '繁昌县', '', '0', '2', 'FCX', '0');
INSERT INTO `t_system_region_info` VALUES ('340223', '34', '2', '23', '南陵县', '安徽省', '芜湖市', '南陵县', '', '0', '2', 'NLX', '0');
INSERT INTO `t_system_region_info` VALUES ('340225', '34', '2', '25', '无为县', '安徽省', '芜湖市', '无为县', '', '0', '2', 'MWX', '0');
INSERT INTO `t_system_region_info` VALUES ('340300', '34', '3', '0', '蚌埠市', '安徽省', '蚌埠市', '', '', '0', '1', 'BBS', '0');
INSERT INTO `t_system_region_info` VALUES ('340301', '34', '3', '1', '市辖区', '安徽省', '蚌埠市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340302', '34', '3', '2', '龙子湖区', '安徽省', '蚌埠市', '龙子湖区', '', '0', '2', 'LZHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340303', '34', '3', '3', '蚌山区', '安徽省', '蚌埠市', '蚌山区', '', '0', '2', 'BSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340304', '34', '3', '4', '禹会区', '安徽省', '蚌埠市', '禹会区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340311', '34', '3', '11', '淮上区', '安徽省', '蚌埠市', '淮上区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340321', '34', '3', '21', '怀远县', '安徽省', '蚌埠市', '怀远县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('340322', '34', '3', '22', '五河县', '安徽省', '蚌埠市', '五河县', '', '0', '2', 'WHX', '0');
INSERT INTO `t_system_region_info` VALUES ('340323', '34', '3', '23', '固镇县', '安徽省', '蚌埠市', '固镇县', '', '0', '2', 'GZX', '0');
INSERT INTO `t_system_region_info` VALUES ('340400', '34', '4', '0', '淮南市', '安徽省', '淮南市', '', '', '0', '1', 'HNS', '0');
INSERT INTO `t_system_region_info` VALUES ('340401', '34', '4', '1', '市辖区', '安徽省', '淮南市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340402', '34', '4', '2', '大通区', '安徽省', '淮南市', '大通区', '', '0', '2', 'DTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340403', '34', '4', '3', '田家庵区', '安徽省', '淮南市', '田家庵区', '', '0', '2', 'TJAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340404', '34', '4', '4', '谢家集区', '安徽省', '淮南市', '谢家集区', '', '0', '2', 'XJJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340405', '34', '4', '5', '八公山区', '安徽省', '淮南市', '八公山区', '', '0', '2', 'BGSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340406', '34', '4', '6', '潘集区', '安徽省', '淮南市', '潘集区', '', '0', '2', 'PJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340421', '34', '4', '21', '凤台县', '安徽省', '淮南市', '凤台县', '', '0', '2', 'FTX', '0');
INSERT INTO `t_system_region_info` VALUES ('340500', '34', '5', '0', '马鞍山市', '安徽省', '马鞍山市', '', '', '0', '1', 'MASS', '0');
INSERT INTO `t_system_region_info` VALUES ('340501', '34', '5', '1', '市辖区', '安徽省', '马鞍山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340502', '34', '5', '2', '金家庄区', '安徽省', '马鞍山市', '金家庄区', '', '0', '2', 'JJZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340503', '34', '5', '3', '花山区', '安徽省', '马鞍山市', '花山区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340504', '34', '5', '4', '雨山区', '安徽省', '马鞍山市', '雨山区', '', '0', '2', 'YSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340521', '34', '5', '21', '当涂县', '安徽省', '马鞍山市', '当涂县', '', '0', '2', 'DTX', '0');
INSERT INTO `t_system_region_info` VALUES ('340522', '34', '5', '22', '含山县', '安徽省', '马鞍山市', '含山县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('340523', '34', '5', '23', '和县', '安徽省', '马鞍山市', '和县', '', '0', '2', 'HX', '0');
INSERT INTO `t_system_region_info` VALUES ('340600', '34', '6', '0', '淮北市', '安徽省', '淮北市', '', '', '0', '1', 'HBS', '0');
INSERT INTO `t_system_region_info` VALUES ('340601', '34', '6', '1', '市辖区', '安徽省', '淮北市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340602', '34', '6', '2', '杜集区', '安徽省', '淮北市', '杜集区', '', '0', '2', 'DJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340603', '34', '6', '3', '相山区', '安徽省', '淮北市', '相山区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340604', '34', '6', '4', '烈山区', '安徽省', '淮北市', '烈山区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340621', '34', '6', '21', '濉溪县', '安徽省', '淮北市', '濉溪县', '', '0', '2', 'SXX', '0');
INSERT INTO `t_system_region_info` VALUES ('340700', '34', '7', '0', '铜陵市', '安徽省', '铜陵市', '', '', '0', '1', 'TLS', '0');
INSERT INTO `t_system_region_info` VALUES ('340701', '34', '7', '1', '市辖区', '安徽省', '铜陵市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340702', '34', '7', '2', '铜官山区', '安徽省', '铜陵市', '铜官山区', '', '0', '2', 'TGSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340703', '34', '7', '3', '狮子山区', '安徽省', '铜陵市', '狮子山区', '', '0', '2', 'SZSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340711', '34', '7', '11', '郊区', '安徽省', '铜陵市', '郊区', '', '0', '2', 'JQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340721', '34', '7', '21', '铜陵县', '安徽省', '铜陵市', '铜陵县', '', '0', '2', 'TLX', '0');
INSERT INTO `t_system_region_info` VALUES ('340800', '34', '8', '0', '安庆市', '安徽省', '安庆市', '', '', '0', '1', 'AQS', '0');
INSERT INTO `t_system_region_info` VALUES ('340801', '34', '8', '1', '市辖区', '安徽省', '安庆市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340802', '34', '8', '2', '迎江区', '安徽省', '安庆市', '迎江区', '', '0', '2', 'YJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340803', '34', '8', '3', '大观区', '安徽省', '安庆市', '大观区', '', '0', '2', 'DGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340811', '34', '8', '11', '宜秀区', '安徽省', '安庆市', '宜秀区', '', '0', '2', 'YXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('340822', '34', '8', '22', '怀宁县', '安徽省', '安庆市', '怀宁县', '', '0', '2', 'HNX', '0');
INSERT INTO `t_system_region_info` VALUES ('340823', '34', '8', '23', '枞阳县', '安徽省', '安庆市', '枞阳县', '', '0', '2', 'CYX', '0');
INSERT INTO `t_system_region_info` VALUES ('340824', '34', '8', '24', '潜山县', '安徽省', '安庆市', '潜山县', '', '0', '2', 'QSX', '0');
INSERT INTO `t_system_region_info` VALUES ('340825', '34', '8', '25', '太湖县', '安徽省', '安庆市', '太湖县', '', '0', '2', 'THX', '0');
INSERT INTO `t_system_region_info` VALUES ('340826', '34', '8', '26', '宿松县', '安徽省', '安庆市', '宿松县', '', '0', '2', 'SSX', '0');
INSERT INTO `t_system_region_info` VALUES ('340827', '34', '8', '27', '望江县', '安徽省', '安庆市', '望江县', '', '0', '2', 'WJX', '0');
INSERT INTO `t_system_region_info` VALUES ('340828', '34', '8', '28', '岳西县', '安徽省', '安庆市', '岳西县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('340881', '34', '8', '81', '桐城市', '安徽省', '安庆市', '桐城市', '', '0', '2', 'TCS', '0');
INSERT INTO `t_system_region_info` VALUES ('341000', '34', '10', '0', '黄山市', '安徽省', '黄山市', '', '', '0', '1', 'HSS', '0');
INSERT INTO `t_system_region_info` VALUES ('341001', '34', '10', '1', '市辖区', '安徽省', '黄山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341002', '34', '10', '2', '屯溪区', '安徽省', '黄山市', '屯溪区', '', '0', '2', 'TXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341003', '34', '10', '3', '黄山区', '安徽省', '黄山市', '黄山区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341004', '34', '10', '4', '徽州区', '安徽省', '黄山市', '徽州区', '', '0', '2', 'HZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341021', '34', '10', '21', '歙县', '安徽省', '黄山市', '歙县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('341022', '34', '10', '22', '休宁县', '安徽省', '黄山市', '休宁县', '', '0', '2', 'XNX', '0');
INSERT INTO `t_system_region_info` VALUES ('341023', '34', '10', '23', '黟县', '安徽省', '黄山市', '黟县', '', '0', '2', 'YX', '0');
INSERT INTO `t_system_region_info` VALUES ('341024', '34', '10', '24', '祁门县', '安徽省', '黄山市', '祁门县', '', '0', '2', 'QMX', '0');
INSERT INTO `t_system_region_info` VALUES ('341100', '34', '11', '0', '滁州市', '安徽省', '滁州市', '', '', '0', '1', 'CZS', '0');
INSERT INTO `t_system_region_info` VALUES ('341101', '34', '11', '1', '市辖区', '安徽省', '滁州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341102', '34', '11', '2', '琅琊区', '安徽省', '滁州市', '琅琊区', '', '0', '2', 'LYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341103', '34', '11', '3', '南谯区', '安徽省', '滁州市', '南谯区', '', '0', '2', 'NQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341122', '34', '11', '22', '来安县', '安徽省', '滁州市', '来安县', '', '0', '2', 'LAX', '0');
INSERT INTO `t_system_region_info` VALUES ('341124', '34', '11', '24', '全椒县', '安徽省', '滁州市', '全椒县', '', '0', '2', 'QJX', '0');
INSERT INTO `t_system_region_info` VALUES ('341125', '34', '11', '25', '定远县', '安徽省', '滁州市', '定远县', '', '0', '2', 'DYX', '0');
INSERT INTO `t_system_region_info` VALUES ('341126', '34', '11', '26', '凤阳县', '安徽省', '滁州市', '凤阳县', '', '0', '2', 'FYX', '0');
INSERT INTO `t_system_region_info` VALUES ('341181', '34', '11', '81', '天长市', '安徽省', '滁州市', '天长市', '', '0', '2', 'TCS', '0');
INSERT INTO `t_system_region_info` VALUES ('341182', '34', '11', '82', '明光市', '安徽省', '滁州市', '明光市', '', '0', '2', 'MGS', '0');
INSERT INTO `t_system_region_info` VALUES ('341200', '34', '12', '0', '阜阳市', '安徽省', '阜阳市', '', '', '0', '1', 'FYS', '0');
INSERT INTO `t_system_region_info` VALUES ('341201', '34', '12', '1', '市辖区', '安徽省', '阜阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341202', '34', '12', '2', '颍州区', '安徽省', '阜阳市', '颍州区', '', '0', '2', 'YZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341203', '34', '12', '3', '颍东区', '安徽省', '阜阳市', '颍东区', '', '0', '2', 'YDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341204', '34', '12', '4', '颍泉区', '安徽省', '阜阳市', '颍泉区', '', '0', '2', 'YQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341221', '34', '12', '21', '临泉县', '安徽省', '阜阳市', '临泉县', '', '0', '2', 'LQX', '0');
INSERT INTO `t_system_region_info` VALUES ('341222', '34', '12', '22', '太和县', '安徽省', '阜阳市', '太和县', '', '0', '2', 'THX', '0');
INSERT INTO `t_system_region_info` VALUES ('341225', '34', '12', '25', '阜南县', '安徽省', '阜阳市', '阜南县', '', '0', '2', 'FNX', '0');
INSERT INTO `t_system_region_info` VALUES ('341226', '34', '12', '26', '颍上县', '安徽省', '阜阳市', '颍上县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('341282', '34', '12', '82', '界首市', '安徽省', '阜阳市', '界首市', '', '0', '2', 'JSS', '0');
INSERT INTO `t_system_region_info` VALUES ('341300', '34', '13', '0', '宿州市', '安徽省', '宿州市', '', '', '0', '1', 'SZS', '0');
INSERT INTO `t_system_region_info` VALUES ('341301', '34', '13', '1', '市辖区', '安徽省', '宿州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341302', '34', '13', '2', '埇桥区', '安徽省', '宿州市', '埇桥区', '', '0', '2', '埇QQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341321', '34', '13', '21', '砀山县', '安徽省', '宿州市', '砀山县', '', '0', '2', 'DSX', '0');
INSERT INTO `t_system_region_info` VALUES ('341322', '34', '13', '22', '萧县', '安徽省', '宿州市', '萧县', '', '0', '2', 'XX', '0');
INSERT INTO `t_system_region_info` VALUES ('341323', '34', '13', '23', '灵璧县', '安徽省', '宿州市', '灵璧县', '', '0', '2', 'LBX', '0');
INSERT INTO `t_system_region_info` VALUES ('341324', '34', '13', '24', '泗县', '安徽省', '宿州市', '泗县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('341500', '34', '15', '0', '六安市', '安徽省', '六安市', '', '', '0', '1', 'LAS', '0');
INSERT INTO `t_system_region_info` VALUES ('341501', '34', '15', '1', '市辖区', '安徽省', '六安市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341502', '34', '15', '2', '金安区', '安徽省', '六安市', '金安区', '', '0', '2', 'JAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341503', '34', '15', '3', '裕安区', '安徽省', '六安市', '裕安区', '', '0', '2', 'YAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341521', '34', '15', '21', '寿县', '安徽省', '六安市', '寿县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('341522', '34', '15', '22', '霍邱县', '安徽省', '六安市', '霍邱县', '', '0', '2', 'HQX', '0');
INSERT INTO `t_system_region_info` VALUES ('341523', '34', '15', '23', '舒城县', '安徽省', '六安市', '舒城县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('341524', '34', '15', '24', '金寨县', '安徽省', '六安市', '金寨县', '', '0', '2', 'JZX', '0');
INSERT INTO `t_system_region_info` VALUES ('341525', '34', '15', '25', '霍山县', '安徽省', '六安市', '霍山县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('341600', '34', '16', '0', '亳州市', '安徽省', '亳州市', '', '', '0', '1', 'BZS', '0');
INSERT INTO `t_system_region_info` VALUES ('341601', '34', '16', '1', '市辖区', '安徽省', '亳州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341602', '34', '16', '2', '谯城区', '安徽省', '亳州市', '谯城区', '', '0', '2', 'QCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341621', '34', '16', '21', '涡阳县', '安徽省', '亳州市', '涡阳县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('341622', '34', '16', '22', '蒙城县', '安徽省', '亳州市', '蒙城县', '', '0', '2', 'MCX', '0');
INSERT INTO `t_system_region_info` VALUES ('341623', '34', '16', '23', '利辛县', '安徽省', '亳州市', '利辛县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('341700', '34', '17', '0', '池州市', '安徽省', '池州市', '', '', '0', '1', 'CZS', '0');
INSERT INTO `t_system_region_info` VALUES ('341701', '34', '17', '1', '市辖区', '安徽省', '池州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341702', '34', '17', '2', '贵池区', '安徽省', '池州市', '贵池区', '', '0', '2', 'GCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341721', '34', '17', '21', '东至县', '安徽省', '池州市', '东至县', '', '0', '2', 'DZX', '0');
INSERT INTO `t_system_region_info` VALUES ('341722', '34', '17', '22', '石台县', '安徽省', '池州市', '石台县', '', '0', '2', 'STX', '0');
INSERT INTO `t_system_region_info` VALUES ('341723', '34', '17', '23', '青阳县', '安徽省', '池州市', '青阳县', '', '0', '2', 'QYX', '0');
INSERT INTO `t_system_region_info` VALUES ('341800', '34', '18', '0', '宣城市', '安徽省', '宣城市', '', '', '0', '1', 'XCS', '0');
INSERT INTO `t_system_region_info` VALUES ('341801', '34', '18', '1', '市辖区', '安徽省', '宣城市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341802', '34', '18', '2', '宣州区', '安徽省', '宣城市', '宣州区', '', '0', '2', 'XZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('341821', '34', '18', '21', '郎溪县', '安徽省', '宣城市', '郎溪县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('341822', '34', '18', '22', '广德县', '安徽省', '宣城市', '广德县', '', '0', '2', 'ADX', '0');
INSERT INTO `t_system_region_info` VALUES ('341823', '34', '18', '23', '泾县', '安徽省', '宣城市', '泾县', '', '0', '2', 'JX', '0');
INSERT INTO `t_system_region_info` VALUES ('341824', '34', '18', '24', '绩溪县', '安徽省', '宣城市', '绩溪县', '', '0', '2', 'JXX', '0');
INSERT INTO `t_system_region_info` VALUES ('341825', '34', '18', '25', '旌德县', '安徽省', '宣城市', '旌德县', '', '0', '2', 'JDX', '0');
INSERT INTO `t_system_region_info` VALUES ('341881', '34', '18', '81', '宁国市', '安徽省', '宣城市', '宁国市', '', '0', '2', 'NGS', '0');
INSERT INTO `t_system_region_info` VALUES ('350000', '35', '0', '0', '福建省', '福建省', '', '', '', '0', '0', 'FJS', '0');
INSERT INTO `t_system_region_info` VALUES ('350100', '35', '1', '0', '福州市', '福建省', '福州市', '', '', '0', '1', 'FZS', '0');
INSERT INTO `t_system_region_info` VALUES ('350101', '35', '1', '1', '市辖区', '福建省', '福州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350102', '35', '1', '2', '鼓楼区', '福建省', '福州市', '鼓楼区', '', '0', '2', 'GLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350103', '35', '1', '3', '台江区', '福建省', '福州市', '台江区', '', '0', '2', 'TJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350104', '35', '1', '4', '仓山区', '福建省', '福州市', '仓山区', '', '0', '2', 'CSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350105', '35', '1', '5', '马尾区', '福建省', '福州市', '马尾区', '', '0', '2', 'MWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350111', '35', '1', '11', '晋安区', '福建省', '福州市', '晋安区', '', '0', '2', 'JAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350121', '35', '1', '21', '闽侯县', '福建省', '福州市', '闽侯县', '', '0', '2', 'MHX', '0');
INSERT INTO `t_system_region_info` VALUES ('350122', '35', '1', '22', '连江县', '福建省', '福州市', '连江县', '', '0', '2', 'LJX', '0');
INSERT INTO `t_system_region_info` VALUES ('350123', '35', '1', '23', '罗源县', '福建省', '福州市', '罗源县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('350124', '35', '1', '24', '闽清县', '福建省', '福州市', '闽清县', '', '0', '2', 'MQX', '0');
INSERT INTO `t_system_region_info` VALUES ('350125', '35', '1', '25', '永泰县', '福建省', '福州市', '永泰县', '', '0', '2', 'YTX', '0');
INSERT INTO `t_system_region_info` VALUES ('350128', '35', '1', '28', '平潭县', '福建省', '福州市', '平潭县', '', '0', '2', 'PTX', '0');
INSERT INTO `t_system_region_info` VALUES ('350181', '35', '1', '81', '福清市', '福建省', '福州市', '福清市', '', '0', '2', 'FQS', '0');
INSERT INTO `t_system_region_info` VALUES ('350182', '35', '1', '82', '长乐市', '福建省', '福州市', '长乐市', '', '0', '2', 'CLS', '0');
INSERT INTO `t_system_region_info` VALUES ('350200', '35', '2', '0', '厦门市', '福建省', '厦门市', '', '', '0', '1', 'SMS', '0');
INSERT INTO `t_system_region_info` VALUES ('350201', '35', '2', '1', '市辖区', '福建省', '厦门市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350203', '35', '2', '3', '思明区', '福建省', '厦门市', '思明区', '', '0', '2', 'SMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350205', '35', '2', '5', '海沧区', '福建省', '厦门市', '海沧区', '', '0', '2', 'HCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350206', '35', '2', '6', '湖里区', '福建省', '厦门市', '湖里区', '', '0', '2', 'HLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350211', '35', '2', '11', '集美区', '福建省', '厦门市', '集美区', '', '0', '2', 'JMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350212', '35', '2', '12', '同安区', '福建省', '厦门市', '同安区', '', '0', '2', 'TAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350213', '35', '2', '13', '翔安区', '福建省', '厦门市', '翔安区', '', '0', '2', 'XAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350300', '35', '3', '0', '莆田市', '福建省', '莆田市', '', '', '0', '1', 'PTS', '0');
INSERT INTO `t_system_region_info` VALUES ('350301', '35', '3', '1', '市辖区', '福建省', '莆田市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350302', '35', '3', '2', '城厢区', '福建省', '莆田市', '城厢区', '', '0', '2', 'CXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350303', '35', '3', '3', '涵江区', '福建省', '莆田市', '涵江区', '', '0', '2', 'HJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350304', '35', '3', '4', '荔城区', '福建省', '莆田市', '荔城区', '', '0', '2', 'LCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350305', '35', '3', '5', '秀屿区', '福建省', '莆田市', '秀屿区', '', '0', '2', 'XYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350322', '35', '3', '22', '仙游县', '福建省', '莆田市', '仙游县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('350400', '35', '4', '0', '三明市', '福建省', '三明市', '', '', '0', '1', 'SMS', '0');
INSERT INTO `t_system_region_info` VALUES ('350401', '35', '4', '1', '市辖区', '福建省', '三明市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350402', '35', '4', '2', '梅列区', '福建省', '三明市', '梅列区', '', '0', '2', 'MLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350403', '35', '4', '3', '三元区', '福建省', '三明市', '三元区', '', '0', '2', 'SYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350421', '35', '4', '21', '明溪县', '福建省', '三明市', '明溪县', '', '0', '2', 'MXX', '0');
INSERT INTO `t_system_region_info` VALUES ('350423', '35', '4', '23', '清流县', '福建省', '三明市', '清流县', '', '0', '2', 'QLX', '0');
INSERT INTO `t_system_region_info` VALUES ('350424', '35', '4', '24', '宁化县', '福建省', '三明市', '宁化县', '', '0', '2', 'NHX', '0');
INSERT INTO `t_system_region_info` VALUES ('350425', '35', '4', '25', '大田县', '福建省', '三明市', '大田县', '', '0', '2', 'DTX', '0');
INSERT INTO `t_system_region_info` VALUES ('350426', '35', '4', '26', '尤溪县', '福建省', '三明市', '尤溪县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('350427', '35', '4', '27', '沙县', '福建省', '三明市', '沙县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('350428', '35', '4', '28', '将乐县', '福建省', '三明市', '将乐县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('350429', '35', '4', '29', '泰宁县', '福建省', '三明市', '泰宁县', '', '0', '2', 'TNX', '0');
INSERT INTO `t_system_region_info` VALUES ('350430', '35', '4', '30', '建宁县', '福建省', '三明市', '建宁县', '', '0', '2', 'JNX', '0');
INSERT INTO `t_system_region_info` VALUES ('350481', '35', '4', '81', '永安市', '福建省', '三明市', '永安市', '', '0', '2', 'YAS', '0');
INSERT INTO `t_system_region_info` VALUES ('350500', '35', '5', '0', '泉州市', '福建省', '泉州市', '', '', '0', '1', 'QZS', '0');
INSERT INTO `t_system_region_info` VALUES ('350501', '35', '5', '1', '市辖区', '福建省', '泉州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350502', '35', '5', '2', '鲤城区', '福建省', '泉州市', '鲤城区', '', '0', '2', 'LCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350503', '35', '5', '3', '丰泽区', '福建省', '泉州市', '丰泽区', '', '0', '2', 'FZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350504', '35', '5', '4', '洛江区', '福建省', '泉州市', '洛江区', '', '0', '2', 'LJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350505', '35', '5', '5', '泉港区', '福建省', '泉州市', '泉港区', '', '0', '2', 'QGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350521', '35', '5', '21', '惠安县', '福建省', '泉州市', '惠安县', '', '0', '2', 'HAX', '0');
INSERT INTO `t_system_region_info` VALUES ('350524', '35', '5', '24', '安溪县', '福建省', '泉州市', '安溪县', '', '0', '2', 'AXX', '0');
INSERT INTO `t_system_region_info` VALUES ('350525', '35', '5', '25', '永春县', '福建省', '泉州市', '永春县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('350526', '35', '5', '26', '德化县', '福建省', '泉州市', '德化县', '', '0', '2', 'DHX', '0');
INSERT INTO `t_system_region_info` VALUES ('350527', '35', '5', '27', '金门县', '福建省', '泉州市', '金门县', '', '0', '2', 'JMX', '0');
INSERT INTO `t_system_region_info` VALUES ('350581', '35', '5', '81', '石狮市', '福建省', '泉州市', '石狮市', '', '0', '2', 'SSS', '0');
INSERT INTO `t_system_region_info` VALUES ('350582', '35', '5', '82', '晋江市', '福建省', '泉州市', '晋江市', '', '0', '2', 'JJS', '0');
INSERT INTO `t_system_region_info` VALUES ('350583', '35', '5', '83', '南安市', '福建省', '泉州市', '南安市', '', '0', '2', 'NAS', '0');
INSERT INTO `t_system_region_info` VALUES ('350600', '35', '6', '0', '漳州市', '福建省', '漳州市', '', '', '0', '1', 'ZZS', '0');
INSERT INTO `t_system_region_info` VALUES ('350601', '35', '6', '1', '市辖区', '福建省', '漳州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350602', '35', '6', '2', '芗城区', '福建省', '漳州市', '芗城区', '', '0', '2', 'XCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350603', '35', '6', '3', '龙文区', '福建省', '漳州市', '龙文区', '', '0', '2', 'LWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350622', '35', '6', '22', '云霄县', '福建省', '漳州市', '云霄县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('350623', '35', '6', '23', '漳浦县', '福建省', '漳州市', '漳浦县', '', '0', '2', 'ZPX', '0');
INSERT INTO `t_system_region_info` VALUES ('350624', '35', '6', '24', '诏安县', '福建省', '漳州市', '诏安县', '', '0', '2', 'ZAX', '0');
INSERT INTO `t_system_region_info` VALUES ('350625', '35', '6', '25', '长泰县', '福建省', '漳州市', '长泰县', '', '0', '2', 'CTX', '0');
INSERT INTO `t_system_region_info` VALUES ('350626', '35', '6', '26', '东山县', '福建省', '漳州市', '东山县', '', '0', '2', 'DSX', '0');
INSERT INTO `t_system_region_info` VALUES ('350627', '35', '6', '27', '南靖县', '福建省', '漳州市', '南靖县', '', '0', '2', 'NJX', '0');
INSERT INTO `t_system_region_info` VALUES ('350628', '35', '6', '28', '平和县', '福建省', '漳州市', '平和县', '', '0', '2', 'PHX', '0');
INSERT INTO `t_system_region_info` VALUES ('350629', '35', '6', '29', '华安县', '福建省', '漳州市', '华安县', '', '0', '2', 'HAX', '0');
INSERT INTO `t_system_region_info` VALUES ('350681', '35', '6', '81', '龙海市', '福建省', '漳州市', '龙海市', '', '0', '2', 'LHS', '0');
INSERT INTO `t_system_region_info` VALUES ('350700', '35', '7', '0', '南平市', '福建省', '南平市', '', '', '0', '1', 'NPS', '0');
INSERT INTO `t_system_region_info` VALUES ('350701', '35', '7', '1', '市辖区', '福建省', '南平市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350702', '35', '7', '2', '延平区', '福建省', '南平市', '延平区', '', '0', '2', 'YPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350721', '35', '7', '21', '顺昌县', '福建省', '南平市', '顺昌县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('350722', '35', '7', '22', '浦城县', '福建省', '南平市', '浦城县', '', '0', '2', 'PCX', '0');
INSERT INTO `t_system_region_info` VALUES ('350723', '35', '7', '23', '光泽县', '福建省', '南平市', '光泽县', '', '0', '2', 'GZX', '0');
INSERT INTO `t_system_region_info` VALUES ('350724', '35', '7', '24', '松溪县', '福建省', '南平市', '松溪县', '', '0', '2', 'SXX', '0');
INSERT INTO `t_system_region_info` VALUES ('350725', '35', '7', '25', '政和县', '福建省', '南平市', '政和县', '', '0', '2', 'ZHX', '0');
INSERT INTO `t_system_region_info` VALUES ('350781', '35', '7', '81', '邵武市', '福建省', '南平市', '邵武市', '', '0', '2', 'SWS', '0');
INSERT INTO `t_system_region_info` VALUES ('350782', '35', '7', '82', '武夷山市', '福建省', '南平市', '武夷山市', '', '0', '2', 'WYSS', '0');
INSERT INTO `t_system_region_info` VALUES ('350783', '35', '7', '83', '建瓯市', '福建省', '南平市', '建瓯市', '', '0', '2', 'JOS', '0');
INSERT INTO `t_system_region_info` VALUES ('350784', '35', '7', '84', '建阳市', '福建省', '南平市', '建阳市', '', '0', '2', 'JYS', '0');
INSERT INTO `t_system_region_info` VALUES ('350800', '35', '8', '0', '龙岩市', '福建省', '龙岩市', '', '', '0', '1', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('350801', '35', '8', '1', '市辖区', '福建省', '龙岩市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350802', '35', '8', '2', '新罗区', '福建省', '龙岩市', '新罗区', '', '0', '2', 'XLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350821', '35', '8', '21', '长汀县', '福建省', '龙岩市', '长汀县', '', '0', '2', 'CTX', '0');
INSERT INTO `t_system_region_info` VALUES ('350822', '35', '8', '22', '永定县', '福建省', '龙岩市', '永定县', '', '0', '2', 'YDX', '0');
INSERT INTO `t_system_region_info` VALUES ('350823', '35', '8', '23', '上杭县', '福建省', '龙岩市', '上杭县', '', '0', '2', 'SHX', '0');
INSERT INTO `t_system_region_info` VALUES ('350824', '35', '8', '24', '武平县', '福建省', '龙岩市', '武平县', '', '0', '2', 'WPX', '0');
INSERT INTO `t_system_region_info` VALUES ('350825', '35', '8', '25', '连城县', '福建省', '龙岩市', '连城县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('350881', '35', '8', '81', '漳平市', '福建省', '龙岩市', '漳平市', '', '0', '2', 'ZPS', '0');
INSERT INTO `t_system_region_info` VALUES ('350900', '35', '9', '0', '宁德市', '福建省', '宁德市', '', '', '0', '1', 'NDS', '0');
INSERT INTO `t_system_region_info` VALUES ('350901', '35', '9', '1', '市辖区', '福建省', '宁德市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350902', '35', '9', '2', '蕉城区', '福建省', '宁德市', '蕉城区', '', '0', '2', 'JCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('350921', '35', '9', '21', '霞浦县', '福建省', '宁德市', '霞浦县', '', '0', '2', 'XPX', '0');
INSERT INTO `t_system_region_info` VALUES ('350922', '35', '9', '22', '古田县', '福建省', '宁德市', '古田县', '', '0', '2', 'GTX', '0');
INSERT INTO `t_system_region_info` VALUES ('350923', '35', '9', '23', '屏南县', '福建省', '宁德市', '屏南县', '', '0', '2', 'BNX', '0');
INSERT INTO `t_system_region_info` VALUES ('350924', '35', '9', '24', '寿宁县', '福建省', '宁德市', '寿宁县', '', '0', '2', 'SNX', '0');
INSERT INTO `t_system_region_info` VALUES ('350925', '35', '9', '25', '周宁县', '福建省', '宁德市', '周宁县', '', '0', '2', 'ZNX', '0');
INSERT INTO `t_system_region_info` VALUES ('350926', '35', '9', '26', '柘荣县', '福建省', '宁德市', '柘荣县', '', '0', '2', 'ZRX', '0');
INSERT INTO `t_system_region_info` VALUES ('350981', '35', '9', '81', '福安市', '福建省', '宁德市', '福安市', '', '0', '2', 'FAS', '0');
INSERT INTO `t_system_region_info` VALUES ('350982', '35', '9', '82', '福鼎市', '福建省', '宁德市', '福鼎市', '', '0', '2', 'FDS', '0');
INSERT INTO `t_system_region_info` VALUES ('360000', '36', '0', '0', '江西省', '江西省', '', '', '', '0', '0', 'JXS', '0');
INSERT INTO `t_system_region_info` VALUES ('360100', '36', '1', '0', '南昌市', '江西省', '南昌市', '', '', '0', '1', 'NCS', '0');
INSERT INTO `t_system_region_info` VALUES ('360101', '36', '1', '1', '市辖区', '江西省', '南昌市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360102', '36', '1', '2', '东湖区', '江西省', '南昌市', '东湖区', '', '0', '2', 'DHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360103', '36', '1', '3', '西湖区', '江西省', '南昌市', '西湖区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360104', '36', '1', '4', '青云谱区', '江西省', '南昌市', '青云谱区', '', '0', '2', 'QYPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360105', '36', '1', '5', '湾里区', '江西省', '南昌市', '湾里区', '', '0', '2', 'WLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360111', '36', '1', '11', '青山湖区', '江西省', '南昌市', '青山湖区', '', '0', '2', 'QSHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360121', '36', '1', '21', '南昌县', '江西省', '南昌市', '南昌县', '', '0', '2', 'NCX', '0');
INSERT INTO `t_system_region_info` VALUES ('360122', '36', '1', '22', '新建县', '江西省', '南昌市', '新建县', '', '0', '2', 'XJX', '0');
INSERT INTO `t_system_region_info` VALUES ('360123', '36', '1', '23', '安义县', '江西省', '南昌市', '安义县', '', '0', '2', 'AYX', '0');
INSERT INTO `t_system_region_info` VALUES ('360124', '36', '1', '24', '进贤县', '江西省', '南昌市', '进贤县', '', '0', '2', 'JXX', '0');
INSERT INTO `t_system_region_info` VALUES ('360200', '36', '2', '0', '景德镇市', '江西省', '景德镇市', '', '', '0', '1', 'JDZS', '0');
INSERT INTO `t_system_region_info` VALUES ('360201', '36', '2', '1', '市辖区', '江西省', '景德镇市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360202', '36', '2', '2', '昌江区', '江西省', '景德镇市', '昌江区', '', '0', '2', 'CJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360203', '36', '2', '3', '珠山区', '江西省', '景德镇市', '珠山区', '', '0', '2', 'ZSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360222', '36', '2', '22', '浮梁县', '江西省', '景德镇市', '浮梁县', '', '0', '2', 'FLX', '0');
INSERT INTO `t_system_region_info` VALUES ('360281', '36', '2', '81', '乐平市', '江西省', '景德镇市', '乐平市', '', '0', '2', 'LPS', '0');
INSERT INTO `t_system_region_info` VALUES ('360300', '36', '3', '0', '萍乡市', '江西省', '萍乡市', '', '', '0', '1', 'PXS', '0');
INSERT INTO `t_system_region_info` VALUES ('360301', '36', '3', '1', '市辖区', '江西省', '萍乡市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360302', '36', '3', '2', '安源区', '江西省', '萍乡市', '安源区', '', '0', '2', 'AYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360313', '36', '3', '13', '湘东区', '江西省', '萍乡市', '湘东区', '', '0', '2', 'XDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360321', '36', '3', '21', '莲花县', '江西省', '萍乡市', '莲花县', '', '0', '2', 'LHX', '0');
INSERT INTO `t_system_region_info` VALUES ('360322', '36', '3', '22', '上栗县', '江西省', '萍乡市', '上栗县', '', '0', '2', 'SLX', '0');
INSERT INTO `t_system_region_info` VALUES ('360323', '36', '3', '23', '芦溪县', '江西省', '萍乡市', '芦溪县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('360400', '36', '4', '0', '九江市', '江西省', '九江市', '', '', '0', '1', 'JJS', '0');
INSERT INTO `t_system_region_info` VALUES ('360401', '36', '4', '1', '市辖区', '江西省', '九江市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360402', '36', '4', '2', '庐山区', '江西省', '九江市', '庐山区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360403', '36', '4', '3', '浔阳区', '江西省', '九江市', '浔阳区', '', '0', '2', 'XYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360421', '36', '4', '21', '九江县', '江西省', '九江市', '九江县', '', '0', '2', 'JJX', '0');
INSERT INTO `t_system_region_info` VALUES ('360423', '36', '4', '23', '武宁县', '江西省', '九江市', '武宁县', '', '0', '2', 'WNX', '0');
INSERT INTO `t_system_region_info` VALUES ('360424', '36', '4', '24', '修水县', '江西省', '九江市', '修水县', '', '0', '2', 'XSX', '0');
INSERT INTO `t_system_region_info` VALUES ('360425', '36', '4', '25', '永修县', '江西省', '九江市', '永修县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('360426', '36', '4', '26', '德安县', '江西省', '九江市', '德安县', '', '0', '2', 'DAX', '0');
INSERT INTO `t_system_region_info` VALUES ('360427', '36', '4', '27', '星子县', '江西省', '九江市', '星子县', '', '0', '2', 'XZX', '0');
INSERT INTO `t_system_region_info` VALUES ('360428', '36', '4', '28', '都昌县', '江西省', '九江市', '都昌县', '', '0', '2', 'DCX', '0');
INSERT INTO `t_system_region_info` VALUES ('360429', '36', '4', '29', '湖口县', '江西省', '九江市', '湖口县', '', '0', '2', 'HKX', '0');
INSERT INTO `t_system_region_info` VALUES ('360430', '36', '4', '30', '彭泽县', '江西省', '九江市', '彭泽县', '', '0', '2', 'PZX', '0');
INSERT INTO `t_system_region_info` VALUES ('360481', '36', '4', '81', '瑞昌市', '江西省', '九江市', '瑞昌市', '', '0', '2', 'RCS', '0');
INSERT INTO `t_system_region_info` VALUES ('360482', '36', '4', '82', '共青城市', '江西省', '九江市', '共青城市', '', '0', '2', 'GQCS', '0');
INSERT INTO `t_system_region_info` VALUES ('360500', '36', '5', '0', '新余市', '江西省', '新余市', '', '', '0', '1', 'XYS', '0');
INSERT INTO `t_system_region_info` VALUES ('360501', '36', '5', '1', '市辖区', '江西省', '新余市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360502', '36', '5', '2', '渝水区', '江西省', '新余市', '渝水区', '', '0', '2', 'YSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360521', '36', '5', '21', '分宜县', '江西省', '新余市', '分宜县', '', '0', '2', 'FYX', '0');
INSERT INTO `t_system_region_info` VALUES ('360600', '36', '6', '0', '鹰潭市', '江西省', '鹰潭市', '', '', '0', '1', 'YTS', '0');
INSERT INTO `t_system_region_info` VALUES ('360601', '36', '6', '1', '市辖区', '江西省', '鹰潭市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360602', '36', '6', '2', '月湖区', '江西省', '鹰潭市', '月湖区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360622', '36', '6', '22', '余江县', '江西省', '鹰潭市', '余江县', '', '0', '2', 'YJX', '0');
INSERT INTO `t_system_region_info` VALUES ('360681', '36', '6', '81', '贵溪市', '江西省', '鹰潭市', '贵溪市', '', '0', '2', 'GXS', '0');
INSERT INTO `t_system_region_info` VALUES ('360700', '36', '7', '0', '赣州市', '江西省', '赣州市', '', '', '0', '1', 'GZS', '0');
INSERT INTO `t_system_region_info` VALUES ('360701', '36', '7', '1', '市辖区', '江西省', '赣州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360702', '36', '7', '2', '章贡区', '江西省', '赣州市', '章贡区', '', '0', '2', 'ZGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360721', '36', '7', '21', '赣县', '江西省', '赣州市', '赣县', '', '0', '2', 'GX', '0');
INSERT INTO `t_system_region_info` VALUES ('360722', '36', '7', '22', '信丰县', '江西省', '赣州市', '信丰县', '', '0', '2', 'XFX', '0');
INSERT INTO `t_system_region_info` VALUES ('360723', '36', '7', '23', '大余县', '江西省', '赣州市', '大余县', '', '0', '2', 'DYX', '0');
INSERT INTO `t_system_region_info` VALUES ('360724', '36', '7', '24', '上犹县', '江西省', '赣州市', '上犹县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('360725', '36', '7', '25', '崇义县', '江西省', '赣州市', '崇义县', '', '0', '2', 'CYX', '0');
INSERT INTO `t_system_region_info` VALUES ('360726', '36', '7', '26', '安远县', '江西省', '赣州市', '安远县', '', '0', '2', 'AYX', '0');
INSERT INTO `t_system_region_info` VALUES ('360727', '36', '7', '27', '龙南县', '江西省', '赣州市', '龙南县', '', '0', '2', 'LNX', '0');
INSERT INTO `t_system_region_info` VALUES ('360728', '36', '7', '28', '定南县', '江西省', '赣州市', '定南县', '', '0', '2', 'DNX', '0');
INSERT INTO `t_system_region_info` VALUES ('360729', '36', '7', '29', '全南县', '江西省', '赣州市', '全南县', '', '0', '2', 'QNX', '0');
INSERT INTO `t_system_region_info` VALUES ('360730', '36', '7', '30', '宁都县', '江西省', '赣州市', '宁都县', '', '0', '2', 'NDX', '0');
INSERT INTO `t_system_region_info` VALUES ('360731', '36', '7', '31', '于都县', '江西省', '赣州市', '于都县', '', '0', '2', 'YDX', '0');
INSERT INTO `t_system_region_info` VALUES ('360732', '36', '7', '32', '兴国县', '江西省', '赣州市', '兴国县', '', '0', '2', 'XGX', '0');
INSERT INTO `t_system_region_info` VALUES ('360733', '36', '7', '33', '会昌县', '江西省', '赣州市', '会昌县', '', '0', '2', 'HCX', '0');
INSERT INTO `t_system_region_info` VALUES ('360734', '36', '7', '34', '寻乌县', '江西省', '赣州市', '寻乌县', '', '0', '2', 'XWX', '0');
INSERT INTO `t_system_region_info` VALUES ('360735', '36', '7', '35', '石城县', '江西省', '赣州市', '石城县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('360781', '36', '7', '81', '瑞金市', '江西省', '赣州市', '瑞金市', '', '0', '2', 'RJS', '0');
INSERT INTO `t_system_region_info` VALUES ('360782', '36', '7', '82', '南康市', '江西省', '赣州市', '南康市', '', '0', '2', 'NKS', '0');
INSERT INTO `t_system_region_info` VALUES ('360800', '36', '8', '0', '吉安市', '江西省', '吉安市', '', '', '0', '1', 'JAS', '0');
INSERT INTO `t_system_region_info` VALUES ('360801', '36', '8', '1', '市辖区', '江西省', '吉安市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360802', '36', '8', '2', '吉州区', '江西省', '吉安市', '吉州区', '', '0', '2', 'JZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360803', '36', '8', '3', '青原区', '江西省', '吉安市', '青原区', '', '0', '2', 'QYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360821', '36', '8', '21', '吉安县', '江西省', '吉安市', '吉安县', '', '0', '2', 'JAX', '0');
INSERT INTO `t_system_region_info` VALUES ('360822', '36', '8', '22', '吉水县', '江西省', '吉安市', '吉水县', '', '0', '2', 'JSX', '0');
INSERT INTO `t_system_region_info` VALUES ('360823', '36', '8', '23', '峡江县', '江西省', '吉安市', '峡江县', '', '0', '2', 'XJX', '0');
INSERT INTO `t_system_region_info` VALUES ('360824', '36', '8', '24', '新干县', '江西省', '吉安市', '新干县', '', '0', '2', 'XGX', '0');
INSERT INTO `t_system_region_info` VALUES ('360825', '36', '8', '25', '永丰县', '江西省', '吉安市', '永丰县', '', '0', '2', 'YFX', '0');
INSERT INTO `t_system_region_info` VALUES ('360826', '36', '8', '26', '泰和县', '江西省', '吉安市', '泰和县', '', '0', '2', 'THX', '0');
INSERT INTO `t_system_region_info` VALUES ('360827', '36', '8', '27', '遂川县', '江西省', '吉安市', '遂川县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('360828', '36', '8', '28', '万安县', '江西省', '吉安市', '万安县', '', '0', '2', 'MAX', '0');
INSERT INTO `t_system_region_info` VALUES ('360829', '36', '8', '29', '安福县', '江西省', '吉安市', '安福县', '', '0', '2', 'AFX', '0');
INSERT INTO `t_system_region_info` VALUES ('360830', '36', '8', '30', '永新县', '江西省', '吉安市', '永新县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('360881', '36', '8', '81', '井冈山市', '江西省', '吉安市', '井冈山市', '', '0', '2', 'JGSS', '0');
INSERT INTO `t_system_region_info` VALUES ('360900', '36', '9', '0', '宜春市', '江西省', '宜春市', '', '', '0', '1', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('360901', '36', '9', '1', '市辖区', '江西省', '宜春市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360902', '36', '9', '2', '袁州区', '江西省', '宜春市', '袁州区', '', '0', '2', 'YZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('360921', '36', '9', '21', '奉新县', '江西省', '宜春市', '奉新县', '', '0', '2', 'FXX', '0');
INSERT INTO `t_system_region_info` VALUES ('360922', '36', '9', '22', '万载县', '江西省', '宜春市', '万载县', '', '0', '2', 'MZX', '0');
INSERT INTO `t_system_region_info` VALUES ('360923', '36', '9', '23', '上高县', '江西省', '宜春市', '上高县', '', '0', '2', 'SGX', '0');
INSERT INTO `t_system_region_info` VALUES ('360924', '36', '9', '24', '宜丰县', '江西省', '宜春市', '宜丰县', '', '0', '2', 'YFX', '0');
INSERT INTO `t_system_region_info` VALUES ('360925', '36', '9', '25', '靖安县', '江西省', '宜春市', '靖安县', '', '0', '2', 'JAX', '0');
INSERT INTO `t_system_region_info` VALUES ('360926', '36', '9', '26', '铜鼓县', '江西省', '宜春市', '铜鼓县', '', '0', '2', 'TGX', '0');
INSERT INTO `t_system_region_info` VALUES ('360981', '36', '9', '81', '丰城市', '江西省', '宜春市', '丰城市', '', '0', '2', 'FCS', '0');
INSERT INTO `t_system_region_info` VALUES ('360982', '36', '9', '82', '樟树市', '江西省', '宜春市', '樟树市', '', '0', '2', 'ZSS', '0');
INSERT INTO `t_system_region_info` VALUES ('360983', '36', '9', '83', '高安市', '江西省', '宜春市', '高安市', '', '0', '2', 'GAS', '0');
INSERT INTO `t_system_region_info` VALUES ('361000', '36', '10', '0', '抚州市', '江西省', '抚州市', '', '', '0', '1', 'FZS', '0');
INSERT INTO `t_system_region_info` VALUES ('361001', '36', '10', '1', '市辖区', '江西省', '抚州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('361002', '36', '10', '2', '临川区', '江西省', '抚州市', '临川区', '', '0', '2', 'LCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('361021', '36', '10', '21', '南城县', '江西省', '抚州市', '南城县', '', '0', '2', 'NCX', '0');
INSERT INTO `t_system_region_info` VALUES ('361022', '36', '10', '22', '黎川县', '江西省', '抚州市', '黎川县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('361023', '36', '10', '23', '南丰县', '江西省', '抚州市', '南丰县', '', '0', '2', 'NFX', '0');
INSERT INTO `t_system_region_info` VALUES ('361024', '36', '10', '24', '崇仁县', '江西省', '抚州市', '崇仁县', '', '0', '2', 'CRX', '0');
INSERT INTO `t_system_region_info` VALUES ('361025', '36', '10', '25', '乐安县', '江西省', '抚州市', '乐安县', '', '0', '2', 'LAX', '0');
INSERT INTO `t_system_region_info` VALUES ('361026', '36', '10', '26', '宜黄县', '江西省', '抚州市', '宜黄县', '', '0', '2', 'YHX', '0');
INSERT INTO `t_system_region_info` VALUES ('361027', '36', '10', '27', '金溪县', '江西省', '抚州市', '金溪县', '', '0', '2', 'JXX', '0');
INSERT INTO `t_system_region_info` VALUES ('361028', '36', '10', '28', '资溪县', '江西省', '抚州市', '资溪县', '', '0', '2', 'ZXX', '0');
INSERT INTO `t_system_region_info` VALUES ('361029', '36', '10', '29', '东乡县', '江西省', '抚州市', '东乡县', '', '0', '2', 'DXX', '0');
INSERT INTO `t_system_region_info` VALUES ('361030', '36', '10', '30', '广昌县', '江西省', '抚州市', '广昌县', '', '0', '2', 'ACX', '0');
INSERT INTO `t_system_region_info` VALUES ('361100', '36', '11', '0', '上饶市', '江西省', '上饶市', '', '', '0', '1', 'SRS', '0');
INSERT INTO `t_system_region_info` VALUES ('361101', '36', '11', '1', '市辖区', '江西省', '上饶市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('361102', '36', '11', '2', '信州区', '江西省', '上饶市', '信州区', '', '0', '2', 'XZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('361121', '36', '11', '21', '上饶县', '江西省', '上饶市', '上饶县', '', '0', '2', 'SRX', '0');
INSERT INTO `t_system_region_info` VALUES ('361122', '36', '11', '22', '广丰县', '江西省', '上饶市', '广丰县', '', '0', '2', 'AFX', '0');
INSERT INTO `t_system_region_info` VALUES ('361123', '36', '11', '23', '玉山县', '江西省', '上饶市', '玉山县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('361124', '36', '11', '24', '铅山县', '江西省', '上饶市', '铅山县', '', '0', '2', 'QSX', '0');
INSERT INTO `t_system_region_info` VALUES ('361125', '36', '11', '25', '横峰县', '江西省', '上饶市', '横峰县', '', '0', '2', 'HFX', '0');
INSERT INTO `t_system_region_info` VALUES ('361126', '36', '11', '26', '弋阳县', '江西省', '上饶市', '弋阳县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('361127', '36', '11', '27', '余干县', '江西省', '上饶市', '余干县', '', '0', '2', 'YGX', '0');
INSERT INTO `t_system_region_info` VALUES ('361128', '36', '11', '28', '鄱阳县', '江西省', '上饶市', '鄱阳县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('361129', '36', '11', '29', '万年县', '江西省', '上饶市', '万年县', '', '0', '2', 'MNX', '0');
INSERT INTO `t_system_region_info` VALUES ('361130', '36', '11', '30', '婺源县', '江西省', '上饶市', '婺源县', '', '0', '2', 'WYX', '0');
INSERT INTO `t_system_region_info` VALUES ('361181', '36', '11', '81', '德兴市', '江西省', '上饶市', '德兴市', '', '0', '2', 'DXS', '0');
INSERT INTO `t_system_region_info` VALUES ('370000', '37', '0', '0', '山东省', '山东省', '', '', '', '0', '0', 'SDS', '0');
INSERT INTO `t_system_region_info` VALUES ('370100', '37', '1', '0', '济南市', '山东省', '济南市', '', '', '0', '1', 'JNS', '0');
INSERT INTO `t_system_region_info` VALUES ('370101', '37', '1', '1', '市辖区', '山东省', '济南市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370102', '37', '1', '2', '历下区', '山东省', '济南市', '历下区', '', '0', '2', 'LXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370103', '37', '1', '3', '市中区', '山东省', '济南市', '市中区', '', '0', '2', 'SZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370104', '37', '1', '4', '槐荫区', '山东省', '济南市', '槐荫区', '', '0', '2', 'HYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370105', '37', '1', '5', '天桥区', '山东省', '济南市', '天桥区', '', '0', '2', 'TQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370112', '37', '1', '12', '历城区', '山东省', '济南市', '历城区', '', '0', '2', 'LCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370113', '37', '1', '13', '长清区', '山东省', '济南市', '长清区', '', '0', '2', 'CQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370124', '37', '1', '24', '平阴县', '山东省', '济南市', '平阴县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('370125', '37', '1', '25', '济阳县', '山东省', '济南市', '济阳县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('370126', '37', '1', '26', '商河县', '山东省', '济南市', '商河县', '', '0', '2', 'SHX', '0');
INSERT INTO `t_system_region_info` VALUES ('370181', '37', '1', '81', '章丘市', '山东省', '济南市', '章丘市', '', '0', '2', 'ZQS', '0');
INSERT INTO `t_system_region_info` VALUES ('370200', '37', '2', '0', '青岛市', '山东省', '青岛市', '', '', '0', '1', 'QDS', '0');
INSERT INTO `t_system_region_info` VALUES ('370201', '37', '2', '1', '市辖区', '山东省', '青岛市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370202', '37', '2', '2', '市南区', '山东省', '青岛市', '市南区', '', '0', '2', 'SNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370203', '37', '2', '3', '市北区', '山东省', '青岛市', '市北区', '', '0', '2', 'SBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370205', '37', '2', '5', '四方区', '山东省', '青岛市', '四方区', '', '0', '2', 'SFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370211', '37', '2', '11', '黄岛区', '山东省', '青岛市', '黄岛区', '', '0', '2', 'HDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370212', '37', '2', '12', '崂山区', '山东省', '青岛市', '崂山区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370213', '37', '2', '13', '李沧区', '山东省', '青岛市', '李沧区', '', '0', '2', 'LCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370214', '37', '2', '14', '城阳区', '山东省', '青岛市', '城阳区', '', '0', '2', 'CYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370281', '37', '2', '81', '胶州市', '山东省', '青岛市', '胶州市', '', '0', '2', 'JZS', '0');
INSERT INTO `t_system_region_info` VALUES ('370282', '37', '2', '82', '即墨市', '山东省', '青岛市', '即墨市', '', '0', '2', 'JMS', '0');
INSERT INTO `t_system_region_info` VALUES ('370283', '37', '2', '83', '平度市', '山东省', '青岛市', '平度市', '', '0', '2', 'PDS', '0');
INSERT INTO `t_system_region_info` VALUES ('370284', '37', '2', '84', '胶南市', '山东省', '青岛市', '胶南市', '', '0', '2', 'JNS', '0');
INSERT INTO `t_system_region_info` VALUES ('370285', '37', '2', '85', '莱西市', '山东省', '青岛市', '莱西市', '', '0', '2', 'LXS', '0');
INSERT INTO `t_system_region_info` VALUES ('370300', '37', '3', '0', '淄博市', '山东省', '淄博市', '', '', '0', '1', 'ZBS', '0');
INSERT INTO `t_system_region_info` VALUES ('370301', '37', '3', '1', '市辖区', '山东省', '淄博市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370302', '37', '3', '2', '淄川区', '山东省', '淄博市', '淄川区', '', '0', '2', 'ZCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370303', '37', '3', '3', '张店区', '山东省', '淄博市', '张店区', '', '0', '2', 'ZDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370304', '37', '3', '4', '博山区', '山东省', '淄博市', '博山区', '', '0', '2', 'BSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370305', '37', '3', '5', '临淄区', '山东省', '淄博市', '临淄区', '', '0', '2', 'LZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370306', '37', '3', '6', '周村区', '山东省', '淄博市', '周村区', '', '0', '2', 'ZCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370321', '37', '3', '21', '桓台县', '山东省', '淄博市', '桓台县', '', '0', '2', 'HTX', '0');
INSERT INTO `t_system_region_info` VALUES ('370322', '37', '3', '22', '高青县', '山东省', '淄博市', '高青县', '', '0', '2', 'GQX', '0');
INSERT INTO `t_system_region_info` VALUES ('370323', '37', '3', '23', '沂源县', '山东省', '淄博市', '沂源县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('370400', '37', '4', '0', '枣庄市', '山东省', '枣庄市', '', '', '0', '1', 'ZZS', '0');
INSERT INTO `t_system_region_info` VALUES ('370401', '37', '4', '1', '市辖区', '山东省', '枣庄市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370402', '37', '4', '2', '市中区', '山东省', '枣庄市', '市中区', '', '0', '2', 'SZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370403', '37', '4', '3', '薛城区', '山东省', '枣庄市', '薛城区', '', '0', '2', 'XCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370404', '37', '4', '4', '峄城区', '山东省', '枣庄市', '峄城区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370405', '37', '4', '5', '台儿庄区', '山东省', '枣庄市', '台儿庄区', '', '0', '2', 'TEZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370406', '37', '4', '6', '山亭区', '山东省', '枣庄市', '山亭区', '', '0', '2', 'STQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370481', '37', '4', '81', '滕州市', '山东省', '枣庄市', '滕州市', '', '0', '2', 'TZS', '0');
INSERT INTO `t_system_region_info` VALUES ('370500', '37', '5', '0', '东营市', '山东省', '东营市', '', '', '0', '1', 'DYS', '0');
INSERT INTO `t_system_region_info` VALUES ('370501', '37', '5', '1', '市辖区', '山东省', '东营市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370502', '37', '5', '2', '东营区', '山东省', '东营市', '东营区', '', '0', '2', 'DYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370503', '37', '5', '3', '河口区', '山东省', '东营市', '河口区', '', '0', '2', 'HKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370521', '37', '5', '21', '垦利县', '山东省', '东营市', '垦利县', '', '0', '2', 'KLX', '0');
INSERT INTO `t_system_region_info` VALUES ('370522', '37', '5', '22', '利津县', '山东省', '东营市', '利津县', '', '0', '2', 'LJX', '0');
INSERT INTO `t_system_region_info` VALUES ('370523', '37', '5', '23', '广饶县', '山东省', '东营市', '广饶县', '', '0', '2', 'ARX', '0');
INSERT INTO `t_system_region_info` VALUES ('370600', '37', '6', '0', '烟台市', '山东省', '烟台市', '', '', '0', '1', 'YTS', '0');
INSERT INTO `t_system_region_info` VALUES ('370601', '37', '6', '1', '市辖区', '山东省', '烟台市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370602', '37', '6', '2', '芝罘区', '山东省', '烟台市', '芝罘区', '', '0', '2', 'ZFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370611', '37', '6', '11', '福山区', '山东省', '烟台市', '福山区', '', '0', '2', 'FSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370612', '37', '6', '12', '牟平区', '山东省', '烟台市', '牟平区', '', '0', '2', 'MPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370613', '37', '6', '13', '莱山区', '山东省', '烟台市', '莱山区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370634', '37', '6', '34', '长岛县', '山东省', '烟台市', '长岛县', '', '0', '2', 'CDX', '0');
INSERT INTO `t_system_region_info` VALUES ('370681', '37', '6', '81', '龙口市', '山东省', '烟台市', '龙口市', '', '0', '2', 'LKS', '0');
INSERT INTO `t_system_region_info` VALUES ('370682', '37', '6', '82', '莱阳市', '山东省', '烟台市', '莱阳市', '', '0', '2', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('370683', '37', '6', '83', '莱州市', '山东省', '烟台市', '莱州市', '', '0', '2', 'LZS', '0');
INSERT INTO `t_system_region_info` VALUES ('370684', '37', '6', '84', '蓬莱市', '山东省', '烟台市', '蓬莱市', '', '0', '2', 'PLS', '0');
INSERT INTO `t_system_region_info` VALUES ('370685', '37', '6', '85', '招远市', '山东省', '烟台市', '招远市', '', '0', '2', 'ZYS', '0');
INSERT INTO `t_system_region_info` VALUES ('370686', '37', '6', '86', '栖霞市', '山东省', '烟台市', '栖霞市', '', '0', '2', 'QXS', '0');
INSERT INTO `t_system_region_info` VALUES ('370687', '37', '6', '87', '海阳市', '山东省', '烟台市', '海阳市', '', '0', '2', 'HYS', '0');
INSERT INTO `t_system_region_info` VALUES ('370700', '37', '7', '0', '潍坊市', '山东省', '潍坊市', '', '', '0', '1', 'WFS', '0');
INSERT INTO `t_system_region_info` VALUES ('370701', '37', '7', '1', '市辖区', '山东省', '潍坊市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370702', '37', '7', '2', '潍城区', '山东省', '潍坊市', '潍城区', '', '0', '2', 'WCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370703', '37', '7', '3', '寒亭区', '山东省', '潍坊市', '寒亭区', '', '0', '2', 'HTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370704', '37', '7', '4', '坊子区', '山东省', '潍坊市', '坊子区', '', '0', '2', 'FZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370705', '37', '7', '5', '奎文区', '山东省', '潍坊市', '奎文区', '', '0', '2', 'KWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370724', '37', '7', '24', '临朐县', '山东省', '潍坊市', '临朐县', '', '0', '2', 'LQX', '0');
INSERT INTO `t_system_region_info` VALUES ('370725', '37', '7', '25', '昌乐县', '山东省', '潍坊市', '昌乐县', '', '0', '2', 'CLX', '0');
INSERT INTO `t_system_region_info` VALUES ('370781', '37', '7', '81', '青州市', '山东省', '潍坊市', '青州市', '', '0', '2', 'QZS', '0');
INSERT INTO `t_system_region_info` VALUES ('370782', '37', '7', '82', '诸城市', '山东省', '潍坊市', '诸城市', '', '0', '2', 'ZCS', '0');
INSERT INTO `t_system_region_info` VALUES ('370783', '37', '7', '83', '寿光市', '山东省', '潍坊市', '寿光市', '', '0', '2', 'SGS', '0');
INSERT INTO `t_system_region_info` VALUES ('370784', '37', '7', '84', '安丘市', '山东省', '潍坊市', '安丘市', '', '0', '2', 'AQS', '0');
INSERT INTO `t_system_region_info` VALUES ('370785', '37', '7', '85', '高密市', '山东省', '潍坊市', '高密市', '', '0', '2', 'GMS', '0');
INSERT INTO `t_system_region_info` VALUES ('370786', '37', '7', '86', '昌邑市', '山东省', '潍坊市', '昌邑市', '', '0', '2', 'CYS', '0');
INSERT INTO `t_system_region_info` VALUES ('370800', '37', '8', '0', '济宁市', '山东省', '济宁市', '', '', '0', '1', 'JNS', '0');
INSERT INTO `t_system_region_info` VALUES ('370801', '37', '8', '1', '市辖区', '山东省', '济宁市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370802', '37', '8', '2', '市中区', '山东省', '济宁市', '市中区', '', '0', '2', 'SZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370811', '37', '8', '11', '任城区', '山东省', '济宁市', '任城区', '', '0', '2', 'RCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370826', '37', '8', '26', '微山县', '山东省', '济宁市', '微山县', '', '0', '2', 'WSX', '0');
INSERT INTO `t_system_region_info` VALUES ('370827', '37', '8', '27', '鱼台县', '山东省', '济宁市', '鱼台县', '', '0', '2', 'YTX', '0');
INSERT INTO `t_system_region_info` VALUES ('370828', '37', '8', '28', '金乡县', '山东省', '济宁市', '金乡县', '', '0', '2', 'JXX', '0');
INSERT INTO `t_system_region_info` VALUES ('370829', '37', '8', '29', '嘉祥县', '山东省', '济宁市', '嘉祥县', '', '0', '2', 'JXX', '0');
INSERT INTO `t_system_region_info` VALUES ('370830', '37', '8', '30', '汶上县', '山东省', '济宁市', '汶上县', '', '0', '2', 'WSX', '0');
INSERT INTO `t_system_region_info` VALUES ('370831', '37', '8', '31', '泗水县', '山东省', '济宁市', '泗水县', '', '0', '2', 'SSX', '0');
INSERT INTO `t_system_region_info` VALUES ('370832', '37', '8', '32', '梁山县', '山东省', '济宁市', '梁山县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('370881', '37', '8', '81', '曲阜市', '山东省', '济宁市', '曲阜市', '', '0', '2', 'QFS', '0');
INSERT INTO `t_system_region_info` VALUES ('370882', '37', '8', '82', '兖州市', '山东省', '济宁市', '兖州市', '', '0', '2', 'YZS', '0');
INSERT INTO `t_system_region_info` VALUES ('370883', '37', '8', '83', '邹城市', '山东省', '济宁市', '邹城市', '', '0', '2', 'ZCS', '0');
INSERT INTO `t_system_region_info` VALUES ('370900', '37', '9', '0', '泰安市', '山东省', '泰安市', '', '', '0', '1', 'TAS', '0');
INSERT INTO `t_system_region_info` VALUES ('370901', '37', '9', '1', '市辖区', '山东省', '泰安市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370902', '37', '9', '2', '泰山区', '山东省', '泰安市', '泰山区', '', '0', '2', 'TSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370911', '37', '9', '11', '岱岳区', '山东省', '泰安市', '岱岳区', '', '0', '2', 'DYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('370921', '37', '9', '21', '宁阳县', '山东省', '泰安市', '宁阳县', '', '0', '2', 'NYX', '0');
INSERT INTO `t_system_region_info` VALUES ('370923', '37', '9', '23', '东平县', '山东省', '泰安市', '东平县', '', '0', '2', 'DPX', '0');
INSERT INTO `t_system_region_info` VALUES ('370982', '37', '9', '82', '新泰市', '山东省', '泰安市', '新泰市', '', '0', '2', 'XTS', '0');
INSERT INTO `t_system_region_info` VALUES ('370983', '37', '9', '83', '肥城市', '山东省', '泰安市', '肥城市', '', '0', '2', 'FCS', '0');
INSERT INTO `t_system_region_info` VALUES ('371000', '37', '10', '0', '威海市', '山东省', '威海市', '', '', '0', '1', 'WHS', '0');
INSERT INTO `t_system_region_info` VALUES ('371001', '37', '10', '1', '市辖区', '山东省', '威海市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371002', '37', '10', '2', '环翠区', '山东省', '威海市', '环翠区', '', '0', '2', 'HCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371081', '37', '10', '81', '文登市', '山东省', '威海市', '文登市', '', '0', '2', 'WDS', '0');
INSERT INTO `t_system_region_info` VALUES ('371082', '37', '10', '82', '荣成市', '山东省', '威海市', '荣成市', '', '0', '2', 'RCS', '0');
INSERT INTO `t_system_region_info` VALUES ('371083', '37', '10', '83', '乳山市', '山东省', '威海市', '乳山市', '', '0', '2', 'RSS', '0');
INSERT INTO `t_system_region_info` VALUES ('371100', '37', '11', '0', '日照市', '山东省', '日照市', '', '', '0', '1', 'RZS', '0');
INSERT INTO `t_system_region_info` VALUES ('371101', '37', '11', '1', '市辖区', '山东省', '日照市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371102', '37', '11', '2', '东港区', '山东省', '日照市', '东港区', '', '0', '2', 'DGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371103', '37', '11', '3', '岚山区', '山东省', '日照市', '岚山区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371121', '37', '11', '21', '五莲县', '山东省', '日照市', '五莲县', '', '0', '2', 'WLX', '0');
INSERT INTO `t_system_region_info` VALUES ('371122', '37', '11', '22', '莒县', '山东省', '日照市', '莒县', '', '0', '2', 'JX', '0');
INSERT INTO `t_system_region_info` VALUES ('371200', '37', '12', '0', '莱芜市', '山东省', '莱芜市', '', '', '0', '1', 'LWS', '0');
INSERT INTO `t_system_region_info` VALUES ('371201', '37', '12', '1', '市辖区', '山东省', '莱芜市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371202', '37', '12', '2', '莱城区', '山东省', '莱芜市', '莱城区', '', '0', '2', 'LCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371203', '37', '12', '3', '钢城区', '山东省', '莱芜市', '钢城区', '', '0', '2', 'GCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371300', '37', '13', '0', '临沂市', '山东省', '临沂市', '', '', '0', '1', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('371301', '37', '13', '1', '市辖区', '山东省', '临沂市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371302', '37', '13', '2', '兰山区', '山东省', '临沂市', '兰山区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371311', '37', '13', '11', '罗庄区', '山东省', '临沂市', '罗庄区', '', '0', '2', 'LZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371312', '37', '13', '12', '河东区', '山东省', '临沂市', '河东区', '', '0', '2', 'HDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371321', '37', '13', '21', '沂南县', '山东省', '临沂市', '沂南县', '', '0', '2', 'YNX', '0');
INSERT INTO `t_system_region_info` VALUES ('371322', '37', '13', '22', '郯城县', '山东省', '临沂市', '郯城县', '', '0', '2', 'TCX', '0');
INSERT INTO `t_system_region_info` VALUES ('371323', '37', '13', '23', '沂水县', '山东省', '临沂市', '沂水县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('371324', '37', '13', '24', '苍山县', '山东省', '临沂市', '苍山县', '', '0', '2', 'CSX', '0');
INSERT INTO `t_system_region_info` VALUES ('371325', '37', '13', '25', '费县', '山东省', '临沂市', '费县', '', '0', '2', 'FX', '0');
INSERT INTO `t_system_region_info` VALUES ('371326', '37', '13', '26', '平邑县', '山东省', '临沂市', '平邑县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('371327', '37', '13', '27', '莒南县', '山东省', '临沂市', '莒南县', '', '0', '2', 'JNX', '0');
INSERT INTO `t_system_region_info` VALUES ('371328', '37', '13', '28', '蒙阴县', '山东省', '临沂市', '蒙阴县', '', '0', '2', 'MYX', '0');
INSERT INTO `t_system_region_info` VALUES ('371329', '37', '13', '29', '临沭县', '山东省', '临沂市', '临沭县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('371400', '37', '14', '0', '德州市', '山东省', '德州市', '', '', '0', '1', 'DZS', '0');
INSERT INTO `t_system_region_info` VALUES ('371401', '37', '14', '1', '市辖区', '山东省', '德州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371402', '37', '14', '2', '德城区', '山东省', '德州市', '德城区', '', '0', '2', 'DCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371421', '37', '14', '21', '陵县', '山东省', '德州市', '陵县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('371422', '37', '14', '22', '宁津县', '山东省', '德州市', '宁津县', '', '0', '2', 'NJX', '0');
INSERT INTO `t_system_region_info` VALUES ('371423', '37', '14', '23', '庆云县', '山东省', '德州市', '庆云县', '', '0', '2', 'QYX', '0');
INSERT INTO `t_system_region_info` VALUES ('371424', '37', '14', '24', '临邑县', '山东省', '德州市', '临邑县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('371425', '37', '14', '25', '齐河县', '山东省', '德州市', '齐河县', '', '0', '2', 'JHX', '0');
INSERT INTO `t_system_region_info` VALUES ('371426', '37', '14', '26', '平原县', '山东省', '德州市', '平原县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('371427', '37', '14', '27', '夏津县', '山东省', '德州市', '夏津县', '', '0', '2', 'XJX', '0');
INSERT INTO `t_system_region_info` VALUES ('371428', '37', '14', '28', '武城县', '山东省', '德州市', '武城县', '', '0', '2', 'WCX', '0');
INSERT INTO `t_system_region_info` VALUES ('371481', '37', '14', '81', '乐陵市', '山东省', '德州市', '乐陵市', '', '0', '2', 'LLS', '0');
INSERT INTO `t_system_region_info` VALUES ('371482', '37', '14', '82', '禹城市', '山东省', '德州市', '禹城市', '', '0', '2', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('371500', '37', '15', '0', '聊城市', '山东省', '聊城市', '', '', '0', '1', 'LCS', '0');
INSERT INTO `t_system_region_info` VALUES ('371501', '37', '15', '1', '市辖区', '山东省', '聊城市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371502', '37', '15', '2', '东昌府区', '山东省', '聊城市', '东昌府区', '', '0', '2', 'DCFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371521', '37', '15', '21', '阳谷县', '山东省', '聊城市', '阳谷县', '', '0', '2', 'YGX', '0');
INSERT INTO `t_system_region_info` VALUES ('371522', '37', '15', '22', '莘县', '山东省', '聊城市', '莘县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('371523', '37', '15', '23', '茌平县', '山东省', '聊城市', '茌平县', '', '0', '2', 'CPX', '0');
INSERT INTO `t_system_region_info` VALUES ('371524', '37', '15', '24', '东阿县', '山东省', '聊城市', '东阿县', '', '0', '2', 'DAX', '0');
INSERT INTO `t_system_region_info` VALUES ('371525', '37', '15', '25', '冠县', '山东省', '聊城市', '冠县', '', '0', '2', 'GX', '0');
INSERT INTO `t_system_region_info` VALUES ('371526', '37', '15', '26', '高唐县', '山东省', '聊城市', '高唐县', '', '0', '2', 'GTX', '0');
INSERT INTO `t_system_region_info` VALUES ('371581', '37', '15', '81', '临清市', '山东省', '聊城市', '临清市', '', '0', '2', 'LQS', '0');
INSERT INTO `t_system_region_info` VALUES ('371600', '37', '16', '0', '滨州市', '山东省', '滨州市', '', '', '0', '1', 'BZS', '0');
INSERT INTO `t_system_region_info` VALUES ('371601', '37', '16', '1', '市辖区', '山东省', '滨州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371602', '37', '16', '2', '滨城区', '山东省', '滨州市', '滨城区', '', '0', '2', 'BCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371621', '37', '16', '21', '惠民县', '山东省', '滨州市', '惠民县', '', '0', '2', 'HMX', '0');
INSERT INTO `t_system_region_info` VALUES ('371622', '37', '16', '22', '阳信县', '山东省', '滨州市', '阳信县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('371623', '37', '16', '23', '无棣县', '山东省', '滨州市', '无棣县', '', '0', '2', 'MDX', '0');
INSERT INTO `t_system_region_info` VALUES ('371624', '37', '16', '24', '沾化县', '山东省', '滨州市', '沾化县', '', '0', '2', 'ZHX', '0');
INSERT INTO `t_system_region_info` VALUES ('371625', '37', '16', '25', '博兴县', '山东省', '滨州市', '博兴县', '', '0', '2', 'BXX', '0');
INSERT INTO `t_system_region_info` VALUES ('371626', '37', '16', '26', '邹平县', '山东省', '滨州市', '邹平县', '', '0', '2', 'ZPX', '0');
INSERT INTO `t_system_region_info` VALUES ('371700', '37', '17', '0', '菏泽市', '山东省', '菏泽市', '', '', '0', '1', 'HZS', '0');
INSERT INTO `t_system_region_info` VALUES ('371701', '37', '17', '1', '市辖区', '山东省', '菏泽市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371702', '37', '17', '2', '牡丹区', '山东省', '菏泽市', '牡丹区', '', '0', '2', 'MDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('371721', '37', '17', '21', '曹县', '山东省', '菏泽市', '曹县', '', '0', '2', 'CX', '0');
INSERT INTO `t_system_region_info` VALUES ('371722', '37', '17', '22', '单县', '山东省', '菏泽市', '单县', '', '0', '2', 'CX', '0');
INSERT INTO `t_system_region_info` VALUES ('371723', '37', '17', '23', '成武县', '山东省', '菏泽市', '成武县', '', '0', '2', 'CWX', '0');
INSERT INTO `t_system_region_info` VALUES ('371724', '37', '17', '24', '巨野县', '山东省', '菏泽市', '巨野县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('371725', '37', '17', '25', '郓城县', '山东省', '菏泽市', '郓城县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('371726', '37', '17', '26', '鄄城县', '山东省', '菏泽市', '鄄城县', '', '0', '2', 'JCX', '0');
INSERT INTO `t_system_region_info` VALUES ('371727', '37', '17', '27', '定陶县', '山东省', '菏泽市', '定陶县', '', '0', '2', 'DTX', '0');
INSERT INTO `t_system_region_info` VALUES ('371728', '37', '17', '28', '东明县', '山东省', '菏泽市', '东明县', '', '0', '2', 'DMX', '0');
INSERT INTO `t_system_region_info` VALUES ('410000', '41', '0', '0', '河南省', '河南省', '', '', '', '0', '0', 'HNS', '0');
INSERT INTO `t_system_region_info` VALUES ('410100', '41', '1', '0', '郑州市', '河南省', '郑州市', '', '', '0', '1', 'ZZS', '0');
INSERT INTO `t_system_region_info` VALUES ('410101', '41', '1', '1', '市辖区', '河南省', '郑州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410102', '41', '1', '2', '中原区', '河南省', '郑州市', '中原区', '', '0', '2', 'ZYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410103', '41', '1', '3', '二七区', '河南省', '郑州市', '二七区', '', '0', '2', 'EQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410104', '41', '1', '4', '管城回族区', '河南省', '郑州市', '管城回族区', '', '0', '2', 'GCHZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410105', '41', '1', '5', '金水区', '河南省', '郑州市', '金水区', '', '0', '2', 'JSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410106', '41', '1', '6', '上街区', '河南省', '郑州市', '上街区', '', '0', '2', 'SJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410108', '41', '1', '8', '惠济区', '河南省', '郑州市', '惠济区', '', '0', '2', 'HJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410109', '41', '1', '9', '郑东新区', '河南省', '郑州市', '郑东新区', '', '0', '2', 'ZDXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410110', '41', '1', '10', '高新区', '河南省', '郑州市', '高新区', '', '0', '2', 'GXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410111', '41', '1', '11', '经开区', '河南省', '郑州市', '经开区', '', '0', '2', 'JKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410122', '41', '1', '22', '中牟县', '河南省', '郑州市', '中牟县', '', '0', '2', 'ZMX', '0');
INSERT INTO `t_system_region_info` VALUES ('410181', '41', '1', '81', '巩义市', '河南省', '郑州市', '巩义市', '', '0', '2', 'GYS', '0');
INSERT INTO `t_system_region_info` VALUES ('410182', '41', '1', '82', '荥阳市', '河南省', '郑州市', '荥阳市', '', '0', '2', 'XYS', '0');
INSERT INTO `t_system_region_info` VALUES ('410183', '41', '1', '83', '新密市', '河南省', '郑州市', '新密市', '', '0', '2', 'XMS', '0');
INSERT INTO `t_system_region_info` VALUES ('410184', '41', '1', '84', '新郑市', '河南省', '郑州市', '新郑市', '', '0', '2', 'XZS', '0');
INSERT INTO `t_system_region_info` VALUES ('410185', '41', '1', '85', '登封市', '河南省', '郑州市', '登封市', '', '0', '2', 'DFS', '0');
INSERT INTO `t_system_region_info` VALUES ('410200', '41', '2', '0', '开封市', '河南省', '开封市', '', '', '0', '1', 'KFS', '0');
INSERT INTO `t_system_region_info` VALUES ('410201', '41', '2', '1', '市辖区', '河南省', '开封市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410202', '41', '2', '2', '龙亭区', '河南省', '开封市', '龙亭区', '', '0', '2', 'LTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410203', '41', '2', '3', '顺河回族区', '河南省', '开封市', '顺河回族区', '', '0', '2', 'SHHZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410204', '41', '2', '4', '鼓楼区', '河南省', '开封市', '鼓楼区', '', '0', '2', 'GLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410205', '41', '2', '5', '禹王台区', '河南省', '开封市', '禹王台区', '', '0', '2', 'YWTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410211', '41', '2', '11', '金明区', '河南省', '开封市', '金明区', '', '0', '2', 'JMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410221', '41', '2', '21', '杞县', '河南省', '开封市', '杞县', '', '0', '2', 'QX', '0');
INSERT INTO `t_system_region_info` VALUES ('410222', '41', '2', '22', '通许县', '河南省', '开封市', '通许县', '', '0', '2', 'TXX', '0');
INSERT INTO `t_system_region_info` VALUES ('410223', '41', '2', '23', '尉氏县', '河南省', '开封市', '尉氏县', '', '0', '2', 'WSX', '0');
INSERT INTO `t_system_region_info` VALUES ('410224', '41', '2', '24', '开封县', '河南省', '开封市', '开封县', '', '0', '2', 'KFX', '0');
INSERT INTO `t_system_region_info` VALUES ('410225', '41', '2', '25', '兰考县', '河南省', '开封市', '兰考县', '', '0', '2', 'LKX', '0');
INSERT INTO `t_system_region_info` VALUES ('410300', '41', '3', '0', '洛阳市', '河南省', '洛阳市', '', '', '0', '1', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('410301', '41', '3', '1', '市辖区', '河南省', '洛阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410302', '41', '3', '2', '老城区', '河南省', '洛阳市', '老城区', '', '0', '2', 'LCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410303', '41', '3', '3', '西工区', '河南省', '洛阳市', '西工区', '', '0', '2', 'XGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410304', '41', '3', '4', '瀍河回族区', '河南省', '洛阳市', '瀍河回族区', '', '0', '2', '瀍HHZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410305', '41', '3', '5', '涧西区', '河南省', '洛阳市', '涧西区', '', '0', '2', 'JXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410306', '41', '3', '6', '吉利区', '河南省', '洛阳市', '吉利区', '', '0', '2', 'JLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410311', '41', '3', '11', '洛龙区', '河南省', '洛阳市', '洛龙区', '', '0', '2', 'LLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410322', '41', '3', '22', '孟津县', '河南省', '洛阳市', '孟津县', '', '0', '2', 'MJX', '0');
INSERT INTO `t_system_region_info` VALUES ('410323', '41', '3', '23', '新安县', '河南省', '洛阳市', '新安县', '', '0', '2', 'XAX', '0');
INSERT INTO `t_system_region_info` VALUES ('410324', '41', '3', '24', '栾川县', '河南省', '洛阳市', '栾川县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('410325', '41', '3', '25', '嵩县', '河南省', '洛阳市', '嵩县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('410326', '41', '3', '26', '汝阳县', '河南省', '洛阳市', '汝阳县', '', '0', '2', 'RYX', '0');
INSERT INTO `t_system_region_info` VALUES ('410327', '41', '3', '27', '宜阳县', '河南省', '洛阳市', '宜阳县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('410328', '41', '3', '28', '洛宁县', '河南省', '洛阳市', '洛宁县', '', '0', '2', 'LNX', '0');
INSERT INTO `t_system_region_info` VALUES ('410329', '41', '3', '29', '伊川县', '河南省', '洛阳市', '伊川县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('410381', '41', '3', '81', '偃师市', '河南省', '洛阳市', '偃师市', '', '0', '2', 'YSS', '0');
INSERT INTO `t_system_region_info` VALUES ('410400', '41', '4', '0', '平顶山市', '河南省', '平顶山市', '', '', '0', '1', 'PDSS', '0');
INSERT INTO `t_system_region_info` VALUES ('410401', '41', '4', '1', '市辖区', '河南省', '平顶山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410402', '41', '4', '2', '新华区', '河南省', '平顶山市', '新华区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410403', '41', '4', '3', '卫东区', '河南省', '平顶山市', '卫东区', '', '0', '2', 'WDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410404', '41', '4', '4', '石龙区', '河南省', '平顶山市', '石龙区', '', '0', '2', 'SLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410411', '41', '4', '11', '湛河区', '河南省', '平顶山市', '湛河区', '', '0', '2', 'ZHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410421', '41', '4', '21', '宝丰县', '河南省', '平顶山市', '宝丰县', '', '0', '2', 'BFX', '0');
INSERT INTO `t_system_region_info` VALUES ('410422', '41', '4', '22', '叶县', '河南省', '平顶山市', '叶县', '', '0', '2', 'XX', '0');
INSERT INTO `t_system_region_info` VALUES ('410423', '41', '4', '23', '鲁山县', '河南省', '平顶山市', '鲁山县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('410425', '41', '4', '25', '郏县', '河南省', '平顶山市', '郏县', '', '0', '2', 'JX', '0');
INSERT INTO `t_system_region_info` VALUES ('410481', '41', '4', '81', '舞钢市', '河南省', '平顶山市', '舞钢市', '', '0', '2', 'WGS', '0');
INSERT INTO `t_system_region_info` VALUES ('410482', '41', '4', '82', '汝州市', '河南省', '平顶山市', '汝州市', '', '0', '2', 'RZS', '0');
INSERT INTO `t_system_region_info` VALUES ('410500', '41', '5', '0', '安阳市', '河南省', '安阳市', '', '', '0', '1', 'AYS', '0');
INSERT INTO `t_system_region_info` VALUES ('410501', '41', '5', '1', '市辖区', '河南省', '安阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410502', '41', '5', '2', '文峰区', '河南省', '安阳市', '文峰区', '', '0', '2', 'WFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410503', '41', '5', '3', '北关区', '河南省', '安阳市', '北关区', '', '0', '2', 'BGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410505', '41', '5', '5', '殷都区', '河南省', '安阳市', '殷都区', '', '0', '2', 'YDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410506', '41', '5', '6', '龙安区', '河南省', '安阳市', '龙安区', '', '0', '2', 'LAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410522', '41', '5', '22', '安阳县', '河南省', '安阳市', '安阳县', '', '0', '2', 'AYX', '0');
INSERT INTO `t_system_region_info` VALUES ('410523', '41', '5', '23', '汤阴县', '河南省', '安阳市', '汤阴县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('410526', '41', '5', '26', '滑县', '河南省', '安阳市', '滑县', '', '0', '2', 'HX', '0');
INSERT INTO `t_system_region_info` VALUES ('410527', '41', '5', '27', '内黄县', '河南省', '安阳市', '内黄县', '', '0', '2', 'NHX', '0');
INSERT INTO `t_system_region_info` VALUES ('410581', '41', '5', '81', '林州市', '河南省', '安阳市', '林州市', '', '0', '2', 'LZS', '0');
INSERT INTO `t_system_region_info` VALUES ('410600', '41', '6', '0', '鹤壁市', '河南省', '鹤壁市', '', '', '0', '1', 'HBS', '0');
INSERT INTO `t_system_region_info` VALUES ('410601', '41', '6', '1', '市辖区', '河南省', '鹤壁市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410602', '41', '6', '2', '鹤山区', '河南省', '鹤壁市', '鹤山区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410603', '41', '6', '3', '山城区', '河南省', '鹤壁市', '山城区', '', '0', '2', 'SCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410611', '41', '6', '11', '淇滨区', '河南省', '鹤壁市', '淇滨区', '', '0', '2', 'QBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410621', '41', '6', '21', '浚县', '河南省', '鹤壁市', '浚县', '', '0', '2', 'JX', '0');
INSERT INTO `t_system_region_info` VALUES ('410622', '41', '6', '22', '淇县', '河南省', '鹤壁市', '淇县', '', '0', '2', 'QX', '0');
INSERT INTO `t_system_region_info` VALUES ('410700', '41', '7', '0', '新乡市', '河南省', '新乡市', '', '', '0', '1', 'XXS', '0');
INSERT INTO `t_system_region_info` VALUES ('410701', '41', '7', '1', '市辖区', '河南省', '新乡市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410702', '41', '7', '2', '红旗区', '河南省', '新乡市', '红旗区', '', '0', '2', 'GQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410703', '41', '7', '3', '卫滨区', '河南省', '新乡市', '卫滨区', '', '0', '2', 'WBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410704', '41', '7', '4', '凤泉区', '河南省', '新乡市', '凤泉区', '', '0', '2', 'FQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410711', '41', '7', '11', '牧野区', '河南省', '新乡市', '牧野区', '', '0', '2', 'MYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410721', '41', '7', '21', '新乡县', '河南省', '新乡市', '新乡县', '', '0', '2', 'XXX', '0');
INSERT INTO `t_system_region_info` VALUES ('410724', '41', '7', '24', '获嘉县', '河南省', '新乡市', '获嘉县', '', '0', '2', 'HJX', '0');
INSERT INTO `t_system_region_info` VALUES ('410725', '41', '7', '25', '原阳县', '河南省', '新乡市', '原阳县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('410726', '41', '7', '26', '延津县', '河南省', '新乡市', '延津县', '', '0', '2', 'YJX', '0');
INSERT INTO `t_system_region_info` VALUES ('410727', '41', '7', '27', '封丘县', '河南省', '新乡市', '封丘县', '', '0', '2', 'FQX', '0');
INSERT INTO `t_system_region_info` VALUES ('410728', '41', '7', '28', '长垣县', '河南省', '新乡市', '长垣县', '', '0', '2', 'CYX', '0');
INSERT INTO `t_system_region_info` VALUES ('410781', '41', '7', '81', '卫辉市', '河南省', '新乡市', '卫辉市', '', '0', '2', 'WHS', '0');
INSERT INTO `t_system_region_info` VALUES ('410782', '41', '7', '82', '辉县市', '河南省', '新乡市', '辉县市', '', '0', '2', 'HXS', '0');
INSERT INTO `t_system_region_info` VALUES ('410800', '41', '8', '0', '焦作市', '河南省', '焦作市', '', '', '0', '1', 'JZS', '0');
INSERT INTO `t_system_region_info` VALUES ('410801', '41', '8', '1', '市辖区', '河南省', '焦作市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410802', '41', '8', '2', '解放区', '河南省', '焦作市', '解放区', '', '0', '2', 'JFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410803', '41', '8', '3', '中站区', '河南省', '焦作市', '中站区', '', '0', '2', 'ZZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410804', '41', '8', '4', '马村区', '河南省', '焦作市', '马村区', '', '0', '2', 'MCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410811', '41', '8', '11', '山阳区', '河南省', '焦作市', '山阳区', '', '0', '2', 'SYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410821', '41', '8', '21', '修武县', '河南省', '焦作市', '修武县', '', '0', '2', 'XWX', '0');
INSERT INTO `t_system_region_info` VALUES ('410822', '41', '8', '22', '博爱县', '河南省', '焦作市', '博爱县', '', '0', '2', 'BAX', '0');
INSERT INTO `t_system_region_info` VALUES ('410823', '41', '8', '23', '武陟县', '河南省', '焦作市', '武陟县', '', '0', '2', 'WZX', '0');
INSERT INTO `t_system_region_info` VALUES ('410825', '41', '8', '25', '温县', '河南省', '焦作市', '温县', '', '0', '2', 'WX', '0');
INSERT INTO `t_system_region_info` VALUES ('410882', '41', '8', '82', '沁阳市', '河南省', '焦作市', '沁阳市', '', '0', '2', 'QYS', '0');
INSERT INTO `t_system_region_info` VALUES ('410883', '41', '8', '83', '孟州市', '河南省', '焦作市', '孟州市', '', '0', '2', 'MZS', '0');
INSERT INTO `t_system_region_info` VALUES ('410900', '41', '9', '0', '濮阳市', '河南省', '濮阳市', '', '', '0', '1', 'PYS', '0');
INSERT INTO `t_system_region_info` VALUES ('410901', '41', '9', '1', '市辖区', '河南省', '濮阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410902', '41', '9', '2', '华龙区', '河南省', '濮阳市', '华龙区', '', '0', '2', 'HLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('410922', '41', '9', '22', '清丰县', '河南省', '濮阳市', '清丰县', '', '0', '2', 'QFX', '0');
INSERT INTO `t_system_region_info` VALUES ('410923', '41', '9', '23', '南乐县', '河南省', '濮阳市', '南乐县', '', '0', '2', 'NLX', '0');
INSERT INTO `t_system_region_info` VALUES ('410926', '41', '9', '26', '范县', '河南省', '濮阳市', '范县', '', '0', '2', 'FX', '0');
INSERT INTO `t_system_region_info` VALUES ('410927', '41', '9', '27', '台前县', '河南省', '濮阳市', '台前县', '', '0', '2', 'TQX', '0');
INSERT INTO `t_system_region_info` VALUES ('410928', '41', '9', '28', '濮阳县', '河南省', '濮阳市', '濮阳县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411000', '41', '10', '0', '许昌市', '河南省', '许昌市', '', '', '0', '1', 'XCS', '0');
INSERT INTO `t_system_region_info` VALUES ('411001', '41', '10', '1', '市辖区', '河南省', '许昌市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411002', '41', '10', '2', '魏都区', '河南省', '许昌市', '魏都区', '', '0', '2', 'WDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411023', '41', '10', '23', '许昌县', '河南省', '许昌市', '许昌县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411024', '41', '10', '24', '鄢陵县', '河南省', '许昌市', '鄢陵县', '', '0', '2', 'YLX', '0');
INSERT INTO `t_system_region_info` VALUES ('411025', '41', '10', '25', '襄城县', '河南省', '许昌市', '襄城县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411081', '41', '10', '81', '禹州市', '河南省', '许昌市', '禹州市', '', '0', '2', 'YZS', '0');
INSERT INTO `t_system_region_info` VALUES ('411082', '41', '10', '82', '长葛市', '河南省', '许昌市', '长葛市', '', '0', '2', 'CGS', '0');
INSERT INTO `t_system_region_info` VALUES ('411100', '41', '11', '0', '漯河市', '河南省', '漯河市', '', '', '0', '1', 'LHS', '0');
INSERT INTO `t_system_region_info` VALUES ('411101', '41', '11', '1', '市辖区', '河南省', '漯河市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411102', '41', '11', '2', '源汇区', '河南省', '漯河市', '源汇区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411103', '41', '11', '3', '郾城区', '河南省', '漯河市', '郾城区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411104', '41', '11', '4', '召陵区', '河南省', '漯河市', '召陵区', '', '0', '2', 'SLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411121', '41', '11', '21', '舞阳县', '河南省', '漯河市', '舞阳县', '', '0', '2', 'WYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411122', '41', '11', '22', '临颍县', '河南省', '漯河市', '临颍县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411200', '41', '12', '0', '三门峡市', '河南省', '三门峡市', '', '', '0', '1', 'SMXS', '0');
INSERT INTO `t_system_region_info` VALUES ('411201', '41', '12', '1', '市辖区', '河南省', '三门峡市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411202', '41', '12', '2', '湖滨区', '河南省', '三门峡市', '湖滨区', '', '0', '2', 'HBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411221', '41', '12', '21', '渑池县', '河南省', '三门峡市', '渑池县', '', '0', '2', 'MCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411222', '41', '12', '22', '陕县', '河南省', '三门峡市', '陕县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('411224', '41', '12', '24', '卢氏县', '河南省', '三门峡市', '卢氏县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('411281', '41', '12', '81', '义马市', '河南省', '三门峡市', '义马市', '', '0', '2', 'YMS', '0');
INSERT INTO `t_system_region_info` VALUES ('411282', '41', '12', '82', '灵宝市', '河南省', '三门峡市', '灵宝市', '', '0', '2', 'LBS', '0');
INSERT INTO `t_system_region_info` VALUES ('411300', '41', '13', '0', '南阳市', '河南省', '南阳市', '', '', '0', '1', 'NYS', '0');
INSERT INTO `t_system_region_info` VALUES ('411301', '41', '13', '1', '市辖区', '河南省', '南阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411302', '41', '13', '2', '宛城区', '河南省', '南阳市', '宛城区', '', '0', '2', 'WCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411303', '41', '13', '3', '卧龙区', '河南省', '南阳市', '卧龙区', '', '0', '2', 'WLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411321', '41', '13', '21', '南召县', '河南省', '南阳市', '南召县', '', '0', '2', 'NSX', '0');
INSERT INTO `t_system_region_info` VALUES ('411322', '41', '13', '22', '方城县', '河南省', '南阳市', '方城县', '', '0', '2', 'FCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411323', '41', '13', '23', '西峡县', '河南省', '南阳市', '西峡县', '', '0', '2', 'XXX', '0');
INSERT INTO `t_system_region_info` VALUES ('411324', '41', '13', '24', '镇平县', '河南省', '南阳市', '镇平县', '', '0', '2', 'ZPX', '0');
INSERT INTO `t_system_region_info` VALUES ('411325', '41', '13', '25', '内乡县', '河南省', '南阳市', '内乡县', '', '0', '2', 'NXX', '0');
INSERT INTO `t_system_region_info` VALUES ('411326', '41', '13', '26', '淅川县', '河南省', '南阳市', '淅川县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411327', '41', '13', '27', '社旗县', '河南省', '南阳市', '社旗县', '', '0', '2', 'SQX', '0');
INSERT INTO `t_system_region_info` VALUES ('411328', '41', '13', '28', '唐河县', '河南省', '南阳市', '唐河县', '', '0', '2', 'THX', '0');
INSERT INTO `t_system_region_info` VALUES ('411329', '41', '13', '29', '新野县', '河南省', '南阳市', '新野县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411330', '41', '13', '30', '桐柏县', '河南省', '南阳市', '桐柏县', '', '0', '2', 'TBX', '0');
INSERT INTO `t_system_region_info` VALUES ('411381', '41', '13', '81', '邓州市', '河南省', '南阳市', '邓州市', '', '0', '2', 'DZS', '0');
INSERT INTO `t_system_region_info` VALUES ('411400', '41', '14', '0', '商丘市', '河南省', '商丘市', '', '', '0', '1', 'SQS', '0');
INSERT INTO `t_system_region_info` VALUES ('411401', '41', '14', '1', '市辖区', '河南省', '商丘市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411402', '41', '14', '2', '梁园区', '河南省', '商丘市', '梁园区', '', '0', '2', 'LYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411403', '41', '14', '3', '睢阳区', '河南省', '商丘市', '睢阳区', '', '0', '2', 'SYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411421', '41', '14', '21', '民权县', '河南省', '商丘市', '民权县', '', '0', '2', 'MQX', '0');
INSERT INTO `t_system_region_info` VALUES ('411422', '41', '14', '22', '睢县', '河南省', '商丘市', '睢县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('411423', '41', '14', '23', '宁陵县', '河南省', '商丘市', '宁陵县', '', '0', '2', 'NLX', '0');
INSERT INTO `t_system_region_info` VALUES ('411424', '41', '14', '24', '柘城县', '河南省', '商丘市', '柘城县', '', '0', '2', 'ZCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411425', '41', '14', '25', '虞城县', '河南省', '商丘市', '虞城县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411426', '41', '14', '26', '夏邑县', '河南省', '商丘市', '夏邑县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411481', '41', '14', '81', '永城市', '河南省', '商丘市', '永城市', '', '0', '2', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('411500', '41', '15', '0', '信阳市', '河南省', '信阳市', '', '', '0', '1', 'XYS', '0');
INSERT INTO `t_system_region_info` VALUES ('411501', '41', '15', '1', '市辖区', '河南省', '信阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411502', '41', '15', '2', '浉河区', '河南省', '信阳市', '浉河区', '', '0', '2', '浉HQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411503', '41', '15', '3', '平桥区', '河南省', '信阳市', '平桥区', '', '0', '2', 'PQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411521', '41', '15', '21', '罗山县', '河南省', '信阳市', '罗山县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('411522', '41', '15', '22', '光山县', '河南省', '信阳市', '光山县', '', '0', '2', 'GSX', '0');
INSERT INTO `t_system_region_info` VALUES ('411523', '41', '15', '23', '新县', '河南省', '信阳市', '新县', '', '0', '2', 'XX', '0');
INSERT INTO `t_system_region_info` VALUES ('411524', '41', '15', '24', '商城县', '河南省', '信阳市', '商城县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411525', '41', '15', '25', '固始县', '河南省', '信阳市', '固始县', '', '0', '2', 'GSX', '0');
INSERT INTO `t_system_region_info` VALUES ('411526', '41', '15', '26', '潢川县', '河南省', '信阳市', '潢川县', '', '0', '2', 'HCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411527', '41', '15', '27', '淮滨县', '河南省', '信阳市', '淮滨县', '', '0', '2', 'HBX', '0');
INSERT INTO `t_system_region_info` VALUES ('411528', '41', '15', '28', '息县', '河南省', '信阳市', '息县', '', '0', '2', 'XX', '0');
INSERT INTO `t_system_region_info` VALUES ('411600', '41', '16', '0', '周口市', '河南省', '周口市', '', '', '0', '1', 'ZKS', '0');
INSERT INTO `t_system_region_info` VALUES ('411601', '41', '16', '1', '市辖区', '河南省', '周口市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411602', '41', '16', '2', '川汇区', '河南省', '周口市', '川汇区', '', '0', '2', 'CHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411621', '41', '16', '21', '扶沟县', '河南省', '周口市', '扶沟县', '', '0', '2', 'FGX', '0');
INSERT INTO `t_system_region_info` VALUES ('411622', '41', '16', '22', '西华县', '河南省', '周口市', '西华县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('411623', '41', '16', '23', '商水县', '河南省', '周口市', '商水县', '', '0', '2', 'SSX', '0');
INSERT INTO `t_system_region_info` VALUES ('411624', '41', '16', '24', '沈丘县', '河南省', '周口市', '沈丘县', '', '0', '2', 'CQX', '0');
INSERT INTO `t_system_region_info` VALUES ('411625', '41', '16', '25', '郸城县', '河南省', '周口市', '郸城县', '', '0', '2', 'DCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411626', '41', '16', '26', '淮阳县', '河南省', '周口市', '淮阳县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411627', '41', '16', '27', '太康县', '河南省', '周口市', '太康县', '', '0', '2', 'TKX', '0');
INSERT INTO `t_system_region_info` VALUES ('411628', '41', '16', '28', '鹿邑县', '河南省', '周口市', '鹿邑县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411681', '41', '16', '81', '项城市', '河南省', '周口市', '项城市', '', '0', '2', 'XCS', '0');
INSERT INTO `t_system_region_info` VALUES ('411700', '41', '17', '0', '驻马店市', '河南省', '驻马店市', '', '', '0', '1', 'ZMDS', '0');
INSERT INTO `t_system_region_info` VALUES ('411701', '41', '17', '1', '市辖区', '河南省', '驻马店市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411702', '41', '17', '2', '驿城区', '河南省', '驻马店市', '驿城区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('411721', '41', '17', '21', '西平县', '河南省', '驻马店市', '西平县', '', '0', '2', 'XPX', '0');
INSERT INTO `t_system_region_info` VALUES ('411722', '41', '17', '22', '上蔡县', '河南省', '驻马店市', '上蔡县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('411723', '41', '17', '23', '平舆县', '河南省', '驻马店市', '平舆县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411724', '41', '17', '24', '正阳县', '河南省', '驻马店市', '正阳县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411725', '41', '17', '25', '确山县', '河南省', '驻马店市', '确山县', '', '0', '2', 'QSX', '0');
INSERT INTO `t_system_region_info` VALUES ('411726', '41', '17', '26', '泌阳县', '河南省', '驻马店市', '泌阳县', '', '0', '2', 'BYX', '0');
INSERT INTO `t_system_region_info` VALUES ('411727', '41', '17', '27', '汝南县', '河南省', '驻马店市', '汝南县', '', '0', '2', 'RNX', '0');
INSERT INTO `t_system_region_info` VALUES ('411728', '41', '17', '28', '遂平县', '河南省', '驻马店市', '遂平县', '', '0', '2', 'SPX', '0');
INSERT INTO `t_system_region_info` VALUES ('411729', '41', '17', '29', '新蔡县', '河南省', '驻马店市', '新蔡县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('419000', '41', '90', '0', '省直辖县级行政区划', '河南省', '省直辖县级行政区划', '', '', '0', '1', 'SZXXJHZQH', '0');
INSERT INTO `t_system_region_info` VALUES ('419001', '41', '90', '1', '济源市', '河南省', '省直辖县级行政区划', '济源市', '', '0', '2', 'JYS', '0');
INSERT INTO `t_system_region_info` VALUES ('420000', '42', '0', '0', '湖北省', '湖北省', '', '', '', '0', '0', 'HBS', '0');
INSERT INTO `t_system_region_info` VALUES ('420100', '42', '1', '0', '武汉市', '湖北省', '武汉市', '', '', '0', '1', 'WHS', '0');
INSERT INTO `t_system_region_info` VALUES ('420101', '42', '1', '1', '市辖区', '湖北省', '武汉市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420102', '42', '1', '2', '江岸区', '湖北省', '武汉市', '江岸区', '', '0', '2', 'JAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420103', '42', '1', '3', '江汉区', '湖北省', '武汉市', '江汉区', '', '0', '2', 'JHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420104', '42', '1', '4', '硚口区', '湖北省', '武汉市', '硚口区', '', '0', '2', '硚KQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420105', '42', '1', '5', '汉阳区', '湖北省', '武汉市', '汉阳区', '', '0', '2', 'HYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420106', '42', '1', '6', '武昌区', '湖北省', '武汉市', '武昌区', '', '0', '2', 'WCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420107', '42', '1', '7', '青山区', '湖北省', '武汉市', '青山区', '', '0', '2', 'QSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420111', '42', '1', '11', '洪山区', '湖北省', '武汉市', '洪山区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420112', '42', '1', '12', '东西湖区', '湖北省', '武汉市', '东西湖区', '', '0', '2', 'DXHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420113', '42', '1', '13', '汉南区', '湖北省', '武汉市', '汉南区', '', '0', '2', 'HNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420114', '42', '1', '14', '蔡甸区', '湖北省', '武汉市', '蔡甸区', '', '0', '2', 'CDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420115', '42', '1', '15', '江夏区', '湖北省', '武汉市', '江夏区', '', '0', '2', 'JXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420116', '42', '1', '16', '黄陂区', '湖北省', '武汉市', '黄陂区', '', '0', '2', 'HBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420117', '42', '1', '17', '新洲区', '湖北省', '武汉市', '新洲区', '', '0', '2', 'XZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420200', '42', '2', '0', '黄石市', '湖北省', '黄石市', '', '', '0', '1', 'HSS', '0');
INSERT INTO `t_system_region_info` VALUES ('420201', '42', '2', '1', '市辖区', '湖北省', '黄石市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420202', '42', '2', '2', '黄石港区', '湖北省', '黄石市', '黄石港区', '', '0', '2', 'HSGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420203', '42', '2', '3', '西塞山区', '湖北省', '黄石市', '西塞山区', '', '0', '2', 'XSSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420204', '42', '2', '4', '下陆区', '湖北省', '黄石市', '下陆区', '', '0', '2', 'XLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420205', '42', '2', '5', '铁山区', '湖北省', '黄石市', '铁山区', '', '0', '2', 'TSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420222', '42', '2', '22', '阳新县', '湖北省', '黄石市', '阳新县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('420281', '42', '2', '81', '大冶市', '湖北省', '黄石市', '大冶市', '', '0', '2', 'DYS', '0');
INSERT INTO `t_system_region_info` VALUES ('420300', '42', '3', '0', '十堰市', '湖北省', '十堰市', '', '', '0', '1', 'SYS', '0');
INSERT INTO `t_system_region_info` VALUES ('420301', '42', '3', '1', '市辖区', '湖北省', '十堰市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420302', '42', '3', '2', '茅箭区', '湖北省', '十堰市', '茅箭区', '', '0', '2', 'MJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420303', '42', '3', '3', '张湾区', '湖北省', '十堰市', '张湾区', '', '0', '2', 'ZWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420321', '42', '3', '21', '郧县', '湖北省', '十堰市', '郧县', '', '0', '2', 'YX', '0');
INSERT INTO `t_system_region_info` VALUES ('420322', '42', '3', '22', '郧西县', '湖北省', '十堰市', '郧西县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('420323', '42', '3', '23', '竹山县', '湖北省', '十堰市', '竹山县', '', '0', '2', 'ZSX', '0');
INSERT INTO `t_system_region_info` VALUES ('420324', '42', '3', '24', '竹溪县', '湖北省', '十堰市', '竹溪县', '', '0', '2', 'ZXX', '0');
INSERT INTO `t_system_region_info` VALUES ('420325', '42', '3', '25', '房县', '湖北省', '十堰市', '房县', '', '0', '2', 'FX', '0');
INSERT INTO `t_system_region_info` VALUES ('420381', '42', '3', '81', '丹江口市', '湖北省', '十堰市', '丹江口市', '', '0', '2', 'DJKS', '0');
INSERT INTO `t_system_region_info` VALUES ('420500', '42', '5', '0', '宜昌市', '湖北省', '宜昌市', '', '', '0', '1', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('420501', '42', '5', '1', '市辖区', '湖北省', '宜昌市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420502', '42', '5', '2', '西陵区', '湖北省', '宜昌市', '西陵区', '', '0', '2', 'XLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420503', '42', '5', '3', '伍家岗区', '湖北省', '宜昌市', '伍家岗区', '', '0', '2', 'WJGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420504', '42', '5', '4', '点军区', '湖北省', '宜昌市', '点军区', '', '0', '2', 'DJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420505', '42', '5', '5', '猇亭区', '湖北省', '宜昌市', '猇亭区', '', '0', '2', '猇TQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420506', '42', '5', '6', '夷陵区', '湖北省', '宜昌市', '夷陵区', '', '0', '2', 'YLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420525', '42', '5', '25', '远安县', '湖北省', '宜昌市', '远安县', '', '0', '2', 'YAX', '0');
INSERT INTO `t_system_region_info` VALUES ('420526', '42', '5', '26', '兴山县', '湖北省', '宜昌市', '兴山县', '', '0', '2', 'XSX', '0');
INSERT INTO `t_system_region_info` VALUES ('420527', '42', '5', '27', '秭归县', '湖北省', '宜昌市', '秭归县', '', '0', '2', 'ZGX', '0');
INSERT INTO `t_system_region_info` VALUES ('420528', '42', '5', '28', '长阳土家族自治县', '湖北省', '宜昌市', '长阳土家族自治县', '', '0', '2', 'CYTJZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('420529', '42', '5', '29', '五峰土家族自治县', '湖北省', '宜昌市', '五峰土家族自治县', '', '0', '2', 'WFTJZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('420581', '42', '5', '81', '宜都市', '湖北省', '宜昌市', '宜都市', '', '0', '2', 'YDS', '0');
INSERT INTO `t_system_region_info` VALUES ('420582', '42', '5', '82', '当阳市', '湖北省', '宜昌市', '当阳市', '', '0', '2', 'DYS', '0');
INSERT INTO `t_system_region_info` VALUES ('420583', '42', '5', '83', '枝江市', '湖北省', '宜昌市', '枝江市', '', '0', '2', 'ZJS', '0');
INSERT INTO `t_system_region_info` VALUES ('420600', '42', '6', '0', '襄阳市', '湖北省', '襄阳市', '', '', '0', '1', 'XYS', '0');
INSERT INTO `t_system_region_info` VALUES ('420601', '42', '6', '1', '市辖区', '湖北省', '襄阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420602', '42', '6', '2', '襄城区', '湖北省', '襄阳市', '襄城区', '', '0', '2', 'XCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420606', '42', '6', '6', '樊城区', '湖北省', '襄阳市', '樊城区', '', '0', '2', 'FCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420607', '42', '6', '7', '襄州区', '湖北省', '襄阳市', '襄州区', '', '0', '2', 'XZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420624', '42', '6', '24', '南漳县', '湖北省', '襄阳市', '南漳县', '', '0', '2', 'NZX', '0');
INSERT INTO `t_system_region_info` VALUES ('420625', '42', '6', '25', '谷城县', '湖北省', '襄阳市', '谷城县', '', '0', '2', 'GCX', '0');
INSERT INTO `t_system_region_info` VALUES ('420626', '42', '6', '26', '保康县', '湖北省', '襄阳市', '保康县', '', '0', '2', 'BKX', '0');
INSERT INTO `t_system_region_info` VALUES ('420682', '42', '6', '82', '老河口市', '湖北省', '襄阳市', '老河口市', '', '0', '2', 'LHKS', '0');
INSERT INTO `t_system_region_info` VALUES ('420683', '42', '6', '83', '枣阳市', '湖北省', '襄阳市', '枣阳市', '', '0', '2', 'ZYS', '0');
INSERT INTO `t_system_region_info` VALUES ('420684', '42', '6', '84', '宜城市', '湖北省', '襄阳市', '宜城市', '', '0', '2', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('420700', '42', '7', '0', '鄂州市', '湖北省', '鄂州市', '', '', '0', '1', 'EZS', '0');
INSERT INTO `t_system_region_info` VALUES ('420701', '42', '7', '1', '市辖区', '湖北省', '鄂州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420702', '42', '7', '2', '梁子湖区', '湖北省', '鄂州市', '梁子湖区', '', '0', '2', 'LZHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420703', '42', '7', '3', '华容区', '湖北省', '鄂州市', '华容区', '', '0', '2', 'HRQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420704', '42', '7', '4', '鄂城区', '湖北省', '鄂州市', '鄂城区', '', '0', '2', 'ECQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420800', '42', '8', '0', '荆门市', '湖北省', '荆门市', '', '', '0', '1', 'JMS', '0');
INSERT INTO `t_system_region_info` VALUES ('420801', '42', '8', '1', '市辖区', '湖北省', '荆门市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420802', '42', '8', '2', '东宝区', '湖北省', '荆门市', '东宝区', '', '0', '2', 'DBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420804', '42', '8', '4', '掇刀区', '湖北省', '荆门市', '掇刀区', '', '0', '2', 'DDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420821', '42', '8', '21', '京山县', '湖北省', '荆门市', '京山县', '', '0', '2', 'JSX', '0');
INSERT INTO `t_system_region_info` VALUES ('420822', '42', '8', '22', '沙洋县', '湖北省', '荆门市', '沙洋县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('420881', '42', '8', '81', '钟祥市', '湖北省', '荆门市', '钟祥市', '', '0', '2', 'ZXS', '0');
INSERT INTO `t_system_region_info` VALUES ('420900', '42', '9', '0', '孝感市', '湖北省', '孝感市', '', '', '0', '1', 'XGS', '0');
INSERT INTO `t_system_region_info` VALUES ('420901', '42', '9', '1', '市辖区', '湖北省', '孝感市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420902', '42', '9', '2', '孝南区', '湖北省', '孝感市', '孝南区', '', '0', '2', 'XNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('420921', '42', '9', '21', '孝昌县', '湖北省', '孝感市', '孝昌县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('420922', '42', '9', '22', '大悟县', '湖北省', '孝感市', '大悟县', '', '0', '2', 'DWX', '0');
INSERT INTO `t_system_region_info` VALUES ('420923', '42', '9', '23', '云梦县', '湖北省', '孝感市', '云梦县', '', '0', '2', 'YMX', '0');
INSERT INTO `t_system_region_info` VALUES ('420981', '42', '9', '81', '应城市', '湖北省', '孝感市', '应城市', '', '0', '2', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('420982', '42', '9', '82', '安陆市', '湖北省', '孝感市', '安陆市', '', '0', '2', 'ALS', '0');
INSERT INTO `t_system_region_info` VALUES ('420984', '42', '9', '84', '汉川市', '湖北省', '孝感市', '汉川市', '', '0', '2', 'HCS', '0');
INSERT INTO `t_system_region_info` VALUES ('421000', '42', '10', '0', '荆州市', '湖北省', '荆州市', '', '', '0', '1', 'JZS', '0');
INSERT INTO `t_system_region_info` VALUES ('421001', '42', '10', '1', '市辖区', '湖北省', '荆州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('421002', '42', '10', '2', '沙市区', '湖北省', '荆州市', '沙市区', '', '0', '2', 'SSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('421003', '42', '10', '3', '荆州区', '湖北省', '荆州市', '荆州区', '', '0', '2', 'JZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('421022', '42', '10', '22', '公安县', '湖北省', '荆州市', '公安县', '', '0', '2', 'GAX', '0');
INSERT INTO `t_system_region_info` VALUES ('421023', '42', '10', '23', '监利县', '湖北省', '荆州市', '监利县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('421024', '42', '10', '24', '江陵县', '湖北省', '荆州市', '江陵县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('421081', '42', '10', '81', '石首市', '湖北省', '荆州市', '石首市', '', '0', '2', 'SSS', '0');
INSERT INTO `t_system_region_info` VALUES ('421083', '42', '10', '83', '洪湖市', '湖北省', '荆州市', '洪湖市', '', '0', '2', 'HHS', '0');
INSERT INTO `t_system_region_info` VALUES ('421087', '42', '10', '87', '松滋市', '湖北省', '荆州市', '松滋市', '', '0', '2', 'SZS', '0');
INSERT INTO `t_system_region_info` VALUES ('421100', '42', '11', '0', '黄冈市', '湖北省', '黄冈市', '', '', '0', '1', 'HGS', '0');
INSERT INTO `t_system_region_info` VALUES ('421101', '42', '11', '1', '市辖区', '湖北省', '黄冈市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('421102', '42', '11', '2', '黄州区', '湖北省', '黄冈市', '黄州区', '', '0', '2', 'HZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('421121', '42', '11', '21', '团风县', '湖北省', '黄冈市', '团风县', '', '0', '2', 'TFX', '0');
INSERT INTO `t_system_region_info` VALUES ('421122', '42', '11', '22', '红安县', '湖北省', '黄冈市', '红安县', '', '0', '2', 'GAX', '0');
INSERT INTO `t_system_region_info` VALUES ('421123', '42', '11', '23', '罗田县', '湖北省', '黄冈市', '罗田县', '', '0', '2', 'LTX', '0');
INSERT INTO `t_system_region_info` VALUES ('421124', '42', '11', '24', '英山县', '湖北省', '黄冈市', '英山县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('421125', '42', '11', '25', '浠水县', '湖北省', '黄冈市', '浠水县', '', '0', '2', 'XSX', '0');
INSERT INTO `t_system_region_info` VALUES ('421126', '42', '11', '26', '蕲春县', '湖北省', '黄冈市', '蕲春县', '', '0', '2', 'QCX', '0');
INSERT INTO `t_system_region_info` VALUES ('421127', '42', '11', '27', '黄梅县', '湖北省', '黄冈市', '黄梅县', '', '0', '2', 'HMX', '0');
INSERT INTO `t_system_region_info` VALUES ('421181', '42', '11', '81', '麻城市', '湖北省', '黄冈市', '麻城市', '', '0', '2', 'MCS', '0');
INSERT INTO `t_system_region_info` VALUES ('421182', '42', '11', '82', '武穴市', '湖北省', '黄冈市', '武穴市', '', '0', '2', 'WXS', '0');
INSERT INTO `t_system_region_info` VALUES ('421200', '42', '12', '0', '咸宁市', '湖北省', '咸宁市', '', '', '0', '1', 'XNS', '0');
INSERT INTO `t_system_region_info` VALUES ('421201', '42', '12', '1', '市辖区', '湖北省', '咸宁市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('421202', '42', '12', '2', '咸安区', '湖北省', '咸宁市', '咸安区', '', '0', '2', 'XAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('421221', '42', '12', '21', '嘉鱼县', '湖北省', '咸宁市', '嘉鱼县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('421222', '42', '12', '22', '通城县', '湖北省', '咸宁市', '通城县', '', '0', '2', 'TCX', '0');
INSERT INTO `t_system_region_info` VALUES ('421223', '42', '12', '23', '崇阳县', '湖北省', '咸宁市', '崇阳县', '', '0', '2', 'CYX', '0');
INSERT INTO `t_system_region_info` VALUES ('421224', '42', '12', '24', '通山县', '湖北省', '咸宁市', '通山县', '', '0', '2', 'TSX', '0');
INSERT INTO `t_system_region_info` VALUES ('421281', '42', '12', '81', '赤壁市', '湖北省', '咸宁市', '赤壁市', '', '0', '2', 'CBS', '0');
INSERT INTO `t_system_region_info` VALUES ('421300', '42', '13', '0', '随州市', '湖北省', '随州市', '', '', '0', '1', 'SZS', '0');
INSERT INTO `t_system_region_info` VALUES ('421301', '42', '13', '1', '市辖区', '湖北省', '随州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('421303', '42', '13', '3', '曾都区', '湖北省', '随州市', '曾都区', '', '0', '2', 'CDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('421321', '42', '13', '21', '随县', '湖北省', '随州市', '随县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('421381', '42', '13', '81', '广水市', '湖北省', '随州市', '广水市', '', '0', '2', 'ASS', '0');
INSERT INTO `t_system_region_info` VALUES ('422800', '42', '28', '0', '恩施土家族苗族自治州', '湖北省', '恩施土家族苗族自治州', '', '', '0', '1', 'ESTJZMZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('422801', '42', '28', '1', '恩施市', '湖北省', '恩施土家族苗族自治州', '恩施市', '', '0', '2', 'ESS', '0');
INSERT INTO `t_system_region_info` VALUES ('422802', '42', '28', '2', '利川市', '湖北省', '恩施土家族苗族自治州', '利川市', '', '0', '2', 'LCS', '0');
INSERT INTO `t_system_region_info` VALUES ('422822', '42', '28', '22', '建始县', '湖北省', '恩施土家族苗族自治州', '建始县', '', '0', '2', 'JSX', '0');
INSERT INTO `t_system_region_info` VALUES ('422823', '42', '28', '23', '巴东县', '湖北省', '恩施土家族苗族自治州', '巴东县', '', '0', '2', 'BDX', '0');
INSERT INTO `t_system_region_info` VALUES ('422825', '42', '28', '25', '宣恩县', '湖北省', '恩施土家族苗族自治州', '宣恩县', '', '0', '2', 'XEX', '0');
INSERT INTO `t_system_region_info` VALUES ('422826', '42', '28', '26', '咸丰县', '湖北省', '恩施土家族苗族自治州', '咸丰县', '', '0', '2', 'XFX', '0');
INSERT INTO `t_system_region_info` VALUES ('422827', '42', '28', '27', '来凤县', '湖北省', '恩施土家族苗族自治州', '来凤县', '', '0', '2', 'LFX', '0');
INSERT INTO `t_system_region_info` VALUES ('422828', '42', '28', '28', '鹤峰县', '湖北省', '恩施土家族苗族自治州', '鹤峰县', '', '0', '2', 'HFX', '0');
INSERT INTO `t_system_region_info` VALUES ('429000', '42', '90', '0', '省直辖县级行政区划', '湖北省', '省直辖县级行政区划', '', '', '0', '1', 'SZXXJHZQH', '0');
INSERT INTO `t_system_region_info` VALUES ('429004', '42', '90', '4', '仙桃市', '湖北省', '省直辖县级行政区划', '仙桃市', '', '0', '2', 'XTS', '0');
INSERT INTO `t_system_region_info` VALUES ('429005', '42', '90', '5', '潜江市', '湖北省', '省直辖县级行政区划', '潜江市', '', '0', '2', 'QJS', '0');
INSERT INTO `t_system_region_info` VALUES ('429006', '42', '90', '6', '天门市', '湖北省', '省直辖县级行政区划', '天门市', '', '0', '2', 'TMS', '0');
INSERT INTO `t_system_region_info` VALUES ('429021', '42', '90', '21', '神农架林区', '湖北省', '省直辖县级行政区划', '神农架林区', '', '0', '2', 'SNJLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430000', '43', '0', '0', '湖南省', '湖南省', '', '', '', '0', '0', 'HNS', '0');
INSERT INTO `t_system_region_info` VALUES ('430100', '43', '1', '0', '长沙市', '湖南省', '长沙市', '', '', '0', '1', 'CSS', '0');
INSERT INTO `t_system_region_info` VALUES ('430101', '43', '1', '1', '市辖区', '湖南省', '长沙市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430102', '43', '1', '2', '芙蓉区', '湖南省', '长沙市', '芙蓉区', '', '0', '2', 'FRQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430103', '43', '1', '3', '天心区', '湖南省', '长沙市', '天心区', '', '0', '2', 'TXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430104', '43', '1', '4', '岳麓区', '湖南省', '长沙市', '岳麓区', '', '0', '2', 'YLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430105', '43', '1', '5', '开福区', '湖南省', '长沙市', '开福区', '', '0', '2', 'KFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430111', '43', '1', '11', '雨花区', '湖南省', '长沙市', '雨花区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430112', '43', '1', '12', '望城区', '湖南省', '长沙市', '望城区', '', '0', '2', 'WCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430121', '43', '1', '21', '长沙县', '湖南省', '长沙市', '长沙县', '', '0', '2', 'CSX', '0');
INSERT INTO `t_system_region_info` VALUES ('430124', '43', '1', '24', '宁乡县', '湖南省', '长沙市', '宁乡县', '', '0', '2', 'NXX', '0');
INSERT INTO `t_system_region_info` VALUES ('430181', '43', '1', '81', '浏阳市', '湖南省', '长沙市', '浏阳市', '', '0', '2', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('430200', '43', '2', '0', '株洲市', '湖南省', '株洲市', '', '', '0', '1', 'ZZS', '0');
INSERT INTO `t_system_region_info` VALUES ('430201', '43', '2', '1', '市辖区', '湖南省', '株洲市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430202', '43', '2', '2', '荷塘区', '湖南省', '株洲市', '荷塘区', '', '0', '2', 'HTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430203', '43', '2', '3', '芦淞区', '湖南省', '株洲市', '芦淞区', '', '0', '2', 'LSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430204', '43', '2', '4', '石峰区', '湖南省', '株洲市', '石峰区', '', '0', '2', 'SFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430211', '43', '2', '11', '天元区', '湖南省', '株洲市', '天元区', '', '0', '2', 'TYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430221', '43', '2', '21', '株洲县', '湖南省', '株洲市', '株洲县', '', '0', '2', 'ZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('430223', '43', '2', '23', '攸县', '湖南省', '株洲市', '攸县', '', '0', '2', 'YX', '0');
INSERT INTO `t_system_region_info` VALUES ('430224', '43', '2', '24', '茶陵县', '湖南省', '株洲市', '茶陵县', '', '0', '2', 'CLX', '0');
INSERT INTO `t_system_region_info` VALUES ('430225', '43', '2', '25', '炎陵县', '湖南省', '株洲市', '炎陵县', '', '0', '2', 'YLX', '0');
INSERT INTO `t_system_region_info` VALUES ('430281', '43', '2', '81', '醴陵市', '湖南省', '株洲市', '醴陵市', '', '0', '2', 'LLS', '0');
INSERT INTO `t_system_region_info` VALUES ('430300', '43', '3', '0', '湘潭市', '湖南省', '湘潭市', '', '', '0', '1', 'XTS', '0');
INSERT INTO `t_system_region_info` VALUES ('430301', '43', '3', '1', '市辖区', '湖南省', '湘潭市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430302', '43', '3', '2', '雨湖区', '湖南省', '湘潭市', '雨湖区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430304', '43', '3', '4', '岳塘区', '湖南省', '湘潭市', '岳塘区', '', '0', '2', 'YTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430321', '43', '3', '21', '湘潭县', '湖南省', '湘潭市', '湘潭县', '', '0', '2', 'XTX', '0');
INSERT INTO `t_system_region_info` VALUES ('430381', '43', '3', '81', '湘乡市', '湖南省', '湘潭市', '湘乡市', '', '0', '2', 'XXS', '0');
INSERT INTO `t_system_region_info` VALUES ('430382', '43', '3', '82', '韶山市', '湖南省', '湘潭市', '韶山市', '', '0', '2', 'SSS', '0');
INSERT INTO `t_system_region_info` VALUES ('430400', '43', '4', '0', '衡阳市', '湖南省', '衡阳市', '', '', '0', '1', 'HYS', '0');
INSERT INTO `t_system_region_info` VALUES ('430401', '43', '4', '1', '市辖区', '湖南省', '衡阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430405', '43', '4', '5', '珠晖区', '湖南省', '衡阳市', '珠晖区', '', '0', '2', 'ZHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430406', '43', '4', '6', '雁峰区', '湖南省', '衡阳市', '雁峰区', '', '0', '2', 'YFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430407', '43', '4', '7', '石鼓区', '湖南省', '衡阳市', '石鼓区', '', '0', '2', 'SGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430408', '43', '4', '8', '蒸湘区', '湖南省', '衡阳市', '蒸湘区', '', '0', '2', 'ZXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430412', '43', '4', '12', '南岳区', '湖南省', '衡阳市', '南岳区', '', '0', '2', 'NYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430421', '43', '4', '21', '衡阳县', '湖南省', '衡阳市', '衡阳县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('430422', '43', '4', '22', '衡南县', '湖南省', '衡阳市', '衡南县', '', '0', '2', 'HNX', '0');
INSERT INTO `t_system_region_info` VALUES ('430423', '43', '4', '23', '衡山县', '湖南省', '衡阳市', '衡山县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('430424', '43', '4', '24', '衡东县', '湖南省', '衡阳市', '衡东县', '', '0', '2', 'HDX', '0');
INSERT INTO `t_system_region_info` VALUES ('430426', '43', '4', '26', '祁东县', '湖南省', '衡阳市', '祁东县', '', '0', '2', 'QDX', '0');
INSERT INTO `t_system_region_info` VALUES ('430481', '43', '4', '81', '耒阳市', '湖南省', '衡阳市', '耒阳市', '', '0', '2', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('430482', '43', '4', '82', '常宁市', '湖南省', '衡阳市', '常宁市', '', '0', '2', 'CNS', '0');
INSERT INTO `t_system_region_info` VALUES ('430500', '43', '5', '0', '邵阳市', '湖南省', '邵阳市', '', '', '0', '1', 'SYS', '0');
INSERT INTO `t_system_region_info` VALUES ('430501', '43', '5', '1', '市辖区', '湖南省', '邵阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430502', '43', '5', '2', '双清区', '湖南省', '邵阳市', '双清区', '', '0', '2', 'SQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430503', '43', '5', '3', '大祥区', '湖南省', '邵阳市', '大祥区', '', '0', '2', 'DXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430511', '43', '5', '11', '北塔区', '湖南省', '邵阳市', '北塔区', '', '0', '2', 'BDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430521', '43', '5', '21', '邵东县', '湖南省', '邵阳市', '邵东县', '', '0', '2', 'SDX', '0');
INSERT INTO `t_system_region_info` VALUES ('430522', '43', '5', '22', '新邵县', '湖南省', '邵阳市', '新邵县', '', '0', '2', 'XSX', '0');
INSERT INTO `t_system_region_info` VALUES ('430523', '43', '5', '23', '邵阳县', '湖南省', '邵阳市', '邵阳县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('430524', '43', '5', '24', '隆回县', '湖南省', '邵阳市', '隆回县', '', '0', '2', 'LHX', '0');
INSERT INTO `t_system_region_info` VALUES ('430525', '43', '5', '25', '洞口县', '湖南省', '邵阳市', '洞口县', '', '0', '2', 'DKX', '0');
INSERT INTO `t_system_region_info` VALUES ('430527', '43', '5', '27', '绥宁县', '湖南省', '邵阳市', '绥宁县', '', '0', '2', 'SNX', '0');
INSERT INTO `t_system_region_info` VALUES ('430528', '43', '5', '28', '新宁县', '湖南省', '邵阳市', '新宁县', '', '0', '2', 'XNX', '0');
INSERT INTO `t_system_region_info` VALUES ('430529', '43', '5', '29', '城步苗族自治县', '湖南省', '邵阳市', '城步苗族自治县', '', '0', '2', 'CBMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('430581', '43', '5', '81', '武冈市', '湖南省', '邵阳市', '武冈市', '', '0', '2', 'WGS', '0');
INSERT INTO `t_system_region_info` VALUES ('430600', '43', '6', '0', '岳阳市', '湖南省', '岳阳市', '', '', '0', '1', 'YYS', '0');
INSERT INTO `t_system_region_info` VALUES ('430601', '43', '6', '1', '市辖区', '湖南省', '岳阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430602', '43', '6', '2', '岳阳楼区', '湖南省', '岳阳市', '岳阳楼区', '', '0', '2', 'YYLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430603', '43', '6', '3', '云溪区', '湖南省', '岳阳市', '云溪区', '', '0', '2', 'YXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430611', '43', '6', '11', '君山区', '湖南省', '岳阳市', '君山区', '', '0', '2', 'JSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430621', '43', '6', '21', '岳阳县', '湖南省', '岳阳市', '岳阳县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('430623', '43', '6', '23', '华容县', '湖南省', '岳阳市', '华容县', '', '0', '2', 'HRX', '0');
INSERT INTO `t_system_region_info` VALUES ('430624', '43', '6', '24', '湘阴县', '湖南省', '岳阳市', '湘阴县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('430626', '43', '6', '26', '平江县', '湖南省', '岳阳市', '平江县', '', '0', '2', 'PJX', '0');
INSERT INTO `t_system_region_info` VALUES ('430681', '43', '6', '81', '汨罗市', '湖南省', '岳阳市', '汨罗市', '', '0', '2', 'MLS', '0');
INSERT INTO `t_system_region_info` VALUES ('430682', '43', '6', '82', '临湘市', '湖南省', '岳阳市', '临湘市', '', '0', '2', 'LXS', '0');
INSERT INTO `t_system_region_info` VALUES ('430700', '43', '7', '0', '常德市', '湖南省', '常德市', '', '', '0', '1', 'CDS', '0');
INSERT INTO `t_system_region_info` VALUES ('430701', '43', '7', '1', '市辖区', '湖南省', '常德市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430702', '43', '7', '2', '武陵区', '湖南省', '常德市', '武陵区', '', '0', '2', 'WLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430703', '43', '7', '3', '鼎城区', '湖南省', '常德市', '鼎城区', '', '0', '2', 'DCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430721', '43', '7', '21', '安乡县', '湖南省', '常德市', '安乡县', '', '0', '2', 'AXX', '0');
INSERT INTO `t_system_region_info` VALUES ('430722', '43', '7', '22', '汉寿县', '湖南省', '常德市', '汉寿县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('430723', '43', '7', '23', '澧县', '湖南省', '常德市', '澧县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('430724', '43', '7', '24', '临澧县', '湖南省', '常德市', '临澧县', '', '0', '2', 'LLX', '0');
INSERT INTO `t_system_region_info` VALUES ('430725', '43', '7', '25', '桃源县', '湖南省', '常德市', '桃源县', '', '0', '2', 'TYX', '0');
INSERT INTO `t_system_region_info` VALUES ('430726', '43', '7', '26', '石门县', '湖南省', '常德市', '石门县', '', '0', '2', 'SMX', '0');
INSERT INTO `t_system_region_info` VALUES ('430781', '43', '7', '81', '津市市', '湖南省', '常德市', '津市市', '', '0', '2', 'JSS', '0');
INSERT INTO `t_system_region_info` VALUES ('430800', '43', '8', '0', '张家界市', '湖南省', '张家界市', '', '', '0', '1', 'ZJJS', '0');
INSERT INTO `t_system_region_info` VALUES ('430801', '43', '8', '1', '市辖区', '湖南省', '张家界市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430802', '43', '8', '2', '永定区', '湖南省', '张家界市', '永定区', '', '0', '2', 'YDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430811', '43', '8', '11', '武陵源区', '湖南省', '张家界市', '武陵源区', '', '0', '2', 'WLYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430821', '43', '8', '21', '慈利县', '湖南省', '张家界市', '慈利县', '', '0', '2', 'CLX', '0');
INSERT INTO `t_system_region_info` VALUES ('430822', '43', '8', '22', '桑植县', '湖南省', '张家界市', '桑植县', '', '0', '2', 'SZX', '0');
INSERT INTO `t_system_region_info` VALUES ('430900', '43', '9', '0', '益阳市', '湖南省', '益阳市', '', '', '0', '1', 'YYS', '0');
INSERT INTO `t_system_region_info` VALUES ('430901', '43', '9', '1', '市辖区', '湖南省', '益阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430902', '43', '9', '2', '资阳区', '湖南省', '益阳市', '资阳区', '', '0', '2', 'ZYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430903', '43', '9', '3', '赫山区', '湖南省', '益阳市', '赫山区', '', '0', '2', 'HSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('430921', '43', '9', '21', '南县', '湖南省', '益阳市', '南县', '', '0', '2', 'NX', '0');
INSERT INTO `t_system_region_info` VALUES ('430922', '43', '9', '22', '桃江县', '湖南省', '益阳市', '桃江县', '', '0', '2', 'TJX', '0');
INSERT INTO `t_system_region_info` VALUES ('430923', '43', '9', '23', '安化县', '湖南省', '益阳市', '安化县', '', '0', '2', 'AHX', '0');
INSERT INTO `t_system_region_info` VALUES ('430981', '43', '9', '81', '沅江市', '湖南省', '益阳市', '沅江市', '', '0', '2', 'YJS', '0');
INSERT INTO `t_system_region_info` VALUES ('431000', '43', '10', '0', '郴州市', '湖南省', '郴州市', '', '', '0', '1', 'CZS', '0');
INSERT INTO `t_system_region_info` VALUES ('431001', '43', '10', '1', '市辖区', '湖南省', '郴州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431002', '43', '10', '2', '北湖区', '湖南省', '郴州市', '北湖区', '', '0', '2', 'BHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431003', '43', '10', '3', '苏仙区', '湖南省', '郴州市', '苏仙区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431021', '43', '10', '21', '桂阳县', '湖南省', '郴州市', '桂阳县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('431022', '43', '10', '22', '宜章县', '湖南省', '郴州市', '宜章县', '', '0', '2', 'YZX', '0');
INSERT INTO `t_system_region_info` VALUES ('431023', '43', '10', '23', '永兴县', '湖南省', '郴州市', '永兴县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('431024', '43', '10', '24', '嘉禾县', '湖南省', '郴州市', '嘉禾县', '', '0', '2', 'JHX', '0');
INSERT INTO `t_system_region_info` VALUES ('431025', '43', '10', '25', '临武县', '湖南省', '郴州市', '临武县', '', '0', '2', 'LWX', '0');
INSERT INTO `t_system_region_info` VALUES ('431026', '43', '10', '26', '汝城县', '湖南省', '郴州市', '汝城县', '', '0', '2', 'RCX', '0');
INSERT INTO `t_system_region_info` VALUES ('431027', '43', '10', '27', '桂东县', '湖南省', '郴州市', '桂东县', '', '0', '2', 'GDX', '0');
INSERT INTO `t_system_region_info` VALUES ('431028', '43', '10', '28', '安仁县', '湖南省', '郴州市', '安仁县', '', '0', '2', 'ARX', '0');
INSERT INTO `t_system_region_info` VALUES ('431081', '43', '10', '81', '资兴市', '湖南省', '郴州市', '资兴市', '', '0', '2', 'ZXS', '0');
INSERT INTO `t_system_region_info` VALUES ('431100', '43', '11', '0', '永州市', '湖南省', '永州市', '', '', '0', '1', 'YZS', '0');
INSERT INTO `t_system_region_info` VALUES ('431101', '43', '11', '1', '市辖区', '湖南省', '永州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431102', '43', '11', '2', '零陵区', '湖南省', '永州市', '零陵区', '', '0', '2', 'LLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431103', '43', '11', '3', '冷水滩区', '湖南省', '永州市', '冷水滩区', '', '0', '2', 'LSTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431121', '43', '11', '21', '祁阳县', '湖南省', '永州市', '祁阳县', '', '0', '2', 'QYX', '0');
INSERT INTO `t_system_region_info` VALUES ('431122', '43', '11', '22', '东安县', '湖南省', '永州市', '东安县', '', '0', '2', 'DAX', '0');
INSERT INTO `t_system_region_info` VALUES ('431123', '43', '11', '23', '双牌县', '湖南省', '永州市', '双牌县', '', '0', '2', 'SPX', '0');
INSERT INTO `t_system_region_info` VALUES ('431124', '43', '11', '24', '道县', '湖南省', '永州市', '道县', '', '0', '2', 'DX', '0');
INSERT INTO `t_system_region_info` VALUES ('431125', '43', '11', '25', '江永县', '湖南省', '永州市', '江永县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('431126', '43', '11', '26', '宁远县', '湖南省', '永州市', '宁远县', '', '0', '2', 'NYX', '0');
INSERT INTO `t_system_region_info` VALUES ('431127', '43', '11', '27', '蓝山县', '湖南省', '永州市', '蓝山县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('431128', '43', '11', '28', '新田县', '湖南省', '永州市', '新田县', '', '0', '2', 'XTX', '0');
INSERT INTO `t_system_region_info` VALUES ('431129', '43', '11', '29', '江华瑶族自治县', '湖南省', '永州市', '江华瑶族自治县', '', '0', '2', 'JHYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('431200', '43', '12', '0', '怀化市', '湖南省', '怀化市', '', '', '0', '1', 'HHS', '0');
INSERT INTO `t_system_region_info` VALUES ('431201', '43', '12', '1', '市辖区', '湖南省', '怀化市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431202', '43', '12', '2', '鹤城区', '湖南省', '怀化市', '鹤城区', '', '0', '2', 'HCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431221', '43', '12', '21', '中方县', '湖南省', '怀化市', '中方县', '', '0', '2', 'ZFX', '0');
INSERT INTO `t_system_region_info` VALUES ('431222', '43', '12', '22', '沅陵县', '湖南省', '怀化市', '沅陵县', '', '0', '2', 'YLX', '0');
INSERT INTO `t_system_region_info` VALUES ('431223', '43', '12', '23', '辰溪县', '湖南省', '怀化市', '辰溪县', '', '0', '2', 'CXX', '0');
INSERT INTO `t_system_region_info` VALUES ('431224', '43', '12', '24', '溆浦县', '湖南省', '怀化市', '溆浦县', '', '0', '2', 'XPX', '0');
INSERT INTO `t_system_region_info` VALUES ('431225', '43', '12', '25', '会同县', '湖南省', '怀化市', '会同县', '', '0', '2', 'HTX', '0');
INSERT INTO `t_system_region_info` VALUES ('431226', '43', '12', '26', '麻阳苗族自治县', '湖南省', '怀化市', '麻阳苗族自治县', '', '0', '2', 'MYMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('431227', '43', '12', '27', '新晃侗族自治县', '湖南省', '怀化市', '新晃侗族自治县', '', '0', '2', 'XHDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('431228', '43', '12', '28', '芷江侗族自治县', '湖南省', '怀化市', '芷江侗族自治县', '', '0', '2', 'ZJDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('431229', '43', '12', '29', '靖州苗族侗族自治县', '湖南省', '怀化市', '靖州苗族侗族自治县', '', '0', '2', 'JZMZDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('431230', '43', '12', '30', '通道侗族自治县', '湖南省', '怀化市', '通道侗族自治县', '', '0', '2', 'TDDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('431281', '43', '12', '81', '洪江市', '湖南省', '怀化市', '洪江市', '', '0', '2', 'HJS', '0');
INSERT INTO `t_system_region_info` VALUES ('431300', '43', '13', '0', '娄底市', '湖南省', '娄底市', '', '', '0', '1', 'LDS', '0');
INSERT INTO `t_system_region_info` VALUES ('431301', '43', '13', '1', '市辖区', '湖南省', '娄底市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431302', '43', '13', '2', '娄星区', '湖南省', '娄底市', '娄星区', '', '0', '2', 'LXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('431321', '43', '13', '21', '双峰县', '湖南省', '娄底市', '双峰县', '', '0', '2', 'SFX', '0');
INSERT INTO `t_system_region_info` VALUES ('431322', '43', '13', '22', '新化县', '湖南省', '娄底市', '新化县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('431381', '43', '13', '81', '冷水江市', '湖南省', '娄底市', '冷水江市', '', '0', '2', 'LSJS', '0');
INSERT INTO `t_system_region_info` VALUES ('431382', '43', '13', '82', '涟源市', '湖南省', '娄底市', '涟源市', '', '0', '2', 'LYS', '0');
INSERT INTO `t_system_region_info` VALUES ('433100', '43', '31', '0', '湘西土家族苗族自治州', '湖南省', '湘西土家族苗族自治州', '', '', '0', '1', 'XXTJZMZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('433101', '43', '31', '1', '吉首市', '湖南省', '湘西土家族苗族自治州', '吉首市', '', '0', '2', 'JSS', '0');
INSERT INTO `t_system_region_info` VALUES ('433122', '43', '31', '22', '泸溪县', '湖南省', '湘西土家族苗族自治州', '泸溪县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('433123', '43', '31', '23', '凤凰县', '湖南省', '湘西土家族苗族自治州', '凤凰县', '', '0', '2', 'FHX', '0');
INSERT INTO `t_system_region_info` VALUES ('433124', '43', '31', '24', '花垣县', '湖南省', '湘西土家族苗族自治州', '花垣县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('433125', '43', '31', '25', '保靖县', '湖南省', '湘西土家族苗族自治州', '保靖县', '', '0', '2', 'BJX', '0');
INSERT INTO `t_system_region_info` VALUES ('433126', '43', '31', '26', '古丈县', '湖南省', '湘西土家族苗族自治州', '古丈县', '', '0', '2', 'GZX', '0');
INSERT INTO `t_system_region_info` VALUES ('433127', '43', '31', '27', '永顺县', '湖南省', '湘西土家族苗族自治州', '永顺县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('433130', '43', '31', '30', '龙山县', '湖南省', '湘西土家族苗族自治州', '龙山县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('440000', '44', '0', '0', '广东省', '广东省', '', '', '', '0', '0', 'ADS', '0');
INSERT INTO `t_system_region_info` VALUES ('440100', '44', '1', '0', '广州市', '广东省', '广州市', '', '', '0', '1', 'AZS', '0');
INSERT INTO `t_system_region_info` VALUES ('440101', '44', '1', '1', '市辖区', '广东省', '广州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440103', '44', '1', '3', '荔湾区', '广东省', '广州市', '荔湾区', '', '0', '2', 'LWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440104', '44', '1', '4', '越秀区', '广东省', '广州市', '越秀区', '', '0', '2', 'YXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440105', '44', '1', '5', '海珠区', '广东省', '广州市', '海珠区', '', '0', '2', 'HZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440106', '44', '1', '6', '天河区', '广东省', '广州市', '天河区', '', '0', '2', 'THQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440111', '44', '1', '11', '白云区', '广东省', '广州市', '白云区', '', '0', '2', 'BYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440112', '44', '1', '12', '黄埔区', '广东省', '广州市', '黄埔区', '', '0', '2', 'HBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440113', '44', '1', '13', '番禺区', '广东省', '广州市', '番禺区', '', '0', '2', 'FYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440114', '44', '1', '14', '花都区', '广东省', '广州市', '花都区', '', '0', '2', 'HDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440115', '44', '1', '15', '南沙区', '广东省', '广州市', '南沙区', '', '0', '2', 'NSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440116', '44', '1', '16', '萝岗区', '广东省', '广州市', '萝岗区', '', '0', '2', 'LGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440183', '44', '1', '83', '增城市', '广东省', '广州市', '增城市', '', '0', '2', 'ZCS', '0');
INSERT INTO `t_system_region_info` VALUES ('440184', '44', '1', '84', '从化市', '广东省', '广州市', '从化市', '', '0', '2', 'CHS', '0');
INSERT INTO `t_system_region_info` VALUES ('440200', '44', '2', '0', '韶关市', '广东省', '韶关市', '', '', '0', '1', 'SGS', '0');
INSERT INTO `t_system_region_info` VALUES ('440201', '44', '2', '1', '市辖区', '广东省', '韶关市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440203', '44', '2', '3', '武江区', '广东省', '韶关市', '武江区', '', '0', '2', 'WJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440204', '44', '2', '4', '浈江区', '广东省', '韶关市', '浈江区', '', '0', '2', 'ZJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440205', '44', '2', '5', '曲江区', '广东省', '韶关市', '曲江区', '', '0', '2', 'QJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440222', '44', '2', '22', '始兴县', '广东省', '韶关市', '始兴县', '', '0', '2', 'SXX', '0');
INSERT INTO `t_system_region_info` VALUES ('440224', '44', '2', '24', '仁化县', '广东省', '韶关市', '仁化县', '', '0', '2', 'RHX', '0');
INSERT INTO `t_system_region_info` VALUES ('440229', '44', '2', '29', '翁源县', '广东省', '韶关市', '翁源县', '', '0', '2', 'WYX', '0');
INSERT INTO `t_system_region_info` VALUES ('440232', '44', '2', '32', '乳源瑶族自治县', '广东省', '韶关市', '乳源瑶族自治县', '', '0', '2', 'RYYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('440233', '44', '2', '33', '新丰县', '广东省', '韶关市', '新丰县', '', '0', '2', 'XFX', '0');
INSERT INTO `t_system_region_info` VALUES ('440281', '44', '2', '81', '乐昌市', '广东省', '韶关市', '乐昌市', '', '0', '2', 'LCS', '0');
INSERT INTO `t_system_region_info` VALUES ('440282', '44', '2', '82', '南雄市', '广东省', '韶关市', '南雄市', '', '0', '2', 'NXS', '0');
INSERT INTO `t_system_region_info` VALUES ('440300', '44', '3', '0', '深圳市', '广东省', '深圳市', '', '', '0', '1', 'SZS', '0');
INSERT INTO `t_system_region_info` VALUES ('440301', '44', '3', '1', '市辖区', '广东省', '深圳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440303', '44', '3', '3', '罗湖区', '广东省', '深圳市', '罗湖区', '', '0', '2', 'LHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440304', '44', '3', '4', '福田区', '广东省', '深圳市', '福田区', '', '0', '2', 'FTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440305', '44', '3', '5', '南山区', '广东省', '深圳市', '南山区', '', '0', '2', 'NSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440306', '44', '3', '6', '宝安区', '广东省', '深圳市', '宝安区', '', '0', '2', 'BAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440307', '44', '3', '7', '龙岗区', '广东省', '深圳市', '龙岗区', '', '0', '2', 'LGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440308', '44', '3', '8', '盐田区', '广东省', '深圳市', '盐田区', '', '0', '2', 'YTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440400', '44', '4', '0', '珠海市', '广东省', '珠海市', '', '', '0', '1', 'ZHS', '0');
INSERT INTO `t_system_region_info` VALUES ('440401', '44', '4', '1', '市辖区', '广东省', '珠海市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440402', '44', '4', '2', '香洲区', '广东省', '珠海市', '香洲区', '', '0', '2', 'XZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440403', '44', '4', '3', '斗门区', '广东省', '珠海市', '斗门区', '', '0', '2', 'DMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440404', '44', '4', '4', '金湾区', '广东省', '珠海市', '金湾区', '', '0', '2', 'JWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440500', '44', '5', '0', '汕头市', '广东省', '汕头市', '', '', '0', '1', 'STS', '0');
INSERT INTO `t_system_region_info` VALUES ('440501', '44', '5', '1', '市辖区', '广东省', '汕头市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440507', '44', '5', '7', '龙湖区', '广东省', '汕头市', '龙湖区', '', '0', '2', 'LHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440511', '44', '5', '11', '金平区', '广东省', '汕头市', '金平区', '', '0', '2', 'JPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440512', '44', '5', '12', '濠江区', '广东省', '汕头市', '濠江区', '', '0', '2', 'HJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440513', '44', '5', '13', '潮阳区', '广东省', '汕头市', '潮阳区', '', '0', '2', 'CYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440514', '44', '5', '14', '潮南区', '广东省', '汕头市', '潮南区', '', '0', '2', 'CNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440515', '44', '5', '15', '澄海区', '广东省', '汕头市', '澄海区', '', '0', '2', 'CHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440523', '44', '5', '23', '南澳县', '广东省', '汕头市', '南澳县', '', '0', '2', 'NAX', '0');
INSERT INTO `t_system_region_info` VALUES ('440600', '44', '6', '0', '佛山市', '广东省', '佛山市', '', '', '0', '1', 'FSS', '0');
INSERT INTO `t_system_region_info` VALUES ('440601', '44', '6', '1', '市辖区', '广东省', '佛山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440604', '44', '6', '4', '禅城区', '广东省', '佛山市', '禅城区', '', '0', '2', 'CCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440605', '44', '6', '5', '南海区', '广东省', '佛山市', '南海区', '', '0', '2', 'NHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440606', '44', '6', '6', '顺德区', '广东省', '佛山市', '顺德区', '', '0', '2', 'SDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440607', '44', '6', '7', '三水区', '广东省', '佛山市', '三水区', '', '0', '2', 'SSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440608', '44', '6', '8', '高明区', '广东省', '佛山市', '高明区', '', '0', '2', 'GMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440700', '44', '7', '0', '江门市', '广东省', '江门市', '', '', '0', '1', 'JMS', '0');
INSERT INTO `t_system_region_info` VALUES ('440701', '44', '7', '1', '市辖区', '广东省', '江门市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440703', '44', '7', '3', '蓬江区', '广东省', '江门市', '蓬江区', '', '0', '2', 'PJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440704', '44', '7', '4', '江海区', '广东省', '江门市', '江海区', '', '0', '2', 'JHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440705', '44', '7', '5', '新会区', '广东省', '江门市', '新会区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440781', '44', '7', '81', '台山市', '广东省', '江门市', '台山市', '', '0', '2', 'TSS', '0');
INSERT INTO `t_system_region_info` VALUES ('440783', '44', '7', '83', '开平市', '广东省', '江门市', '开平市', '', '0', '2', 'KPS', '0');
INSERT INTO `t_system_region_info` VALUES ('440784', '44', '7', '84', '鹤山市', '广东省', '江门市', '鹤山市', '', '0', '2', 'HSS', '0');
INSERT INTO `t_system_region_info` VALUES ('440785', '44', '7', '85', '恩平市', '广东省', '江门市', '恩平市', '', '0', '2', 'EPS', '0');
INSERT INTO `t_system_region_info` VALUES ('440800', '44', '8', '0', '湛江市', '广东省', '湛江市', '', '', '0', '1', 'ZJS', '0');
INSERT INTO `t_system_region_info` VALUES ('440801', '44', '8', '1', '市辖区', '广东省', '湛江市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440802', '44', '8', '2', '赤坎区', '广东省', '湛江市', '赤坎区', '', '0', '2', 'CKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440803', '44', '8', '3', '霞山区', '广东省', '湛江市', '霞山区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440804', '44', '8', '4', '坡头区', '广东省', '湛江市', '坡头区', '', '0', '2', 'PTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440811', '44', '8', '11', '麻章区', '广东省', '湛江市', '麻章区', '', '0', '2', 'MZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440823', '44', '8', '23', '遂溪县', '广东省', '湛江市', '遂溪县', '', '0', '2', 'SXX', '0');
INSERT INTO `t_system_region_info` VALUES ('440825', '44', '8', '25', '徐闻县', '广东省', '湛江市', '徐闻县', '', '0', '2', 'XWX', '0');
INSERT INTO `t_system_region_info` VALUES ('440881', '44', '8', '81', '廉江市', '广东省', '湛江市', '廉江市', '', '0', '2', 'LJS', '0');
INSERT INTO `t_system_region_info` VALUES ('440882', '44', '8', '82', '雷州市', '广东省', '湛江市', '雷州市', '', '0', '2', 'LZS', '0');
INSERT INTO `t_system_region_info` VALUES ('440883', '44', '8', '83', '吴川市', '广东省', '湛江市', '吴川市', '', '0', '2', 'WCS', '0');
INSERT INTO `t_system_region_info` VALUES ('440900', '44', '9', '0', '茂名市', '广东省', '茂名市', '', '', '0', '1', 'MMS', '0');
INSERT INTO `t_system_region_info` VALUES ('440901', '44', '9', '1', '市辖区', '广东省', '茂名市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440902', '44', '9', '2', '茂南区', '广东省', '茂名市', '茂南区', '', '0', '2', 'MNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440903', '44', '9', '3', '茂港区', '广东省', '茂名市', '茂港区', '', '0', '2', 'MGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('440923', '44', '9', '23', '电白县', '广东省', '茂名市', '电白县', '', '0', '2', 'DBX', '0');
INSERT INTO `t_system_region_info` VALUES ('440981', '44', '9', '81', '高州市', '广东省', '茂名市', '高州市', '', '0', '2', 'GZS', '0');
INSERT INTO `t_system_region_info` VALUES ('440982', '44', '9', '82', '化州市', '广东省', '茂名市', '化州市', '', '0', '2', 'HZS', '0');
INSERT INTO `t_system_region_info` VALUES ('440983', '44', '9', '83', '信宜市', '广东省', '茂名市', '信宜市', '', '0', '2', 'XYS', '0');
INSERT INTO `t_system_region_info` VALUES ('441200', '44', '12', '0', '肇庆市', '广东省', '肇庆市', '', '', '0', '1', 'ZQS', '0');
INSERT INTO `t_system_region_info` VALUES ('441201', '44', '12', '1', '市辖区', '广东省', '肇庆市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441202', '44', '12', '2', '端州区', '广东省', '肇庆市', '端州区', '', '0', '2', 'DZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441203', '44', '12', '3', '鼎湖区', '广东省', '肇庆市', '鼎湖区', '', '0', '2', 'DHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441223', '44', '12', '23', '广宁县', '广东省', '肇庆市', '广宁县', '', '0', '2', 'ANX', '0');
INSERT INTO `t_system_region_info` VALUES ('441224', '44', '12', '24', '怀集县', '广东省', '肇庆市', '怀集县', '', '0', '2', 'HJX', '0');
INSERT INTO `t_system_region_info` VALUES ('441225', '44', '12', '25', '封开县', '广东省', '肇庆市', '封开县', '', '0', '2', 'FKX', '0');
INSERT INTO `t_system_region_info` VALUES ('441226', '44', '12', '26', '德庆县', '广东省', '肇庆市', '德庆县', '', '0', '2', 'DQX', '0');
INSERT INTO `t_system_region_info` VALUES ('441283', '44', '12', '83', '高要市', '广东省', '肇庆市', '高要市', '', '0', '2', 'GYS', '0');
INSERT INTO `t_system_region_info` VALUES ('441284', '44', '12', '84', '四会市', '广东省', '肇庆市', '四会市', '', '0', '2', 'SHS', '0');
INSERT INTO `t_system_region_info` VALUES ('441300', '44', '13', '0', '惠州市', '广东省', '惠州市', '', '', '0', '1', 'HZS', '0');
INSERT INTO `t_system_region_info` VALUES ('441301', '44', '13', '1', '市辖区', '广东省', '惠州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441302', '44', '13', '2', '惠城区', '广东省', '惠州市', '惠城区', '', '0', '2', 'HCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441303', '44', '13', '3', '惠阳区', '广东省', '惠州市', '惠阳区', '', '0', '2', 'HYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441322', '44', '13', '22', '博罗县', '广东省', '惠州市', '博罗县', '', '0', '2', 'BLX', '0');
INSERT INTO `t_system_region_info` VALUES ('441323', '44', '13', '23', '惠东县', '广东省', '惠州市', '惠东县', '', '0', '2', 'HDX', '0');
INSERT INTO `t_system_region_info` VALUES ('441324', '44', '13', '24', '龙门县', '广东省', '惠州市', '龙门县', '', '0', '2', 'LMX', '0');
INSERT INTO `t_system_region_info` VALUES ('441400', '44', '14', '0', '梅州市', '广东省', '梅州市', '', '', '0', '1', 'MZS', '0');
INSERT INTO `t_system_region_info` VALUES ('441401', '44', '14', '1', '市辖区', '广东省', '梅州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441402', '44', '14', '2', '梅江区', '广东省', '梅州市', '梅江区', '', '0', '2', 'MJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441421', '44', '14', '21', '梅县', '广东省', '梅州市', '梅县', '', '0', '2', 'MX', '0');
INSERT INTO `t_system_region_info` VALUES ('441422', '44', '14', '22', '大埔县', '广东省', '梅州市', '大埔县', '', '0', '2', 'DBX', '0');
INSERT INTO `t_system_region_info` VALUES ('441423', '44', '14', '23', '丰顺县', '广东省', '梅州市', '丰顺县', '', '0', '2', 'FSX', '0');
INSERT INTO `t_system_region_info` VALUES ('441424', '44', '14', '24', '五华县', '广东省', '梅州市', '五华县', '', '0', '2', 'WHX', '0');
INSERT INTO `t_system_region_info` VALUES ('441426', '44', '14', '26', '平远县', '广东省', '梅州市', '平远县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('441427', '44', '14', '27', '蕉岭县', '广东省', '梅州市', '蕉岭县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('441481', '44', '14', '81', '兴宁市', '广东省', '梅州市', '兴宁市', '', '0', '2', 'XNS', '0');
INSERT INTO `t_system_region_info` VALUES ('441500', '44', '15', '0', '汕尾市', '广东省', '汕尾市', '', '', '0', '1', 'SWS', '0');
INSERT INTO `t_system_region_info` VALUES ('441501', '44', '15', '1', '市辖区', '广东省', '汕尾市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441502', '44', '15', '2', '城区', '广东省', '汕尾市', '城区', '', '0', '2', 'CQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441521', '44', '15', '21', '海丰县', '广东省', '汕尾市', '海丰县', '', '0', '2', 'HFX', '0');
INSERT INTO `t_system_region_info` VALUES ('441523', '44', '15', '23', '陆河县', '广东省', '汕尾市', '陆河县', '', '0', '2', 'LHX', '0');
INSERT INTO `t_system_region_info` VALUES ('441581', '44', '15', '81', '陆丰市', '广东省', '汕尾市', '陆丰市', '', '0', '2', 'LFS', '0');
INSERT INTO `t_system_region_info` VALUES ('441600', '44', '16', '0', '河源市', '广东省', '河源市', '', '', '0', '1', 'HYS', '0');
INSERT INTO `t_system_region_info` VALUES ('441601', '44', '16', '1', '市辖区', '广东省', '河源市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441602', '44', '16', '2', '源城区', '广东省', '河源市', '源城区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441621', '44', '16', '21', '紫金县', '广东省', '河源市', '紫金县', '', '0', '2', 'ZJX', '0');
INSERT INTO `t_system_region_info` VALUES ('441622', '44', '16', '22', '龙川县', '广东省', '河源市', '龙川县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('441623', '44', '16', '23', '连平县', '广东省', '河源市', '连平县', '', '0', '2', 'LPX', '0');
INSERT INTO `t_system_region_info` VALUES ('441624', '44', '16', '24', '和平县', '广东省', '河源市', '和平县', '', '0', '2', 'HPX', '0');
INSERT INTO `t_system_region_info` VALUES ('441625', '44', '16', '25', '东源县', '广东省', '河源市', '东源县', '', '0', '2', 'DYX', '0');
INSERT INTO `t_system_region_info` VALUES ('441700', '44', '17', '0', '阳江市', '广东省', '阳江市', '', '', '0', '1', 'YJS', '0');
INSERT INTO `t_system_region_info` VALUES ('441701', '44', '17', '1', '市辖区', '广东省', '阳江市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441702', '44', '17', '2', '江城区', '广东省', '阳江市', '江城区', '', '0', '2', 'JCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441721', '44', '17', '21', '阳西县', '广东省', '阳江市', '阳西县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('441723', '44', '17', '23', '阳东县', '广东省', '阳江市', '阳东县', '', '0', '2', 'YDX', '0');
INSERT INTO `t_system_region_info` VALUES ('441781', '44', '17', '81', '阳春市', '广东省', '阳江市', '阳春市', '', '0', '2', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('441800', '44', '18', '0', '清远市', '广东省', '清远市', '', '', '0', '1', 'QYS', '0');
INSERT INTO `t_system_region_info` VALUES ('441801', '44', '18', '1', '市辖区', '广东省', '清远市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441802', '44', '18', '2', '清城区', '广东省', '清远市', '清城区', '', '0', '2', 'QCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('441821', '44', '18', '21', '佛冈县', '广东省', '清远市', '佛冈县', '', '0', '2', 'FGX', '0');
INSERT INTO `t_system_region_info` VALUES ('441823', '44', '18', '23', '阳山县', '广东省', '清远市', '阳山县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('441825', '44', '18', '25', '连山壮族瑶族自治县', '广东省', '清远市', '连山壮族瑶族自治县', '', '0', '2', 'LSZZYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('441826', '44', '18', '26', '连南瑶族自治县', '广东省', '清远市', '连南瑶族自治县', '', '0', '2', 'LNYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('441827', '44', '18', '27', '清新县', '广东省', '清远市', '清新县', '', '0', '2', 'QXX', '0');
INSERT INTO `t_system_region_info` VALUES ('441881', '44', '18', '81', '英德市', '广东省', '清远市', '英德市', '', '0', '2', 'YDS', '0');
INSERT INTO `t_system_region_info` VALUES ('441882', '44', '18', '82', '连州市', '广东省', '清远市', '连州市', '', '0', '2', 'LZS', '0');
INSERT INTO `t_system_region_info` VALUES ('441900', '44', '19', '0', '东莞市', '广东省', '东莞市', '', '', '0', '1', 'DGS', '0');
INSERT INTO `t_system_region_info` VALUES ('441901', '44', '19', '1', '东莞市', '广东省', '东莞市', '东莞市', null, '0', '2', 'DGS', '0');
INSERT INTO `t_system_region_info` VALUES ('442000', '44', '20', '0', '中山市', '广东省', '中山市', '', '', '0', '1', 'ZSS', '0');
INSERT INTO `t_system_region_info` VALUES ('442001', '44', '20', '1', '中山市', '广东省', '中山市', '中山市', null, '0', '2', 'ZSS', '0');
INSERT INTO `t_system_region_info` VALUES ('445100', '44', '51', '0', '潮州市', '广东省', '潮州市', '', '', '0', '1', 'CZS', '0');
INSERT INTO `t_system_region_info` VALUES ('445101', '44', '51', '1', '市辖区', '广东省', '潮州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('445102', '44', '51', '2', '湘桥区', '广东省', '潮州市', '湘桥区', '', '0', '2', 'XQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('445121', '44', '51', '21', '潮安县', '广东省', '潮州市', '潮安县', '', '0', '2', 'CAX', '0');
INSERT INTO `t_system_region_info` VALUES ('445122', '44', '51', '22', '饶平县', '广东省', '潮州市', '饶平县', '', '0', '2', 'RPX', '0');
INSERT INTO `t_system_region_info` VALUES ('445200', '44', '52', '0', '揭阳市', '广东省', '揭阳市', '', '', '0', '1', 'JYS', '0');
INSERT INTO `t_system_region_info` VALUES ('445201', '44', '52', '1', '市辖区', '广东省', '揭阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('445202', '44', '52', '2', '榕城区', '广东省', '揭阳市', '榕城区', '', '0', '2', 'RCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('445221', '44', '52', '21', '揭东县', '广东省', '揭阳市', '揭东县', '', '0', '2', 'JDX', '0');
INSERT INTO `t_system_region_info` VALUES ('445222', '44', '52', '22', '揭西县', '广东省', '揭阳市', '揭西县', '', '0', '2', 'JXX', '0');
INSERT INTO `t_system_region_info` VALUES ('445224', '44', '52', '24', '惠来县', '广东省', '揭阳市', '惠来县', '', '0', '2', 'HLX', '0');
INSERT INTO `t_system_region_info` VALUES ('445281', '44', '52', '81', '普宁市', '广东省', '揭阳市', '普宁市', '', '0', '2', 'PNS', '0');
INSERT INTO `t_system_region_info` VALUES ('445300', '44', '53', '0', '云浮市', '广东省', '云浮市', '', '', '0', '1', 'YFS', '0');
INSERT INTO `t_system_region_info` VALUES ('445301', '44', '53', '1', '市辖区', '广东省', '云浮市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('445302', '44', '53', '2', '云城区', '广东省', '云浮市', '云城区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('445321', '44', '53', '21', '新兴县', '广东省', '云浮市', '新兴县', '', '0', '2', 'XXX', '0');
INSERT INTO `t_system_region_info` VALUES ('445322', '44', '53', '22', '郁南县', '广东省', '云浮市', '郁南县', '', '0', '2', 'YNX', '0');
INSERT INTO `t_system_region_info` VALUES ('445323', '44', '53', '23', '云安县', '广东省', '云浮市', '云安县', '', '0', '2', 'YAX', '0');
INSERT INTO `t_system_region_info` VALUES ('445381', '44', '53', '81', '罗定市', '广东省', '云浮市', '罗定市', '', '0', '2', 'LDS', '0');
INSERT INTO `t_system_region_info` VALUES ('450000', '45', '0', '0', '广西壮族自治区', '广西壮族自治区', '', '', '', '0', '0', 'AXZZZZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450100', '45', '1', '0', '南宁市', '广西壮族自治区', '南宁市', '', '', '0', '1', 'NNS', '0');
INSERT INTO `t_system_region_info` VALUES ('450101', '45', '1', '1', '市辖区', '广西壮族自治区', '南宁市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450102', '45', '1', '2', '兴宁区', '广西壮族自治区', '南宁市', '兴宁区', '', '0', '2', 'XNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450103', '45', '1', '3', '青秀区', '广西壮族自治区', '南宁市', '青秀区', '', '0', '2', 'QXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450105', '45', '1', '5', '江南区', '广西壮族自治区', '南宁市', '江南区', '', '0', '2', 'JNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450107', '45', '1', '7', '西乡塘区', '广西壮族自治区', '南宁市', '西乡塘区', '', '0', '2', 'XXTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450108', '45', '1', '8', '良庆区', '广西壮族自治区', '南宁市', '良庆区', '', '0', '2', 'LQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450109', '45', '1', '9', '邕宁区', '广西壮族自治区', '南宁市', '邕宁区', '', '0', '2', 'YNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450122', '45', '1', '22', '武鸣县', '广西壮族自治区', '南宁市', '武鸣县', '', '0', '2', 'WMX', '0');
INSERT INTO `t_system_region_info` VALUES ('450123', '45', '1', '23', '隆安县', '广西壮族自治区', '南宁市', '隆安县', '', '0', '2', 'LAX', '0');
INSERT INTO `t_system_region_info` VALUES ('450124', '45', '1', '24', '马山县', '广西壮族自治区', '南宁市', '马山县', '', '0', '2', 'MSX', '0');
INSERT INTO `t_system_region_info` VALUES ('450125', '45', '1', '25', '上林县', '广西壮族自治区', '南宁市', '上林县', '', '0', '2', 'SLX', '0');
INSERT INTO `t_system_region_info` VALUES ('450126', '45', '1', '26', '宾阳县', '广西壮族自治区', '南宁市', '宾阳县', '', '0', '2', 'BYX', '0');
INSERT INTO `t_system_region_info` VALUES ('450127', '45', '1', '27', '横县', '广西壮族自治区', '南宁市', '横县', '', '0', '2', 'HX', '0');
INSERT INTO `t_system_region_info` VALUES ('450200', '45', '2', '0', '柳州市', '广西壮族自治区', '柳州市', '', '', '0', '1', 'LZS', '0');
INSERT INTO `t_system_region_info` VALUES ('450201', '45', '2', '1', '市辖区', '广西壮族自治区', '柳州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450202', '45', '2', '2', '城中区', '广西壮族自治区', '柳州市', '城中区', '', '0', '2', 'CZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450203', '45', '2', '3', '鱼峰区', '广西壮族自治区', '柳州市', '鱼峰区', '', '0', '2', 'YFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450204', '45', '2', '4', '柳南区', '广西壮族自治区', '柳州市', '柳南区', '', '0', '2', 'LNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450205', '45', '2', '5', '柳北区', '广西壮族自治区', '柳州市', '柳北区', '', '0', '2', 'LBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450221', '45', '2', '21', '柳江县', '广西壮族自治区', '柳州市', '柳江县', '', '0', '2', 'LJX', '0');
INSERT INTO `t_system_region_info` VALUES ('450222', '45', '2', '22', '柳城县', '广西壮族自治区', '柳州市', '柳城县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('450223', '45', '2', '23', '鹿寨县', '广西壮族自治区', '柳州市', '鹿寨县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('450224', '45', '2', '24', '融安县', '广西壮族自治区', '柳州市', '融安县', '', '0', '2', 'RAX', '0');
INSERT INTO `t_system_region_info` VALUES ('450225', '45', '2', '25', '融水苗族自治县', '广西壮族自治区', '柳州市', '融水苗族自治县', '', '0', '2', 'RSMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('450226', '45', '2', '26', '三江侗族自治县', '广西壮族自治区', '柳州市', '三江侗族自治县', '', '0', '2', 'SJDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('450300', '45', '3', '0', '桂林市', '广西壮族自治区', '桂林市', '', '', '0', '1', 'GLS', '0');
INSERT INTO `t_system_region_info` VALUES ('450301', '45', '3', '1', '市辖区', '广西壮族自治区', '桂林市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450302', '45', '3', '2', '秀峰区', '广西壮族自治区', '桂林市', '秀峰区', '', '0', '2', 'XFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450303', '45', '3', '3', '叠彩区', '广西壮族自治区', '桂林市', '叠彩区', '', '0', '2', 'DCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450304', '45', '3', '4', '象山区', '广西壮族自治区', '桂林市', '象山区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450305', '45', '3', '5', '七星区', '广西壮族自治区', '桂林市', '七星区', '', '0', '2', 'QXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450311', '45', '3', '11', '雁山区', '广西壮族自治区', '桂林市', '雁山区', '', '0', '2', 'YSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450321', '45', '3', '21', '阳朔县', '广西壮族自治区', '桂林市', '阳朔县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('450322', '45', '3', '22', '临桂县', '广西壮族自治区', '桂林市', '临桂县', '', '0', '2', 'LGX', '0');
INSERT INTO `t_system_region_info` VALUES ('450323', '45', '3', '23', '灵川县', '广西壮族自治区', '桂林市', '灵川县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('450324', '45', '3', '24', '全州县', '广西壮族自治区', '桂林市', '全州县', '', '0', '2', 'QZX', '0');
INSERT INTO `t_system_region_info` VALUES ('450325', '45', '3', '25', '兴安县', '广西壮族自治区', '桂林市', '兴安县', '', '0', '2', 'XAX', '0');
INSERT INTO `t_system_region_info` VALUES ('450326', '45', '3', '26', '永福县', '广西壮族自治区', '桂林市', '永福县', '', '0', '2', 'YFX', '0');
INSERT INTO `t_system_region_info` VALUES ('450327', '45', '3', '27', '灌阳县', '广西壮族自治区', '桂林市', '灌阳县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('450328', '45', '3', '28', '龙胜各族自治县', '广西壮族自治区', '桂林市', '龙胜各族自治县', '', '0', '2', 'LSGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('450329', '45', '3', '29', '资源县', '广西壮族自治区', '桂林市', '资源县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('450330', '45', '3', '30', '平乐县', '广西壮族自治区', '桂林市', '平乐县', '', '0', '2', 'PLX', '0');
INSERT INTO `t_system_region_info` VALUES ('450331', '45', '3', '31', '荔蒲县', '广西壮族自治区', '桂林市', '荔蒲县', '', '0', '2', 'LPX', '0');
INSERT INTO `t_system_region_info` VALUES ('450332', '45', '3', '32', '恭城瑶族自治县', '广西壮族自治区', '桂林市', '恭城瑶族自治县', '', '0', '2', 'GCYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('450400', '45', '4', '0', '梧州市', '广西壮族自治区', '梧州市', '', '', '0', '1', 'WZS', '0');
INSERT INTO `t_system_region_info` VALUES ('450401', '45', '4', '1', '市辖区', '广西壮族自治区', '梧州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450403', '45', '4', '3', '万秀区', '广西壮族自治区', '梧州市', '万秀区', '', '0', '2', 'MXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450404', '45', '4', '4', '蝶山区', '广西壮族自治区', '梧州市', '蝶山区', '', '0', '2', 'DSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450405', '45', '4', '5', '长洲区', '广西壮族自治区', '梧州市', '长洲区', '', '0', '2', 'CZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450421', '45', '4', '21', '苍梧县', '广西壮族自治区', '梧州市', '苍梧县', '', '0', '2', 'CWX', '0');
INSERT INTO `t_system_region_info` VALUES ('450422', '45', '4', '22', '藤县', '广西壮族自治区', '梧州市', '藤县', '', '0', '2', 'TX', '0');
INSERT INTO `t_system_region_info` VALUES ('450423', '45', '4', '23', '蒙山县', '广西壮族自治区', '梧州市', '蒙山县', '', '0', '2', 'MSX', '0');
INSERT INTO `t_system_region_info` VALUES ('450481', '45', '4', '81', '岑溪市', '广西壮族自治区', '梧州市', '岑溪市', '', '0', '2', 'CXS', '0');
INSERT INTO `t_system_region_info` VALUES ('450500', '45', '5', '0', '北海市', '广西壮族自治区', '北海市', '', '', '0', '1', 'BHS', '0');
INSERT INTO `t_system_region_info` VALUES ('450501', '45', '5', '1', '市辖区', '广西壮族自治区', '北海市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450502', '45', '5', '2', '海城区', '广西壮族自治区', '北海市', '海城区', '', '0', '2', 'HCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450503', '45', '5', '3', '银海区', '广西壮族自治区', '北海市', '银海区', '', '0', '2', 'YHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450512', '45', '5', '12', '铁山港区', '广西壮族自治区', '北海市', '铁山港区', '', '0', '2', 'TSGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450521', '45', '5', '21', '合浦县', '广西壮族自治区', '北海市', '合浦县', '', '0', '2', 'GPX', '0');
INSERT INTO `t_system_region_info` VALUES ('450600', '45', '6', '0', '防城港市', '广西壮族自治区', '防城港市', '', '', '0', '1', 'FCGS', '0');
INSERT INTO `t_system_region_info` VALUES ('450601', '45', '6', '1', '市辖区', '广西壮族自治区', '防城港市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450602', '45', '6', '2', '港口区', '广西壮族自治区', '防城港市', '港口区', '', '0', '2', 'GKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450603', '45', '6', '3', '防城区', '广西壮族自治区', '防城港市', '防城区', '', '0', '2', 'FCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450621', '45', '6', '21', '上思县', '广西壮族自治区', '防城港市', '上思县', '', '0', '2', 'SSX', '0');
INSERT INTO `t_system_region_info` VALUES ('450681', '45', '6', '81', '东兴市', '广西壮族自治区', '防城港市', '东兴市', '', '0', '2', 'DXS', '0');
INSERT INTO `t_system_region_info` VALUES ('450700', '45', '7', '0', '钦州市', '广西壮族自治区', '钦州市', '', '', '0', '1', 'QZS', '0');
INSERT INTO `t_system_region_info` VALUES ('450701', '45', '7', '1', '市辖区', '广西壮族自治区', '钦州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450702', '45', '7', '2', '钦南区', '广西壮族自治区', '钦州市', '钦南区', '', '0', '2', 'QNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450703', '45', '7', '3', '钦北区', '广西壮族自治区', '钦州市', '钦北区', '', '0', '2', 'QBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450721', '45', '7', '21', '灵山县', '广西壮族自治区', '钦州市', '灵山县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('450722', '45', '7', '22', '浦北县', '广西壮族自治区', '钦州市', '浦北县', '', '0', '2', 'PBX', '0');
INSERT INTO `t_system_region_info` VALUES ('450800', '45', '8', '0', '贵港市', '广西壮族自治区', '贵港市', '', '', '0', '1', 'GGS', '0');
INSERT INTO `t_system_region_info` VALUES ('450801', '45', '8', '1', '市辖区', '广西壮族自治区', '贵港市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450802', '45', '8', '2', '港北区', '广西壮族自治区', '贵港市', '港北区', '', '0', '2', 'GBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450803', '45', '8', '3', '港南区', '广西壮族自治区', '贵港市', '港南区', '', '0', '2', 'GNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450804', '45', '8', '4', '覃塘区', '广西壮族自治区', '贵港市', '覃塘区', '', '0', '2', 'QTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450821', '45', '8', '21', '平南县', '广西壮族自治区', '贵港市', '平南县', '', '0', '2', 'PNX', '0');
INSERT INTO `t_system_region_info` VALUES ('450881', '45', '8', '81', '桂平市', '广西壮族自治区', '贵港市', '桂平市', '', '0', '2', 'GPS', '0');
INSERT INTO `t_system_region_info` VALUES ('450900', '45', '9', '0', '玉林市', '广西壮族自治区', '玉林市', '', '', '0', '1', 'YLS', '0');
INSERT INTO `t_system_region_info` VALUES ('450901', '45', '9', '1', '市辖区', '广西壮族自治区', '玉林市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450902', '45', '9', '2', '玉州区', '广西壮族自治区', '玉林市', '玉州区', '', '0', '2', 'YZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('450921', '45', '9', '21', '容县', '广西壮族自治区', '玉林市', '容县', '', '0', '2', 'RX', '0');
INSERT INTO `t_system_region_info` VALUES ('450922', '45', '9', '22', '陆川县', '广西壮族自治区', '玉林市', '陆川县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('450923', '45', '9', '23', '博白县', '广西壮族自治区', '玉林市', '博白县', '', '0', '2', 'BBX', '0');
INSERT INTO `t_system_region_info` VALUES ('450924', '45', '9', '24', '兴业县', '广西壮族自治区', '玉林市', '兴业县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('450981', '45', '9', '81', '北流市', '广西壮族自治区', '玉林市', '北流市', '', '0', '2', 'BLS', '0');
INSERT INTO `t_system_region_info` VALUES ('451000', '45', '10', '0', '百色市', '广西壮族自治区', '百色市', '', '', '0', '1', 'BSS', '0');
INSERT INTO `t_system_region_info` VALUES ('451001', '45', '10', '1', '市辖区', '广西壮族自治区', '百色市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451002', '45', '10', '2', '右江区', '广西壮族自治区', '百色市', '右江区', '', '0', '2', 'YJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451021', '45', '10', '21', '田阳县', '广西壮族自治区', '百色市', '田阳县', '', '0', '2', 'TYX', '0');
INSERT INTO `t_system_region_info` VALUES ('451022', '45', '10', '22', '田东县', '广西壮族自治区', '百色市', '田东县', '', '0', '2', 'TDX', '0');
INSERT INTO `t_system_region_info` VALUES ('451023', '45', '10', '23', '平果县', '广西壮族自治区', '百色市', '平果县', '', '0', '2', 'PGX', '0');
INSERT INTO `t_system_region_info` VALUES ('451024', '45', '10', '24', '德保县', '广西壮族自治区', '百色市', '德保县', '', '0', '2', 'DBX', '0');
INSERT INTO `t_system_region_info` VALUES ('451025', '45', '10', '25', '靖西县', '广西壮族自治区', '百色市', '靖西县', '', '0', '2', 'JXX', '0');
INSERT INTO `t_system_region_info` VALUES ('451026', '45', '10', '26', '那坡县', '广西壮族自治区', '百色市', '那坡县', '', '0', '2', 'NPX', '0');
INSERT INTO `t_system_region_info` VALUES ('451027', '45', '10', '27', '凌云县', '广西壮族自治区', '百色市', '凌云县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('451028', '45', '10', '28', '乐业县', '广西壮族自治区', '百色市', '乐业县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('451029', '45', '10', '29', '田林县', '广西壮族自治区', '百色市', '田林县', '', '0', '2', 'TLX', '0');
INSERT INTO `t_system_region_info` VALUES ('451030', '45', '10', '30', '西林县', '广西壮族自治区', '百色市', '西林县', '', '0', '2', 'XLX', '0');
INSERT INTO `t_system_region_info` VALUES ('451031', '45', '10', '31', '隆林各族自治县', '广西壮族自治区', '百色市', '隆林各族自治县', '', '0', '2', 'LLGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451100', '45', '11', '0', '贺州市', '广西壮族自治区', '贺州市', '', '', '0', '1', 'HZS', '0');
INSERT INTO `t_system_region_info` VALUES ('451101', '45', '11', '1', '市辖区', '广西壮族自治区', '贺州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451102', '45', '11', '2', '八步区', '广西壮族自治区', '贺州市', '八步区', '', '0', '2', 'BBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451121', '45', '11', '21', '昭平县', '广西壮族自治区', '贺州市', '昭平县', '', '0', '2', 'ZPX', '0');
INSERT INTO `t_system_region_info` VALUES ('451122', '45', '11', '22', '钟山县', '广西壮族自治区', '贺州市', '钟山县', '', '0', '2', 'ZSX', '0');
INSERT INTO `t_system_region_info` VALUES ('451123', '45', '11', '23', '富川瑶族自治县', '广西壮族自治区', '贺州市', '富川瑶族自治县', '', '0', '2', 'FCYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451200', '45', '12', '0', '河池市', '广西壮族自治区', '河池市', '', '', '0', '1', 'HCS', '0');
INSERT INTO `t_system_region_info` VALUES ('451201', '45', '12', '1', '市辖区', '广西壮族自治区', '河池市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451202', '45', '12', '2', '金城江区', '广西壮族自治区', '河池市', '金城江区', '', '0', '2', 'JCJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451221', '45', '12', '21', '南丹县', '广西壮族自治区', '河池市', '南丹县', '', '0', '2', 'NDX', '0');
INSERT INTO `t_system_region_info` VALUES ('451222', '45', '12', '22', '天峨县', '广西壮族自治区', '河池市', '天峨县', '', '0', '2', 'TEX', '0');
INSERT INTO `t_system_region_info` VALUES ('451223', '45', '12', '23', '凤山县', '广西壮族自治区', '河池市', '凤山县', '', '0', '2', 'FSX', '0');
INSERT INTO `t_system_region_info` VALUES ('451224', '45', '12', '24', '东兰县', '广西壮族自治区', '河池市', '东兰县', '', '0', '2', 'DLX', '0');
INSERT INTO `t_system_region_info` VALUES ('451225', '45', '12', '25', '罗城仫佬族自治县', '广西壮族自治区', '河池市', '罗城仫佬族自治县', '', '0', '2', 'LCMLZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451226', '45', '12', '26', '环江毛南族自治县', '广西壮族自治区', '河池市', '环江毛南族自治县', '', '0', '2', 'HJMNZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451227', '45', '12', '27', '巴马瑶族自治县', '广西壮族自治区', '河池市', '巴马瑶族自治县', '', '0', '2', 'BMYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451228', '45', '12', '28', '都安瑶族自治县', '广西壮族自治区', '河池市', '都安瑶族自治县', '', '0', '2', 'DAYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451229', '45', '12', '29', '大化瑶族自治县', '广西壮族自治区', '河池市', '大化瑶族自治县', '', '0', '2', 'DHYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451281', '45', '12', '81', '宜州市', '广西壮族自治区', '河池市', '宜州市', '', '0', '2', 'YZS', '0');
INSERT INTO `t_system_region_info` VALUES ('451300', '45', '13', '0', '来宾市', '广西壮族自治区', '来宾市', '', '', '0', '1', 'LBS', '0');
INSERT INTO `t_system_region_info` VALUES ('451301', '45', '13', '1', '市辖区', '广西壮族自治区', '来宾市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451302', '45', '13', '2', '兴宾区', '广西壮族自治区', '来宾市', '兴宾区', '', '0', '2', 'XBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451321', '45', '13', '21', '忻城县', '广西壮族自治区', '来宾市', '忻城县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('451322', '45', '13', '22', '象州县', '广西壮族自治区', '来宾市', '象州县', '', '0', '2', 'XZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451323', '45', '13', '23', '武宣县', '广西壮族自治区', '来宾市', '武宣县', '', '0', '2', 'WXX', '0');
INSERT INTO `t_system_region_info` VALUES ('451324', '45', '13', '24', '金秀瑶族自治县', '广西壮族自治区', '来宾市', '金秀瑶族自治县', '', '0', '2', 'JXYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451381', '45', '13', '81', '合山市', '广西壮族自治区', '来宾市', '合山市', '', '0', '2', 'GSS', '0');
INSERT INTO `t_system_region_info` VALUES ('451400', '45', '14', '0', '崇左市', '广西壮族自治区', '崇左市', '', '', '0', '1', 'CZS', '0');
INSERT INTO `t_system_region_info` VALUES ('451401', '45', '14', '1', '市辖区', '广西壮族自治区', '崇左市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451402', '45', '14', '2', '江洲区', '广西壮族自治区', '崇左市', '江洲区', '', '0', '2', 'JZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('451421', '45', '14', '21', '扶绥县', '广西壮族自治区', '崇左市', '扶绥县', '', '0', '2', 'FSX', '0');
INSERT INTO `t_system_region_info` VALUES ('451422', '45', '14', '22', '宁明县', '广西壮族自治区', '崇左市', '宁明县', '', '0', '2', 'NMX', '0');
INSERT INTO `t_system_region_info` VALUES ('451423', '45', '14', '23', '龙州县', '广西壮族自治区', '崇左市', '龙州县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('451424', '45', '14', '24', '大新县', '广西壮族自治区', '崇左市', '大新县', '', '0', '2', 'DXX', '0');
INSERT INTO `t_system_region_info` VALUES ('451425', '45', '14', '25', '天等县', '广西壮族自治区', '崇左市', '天等县', '', '0', '2', 'TDX', '0');
INSERT INTO `t_system_region_info` VALUES ('451481', '45', '14', '81', '凭祥市', '广西壮族自治区', '崇左市', '凭祥市', '', '0', '2', 'PXS', '0');
INSERT INTO `t_system_region_info` VALUES ('460000', '46', '0', '0', '海南省', '海南省', '', '', '', '0', '0', 'HNS', '0');
INSERT INTO `t_system_region_info` VALUES ('460100', '46', '1', '0', '海口市', '海南省', '海口市', '', '', '0', '1', 'HKS', '0');
INSERT INTO `t_system_region_info` VALUES ('460101', '46', '1', '1', '市辖区', '海南省', '海口市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('460105', '46', '1', '5', '秀英区', '海南省', '海口市', '秀英区', '', '0', '2', 'XYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('460106', '46', '1', '6', '龙华区', '海南省', '海口市', '龙华区', '', '0', '2', 'LHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('460107', '46', '1', '7', '琼山区', '海南省', '海口市', '琼山区', '', '0', '2', 'QSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('460108', '46', '1', '8', '美兰区', '海南省', '海口市', '美兰区', '', '0', '2', 'MLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('460200', '46', '2', '0', '三亚市', '海南省', '三亚市', '', '', '0', '1', 'SYS', '0');
INSERT INTO `t_system_region_info` VALUES ('460201', '46', '2', '1', '市辖区', '海南省', '三亚市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('469000', '46', '90', '0', '省直辖县级行政区划', '海南省', '省直辖县级行政区划', '', '', '0', '1', 'SZXXJHZQH', '0');
INSERT INTO `t_system_region_info` VALUES ('469001', '46', '90', '1', '五指山市', '海南省', '省直辖县级行政区划', '五指山市', '', '0', '2', 'WZSS', '0');
INSERT INTO `t_system_region_info` VALUES ('469002', '46', '90', '2', '琼海市', '海南省', '省直辖县级行政区划', '琼海市', '', '0', '2', 'QHS', '0');
INSERT INTO `t_system_region_info` VALUES ('469003', '46', '90', '3', '儋州市', '海南省', '省直辖县级行政区划', '儋州市', '', '0', '2', 'DZS', '0');
INSERT INTO `t_system_region_info` VALUES ('469005', '46', '90', '5', '文昌市', '海南省', '省直辖县级行政区划', '文昌市', '', '0', '2', 'WCS', '0');
INSERT INTO `t_system_region_info` VALUES ('469006', '46', '90', '6', '万宁市', '海南省', '省直辖县级行政区划', '万宁市', '', '0', '2', 'MNS', '0');
INSERT INTO `t_system_region_info` VALUES ('469007', '46', '90', '7', '东方市', '海南省', '省直辖县级行政区划', '东方市', '', '0', '2', 'DFS', '0');
INSERT INTO `t_system_region_info` VALUES ('469021', '46', '90', '21', '定安县', '海南省', '省直辖县级行政区划', '定安县', '', '0', '2', 'DAX', '0');
INSERT INTO `t_system_region_info` VALUES ('469022', '46', '90', '22', '屯昌县', '海南省', '省直辖县级行政区划', '屯昌县', '', '0', '2', 'TCX', '0');
INSERT INTO `t_system_region_info` VALUES ('469023', '46', '90', '23', '澄迈县', '海南省', '省直辖县级行政区划', '澄迈县', '', '0', '2', 'CMX', '0');
INSERT INTO `t_system_region_info` VALUES ('469024', '46', '90', '24', '临高县', '海南省', '省直辖县级行政区划', '临高县', '', '0', '2', 'LGX', '0');
INSERT INTO `t_system_region_info` VALUES ('469025', '46', '90', '25', '白沙黎族自治县', '海南省', '省直辖县级行政区划', '白沙黎族自治县', '', '0', '2', 'BSLZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('469026', '46', '90', '26', '昌江黎族自治县', '海南省', '省直辖县级行政区划', '昌江黎族自治县', '', '0', '2', 'CJLZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('469027', '46', '90', '27', '乐东黎族自治县', '海南省', '省直辖县级行政区划', '乐东黎族自治县', '', '0', '2', 'LDLZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('469028', '46', '90', '28', '陵水黎族自治县', '海南省', '省直辖县级行政区划', '陵水黎族自治县', '', '0', '2', 'LSLZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('469029', '46', '90', '29', '保亭黎族苗族自治县', '海南省', '省直辖县级行政区划', '保亭黎族苗族自治县', '', '0', '2', 'BTLZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('469030', '46', '90', '30', '琼中黎族苗族自治县', '海南省', '省直辖县级行政区划', '琼中黎族苗族自治县', '', '0', '2', 'QZLZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('469031', '46', '90', '31', '西沙群岛', '海南省', '省直辖县级行政区划', '西沙群岛', '', '0', '2', 'XSQD', '0');
INSERT INTO `t_system_region_info` VALUES ('469032', '46', '90', '32', '南沙群岛', '海南省', '省直辖县级行政区划', '南沙群岛', '', '0', '2', 'NSQD', '0');
INSERT INTO `t_system_region_info` VALUES ('469033', '46', '90', '33', '中沙群岛的岛礁及其海域', '海南省', '省直辖县级行政区划', '中沙群岛的岛礁及其海域', '', '0', '2', 'ZSQDDDJJJHY', '0');
INSERT INTO `t_system_region_info` VALUES ('500000', '50', '0', '0', '重庆市', '重庆市', '', '', '', '0', '0', 'CQS', '0');
INSERT INTO `t_system_region_info` VALUES ('500100', '50', '1', '0', '重庆市', '重庆市', '重庆市', '', '', '0', '1', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500101', '50', '1', '1', '万州区', '重庆市', '市辖区', '万州区', '', '0', '2', 'MZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500102', '50', '1', '2', '涪陵区', '重庆市', '市辖区', '涪陵区', '', '0', '2', 'FLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500103', '50', '1', '3', '渝中区', '重庆市', '市辖区', '渝中区', '', '0', '2', 'YZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500104', '50', '1', '4', '大渡口区', '重庆市', '市辖区', '大渡口区', '', '0', '2', 'DDKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500105', '50', '1', '5', '江北区', '重庆市', '市辖区', '江北区', '', '0', '2', 'JBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500106', '50', '1', '6', '沙坪坝区', '重庆市', '市辖区', '沙坪坝区', '', '0', '2', 'SPBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500107', '50', '1', '7', '九龙坡区', '重庆市', '市辖区', '九龙坡区', '', '0', '2', 'JLPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500108', '50', '1', '8', '南岸区', '重庆市', '市辖区', '南岸区', '', '0', '2', 'NAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500109', '50', '1', '9', '北碚区', '重庆市', '市辖区', '北碚区', '', '0', '2', 'BBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500110', '50', '1', '10', '綦江区', '重庆市', '市辖区', '綦江区', '', '0', '2', 'QJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500111', '50', '1', '11', '大足区', '重庆市', '市辖区', '大足区', '', '0', '2', 'DZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500112', '50', '1', '12', '渝北区', '重庆市', '市辖区', '渝北区', '', '0', '2', 'YBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500113', '50', '1', '13', '巴南区', '重庆市', '市辖区', '巴南区', '', '0', '2', 'BNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500114', '50', '1', '14', '黔江区', '重庆市', '市辖区', '黔江区', '', '0', '2', 'QJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500115', '50', '1', '15', '长寿区', '重庆市', '市辖区', '长寿区', '', '0', '2', 'CSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500116', '50', '1', '16', '江津区', '重庆市', '市辖区', '江津区', '', '0', '2', 'JJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500117', '50', '1', '17', '合川区', '重庆市', '市辖区', '合川区', '', '0', '2', 'GCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500118', '50', '1', '18', '永川区', '重庆市', '市辖区', '永川区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500119', '50', '1', '19', '南川区', '重庆市', '市辖区', '南川区', '', '0', '2', 'NCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('500200', '50', '2', '0', '县', '重庆市', '县', '', '', '0', '2', 'X', '0');
INSERT INTO `t_system_region_info` VALUES ('500223', '50', '2', '23', '潼南县', '重庆市', '县', '潼南县', '', '0', '2', 'TNX', '0');
INSERT INTO `t_system_region_info` VALUES ('500224', '50', '2', '24', '铜梁县', '重庆市', '县', '铜梁县', '', '0', '2', 'TLX', '0');
INSERT INTO `t_system_region_info` VALUES ('500226', '50', '2', '26', '荣昌县', '重庆市', '县', '荣昌县', '', '0', '2', 'RCX', '0');
INSERT INTO `t_system_region_info` VALUES ('500227', '50', '2', '27', '璧山县', '重庆市', '县', '璧山县', '', '0', '2', 'BSX', '0');
INSERT INTO `t_system_region_info` VALUES ('500228', '50', '2', '28', '梁平县', '重庆市', '县', '梁平县', '', '0', '2', 'LPX', '0');
INSERT INTO `t_system_region_info` VALUES ('500229', '50', '2', '29', '城口县', '重庆市', '县', '城口县', '', '0', '2', 'CKX', '0');
INSERT INTO `t_system_region_info` VALUES ('500230', '50', '2', '30', '丰都县', '重庆市', '县', '丰都县', '', '0', '2', 'FDX', '0');
INSERT INTO `t_system_region_info` VALUES ('500231', '50', '2', '31', '垫江县', '重庆市', '县', '垫江县', '', '0', '2', 'DJX', '0');
INSERT INTO `t_system_region_info` VALUES ('500232', '50', '2', '32', '武隆县', '重庆市', '县', '武隆县', '', '0', '2', 'WLX', '0');
INSERT INTO `t_system_region_info` VALUES ('500233', '50', '2', '33', '忠县', '重庆市', '县', '忠县', '', '0', '2', 'ZX', '0');
INSERT INTO `t_system_region_info` VALUES ('500234', '50', '2', '34', '开县', '重庆市', '县', '开县', '', '0', '2', 'KX', '0');
INSERT INTO `t_system_region_info` VALUES ('500235', '50', '2', '35', '云阳县', '重庆市', '县', '云阳县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('500236', '50', '2', '36', '奉节县', '重庆市', '县', '奉节县', '', '0', '2', 'FJX', '0');
INSERT INTO `t_system_region_info` VALUES ('500237', '50', '2', '37', '巫山县', '重庆市', '县', '巫山县', '', '0', '2', 'WSX', '0');
INSERT INTO `t_system_region_info` VALUES ('500238', '50', '2', '38', '巫溪县', '重庆市', '县', '巫溪县', '', '0', '2', 'WXX', '0');
INSERT INTO `t_system_region_info` VALUES ('500240', '50', '2', '40', '石柱土家族自治县', '重庆市', '县', '石柱土家族自治县', '', '0', '2', 'SZTJZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('500241', '50', '2', '41', '秀山土家族苗族自治县', '重庆市', '县', '秀山土家族苗族自治县', '', '0', '2', 'XSTJZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('500242', '50', '2', '42', '酉阳土家族苗族自治县', '重庆市', '县', '酉阳土家族苗族自治县', '', '0', '2', 'YYTJZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('500243', '50', '2', '43', '彭水苗族土家族自治县', '重庆市', '县', '彭水苗族土家族自治县', '', '0', '2', 'PSMZTJZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('510000', '51', '0', '0', '四川省', '四川省', '', '', '', '0', '0', 'SCS', '0');
INSERT INTO `t_system_region_info` VALUES ('510100', '51', '1', '0', '成都市', '四川省', '成都市', '', '', '0', '1', 'CDS', '0');
INSERT INTO `t_system_region_info` VALUES ('510101', '51', '1', '1', '市辖区', '四川省', '成都市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510104', '51', '1', '4', '锦江区', '四川省', '成都市', '锦江区', '', '0', '2', 'JJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510105', '51', '1', '5', '青羊区', '四川省', '成都市', '青羊区', '', '0', '2', 'QYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510106', '51', '1', '6', '金牛区', '四川省', '成都市', '金牛区', '', '0', '2', 'JNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510107', '51', '1', '7', '武侯区', '四川省', '成都市', '武侯区', '', '0', '2', 'WHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510108', '51', '1', '8', '成华区', '四川省', '成都市', '成华区', '', '0', '2', 'CHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510112', '51', '1', '12', '龙泉驿区', '四川省', '成都市', '龙泉驿区', '', '0', '2', 'LQYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510113', '51', '1', '13', '青白江区', '四川省', '成都市', '青白江区', '', '0', '2', 'QBJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510114', '51', '1', '14', '新都区', '四川省', '成都市', '新都区', '', '0', '2', 'XDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510115', '51', '1', '15', '温江区', '四川省', '成都市', '温江区', '', '0', '2', 'WJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510121', '51', '1', '21', '金堂县', '四川省', '成都市', '金堂县', '', '0', '2', 'JTX', '0');
INSERT INTO `t_system_region_info` VALUES ('510122', '51', '1', '22', '双流县', '四川省', '成都市', '双流县', '', '0', '2', 'SLX', '0');
INSERT INTO `t_system_region_info` VALUES ('510124', '51', '1', '24', '郫县', '四川省', '成都市', '郫县', '', '0', '2', 'PX', '0');
INSERT INTO `t_system_region_info` VALUES ('510129', '51', '1', '29', '大邑县', '四川省', '成都市', '大邑县', '', '0', '2', 'DYX', '0');
INSERT INTO `t_system_region_info` VALUES ('510131', '51', '1', '31', '蒲江县', '四川省', '成都市', '蒲江县', '', '0', '2', 'PJX', '0');
INSERT INTO `t_system_region_info` VALUES ('510132', '51', '1', '32', '新津县', '四川省', '成都市', '新津县', '', '0', '2', 'XJX', '0');
INSERT INTO `t_system_region_info` VALUES ('510181', '51', '1', '81', '都江堰市', '四川省', '成都市', '都江堰市', '', '0', '2', 'DJYS', '0');
INSERT INTO `t_system_region_info` VALUES ('510182', '51', '1', '82', '彭州市', '四川省', '成都市', '彭州市', '', '0', '2', 'PZS', '0');
INSERT INTO `t_system_region_info` VALUES ('510183', '51', '1', '83', '邛崃市', '四川省', '成都市', '邛崃市', '', '0', '2', 'QLS', '0');
INSERT INTO `t_system_region_info` VALUES ('510184', '51', '1', '84', '崇州市', '四川省', '成都市', '崇州市', '', '0', '2', 'CZS', '0');
INSERT INTO `t_system_region_info` VALUES ('510300', '51', '3', '0', '自贡市', '四川省', '自贡市', '', '', '0', '1', 'ZGS', '0');
INSERT INTO `t_system_region_info` VALUES ('510301', '51', '3', '1', '市辖区', '四川省', '自贡市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510302', '51', '3', '2', '自流井区', '四川省', '自贡市', '自流井区', '', '0', '2', 'ZLJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510303', '51', '3', '3', '贡井区', '四川省', '自贡市', '贡井区', '', '0', '2', 'GJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510304', '51', '3', '4', '大安区', '四川省', '自贡市', '大安区', '', '0', '2', 'DAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510311', '51', '3', '11', '沿滩区', '四川省', '自贡市', '沿滩区', '', '0', '2', 'YTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510321', '51', '3', '21', '荣县', '四川省', '自贡市', '荣县', '', '0', '2', 'RX', '0');
INSERT INTO `t_system_region_info` VALUES ('510322', '51', '3', '22', '富顺县', '四川省', '自贡市', '富顺县', '', '0', '2', 'FSX', '0');
INSERT INTO `t_system_region_info` VALUES ('510400', '51', '4', '0', '攀枝花市', '四川省', '攀枝花市', '', '', '0', '1', 'PZHS', '0');
INSERT INTO `t_system_region_info` VALUES ('510401', '51', '4', '1', '市辖区', '四川省', '攀枝花市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510402', '51', '4', '2', '东区', '四川省', '攀枝花市', '东区', '', '0', '2', 'DQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510403', '51', '4', '3', '西区', '四川省', '攀枝花市', '西区', '', '0', '2', 'XQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510411', '51', '4', '11', '仁和区', '四川省', '攀枝花市', '仁和区', '', '0', '2', 'RHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510421', '51', '4', '21', '米易县', '四川省', '攀枝花市', '米易县', '', '0', '2', 'MYX', '0');
INSERT INTO `t_system_region_info` VALUES ('510422', '51', '4', '22', '盐边县', '四川省', '攀枝花市', '盐边县', '', '0', '2', 'YBX', '0');
INSERT INTO `t_system_region_info` VALUES ('510500', '51', '5', '0', '泸州市', '四川省', '泸州市', '', '', '0', '1', 'LZS', '0');
INSERT INTO `t_system_region_info` VALUES ('510501', '51', '5', '1', '市辖区', '四川省', '泸州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510502', '51', '5', '2', '江阳区', '四川省', '泸州市', '江阳区', '', '0', '2', 'JYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510503', '51', '5', '3', '纳溪区', '四川省', '泸州市', '纳溪区', '', '0', '2', 'NXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510504', '51', '5', '4', '龙马潭区', '四川省', '泸州市', '龙马潭区', '', '0', '2', 'LMTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510521', '51', '5', '21', '泸县', '四川省', '泸州市', '泸县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('510522', '51', '5', '22', '合江县', '四川省', '泸州市', '合江县', '', '0', '2', 'GJX', '0');
INSERT INTO `t_system_region_info` VALUES ('510524', '51', '5', '24', '叙永县', '四川省', '泸州市', '叙永县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('510525', '51', '5', '25', '古蔺县', '四川省', '泸州市', '古蔺县', '', '0', '2', 'GLX', '0');
INSERT INTO `t_system_region_info` VALUES ('510600', '51', '6', '0', '德阳市', '四川省', '德阳市', '', '', '0', '1', 'DYS', '0');
INSERT INTO `t_system_region_info` VALUES ('510601', '51', '6', '1', '市辖区', '四川省', '德阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510603', '51', '6', '3', '旌阳区', '四川省', '德阳市', '旌阳区', '', '0', '2', 'JYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510623', '51', '6', '23', '中江县', '四川省', '德阳市', '中江县', '', '0', '2', 'ZJX', '0');
INSERT INTO `t_system_region_info` VALUES ('510626', '51', '6', '26', '罗江县', '四川省', '德阳市', '罗江县', '', '0', '2', 'LJX', '0');
INSERT INTO `t_system_region_info` VALUES ('510681', '51', '6', '81', '广汉市', '四川省', '德阳市', '广汉市', '', '0', '2', 'AHS', '0');
INSERT INTO `t_system_region_info` VALUES ('510682', '51', '6', '82', '什邡市', '四川省', '德阳市', '什邡市', '', '0', '2', 'SFS', '0');
INSERT INTO `t_system_region_info` VALUES ('510683', '51', '6', '83', '绵竹市', '四川省', '德阳市', '绵竹市', '', '0', '2', 'MZS', '0');
INSERT INTO `t_system_region_info` VALUES ('510700', '51', '7', '0', '绵阳市', '四川省', '绵阳市', '', '', '0', '1', 'MYS', '0');
INSERT INTO `t_system_region_info` VALUES ('510701', '51', '7', '1', '市辖区', '四川省', '绵阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510703', '51', '7', '3', '涪城区', '四川省', '绵阳市', '涪城区', '', '0', '2', 'FCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510704', '51', '7', '4', '游仙区', '四川省', '绵阳市', '游仙区', '', '0', '2', 'YXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510722', '51', '7', '22', '三台县', '四川省', '绵阳市', '三台县', '', '0', '2', 'STX', '0');
INSERT INTO `t_system_region_info` VALUES ('510723', '51', '7', '23', '盐亭县', '四川省', '绵阳市', '盐亭县', '', '0', '2', 'YTX', '0');
INSERT INTO `t_system_region_info` VALUES ('510724', '51', '7', '24', '安县', '四川省', '绵阳市', '安县', '', '0', '2', 'AX', '0');
INSERT INTO `t_system_region_info` VALUES ('510725', '51', '7', '25', '梓潼县', '四川省', '绵阳市', '梓潼县', '', '0', '2', 'ZTX', '0');
INSERT INTO `t_system_region_info` VALUES ('510726', '51', '7', '26', '北川羌族自治县', '四川省', '绵阳市', '北川羌族自治县', '', '0', '2', 'BCQZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('510727', '51', '7', '27', '平武县', '四川省', '绵阳市', '平武县', '', '0', '2', 'PWX', '0');
INSERT INTO `t_system_region_info` VALUES ('510781', '51', '7', '81', '江油市', '四川省', '绵阳市', '江油市', '', '0', '2', 'JYS', '0');
INSERT INTO `t_system_region_info` VALUES ('510800', '51', '8', '0', '广元市', '四川省', '广元市', '', '', '0', '1', 'AYS', '0');
INSERT INTO `t_system_region_info` VALUES ('510801', '51', '8', '1', '市辖区', '四川省', '广元市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510802', '51', '8', '2', '利州区', '四川省', '广元市', '利州区', '', '0', '2', 'LZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510811', '51', '8', '11', '元坝区', '四川省', '广元市', '元坝区', '', '0', '2', 'YBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510812', '51', '8', '12', '朝天区', '四川省', '广元市', '朝天区', '', '0', '2', 'CTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510821', '51', '8', '21', '旺苍县', '四川省', '广元市', '旺苍县', '', '0', '2', 'WCX', '0');
INSERT INTO `t_system_region_info` VALUES ('510822', '51', '8', '22', '青川县', '四川省', '广元市', '青川县', '', '0', '2', 'QCX', '0');
INSERT INTO `t_system_region_info` VALUES ('510823', '51', '8', '23', '剑阁县', '四川省', '广元市', '剑阁县', '', '0', '2', 'JGX', '0');
INSERT INTO `t_system_region_info` VALUES ('510824', '51', '8', '24', '苍溪县', '四川省', '广元市', '苍溪县', '', '0', '2', 'CXX', '0');
INSERT INTO `t_system_region_info` VALUES ('510900', '51', '9', '0', '遂宁市', '四川省', '遂宁市', '', '', '0', '1', 'SNS', '0');
INSERT INTO `t_system_region_info` VALUES ('510901', '51', '9', '1', '市辖区', '四川省', '遂宁市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510903', '51', '9', '3', '船山区', '四川省', '遂宁市', '船山区', '', '0', '2', 'CSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510904', '51', '9', '4', '安居区', '四川省', '遂宁市', '安居区', '', '0', '2', 'AJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('510921', '51', '9', '21', '蓬溪县', '四川省', '遂宁市', '蓬溪县', '', '0', '2', 'PXX', '0');
INSERT INTO `t_system_region_info` VALUES ('510922', '51', '9', '22', '射洪县', '四川省', '遂宁市', '射洪县', '', '0', '2', 'SHX', '0');
INSERT INTO `t_system_region_info` VALUES ('510923', '51', '9', '23', '大英县', '四川省', '遂宁市', '大英县', '', '0', '2', 'DYX', '0');
INSERT INTO `t_system_region_info` VALUES ('511000', '51', '10', '0', '内江市', '四川省', '内江市', '', '', '0', '1', 'NJS', '0');
INSERT INTO `t_system_region_info` VALUES ('511001', '51', '10', '1', '市辖区', '四川省', '内江市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511002', '51', '10', '2', '市中区', '四川省', '内江市', '市中区', '', '0', '2', 'SZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511011', '51', '10', '11', '东兴区', '四川省', '内江市', '东兴区', '', '0', '2', 'DXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511024', '51', '10', '24', '威远县', '四川省', '内江市', '威远县', '', '0', '2', 'WYX', '0');
INSERT INTO `t_system_region_info` VALUES ('511025', '51', '10', '25', '资中县', '四川省', '内江市', '资中县', '', '0', '2', 'ZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('511028', '51', '10', '28', '隆昌县', '四川省', '内江市', '隆昌县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('511100', '51', '11', '0', '乐山市', '四川省', '乐山市', '', '', '0', '1', 'LSS', '0');
INSERT INTO `t_system_region_info` VALUES ('511101', '51', '11', '1', '市辖区', '四川省', '乐山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511102', '51', '11', '2', '市中区', '四川省', '乐山市', '市中区', '', '0', '2', 'SZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511111', '51', '11', '11', '沙湾区', '四川省', '乐山市', '沙湾区', '', '0', '2', 'SWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511112', '51', '11', '12', '五通桥区', '四川省', '乐山市', '五通桥区', '', '0', '2', 'WTQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511113', '51', '11', '13', '金口河区', '四川省', '乐山市', '金口河区', '', '0', '2', 'JKHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511123', '51', '11', '23', '犍为县', '四川省', '乐山市', '犍为县', '', '0', '2', 'JWX', '0');
INSERT INTO `t_system_region_info` VALUES ('511124', '51', '11', '24', '井研县', '四川省', '乐山市', '井研县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('511126', '51', '11', '26', '夹江县', '四川省', '乐山市', '夹江县', '', '0', '2', 'GJX', '0');
INSERT INTO `t_system_region_info` VALUES ('511129', '51', '11', '29', '沐川县', '四川省', '乐山市', '沐川县', '', '0', '2', 'MCX', '0');
INSERT INTO `t_system_region_info` VALUES ('511132', '51', '11', '32', '峨边彝族自治县', '四川省', '乐山市', '峨边彝族自治县', '', '0', '2', 'EBYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('511133', '51', '11', '33', '马边彝族自治县', '四川省', '乐山市', '马边彝族自治县', '', '0', '2', 'MBYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('511181', '51', '11', '81', '峨眉山市', '四川省', '乐山市', '峨眉山市', '', '0', '2', 'EMSS', '0');
INSERT INTO `t_system_region_info` VALUES ('511300', '51', '13', '0', '南充市', '四川省', '南充市', '', '', '0', '1', 'NCS', '0');
INSERT INTO `t_system_region_info` VALUES ('511301', '51', '13', '1', '市辖区', '四川省', '南充市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511302', '51', '13', '2', '顺庆区', '四川省', '南充市', '顺庆区', '', '0', '2', 'SQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511303', '51', '13', '3', '高坪区', '四川省', '南充市', '高坪区', '', '0', '2', 'GPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511304', '51', '13', '4', '嘉陵区', '四川省', '南充市', '嘉陵区', '', '0', '2', 'JLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511321', '51', '13', '21', '南部县', '四川省', '南充市', '南部县', '', '0', '2', 'NBX', '0');
INSERT INTO `t_system_region_info` VALUES ('511322', '51', '13', '22', '营山县', '四川省', '南充市', '营山县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('511323', '51', '13', '23', '蓬安县', '四川省', '南充市', '蓬安县', '', '0', '2', 'PAX', '0');
INSERT INTO `t_system_region_info` VALUES ('511324', '51', '13', '24', '仪陇县', '四川省', '南充市', '仪陇县', '', '0', '2', 'YLX', '0');
INSERT INTO `t_system_region_info` VALUES ('511325', '51', '13', '25', '西充县', '四川省', '南充市', '西充县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('511381', '51', '13', '81', '阆中市', '四川省', '南充市', '阆中市', '', '0', '2', 'LZS', '0');
INSERT INTO `t_system_region_info` VALUES ('511400', '51', '14', '0', '眉山市', '四川省', '眉山市', '', '', '0', '1', 'MSS', '0');
INSERT INTO `t_system_region_info` VALUES ('511401', '51', '14', '1', '市辖区', '四川省', '眉山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511402', '51', '14', '2', '东坡区', '四川省', '眉山市', '东坡区', '', '0', '2', 'DPQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511421', '51', '14', '21', '仁寿县', '四川省', '眉山市', '仁寿县', '', '0', '2', 'RSX', '0');
INSERT INTO `t_system_region_info` VALUES ('511422', '51', '14', '22', '彭山县', '四川省', '眉山市', '彭山县', '', '0', '2', 'PSX', '0');
INSERT INTO `t_system_region_info` VALUES ('511423', '51', '14', '23', '洪雅县', '四川省', '眉山市', '洪雅县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('511424', '51', '14', '24', '丹棱县', '四川省', '眉山市', '丹棱县', '', '0', '2', 'DLX', '0');
INSERT INTO `t_system_region_info` VALUES ('511425', '51', '14', '25', '青神县', '四川省', '眉山市', '青神县', '', '0', '2', 'QSX', '0');
INSERT INTO `t_system_region_info` VALUES ('511500', '51', '15', '0', '宜宾市', '四川省', '宜宾市', '', '', '0', '1', 'YBS', '0');
INSERT INTO `t_system_region_info` VALUES ('511501', '51', '15', '1', '市辖区', '四川省', '宜宾市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511502', '51', '15', '2', '翠屏区', '四川省', '宜宾市', '翠屏区', '', '0', '2', 'CBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511503', '51', '15', '3', '南溪区', '四川省', '宜宾市', '南溪区', '', '0', '2', 'NXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511521', '51', '15', '21', '宜宾县', '四川省', '宜宾市', '宜宾县', '', '0', '2', 'YBX', '0');
INSERT INTO `t_system_region_info` VALUES ('511523', '51', '15', '23', '江安县', '四川省', '宜宾市', '江安县', '', '0', '2', 'JAX', '0');
INSERT INTO `t_system_region_info` VALUES ('511524', '51', '15', '24', '长宁县', '四川省', '宜宾市', '长宁县', '', '0', '2', 'CNX', '0');
INSERT INTO `t_system_region_info` VALUES ('511525', '51', '15', '25', '高县', '四川省', '宜宾市', '高县', '', '0', '2', 'GX', '0');
INSERT INTO `t_system_region_info` VALUES ('511526', '51', '15', '26', '珙县', '四川省', '宜宾市', '珙县', '', '0', '2', 'GX', '0');
INSERT INTO `t_system_region_info` VALUES ('511527', '51', '15', '27', '筠连县', '四川省', '宜宾市', '筠连县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('511528', '51', '15', '28', '兴文县', '四川省', '宜宾市', '兴文县', '', '0', '2', 'XWX', '0');
INSERT INTO `t_system_region_info` VALUES ('511529', '51', '15', '29', '屏山县', '四川省', '宜宾市', '屏山县', '', '0', '2', 'BSX', '0');
INSERT INTO `t_system_region_info` VALUES ('511600', '51', '16', '0', '广安市', '四川省', '广安市', '', '', '0', '1', 'AAS', '0');
INSERT INTO `t_system_region_info` VALUES ('511601', '51', '16', '1', '市辖区', '四川省', '广安市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511602', '51', '16', '2', '广安区', '四川省', '广安市', '广安区', '', '0', '2', 'AAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511621', '51', '16', '21', '岳池县', '四川省', '广安市', '岳池县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('511622', '51', '16', '22', '武胜县', '四川省', '广安市', '武胜县', '', '0', '2', 'WSX', '0');
INSERT INTO `t_system_region_info` VALUES ('511623', '51', '16', '23', '邻水县', '四川省', '广安市', '邻水县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('511681', '51', '16', '81', '华蓥市', '四川省', '广安市', '华蓥市', '', '0', '2', 'HYS', '0');
INSERT INTO `t_system_region_info` VALUES ('511700', '51', '17', '0', '达州市', '四川省', '达州市', '', '', '0', '1', 'DZS', '0');
INSERT INTO `t_system_region_info` VALUES ('511701', '51', '17', '1', '市辖区', '四川省', '达州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511702', '51', '17', '2', '通川区', '四川省', '达州市', '通川区', '', '0', '2', 'TCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511721', '51', '17', '21', '达县', '四川省', '达州市', '达县', '', '0', '2', 'DX', '0');
INSERT INTO `t_system_region_info` VALUES ('511722', '51', '17', '22', '宣汉县', '四川省', '达州市', '宣汉县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('511723', '51', '17', '23', '开江县', '四川省', '达州市', '开江县', '', '0', '2', 'KJX', '0');
INSERT INTO `t_system_region_info` VALUES ('511724', '51', '17', '24', '大竹县', '四川省', '达州市', '大竹县', '', '0', '2', 'DZX', '0');
INSERT INTO `t_system_region_info` VALUES ('511725', '51', '17', '25', '渠县', '四川省', '达州市', '渠县', '', '0', '2', 'QX', '0');
INSERT INTO `t_system_region_info` VALUES ('511781', '51', '17', '81', '万源市', '四川省', '达州市', '万源市', '', '0', '2', 'MYS', '0');
INSERT INTO `t_system_region_info` VALUES ('511800', '51', '18', '0', '雅安市', '四川省', '雅安市', '', '', '0', '1', 'YAS', '0');
INSERT INTO `t_system_region_info` VALUES ('511801', '51', '18', '1', '市辖区', '四川省', '雅安市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511802', '51', '18', '2', '雨城区', '四川省', '雅安市', '雨城区', '', '0', '2', 'YCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511821', '51', '18', '21', '名山县', '四川省', '雅安市', '名山县', '', '0', '2', 'MSX', '0');
INSERT INTO `t_system_region_info` VALUES ('511822', '51', '18', '22', '荥经县', '四川省', '雅安市', '荥经县', '', '0', '2', 'XJX', '0');
INSERT INTO `t_system_region_info` VALUES ('511823', '51', '18', '23', '汉源县', '四川省', '雅安市', '汉源县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('511824', '51', '18', '24', '石棉县', '四川省', '雅安市', '石棉县', '', '0', '2', 'SMX', '0');
INSERT INTO `t_system_region_info` VALUES ('511825', '51', '18', '25', '天全县', '四川省', '雅安市', '天全县', '', '0', '2', 'TQX', '0');
INSERT INTO `t_system_region_info` VALUES ('511826', '51', '18', '26', '芦山县', '四川省', '雅安市', '芦山县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('511827', '51', '18', '27', '宝兴县', '四川省', '雅安市', '宝兴县', '', '0', '2', 'BXX', '0');
INSERT INTO `t_system_region_info` VALUES ('511900', '51', '19', '0', '巴中市', '四川省', '巴中市', '', '', '0', '1', 'BZS', '0');
INSERT INTO `t_system_region_info` VALUES ('511901', '51', '19', '1', '市辖区', '四川省', '巴中市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511902', '51', '19', '2', '巴州区', '四川省', '巴中市', '巴州区', '', '0', '2', 'BZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('511921', '51', '19', '21', '通江县', '四川省', '巴中市', '通江县', '', '0', '2', 'TJX', '0');
INSERT INTO `t_system_region_info` VALUES ('511922', '51', '19', '22', '南江县', '四川省', '巴中市', '南江县', '', '0', '2', 'NJX', '0');
INSERT INTO `t_system_region_info` VALUES ('511923', '51', '19', '23', '平昌县', '四川省', '巴中市', '平昌县', '', '0', '2', 'PCX', '0');
INSERT INTO `t_system_region_info` VALUES ('512000', '51', '20', '0', '资阳市', '四川省', '资阳市', '', '', '0', '1', 'ZYS', '0');
INSERT INTO `t_system_region_info` VALUES ('512001', '51', '20', '1', '市辖区', '四川省', '资阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('512002', '51', '20', '2', '雁江区', '四川省', '资阳市', '雁江区', '', '0', '2', 'YJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('512021', '51', '20', '21', '安岳县', '四川省', '资阳市', '安岳县', '', '0', '2', 'AYX', '0');
INSERT INTO `t_system_region_info` VALUES ('512022', '51', '20', '22', '乐至县', '四川省', '资阳市', '乐至县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('512081', '51', '20', '81', '简阳市', '四川省', '资阳市', '简阳市', '', '0', '2', 'JYS', '0');
INSERT INTO `t_system_region_info` VALUES ('513200', '51', '32', '0', '阿坝藏族羌族自治州', '四川省', '阿坝藏族羌族自治州', '', '', '0', '1', 'ABCZQZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('513221', '51', '32', '21', '汶川县', '四川省', '阿坝藏族羌族自治州', '汶川县', '', '0', '2', 'WCX', '0');
INSERT INTO `t_system_region_info` VALUES ('513222', '51', '32', '22', '理县', '四川省', '阿坝藏族羌族自治州', '理县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('513223', '51', '32', '23', '茂县', '四川省', '阿坝藏族羌族自治州', '茂县', '', '0', '2', 'MX', '0');
INSERT INTO `t_system_region_info` VALUES ('513224', '51', '32', '24', '松潘县', '四川省', '阿坝藏族羌族自治州', '松潘县', '', '0', '2', 'SPX', '0');
INSERT INTO `t_system_region_info` VALUES ('513225', '51', '32', '25', '九寨沟县', '四川省', '阿坝藏族羌族自治州', '九寨沟县', '', '0', '2', 'JZGX', '0');
INSERT INTO `t_system_region_info` VALUES ('513226', '51', '32', '26', '金川县', '四川省', '阿坝藏族羌族自治州', '金川县', '', '0', '2', 'JCX', '0');
INSERT INTO `t_system_region_info` VALUES ('513227', '51', '32', '27', '小金县', '四川省', '阿坝藏族羌族自治州', '小金县', '', '0', '2', 'XJX', '0');
INSERT INTO `t_system_region_info` VALUES ('513228', '51', '32', '28', '黑水县', '四川省', '阿坝藏族羌族自治州', '黑水县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('513229', '51', '32', '29', '马尔康县', '四川省', '阿坝藏族羌族自治州', '马尔康县', '', '0', '2', 'MEKX', '0');
INSERT INTO `t_system_region_info` VALUES ('513230', '51', '32', '30', '壤塘县', '四川省', '阿坝藏族羌族自治州', '壤塘县', '', '0', '2', 'RTX', '0');
INSERT INTO `t_system_region_info` VALUES ('513231', '51', '32', '31', '阿坝县', '四川省', '阿坝藏族羌族自治州', '阿坝县', '', '0', '2', 'ABX', '0');
INSERT INTO `t_system_region_info` VALUES ('513232', '51', '32', '32', '若尔盖县', '四川省', '阿坝藏族羌族自治州', '若尔盖县', '', '0', '2', 'REGX', '0');
INSERT INTO `t_system_region_info` VALUES ('513233', '51', '32', '33', '红原县', '四川省', '阿坝藏族羌族自治州', '红原县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('513300', '51', '33', '0', '甘孜藏族自治州', '四川省', '甘孜藏族自治州', '', '', '0', '1', 'GZCZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('513321', '51', '33', '21', '康定县', '四川省', '甘孜藏族自治州', '康定县', '', '0', '2', 'KDX', '0');
INSERT INTO `t_system_region_info` VALUES ('513322', '51', '33', '22', '泸定县', '四川省', '甘孜藏族自治州', '泸定县', '', '0', '2', 'LDX', '0');
INSERT INTO `t_system_region_info` VALUES ('513323', '51', '33', '23', '丹巴县', '四川省', '甘孜藏族自治州', '丹巴县', '', '0', '2', 'DBX', '0');
INSERT INTO `t_system_region_info` VALUES ('513324', '51', '33', '24', '九龙县', '四川省', '甘孜藏族自治州', '九龙县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('513325', '51', '33', '25', '雅江县', '四川省', '甘孜藏族自治州', '雅江县', '', '0', '2', 'YJX', '0');
INSERT INTO `t_system_region_info` VALUES ('513326', '51', '33', '26', '道孚县', '四川省', '甘孜藏族自治州', '道孚县', '', '0', '2', 'DFX', '0');
INSERT INTO `t_system_region_info` VALUES ('513327', '51', '33', '27', '炉霍县', '四川省', '甘孜藏族自治州', '炉霍县', '', '0', '2', 'LHX', '0');
INSERT INTO `t_system_region_info` VALUES ('513328', '51', '33', '28', '甘孜县', '四川省', '甘孜藏族自治州', '甘孜县', '', '0', '2', 'GZX', '0');
INSERT INTO `t_system_region_info` VALUES ('513329', '51', '33', '29', '新龙县', '四川省', '甘孜藏族自治州', '新龙县', '', '0', '2', 'XLX', '0');
INSERT INTO `t_system_region_info` VALUES ('513330', '51', '33', '30', '德格县', '四川省', '甘孜藏族自治州', '德格县', '', '0', '2', 'DGX', '0');
INSERT INTO `t_system_region_info` VALUES ('513331', '51', '33', '31', '白玉县', '四川省', '甘孜藏族自治州', '白玉县', '', '0', '2', 'BYX', '0');
INSERT INTO `t_system_region_info` VALUES ('513332', '51', '33', '32', '石渠县', '四川省', '甘孜藏族自治州', '石渠县', '', '0', '2', 'SQX', '0');
INSERT INTO `t_system_region_info` VALUES ('513333', '51', '33', '33', '色达县', '四川省', '甘孜藏族自治州', '色达县', '', '0', '2', 'SDX', '0');
INSERT INTO `t_system_region_info` VALUES ('513334', '51', '33', '34', '理塘县', '四川省', '甘孜藏族自治州', '理塘县', '', '0', '2', 'LTX', '0');
INSERT INTO `t_system_region_info` VALUES ('513335', '51', '33', '35', '巴塘县', '四川省', '甘孜藏族自治州', '巴塘县', '', '0', '2', 'BTX', '0');
INSERT INTO `t_system_region_info` VALUES ('513336', '51', '33', '36', '乡城县', '四川省', '甘孜藏族自治州', '乡城县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('513337', '51', '33', '37', '稻城县', '四川省', '甘孜藏族自治州', '稻城县', '', '0', '2', 'DCX', '0');
INSERT INTO `t_system_region_info` VALUES ('513338', '51', '33', '38', '得荣县', '四川省', '甘孜藏族自治州', '得荣县', '', '0', '2', 'DRX', '0');
INSERT INTO `t_system_region_info` VALUES ('513400', '51', '34', '0', '凉山彝族自治州', '四川省', '凉山彝族自治州', '', '', '0', '1', 'LSYZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('513401', '51', '34', '1', '西昌市', '四川省', '凉山彝族自治州', '西昌市', '', '0', '2', 'XCS', '0');
INSERT INTO `t_system_region_info` VALUES ('513422', '51', '34', '22', '木里藏族自治县', '四川省', '凉山彝族自治州', '木里藏族自治县', '', '0', '2', 'MLCZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('513423', '51', '34', '23', '盐源县', '四川省', '凉山彝族自治州', '盐源县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('513424', '51', '34', '24', '德昌县', '四川省', '凉山彝族自治州', '德昌县', '', '0', '2', 'DCX', '0');
INSERT INTO `t_system_region_info` VALUES ('513425', '51', '34', '25', '会理县', '四川省', '凉山彝族自治州', '会理县', '', '0', '2', 'HLX', '0');
INSERT INTO `t_system_region_info` VALUES ('513426', '51', '34', '26', '会东县', '四川省', '凉山彝族自治州', '会东县', '', '0', '2', 'HDX', '0');
INSERT INTO `t_system_region_info` VALUES ('513427', '51', '34', '27', '宁南县', '四川省', '凉山彝族自治州', '宁南县', '', '0', '2', 'NNX', '0');
INSERT INTO `t_system_region_info` VALUES ('513428', '51', '34', '28', '普格县', '四川省', '凉山彝族自治州', '普格县', '', '0', '2', 'PGX', '0');
INSERT INTO `t_system_region_info` VALUES ('513429', '51', '34', '29', '布拖县', '四川省', '凉山彝族自治州', '布拖县', '', '0', '2', 'BTX', '0');
INSERT INTO `t_system_region_info` VALUES ('513430', '51', '34', '30', '金阳县', '四川省', '凉山彝族自治州', '金阳县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('513431', '51', '34', '31', '昭觉县', '四川省', '凉山彝族自治州', '昭觉县', '', '0', '2', 'ZJX', '0');
INSERT INTO `t_system_region_info` VALUES ('513432', '51', '34', '32', '喜德县', '四川省', '凉山彝族自治州', '喜德县', '', '0', '2', 'XDX', '0');
INSERT INTO `t_system_region_info` VALUES ('513433', '51', '34', '33', '冕宁县', '四川省', '凉山彝族自治州', '冕宁县', '', '0', '2', 'MNX', '0');
INSERT INTO `t_system_region_info` VALUES ('513434', '51', '34', '34', '越西县', '四川省', '凉山彝族自治州', '越西县', '', '0', '2', 'YXX', '0');
INSERT INTO `t_system_region_info` VALUES ('513435', '51', '34', '35', '甘洛县', '四川省', '凉山彝族自治州', '甘洛县', '', '0', '2', 'GLX', '0');
INSERT INTO `t_system_region_info` VALUES ('513436', '51', '34', '36', '美姑县', '四川省', '凉山彝族自治州', '美姑县', '', '0', '2', 'MGX', '0');
INSERT INTO `t_system_region_info` VALUES ('513437', '51', '34', '37', '雷波县', '四川省', '凉山彝族自治州', '雷波县', '', '0', '2', 'LBX', '0');
INSERT INTO `t_system_region_info` VALUES ('520000', '52', '0', '0', '贵州省', '贵州省', '', '', '', '0', '0', 'GZS', '0');
INSERT INTO `t_system_region_info` VALUES ('520100', '52', '1', '0', '贵阳市', '贵州省', '贵阳市', '', '', '0', '1', 'GYS', '0');
INSERT INTO `t_system_region_info` VALUES ('520101', '52', '1', '1', '市辖区', '贵州省', '贵阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520102', '52', '1', '2', '南明区', '贵州省', '贵阳市', '南明区', '', '0', '2', 'NMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520103', '52', '1', '3', '云岩区', '贵州省', '贵阳市', '云岩区', '', '0', '2', 'YYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520111', '52', '1', '11', '花溪区', '贵州省', '贵阳市', '花溪区', '', '0', '2', 'HXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520112', '52', '1', '12', '乌当区', '贵州省', '贵阳市', '乌当区', '', '0', '2', 'WDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520113', '52', '1', '13', '白云区', '贵州省', '贵阳市', '白云区', '', '0', '2', 'BYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520114', '52', '1', '14', '小河区', '贵州省', '贵阳市', '小河区', '', '0', '2', 'XHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520121', '52', '1', '21', '开阳县', '贵州省', '贵阳市', '开阳县', '', '0', '2', 'KYX', '0');
INSERT INTO `t_system_region_info` VALUES ('520122', '52', '1', '22', '息烽县', '贵州省', '贵阳市', '息烽县', '', '0', '2', 'XFX', '0');
INSERT INTO `t_system_region_info` VALUES ('520123', '52', '1', '23', '修文县', '贵州省', '贵阳市', '修文县', '', '0', '2', 'XWX', '0');
INSERT INTO `t_system_region_info` VALUES ('520181', '52', '1', '81', '清镇市', '贵州省', '贵阳市', '清镇市', '', '0', '2', 'QZS', '0');
INSERT INTO `t_system_region_info` VALUES ('520200', '52', '2', '0', '六盘水市', '贵州省', '六盘水市', '', '', '0', '1', 'LPSS', '0');
INSERT INTO `t_system_region_info` VALUES ('520201', '52', '2', '1', '钟山区', '贵州省', '六盘水市', '钟山区', '', '0', '2', 'ZSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520203', '52', '2', '3', '六枝特区', '贵州省', '六盘水市', '六枝特区', '', '0', '2', 'LZTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520221', '52', '2', '21', '水城县', '贵州省', '六盘水市', '水城县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('520222', '52', '2', '22', '盘县', '贵州省', '六盘水市', '盘县', '', '0', '2', 'PX', '0');
INSERT INTO `t_system_region_info` VALUES ('520300', '52', '3', '0', '遵义市', '贵州省', '遵义市', '', '', '0', '1', 'ZYS', '0');
INSERT INTO `t_system_region_info` VALUES ('520301', '52', '3', '1', '市辖区', '贵州省', '遵义市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520302', '52', '3', '2', '红花岗区', '贵州省', '遵义市', '红花岗区', '', '0', '2', 'GHGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520303', '52', '3', '3', '汇川区', '贵州省', '遵义市', '汇川区', '', '0', '2', 'HCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520321', '52', '3', '21', '遵义县', '贵州省', '遵义市', '遵义县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('520322', '52', '3', '22', '桐梓县', '贵州省', '遵义市', '桐梓县', '', '0', '2', 'TZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520323', '52', '3', '23', '绥阳县', '贵州省', '遵义市', '绥阳县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('520324', '52', '3', '24', '正安县', '贵州省', '遵义市', '正安县', '', '0', '2', 'ZAX', '0');
INSERT INTO `t_system_region_info` VALUES ('520325', '52', '3', '25', '道真仡佬族苗族自治县', '贵州省', '遵义市', '道真仡佬族苗族自治县', '', '0', '2', 'DZGLZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520326', '52', '3', '26', '务川仡佬族苗族自治县', '贵州省', '遵义市', '务川仡佬族苗族自治县', '', '0', '2', 'WCGLZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520327', '52', '3', '27', '凤冈县', '贵州省', '遵义市', '凤冈县', '', '0', '2', 'FGX', '0');
INSERT INTO `t_system_region_info` VALUES ('520328', '52', '3', '28', '湄潭县', '贵州省', '遵义市', '湄潭县', '', '0', '2', 'MTX', '0');
INSERT INTO `t_system_region_info` VALUES ('520329', '52', '3', '29', '余庆县', '贵州省', '遵义市', '余庆县', '', '0', '2', 'YQX', '0');
INSERT INTO `t_system_region_info` VALUES ('520330', '52', '3', '30', '习水县', '贵州省', '遵义市', '习水县', '', '0', '2', 'XSX', '0');
INSERT INTO `t_system_region_info` VALUES ('520381', '52', '3', '81', '赤水市', '贵州省', '遵义市', '赤水市', '', '0', '2', 'CSS', '0');
INSERT INTO `t_system_region_info` VALUES ('520382', '52', '3', '82', '仁怀市', '贵州省', '遵义市', '仁怀市', '', '0', '2', 'RHS', '0');
INSERT INTO `t_system_region_info` VALUES ('520400', '52', '4', '0', '安顺市', '贵州省', '安顺市', '', '', '0', '1', 'ASS', '0');
INSERT INTO `t_system_region_info` VALUES ('520401', '52', '4', '1', '市辖区', '贵州省', '安顺市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520402', '52', '4', '2', '西秀区', '贵州省', '安顺市', '西秀区', '', '0', '2', 'XXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520421', '52', '4', '21', '平坝县', '贵州省', '安顺市', '平坝县', '', '0', '2', 'PBX', '0');
INSERT INTO `t_system_region_info` VALUES ('520422', '52', '4', '22', '普定县', '贵州省', '安顺市', '普定县', '', '0', '2', 'PDX', '0');
INSERT INTO `t_system_region_info` VALUES ('520423', '52', '4', '23', '镇宁布依族苗族自治县', '贵州省', '安顺市', '镇宁布依族苗族自治县', '', '0', '2', 'ZNBYZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520424', '52', '4', '24', '关岭布依族苗族自治县', '贵州省', '安顺市', '关岭布依族苗族自治县', '', '0', '2', 'GLBYZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520425', '52', '4', '25', '紫云苗族布依族自治县', '贵州省', '安顺市', '紫云苗族布依族自治县', '', '0', '2', 'ZYMZBYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520500', '52', '5', '0', '毕节市', '贵州省', '毕节市', '', '', '0', '1', 'BJS', '0');
INSERT INTO `t_system_region_info` VALUES ('520501', '52', '5', '1', '市辖区', '贵州省', '毕节市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520502', '52', '5', '2', '七星关区', '贵州省', '毕节市', '七星关区', '', '0', '2', 'QXGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520521', '52', '5', '21', '大方县', '贵州省', '毕节市', '大方县', '', '0', '2', 'DFX', '0');
INSERT INTO `t_system_region_info` VALUES ('520522', '52', '5', '22', '黔西县', '贵州省', '毕节市', '黔西县', '', '0', '2', 'QXX', '0');
INSERT INTO `t_system_region_info` VALUES ('520523', '52', '5', '23', '金沙县', '贵州省', '毕节市', '金沙县', '', '0', '2', 'JSX', '0');
INSERT INTO `t_system_region_info` VALUES ('520524', '52', '5', '24', '织金县', '贵州省', '毕节市', '织金县', '', '0', '2', 'ZJX', '0');
INSERT INTO `t_system_region_info` VALUES ('520525', '52', '5', '25', '纳雍县', '贵州省', '毕节市', '纳雍县', '', '0', '2', 'NYX', '0');
INSERT INTO `t_system_region_info` VALUES ('520526', '52', '5', '26', '威宁彝族回族苗族自治县', '贵州省', '毕节市', '威宁彝族回族苗族自治县', '', '0', '2', 'WNYZHZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520527', '52', '5', '27', '赫章县', '贵州省', '毕节市', '赫章县', '', '0', '2', 'HZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520600', '52', '6', '0', '铜仁市', '贵州省', '铜仁市', '', '', '0', '1', 'TRS', '0');
INSERT INTO `t_system_region_info` VALUES ('520601', '52', '6', '1', '市辖区', '贵州省', '铜仁市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520602', '52', '6', '2', '碧江区', '贵州省', '铜仁市', '碧江区', '', '0', '2', 'BJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520603', '52', '6', '3', '万山区', '贵州省', '铜仁市', '万山区', '', '0', '2', 'MSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('520621', '52', '6', '21', '江口县', '贵州省', '铜仁市', '江口县', '', '0', '2', 'JKX', '0');
INSERT INTO `t_system_region_info` VALUES ('520622', '52', '6', '22', '玉屏侗族自治县', '贵州省', '铜仁市', '玉屏侗族自治县', '', '0', '2', 'YBDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520623', '52', '6', '23', '石阡县', '贵州省', '铜仁市', '石阡县', '', '0', '2', 'SQX', '0');
INSERT INTO `t_system_region_info` VALUES ('520624', '52', '6', '24', '思南县', '贵州省', '铜仁市', '思南县', '', '0', '2', 'SNX', '0');
INSERT INTO `t_system_region_info` VALUES ('520625', '52', '6', '25', '印江土家族苗族自治县', '贵州省', '铜仁市', '印江土家族苗族自治县', '', '0', '2', 'YJTJZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520626', '52', '6', '26', '德江县', '贵州省', '铜仁市', '德江县', '', '0', '2', 'DJX', '0');
INSERT INTO `t_system_region_info` VALUES ('520627', '52', '6', '27', '沿河土家族自治县', '贵州省', '铜仁市', '沿河土家族自治县', '', '0', '2', 'YHTJZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('520628', '52', '6', '28', '松桃苗族自治县', '贵州省', '铜仁市', '松桃苗族自治县', '', '0', '2', 'STMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('522300', '52', '23', '0', '黔西南布依族苗族自治州', '贵州省', '黔西南布依族苗族自治州', '', '', '0', '1', 'QXNBYZMZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('522301', '52', '23', '1', '兴义市', '贵州省', '黔西南布依族苗族自治州', '兴义市', '', '0', '2', 'XYS', '0');
INSERT INTO `t_system_region_info` VALUES ('522322', '52', '23', '22', '兴仁县', '贵州省', '黔西南布依族苗族自治州', '兴仁县', '', '0', '2', 'XRX', '0');
INSERT INTO `t_system_region_info` VALUES ('522323', '52', '23', '23', '普安县', '贵州省', '黔西南布依族苗族自治州', '普安县', '', '0', '2', 'PAX', '0');
INSERT INTO `t_system_region_info` VALUES ('522324', '52', '23', '24', '晴隆县', '贵州省', '黔西南布依族苗族自治州', '晴隆县', '', '0', '2', 'QLX', '0');
INSERT INTO `t_system_region_info` VALUES ('522325', '52', '23', '25', '贞丰县', '贵州省', '黔西南布依族苗族自治州', '贞丰县', '', '0', '2', 'ZFX', '0');
INSERT INTO `t_system_region_info` VALUES ('522326', '52', '23', '26', '望谟县', '贵州省', '黔西南布依族苗族自治州', '望谟县', '', '0', '2', 'WMX', '0');
INSERT INTO `t_system_region_info` VALUES ('522327', '52', '23', '27', '册亨县', '贵州省', '黔西南布依族苗族自治州', '册亨县', '', '0', '2', 'CHX', '0');
INSERT INTO `t_system_region_info` VALUES ('522328', '52', '23', '28', '安龙县', '贵州省', '黔西南布依族苗族自治州', '安龙县', '', '0', '2', 'ALX', '0');
INSERT INTO `t_system_region_info` VALUES ('522600', '52', '26', '0', '黔东南苗族侗族自治州', '贵州省', '黔东南苗族侗族自治州', '', '', '0', '1', 'QDNMZDZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('522601', '52', '26', '1', '凯里市', '贵州省', '黔东南苗族侗族自治州', '凯里市', '', '0', '2', 'KLS', '0');
INSERT INTO `t_system_region_info` VALUES ('522622', '52', '26', '22', '黄平县', '贵州省', '黔东南苗族侗族自治州', '黄平县', '', '0', '2', 'HPX', '0');
INSERT INTO `t_system_region_info` VALUES ('522623', '52', '26', '23', '施秉县', '贵州省', '黔东南苗族侗族自治州', '施秉县', '', '0', '2', 'SBX', '0');
INSERT INTO `t_system_region_info` VALUES ('522624', '52', '26', '24', '三穗县', '贵州省', '黔东南苗族侗族自治州', '三穗县', '', '0', '2', 'SSX', '0');
INSERT INTO `t_system_region_info` VALUES ('522625', '52', '26', '25', '镇远县', '贵州省', '黔东南苗族侗族自治州', '镇远县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('522626', '52', '26', '26', '岑巩县', '贵州省', '黔东南苗族侗族自治州', '岑巩县', '', '0', '2', 'CGX', '0');
INSERT INTO `t_system_region_info` VALUES ('522627', '52', '26', '27', '天柱县', '贵州省', '黔东南苗族侗族自治州', '天柱县', '', '0', '2', 'TZX', '0');
INSERT INTO `t_system_region_info` VALUES ('522628', '52', '26', '28', '锦屏县', '贵州省', '黔东南苗族侗族自治州', '锦屏县', '', '0', '2', 'JBX', '0');
INSERT INTO `t_system_region_info` VALUES ('522629', '52', '26', '29', '剑河县', '贵州省', '黔东南苗族侗族自治州', '剑河县', '', '0', '2', 'JHX', '0');
INSERT INTO `t_system_region_info` VALUES ('522630', '52', '26', '30', '台江县', '贵州省', '黔东南苗族侗族自治州', '台江县', '', '0', '2', 'TJX', '0');
INSERT INTO `t_system_region_info` VALUES ('522631', '52', '26', '31', '黎平县', '贵州省', '黔东南苗族侗族自治州', '黎平县', '', '0', '2', 'LPX', '0');
INSERT INTO `t_system_region_info` VALUES ('522632', '52', '26', '32', '榕江县', '贵州省', '黔东南苗族侗族自治州', '榕江县', '', '0', '2', 'RJX', '0');
INSERT INTO `t_system_region_info` VALUES ('522633', '52', '26', '33', '从江县', '贵州省', '黔东南苗族侗族自治州', '从江县', '', '0', '2', 'CJX', '0');
INSERT INTO `t_system_region_info` VALUES ('522634', '52', '26', '34', '雷山县', '贵州省', '黔东南苗族侗族自治州', '雷山县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('522635', '52', '26', '35', '麻江县', '贵州省', '黔东南苗族侗族自治州', '麻江县', '', '0', '2', 'MJX', '0');
INSERT INTO `t_system_region_info` VALUES ('522636', '52', '26', '36', '丹寨县', '贵州省', '黔东南苗族侗族自治州', '丹寨县', '', '0', '2', 'DZX', '0');
INSERT INTO `t_system_region_info` VALUES ('522700', '52', '27', '0', '黔南布依族苗族自治州', '贵州省', '黔南布依族苗族自治州', '', '', '0', '1', 'QNBYZMZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('522701', '52', '27', '1', '都匀市', '贵州省', '黔南布依族苗族自治州', '都匀市', '', '0', '2', 'DYS', '0');
INSERT INTO `t_system_region_info` VALUES ('522702', '52', '27', '2', '福泉市', '贵州省', '黔南布依族苗族自治州', '福泉市', '', '0', '2', 'FQS', '0');
INSERT INTO `t_system_region_info` VALUES ('522722', '52', '27', '22', '荔波县', '贵州省', '黔南布依族苗族自治州', '荔波县', '', '0', '2', 'LBX', '0');
INSERT INTO `t_system_region_info` VALUES ('522723', '52', '27', '23', '贵定县', '贵州省', '黔南布依族苗族自治州', '贵定县', '', '0', '2', 'GDX', '0');
INSERT INTO `t_system_region_info` VALUES ('522725', '52', '27', '25', '瓮安县', '贵州省', '黔南布依族苗族自治州', '瓮安县', '', '0', '2', 'WAX', '0');
INSERT INTO `t_system_region_info` VALUES ('522726', '52', '27', '26', '独山县', '贵州省', '黔南布依族苗族自治州', '独山县', '', '0', '2', 'DSX', '0');
INSERT INTO `t_system_region_info` VALUES ('522727', '52', '27', '27', '平塘县', '贵州省', '黔南布依族苗族自治州', '平塘县', '', '0', '2', 'PTX', '0');
INSERT INTO `t_system_region_info` VALUES ('522728', '52', '27', '28', '罗甸县', '贵州省', '黔南布依族苗族自治州', '罗甸县', '', '0', '2', 'LDX', '0');
INSERT INTO `t_system_region_info` VALUES ('522729', '52', '27', '29', '长顺县', '贵州省', '黔南布依族苗族自治州', '长顺县', '', '0', '2', 'CSX', '0');
INSERT INTO `t_system_region_info` VALUES ('522730', '52', '27', '30', '龙里县', '贵州省', '黔南布依族苗族自治州', '龙里县', '', '0', '2', 'LLX', '0');
INSERT INTO `t_system_region_info` VALUES ('522731', '52', '27', '31', '惠水县', '贵州省', '黔南布依族苗族自治州', '惠水县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('522732', '52', '27', '32', '三都水族自治县', '贵州省', '黔南布依族苗族自治州', '三都水族自治县', '', '0', '2', 'SDSZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530000', '53', '0', '0', '云南省', '云南省', '', '', '', '0', '0', 'YNS', '0');
INSERT INTO `t_system_region_info` VALUES ('530100', '53', '1', '0', '昆明市', '云南省', '昆明市', '', '', '0', '1', 'KMS', '0');
INSERT INTO `t_system_region_info` VALUES ('530101', '53', '1', '1', '市辖区', '云南省', '昆明市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530102', '53', '1', '2', '五华区', '云南省', '昆明市', '五华区', '', '0', '2', 'WHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530103', '53', '1', '3', '盘龙区', '云南省', '昆明市', '盘龙区', '', '0', '2', 'PLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530111', '53', '1', '11', '官渡区', '云南省', '昆明市', '官渡区', '', '0', '2', 'GDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530112', '53', '1', '12', '西山区', '云南省', '昆明市', '西山区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530113', '53', '1', '13', '东川区', '云南省', '昆明市', '东川区', '', '0', '2', 'DCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530114', '53', '1', '14', '呈贡区', '云南省', '昆明市', '呈贡区', '', '0', '2', 'CGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530122', '53', '1', '22', '晋宁县', '云南省', '昆明市', '晋宁县', '', '0', '2', 'JNX', '0');
INSERT INTO `t_system_region_info` VALUES ('530124', '53', '1', '24', '富民县', '云南省', '昆明市', '富民县', '', '0', '2', 'FMX', '0');
INSERT INTO `t_system_region_info` VALUES ('530125', '53', '1', '25', '宜良县', '云南省', '昆明市', '宜良县', '', '0', '2', 'YLX', '0');
INSERT INTO `t_system_region_info` VALUES ('530126', '53', '1', '26', '石林彝族自治县', '云南省', '昆明市', '石林彝族自治县', '', '0', '2', 'SLYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530127', '53', '1', '27', '嵩明县', '云南省', '昆明市', '嵩明县', '', '0', '2', 'SMX', '0');
INSERT INTO `t_system_region_info` VALUES ('530128', '53', '1', '28', '禄劝彝族苗族自治县', '云南省', '昆明市', '禄劝彝族苗族自治县', '', '0', '2', 'LQYZMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530129', '53', '1', '29', '寻甸回族彝族自治县', '云南省', '昆明市', '寻甸回族彝族自治县', '', '0', '2', 'XDHZYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530181', '53', '1', '81', '安宁市', '云南省', '昆明市', '安宁市', '', '0', '2', 'ANS', '0');
INSERT INTO `t_system_region_info` VALUES ('530300', '53', '3', '0', '曲靖市', '云南省', '曲靖市', '', '', '0', '1', 'QJS', '0');
INSERT INTO `t_system_region_info` VALUES ('530301', '53', '3', '1', '市辖区', '云南省', '曲靖市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530302', '53', '3', '2', '麒麟区', '云南省', '曲靖市', '麒麟区', '', '0', '2', 'QLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530321', '53', '3', '21', '马龙县', '云南省', '曲靖市', '马龙县', '', '0', '2', 'MLX', '0');
INSERT INTO `t_system_region_info` VALUES ('530322', '53', '3', '22', '陆良县', '云南省', '曲靖市', '陆良县', '', '0', '2', 'LLX', '0');
INSERT INTO `t_system_region_info` VALUES ('530323', '53', '3', '23', '师宗县', '云南省', '曲靖市', '师宗县', '', '0', '2', 'SZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530324', '53', '3', '24', '罗平县', '云南省', '曲靖市', '罗平县', '', '0', '2', 'LPX', '0');
INSERT INTO `t_system_region_info` VALUES ('530325', '53', '3', '25', '富源县', '云南省', '曲靖市', '富源县', '', '0', '2', 'FYX', '0');
INSERT INTO `t_system_region_info` VALUES ('530326', '53', '3', '26', '会泽县', '云南省', '曲靖市', '会泽县', '', '0', '2', 'HZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530328', '53', '3', '28', '沾益县', '云南省', '曲靖市', '沾益县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('530381', '53', '3', '81', '宣威市', '云南省', '曲靖市', '宣威市', '', '0', '2', 'XWS', '0');
INSERT INTO `t_system_region_info` VALUES ('530400', '53', '4', '0', '玉溪市', '云南省', '玉溪市', '', '', '0', '1', 'YXS', '0');
INSERT INTO `t_system_region_info` VALUES ('530401', '53', '4', '1', '市辖区', '云南省', '玉溪市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530402', '53', '4', '2', '红塔区', '云南省', '玉溪市', '红塔区', '', '0', '2', 'GDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530421', '53', '4', '21', '江川县', '云南省', '玉溪市', '江川县', '', '0', '2', 'JCX', '0');
INSERT INTO `t_system_region_info` VALUES ('530422', '53', '4', '22', '澄江县', '云南省', '玉溪市', '澄江县', '', '0', '2', 'CJX', '0');
INSERT INTO `t_system_region_info` VALUES ('530423', '53', '4', '23', '通海县', '云南省', '玉溪市', '通海县', '', '0', '2', 'THX', '0');
INSERT INTO `t_system_region_info` VALUES ('530424', '53', '4', '24', '华宁县', '云南省', '玉溪市', '华宁县', '', '0', '2', 'HNX', '0');
INSERT INTO `t_system_region_info` VALUES ('530425', '53', '4', '25', '易门县', '云南省', '玉溪市', '易门县', '', '0', '2', 'YMX', '0');
INSERT INTO `t_system_region_info` VALUES ('530426', '53', '4', '26', '峨山彝族自治县', '云南省', '玉溪市', '峨山彝族自治县', '', '0', '2', 'ESYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530427', '53', '4', '27', '新平彝族傣族自治县', '云南省', '玉溪市', '新平彝族傣族自治县', '', '0', '2', 'XPYZDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530428', '53', '4', '28', '元江哈尼族彝族傣族自治县', '云南省', '玉溪市', '元江哈尼族彝族傣族自治县', '', '0', '2', 'YJHNZYZDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530500', '53', '5', '0', '保山市', '云南省', '保山市', '', '', '0', '1', 'BSS', '0');
INSERT INTO `t_system_region_info` VALUES ('530501', '53', '5', '1', '市辖区', '云南省', '保山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530502', '53', '5', '2', '隆阳区', '云南省', '保山市', '隆阳区', '', '0', '2', 'LYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530521', '53', '5', '21', '施甸县', '云南省', '保山市', '施甸县', '', '0', '2', 'SDX', '0');
INSERT INTO `t_system_region_info` VALUES ('530522', '53', '5', '22', '腾冲县', '云南省', '保山市', '腾冲县', '', '0', '2', 'TCX', '0');
INSERT INTO `t_system_region_info` VALUES ('530523', '53', '5', '23', '龙陵县', '云南省', '保山市', '龙陵县', '', '0', '2', 'LLX', '0');
INSERT INTO `t_system_region_info` VALUES ('530524', '53', '5', '24', '昌宁县', '云南省', '保山市', '昌宁县', '', '0', '2', 'CNX', '0');
INSERT INTO `t_system_region_info` VALUES ('530600', '53', '6', '0', '昭通市', '云南省', '昭通市', '', '', '0', '1', 'ZTS', '0');
INSERT INTO `t_system_region_info` VALUES ('530601', '53', '6', '1', '市辖区', '云南省', '昭通市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530602', '53', '6', '2', '昭阳区', '云南省', '昭通市', '昭阳区', '', '0', '2', 'ZYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530621', '53', '6', '21', '鲁甸县', '云南省', '昭通市', '鲁甸县', '', '0', '2', 'LDX', '0');
INSERT INTO `t_system_region_info` VALUES ('530622', '53', '6', '22', '巧家县', '云南省', '昭通市', '巧家县', '', '0', '2', 'QJX', '0');
INSERT INTO `t_system_region_info` VALUES ('530623', '53', '6', '23', '盐津县', '云南省', '昭通市', '盐津县', '', '0', '2', 'YJX', '0');
INSERT INTO `t_system_region_info` VALUES ('530624', '53', '6', '24', '大关县', '云南省', '昭通市', '大关县', '', '0', '2', 'DGX', '0');
INSERT INTO `t_system_region_info` VALUES ('530625', '53', '6', '25', '永善县', '云南省', '昭通市', '永善县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('530626', '53', '6', '26', '绥江县', '云南省', '昭通市', '绥江县', '', '0', '2', 'SJX', '0');
INSERT INTO `t_system_region_info` VALUES ('530627', '53', '6', '27', '镇雄县', '云南省', '昭通市', '镇雄县', '', '0', '2', 'ZXX', '0');
INSERT INTO `t_system_region_info` VALUES ('530628', '53', '6', '28', '彝良县', '云南省', '昭通市', '彝良县', '', '0', '2', 'YLX', '0');
INSERT INTO `t_system_region_info` VALUES ('530629', '53', '6', '29', '威信县', '云南省', '昭通市', '威信县', '', '0', '2', 'WXX', '0');
INSERT INTO `t_system_region_info` VALUES ('530630', '53', '6', '30', '水富县', '云南省', '昭通市', '水富县', '', '0', '2', 'SFX', '0');
INSERT INTO `t_system_region_info` VALUES ('530700', '53', '7', '0', '丽江市', '云南省', '丽江市', '', '', '0', '1', 'LJS', '0');
INSERT INTO `t_system_region_info` VALUES ('530701', '53', '7', '1', '市辖区', '云南省', '丽江市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530702', '53', '7', '2', '古城区', '云南省', '丽江市', '古城区', '', '0', '2', 'GCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530721', '53', '7', '21', '玉龙纳西族自治县', '云南省', '丽江市', '玉龙纳西族自治县', '', '0', '2', 'YLNXZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530722', '53', '7', '22', '永胜县', '云南省', '丽江市', '永胜县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('530723', '53', '7', '23', '华坪县', '云南省', '丽江市', '华坪县', '', '0', '2', 'HPX', '0');
INSERT INTO `t_system_region_info` VALUES ('530724', '53', '7', '24', '宁蒗彝族自治县', '云南省', '丽江市', '宁蒗彝族自治县', '', '0', '2', 'NLYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530800', '53', '8', '0', '普洱市', '云南省', '普洱市', '', '', '0', '1', 'PES', '0');
INSERT INTO `t_system_region_info` VALUES ('530801', '53', '8', '1', '市辖区', '云南省', '普洱市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530802', '53', '8', '2', '思茅区', '云南省', '普洱市', '思茅区', '', '0', '2', 'SMQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530821', '53', '8', '21', '宁洱哈尼族彝族自治县', '云南省', '普洱市', '宁洱哈尼族彝族自治县', '', '0', '2', 'NEHNZYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530822', '53', '8', '22', '墨江哈尼族自治县', '云南省', '普洱市', '墨江哈尼族自治县', '', '0', '2', 'MJHNZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530823', '53', '8', '23', '景东彝族自治县', '云南省', '普洱市', '景东彝族自治县', '', '0', '2', 'JDYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530824', '53', '8', '24', '景谷傣族彝族自治县', '云南省', '普洱市', '景谷傣族彝族自治县', '', '0', '2', 'JGDZYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530825', '53', '8', '25', '镇沅彝族哈尼族拉祜族自治县', '云南省', '普洱市', '镇沅彝族哈尼族拉祜族自治县', '', '0', '2', 'ZYYZHNZLHZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530826', '53', '8', '26', '江城哈尼族彝族自治县', '云南省', '普洱市', '江城哈尼族彝族自治县', '', '0', '2', 'JCHNZYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530827', '53', '8', '27', '孟连傣族拉祜族佤族自治县', '云南省', '普洱市', '孟连傣族拉祜族佤族自治县', '', '0', '2', 'MLDZLHZWZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530828', '53', '8', '28', '澜沧拉祜族自治县', '云南省', '普洱市', '澜沧拉祜族自治县', '', '0', '2', 'LCLHZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530829', '53', '8', '29', '西盟佤族自治县', '云南省', '普洱市', '西盟佤族自治县', '', '0', '2', 'XMWZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530900', '53', '9', '0', '临沧市', '云南省', '临沧市', '', '', '0', '1', 'LCS', '0');
INSERT INTO `t_system_region_info` VALUES ('530901', '53', '9', '1', '市辖区', '云南省', '临沧市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530902', '53', '9', '2', '临翔区', '云南省', '临沧市', '临翔区', '', '0', '2', 'LXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('530921', '53', '9', '21', '凤庆县', '云南省', '临沧市', '凤庆县', '', '0', '2', 'FQX', '0');
INSERT INTO `t_system_region_info` VALUES ('530922', '53', '9', '22', '云县', '云南省', '临沧市', '云县', '', '0', '2', 'YX', '0');
INSERT INTO `t_system_region_info` VALUES ('530923', '53', '9', '23', '永德县', '云南省', '临沧市', '永德县', '', '0', '2', 'YDX', '0');
INSERT INTO `t_system_region_info` VALUES ('530924', '53', '9', '24', '镇康县', '云南省', '临沧市', '镇康县', '', '0', '2', 'ZKX', '0');
INSERT INTO `t_system_region_info` VALUES ('530925', '53', '9', '25', '双江拉祜族佤族布朗族傣族自治县', '云南省', '临沧市', '双江拉祜族佤族布朗族傣族自治县', '', '0', '2', 'SJLHZWZBLZDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530926', '53', '9', '26', '耿马傣族佤族自治县', '云南省', '临沧市', '耿马傣族佤族自治县', '', '0', '2', 'GMDZWZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('530927', '53', '9', '27', '沧源佤族自治县', '云南省', '临沧市', '沧源佤族自治县', '', '0', '2', 'CYWZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('532300', '53', '23', '0', '楚雄彝族自治州', '云南省', '楚雄彝族自治州', '', '', '0', '1', 'CXYZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('532301', '53', '23', '1', '楚雄市', '云南省', '楚雄彝族自治州', '楚雄市', '', '0', '2', 'CXS', '0');
INSERT INTO `t_system_region_info` VALUES ('532322', '53', '23', '22', '双柏县', '云南省', '楚雄彝族自治州', '双柏县', '', '0', '2', 'SBX', '0');
INSERT INTO `t_system_region_info` VALUES ('532323', '53', '23', '23', '牟定县', '云南省', '楚雄彝族自治州', '牟定县', '', '0', '2', 'MDX', '0');
INSERT INTO `t_system_region_info` VALUES ('532324', '53', '23', '24', '南华县', '云南省', '楚雄彝族自治州', '南华县', '', '0', '2', 'NHX', '0');
INSERT INTO `t_system_region_info` VALUES ('532325', '53', '23', '25', '姚安县', '云南省', '楚雄彝族自治州', '姚安县', '', '0', '2', 'YAX', '0');
INSERT INTO `t_system_region_info` VALUES ('532326', '53', '23', '26', '大姚县', '云南省', '楚雄彝族自治州', '大姚县', '', '0', '2', 'DYX', '0');
INSERT INTO `t_system_region_info` VALUES ('532327', '53', '23', '27', '永仁县', '云南省', '楚雄彝族自治州', '永仁县', '', '0', '2', 'YRX', '0');
INSERT INTO `t_system_region_info` VALUES ('532328', '53', '23', '28', '元谋县', '云南省', '楚雄彝族自治州', '元谋县', '', '0', '2', 'YMX', '0');
INSERT INTO `t_system_region_info` VALUES ('532329', '53', '23', '29', '武定县', '云南省', '楚雄彝族自治州', '武定县', '', '0', '2', 'WDX', '0');
INSERT INTO `t_system_region_info` VALUES ('532331', '53', '23', '31', '禄丰县', '云南省', '楚雄彝族自治州', '禄丰县', '', '0', '2', 'LFX', '0');
INSERT INTO `t_system_region_info` VALUES ('532500', '53', '25', '0', '红河哈尼族彝族自治州', '云南省', '红河哈尼族彝族自治州', '', '', '0', '1', 'GHHNZYZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('532501', '53', '25', '1', '个旧市', '云南省', '红河哈尼族彝族自治州', '个旧市', '', '0', '2', 'GJS', '0');
INSERT INTO `t_system_region_info` VALUES ('532502', '53', '25', '2', '开远市', '云南省', '红河哈尼族彝族自治州', '开远市', '', '0', '2', 'KYS', '0');
INSERT INTO `t_system_region_info` VALUES ('532503', '53', '25', '3', '蒙自市', '云南省', '红河哈尼族彝族自治州', '蒙自市', '', '0', '2', 'MZS', '0');
INSERT INTO `t_system_region_info` VALUES ('532523', '53', '25', '23', '屏边苗族自治县', '云南省', '红河哈尼族彝族自治州', '屏边苗族自治县', '', '0', '2', 'BBMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('532524', '53', '25', '24', '建水县', '云南省', '红河哈尼族彝族自治州', '建水县', '', '0', '2', 'JSX', '0');
INSERT INTO `t_system_region_info` VALUES ('532525', '53', '25', '25', '石屏县', '云南省', '红河哈尼族彝族自治州', '石屏县', '', '0', '2', 'SBX', '0');
INSERT INTO `t_system_region_info` VALUES ('532526', '53', '25', '26', '弥勒县', '云南省', '红河哈尼族彝族自治州', '弥勒县', '', '0', '2', 'MLX', '0');
INSERT INTO `t_system_region_info` VALUES ('532527', '53', '25', '27', '泸西县', '云南省', '红河哈尼族彝族自治州', '泸西县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('532528', '53', '25', '28', '元阳县', '云南省', '红河哈尼族彝族自治州', '元阳县', '', '0', '2', 'YYX', '0');
INSERT INTO `t_system_region_info` VALUES ('532529', '53', '25', '29', '红河县', '云南省', '红河哈尼族彝族自治州', '红河县', '', '0', '2', 'GHX', '0');
INSERT INTO `t_system_region_info` VALUES ('532530', '53', '25', '30', '金平苗族瑶族傣族自治县', '云南省', '红河哈尼族彝族自治州', '金平苗族瑶族傣族自治县', '', '0', '2', 'JPMZYZDZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('532531', '53', '25', '31', '绿春县', '云南省', '红河哈尼族彝族自治州', '绿春县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('532532', '53', '25', '32', '河口瑶族自治县', '云南省', '红河哈尼族彝族自治州', '河口瑶族自治县', '', '0', '2', 'HKYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('532600', '53', '26', '0', '文山壮族苗族自治州', '云南省', '文山壮族苗族自治州', '', '', '0', '1', 'WSZZMZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('532601', '53', '26', '1', '文山市', '云南省', '文山壮族苗族自治州', '文山市', '', '0', '2', 'WSS', '0');
INSERT INTO `t_system_region_info` VALUES ('532622', '53', '26', '22', '砚山县', '云南省', '文山壮族苗族自治州', '砚山县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('532623', '53', '26', '23', '西畴县', '云南省', '文山壮族苗族自治州', '西畴县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('532624', '53', '26', '24', '麻栗坡县', '云南省', '文山壮族苗族自治州', '麻栗坡县', '', '0', '2', 'MLPX', '0');
INSERT INTO `t_system_region_info` VALUES ('532625', '53', '26', '25', '马关县', '云南省', '文山壮族苗族自治州', '马关县', '', '0', '2', 'MGX', '0');
INSERT INTO `t_system_region_info` VALUES ('532626', '53', '26', '26', '丘北县', '云南省', '文山壮族苗族自治州', '丘北县', '', '0', '2', 'QBX', '0');
INSERT INTO `t_system_region_info` VALUES ('532627', '53', '26', '27', '广南县', '云南省', '文山壮族苗族自治州', '广南县', '', '0', '2', 'ANX', '0');
INSERT INTO `t_system_region_info` VALUES ('532628', '53', '26', '28', '富宁县', '云南省', '文山壮族苗族自治州', '富宁县', '', '0', '2', 'FNX', '0');
INSERT INTO `t_system_region_info` VALUES ('532800', '53', '28', '0', '西双版纳傣族自治州', '云南省', '西双版纳傣族自治州', '', '', '0', '1', 'XSBNDZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('532801', '53', '28', '1', '景洪市', '云南省', '西双版纳傣族自治州', '景洪市', '', '0', '2', 'JHS', '0');
INSERT INTO `t_system_region_info` VALUES ('532822', '53', '28', '22', '勐海县', '云南省', '西双版纳傣族自治州', '勐海县', '', '0', '2', 'MHX', '0');
INSERT INTO `t_system_region_info` VALUES ('532823', '53', '28', '23', '勐腊县', '云南省', '西双版纳傣族自治州', '勐腊县', '', '0', '2', 'MLX', '0');
INSERT INTO `t_system_region_info` VALUES ('532900', '53', '29', '0', '大理白族自治州', '云南省', '大理白族自治州', '', '', '0', '1', 'DLBZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('532901', '53', '29', '1', '大理市', '云南省', '大理白族自治州', '大理市', '', '0', '2', 'DLS', '0');
INSERT INTO `t_system_region_info` VALUES ('532922', '53', '29', '22', '漾濞彝族自治县', '云南省', '大理白族自治州', '漾濞彝族自治县', '', '0', '2', 'YBYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('532923', '53', '29', '23', '祥云县', '云南省', '大理白族自治州', '祥云县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('532924', '53', '29', '24', '宾川县', '云南省', '大理白族自治州', '宾川县', '', '0', '2', 'BCX', '0');
INSERT INTO `t_system_region_info` VALUES ('532925', '53', '29', '25', '弥渡县', '云南省', '大理白族自治州', '弥渡县', '', '0', '2', 'MDX', '0');
INSERT INTO `t_system_region_info` VALUES ('532926', '53', '29', '26', '南涧彝族自治县', '云南省', '大理白族自治州', '南涧彝族自治县', '', '0', '2', 'NJYZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('532927', '53', '29', '27', '巍山彝族回族自治县', '云南省', '大理白族自治州', '巍山彝族回族自治县', '', '0', '2', 'WSYZHZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('532928', '53', '29', '28', '永平县', '云南省', '大理白族自治州', '永平县', '', '0', '2', 'YPX', '0');
INSERT INTO `t_system_region_info` VALUES ('532929', '53', '29', '29', '云龙县', '云南省', '大理白族自治州', '云龙县', '', '0', '2', 'YLX', '0');
INSERT INTO `t_system_region_info` VALUES ('532930', '53', '29', '30', '洱源县', '云南省', '大理白族自治州', '洱源县', '', '0', '2', 'EYX', '0');
INSERT INTO `t_system_region_info` VALUES ('532931', '53', '29', '31', '剑川县', '云南省', '大理白族自治州', '剑川县', '', '0', '2', 'JCX', '0');
INSERT INTO `t_system_region_info` VALUES ('532932', '53', '29', '32', '鹤庆县', '云南省', '大理白族自治州', '鹤庆县', '', '0', '2', 'HQX', '0');
INSERT INTO `t_system_region_info` VALUES ('533100', '53', '31', '0', '德宏傣族景颇族自治州', '云南省', '德宏傣族景颇族自治州', '', '', '0', '1', 'DHDZJPZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('533102', '53', '31', '2', '瑞丽市', '云南省', '德宏傣族景颇族自治州', '瑞丽市', '', '0', '2', 'RLS', '0');
INSERT INTO `t_system_region_info` VALUES ('533103', '53', '31', '3', '芒市', '云南省', '德宏傣族景颇族自治州', '芒市', '', '0', '2', 'MS', '0');
INSERT INTO `t_system_region_info` VALUES ('533122', '53', '31', '22', '梁河县', '云南省', '德宏傣族景颇族自治州', '梁河县', '', '0', '2', 'LHX', '0');
INSERT INTO `t_system_region_info` VALUES ('533123', '53', '31', '23', '盈江县', '云南省', '德宏傣族景颇族自治州', '盈江县', '', '0', '2', 'YJX', '0');
INSERT INTO `t_system_region_info` VALUES ('533124', '53', '31', '24', '陇川县', '云南省', '德宏傣族景颇族自治州', '陇川县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('533300', '53', '33', '0', '怒江傈僳族自治州', '云南省', '怒江傈僳族自治州', '', '', '0', '1', 'NJLSZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('533321', '53', '33', '21', '泸水县', '云南省', '怒江傈僳族自治州', '泸水县', '', '0', '2', 'LSX', '0');
INSERT INTO `t_system_region_info` VALUES ('533323', '53', '33', '23', '福贡县', '云南省', '怒江傈僳族自治州', '福贡县', '', '0', '2', 'FGX', '0');
INSERT INTO `t_system_region_info` VALUES ('533324', '53', '33', '24', '贡山独龙族怒族自治县', '云南省', '怒江傈僳族自治州', '贡山独龙族怒族自治县', '', '0', '2', 'GSDLZNZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('533325', '53', '33', '25', '兰坪白族普米族自治县', '云南省', '怒江傈僳族自治州', '兰坪白族普米族自治县', '', '0', '2', 'LPBZPMZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('533400', '53', '34', '0', '迪庆藏族自治州', '云南省', '迪庆藏族自治州', '', '', '0', '1', 'DQCZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('533421', '53', '34', '21', '香格里拉县', '云南省', '迪庆藏族自治州', '香格里拉县', '', '0', '2', 'XGLLX', '0');
INSERT INTO `t_system_region_info` VALUES ('533422', '53', '34', '22', '德钦县', '云南省', '迪庆藏族自治州', '德钦县', '', '0', '2', 'DQX', '0');
INSERT INTO `t_system_region_info` VALUES ('533423', '53', '34', '23', '维西傈僳族自治县', '云南省', '迪庆藏族自治州', '维西傈僳族自治县', '', '0', '2', 'WXLSZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('540000', '54', '0', '0', '西藏自治区', '西藏自治区', '', '', '', '0', '0', 'XCZZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('540100', '54', '1', '0', '拉萨市', '西藏自治区', '拉萨市', '', '', '0', '1', 'LSS', '0');
INSERT INTO `t_system_region_info` VALUES ('540101', '54', '1', '1', '市辖区', '西藏自治区', '拉萨市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('540102', '54', '1', '2', '城关区', '西藏自治区', '拉萨市', '城关区', '', '0', '2', 'CGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('540121', '54', '1', '21', '林周县', '西藏自治区', '拉萨市', '林周县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('540122', '54', '1', '22', '当雄县', '西藏自治区', '拉萨市', '当雄县', '', '0', '2', 'DXX', '0');
INSERT INTO `t_system_region_info` VALUES ('540123', '54', '1', '23', '尼木县', '西藏自治区', '拉萨市', '尼木县', '', '0', '2', 'NMX', '0');
INSERT INTO `t_system_region_info` VALUES ('540124', '54', '1', '24', '曲水县', '西藏自治区', '拉萨市', '曲水县', '', '0', '2', 'QSX', '0');
INSERT INTO `t_system_region_info` VALUES ('540125', '54', '1', '25', '堆龙德庆县', '西藏自治区', '拉萨市', '堆龙德庆县', '', '0', '2', 'DLDQX', '0');
INSERT INTO `t_system_region_info` VALUES ('540126', '54', '1', '26', '达孜县', '西藏自治区', '拉萨市', '达孜县', '', '0', '2', 'DZX', '0');
INSERT INTO `t_system_region_info` VALUES ('540127', '54', '1', '27', '墨竹工卡县', '西藏自治区', '拉萨市', '墨竹工卡县', '', '0', '2', 'MZGKX', '0');
INSERT INTO `t_system_region_info` VALUES ('542100', '54', '21', '0', '昌都地区', '西藏自治区', '昌都地区', '', '', '0', '1', 'CDDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('542121', '54', '21', '21', '昌都县', '西藏自治区', '昌都地区', '昌都县', '', '0', '2', 'CDX', '0');
INSERT INTO `t_system_region_info` VALUES ('542122', '54', '21', '22', '江达县', '西藏自治区', '昌都地区', '江达县', '', '0', '2', 'JDX', '0');
INSERT INTO `t_system_region_info` VALUES ('542123', '54', '21', '23', '贡觉县', '西藏自治区', '昌都地区', '贡觉县', '', '0', '2', 'GJX', '0');
INSERT INTO `t_system_region_info` VALUES ('542124', '54', '21', '24', '类乌齐县', '西藏自治区', '昌都地区', '类乌齐县', '', '0', '2', 'LWJX', '0');
INSERT INTO `t_system_region_info` VALUES ('542125', '54', '21', '25', '丁青县', '西藏自治区', '昌都地区', '丁青县', '', '0', '2', 'DQX', '0');
INSERT INTO `t_system_region_info` VALUES ('542126', '54', '21', '26', '察雅县', '西藏自治区', '昌都地区', '察雅县', '', '0', '2', 'CYX', '0');
INSERT INTO `t_system_region_info` VALUES ('542127', '54', '21', '27', '八宿县', '西藏自治区', '昌都地区', '八宿县', '', '0', '2', 'BSX', '0');
INSERT INTO `t_system_region_info` VALUES ('542128', '54', '21', '28', '左贡县', '西藏自治区', '昌都地区', '左贡县', '', '0', '2', 'ZGX', '0');
INSERT INTO `t_system_region_info` VALUES ('542129', '54', '21', '29', '芒康县', '西藏自治区', '昌都地区', '芒康县', '', '0', '2', 'MKX', '0');
INSERT INTO `t_system_region_info` VALUES ('542132', '54', '21', '32', '洛隆县', '西藏自治区', '昌都地区', '洛隆县', '', '0', '2', 'LLX', '0');
INSERT INTO `t_system_region_info` VALUES ('542133', '54', '21', '33', '边坝县', '西藏自治区', '昌都地区', '边坝县', '', '0', '2', 'BBX', '0');
INSERT INTO `t_system_region_info` VALUES ('542200', '54', '22', '0', '山南地区', '西藏自治区', '山南地区', '', '', '0', '1', 'SNDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('542221', '54', '22', '21', '乃东县', '西藏自治区', '山南地区', '乃东县', '', '0', '2', 'NDX', '0');
INSERT INTO `t_system_region_info` VALUES ('542222', '54', '22', '22', '扎囊县', '西藏自治区', '山南地区', '扎囊县', '', '0', '2', 'ZNX', '0');
INSERT INTO `t_system_region_info` VALUES ('542223', '54', '22', '23', '贡嘎县', '西藏自治区', '山南地区', '贡嘎县', '', '0', '2', 'GGX', '0');
INSERT INTO `t_system_region_info` VALUES ('542224', '54', '22', '24', '桑日县', '西藏自治区', '山南地区', '桑日县', '', '0', '2', 'SRX', '0');
INSERT INTO `t_system_region_info` VALUES ('542225', '54', '22', '25', '琼结县', '西藏自治区', '山南地区', '琼结县', '', '0', '2', 'QJX', '0');
INSERT INTO `t_system_region_info` VALUES ('542226', '54', '22', '26', '曲松县', '西藏自治区', '山南地区', '曲松县', '', '0', '2', 'QSX', '0');
INSERT INTO `t_system_region_info` VALUES ('542227', '54', '22', '27', '措美县', '西藏自治区', '山南地区', '措美县', '', '0', '2', 'CMX', '0');
INSERT INTO `t_system_region_info` VALUES ('542228', '54', '22', '28', '洛扎县', '西藏自治区', '山南地区', '洛扎县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('542229', '54', '22', '29', '加查县', '西藏自治区', '山南地区', '加查县', '', '0', '2', 'JCX', '0');
INSERT INTO `t_system_region_info` VALUES ('542231', '54', '22', '31', '隆子县', '西藏自治区', '山南地区', '隆子县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('542232', '54', '22', '32', '错那县', '西藏自治区', '山南地区', '错那县', '', '0', '2', 'CNX', '0');
INSERT INTO `t_system_region_info` VALUES ('542233', '54', '22', '33', '浪卡子县', '西藏自治区', '山南地区', '浪卡子县', '', '0', '2', 'LKZX', '0');
INSERT INTO `t_system_region_info` VALUES ('542300', '54', '23', '0', '日喀则地区', '西藏自治区', '日喀则地区', '', '', '0', '1', 'RKZDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('542301', '54', '23', '1', '日喀则市', '西藏自治区', '日喀则地区', '日喀则市', '', '0', '2', 'RKZS', '0');
INSERT INTO `t_system_region_info` VALUES ('542322', '54', '23', '22', '南木林县', '西藏自治区', '日喀则地区', '南木林县', '', '0', '2', 'NMLX', '0');
INSERT INTO `t_system_region_info` VALUES ('542323', '54', '23', '23', '江孜县', '西藏自治区', '日喀则地区', '江孜县', '', '0', '2', 'JZX', '0');
INSERT INTO `t_system_region_info` VALUES ('542324', '54', '23', '24', '定日县', '西藏自治区', '日喀则地区', '定日县', '', '0', '2', 'DRX', '0');
INSERT INTO `t_system_region_info` VALUES ('542325', '54', '23', '25', '萨迦县', '西藏自治区', '日喀则地区', '萨迦县', '', '0', '2', 'SJX', '0');
INSERT INTO `t_system_region_info` VALUES ('542326', '54', '23', '26', '拉孜县', '西藏自治区', '日喀则地区', '拉孜县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('542327', '54', '23', '27', '昂仁县', '西藏自治区', '日喀则地区', '昂仁县', '', '0', '2', 'ARX', '0');
INSERT INTO `t_system_region_info` VALUES ('542328', '54', '23', '28', '谢通门县', '西藏自治区', '日喀则地区', '谢通门县', '', '0', '2', 'XTMX', '0');
INSERT INTO `t_system_region_info` VALUES ('542329', '54', '23', '29', '白朗县', '西藏自治区', '日喀则地区', '白朗县', '', '0', '2', 'BLX', '0');
INSERT INTO `t_system_region_info` VALUES ('542330', '54', '23', '30', '仁布县', '西藏自治区', '日喀则地区', '仁布县', '', '0', '2', 'RBX', '0');
INSERT INTO `t_system_region_info` VALUES ('542331', '54', '23', '31', '康马县', '西藏自治区', '日喀则地区', '康马县', '', '0', '2', 'KMX', '0');
INSERT INTO `t_system_region_info` VALUES ('542332', '54', '23', '32', '定结县', '西藏自治区', '日喀则地区', '定结县', '', '0', '2', 'DJX', '0');
INSERT INTO `t_system_region_info` VALUES ('542333', '54', '23', '33', '仲巴县', '西藏自治区', '日喀则地区', '仲巴县', '', '0', '2', 'ZBX', '0');
INSERT INTO `t_system_region_info` VALUES ('542334', '54', '23', '34', '亚东县', '西藏自治区', '日喀则地区', '亚东县', '', '0', '2', 'YDX', '0');
INSERT INTO `t_system_region_info` VALUES ('542335', '54', '23', '35', '吉隆县', '西藏自治区', '日喀则地区', '吉隆县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('542336', '54', '23', '36', '聂拉木县', '西藏自治区', '日喀则地区', '聂拉木县', '', '0', '2', 'NLMX', '0');
INSERT INTO `t_system_region_info` VALUES ('542337', '54', '23', '37', '萨嘎县', '西藏自治区', '日喀则地区', '萨嘎县', '', '0', '2', 'SGX', '0');
INSERT INTO `t_system_region_info` VALUES ('542338', '54', '23', '38', '岗巴县', '西藏自治区', '日喀则地区', '岗巴县', '', '0', '2', 'GBX', '0');
INSERT INTO `t_system_region_info` VALUES ('542400', '54', '24', '0', '那曲地区', '西藏自治区', '那曲地区', '', '', '0', '1', 'NQDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('542421', '54', '24', '21', '那曲县', '西藏自治区', '那曲地区', '那曲县', '', '0', '2', 'NQX', '0');
INSERT INTO `t_system_region_info` VALUES ('542422', '54', '24', '22', '嘉黎县', '西藏自治区', '那曲地区', '嘉黎县', '', '0', '2', 'JLX', '0');
INSERT INTO `t_system_region_info` VALUES ('542423', '54', '24', '23', '比如县', '西藏自治区', '那曲地区', '比如县', '', '0', '2', 'BRX', '0');
INSERT INTO `t_system_region_info` VALUES ('542424', '54', '24', '24', '聂荣县', '西藏自治区', '那曲地区', '聂荣县', '', '0', '2', 'NRX', '0');
INSERT INTO `t_system_region_info` VALUES ('542425', '54', '24', '25', '安多县', '西藏自治区', '那曲地区', '安多县', '', '0', '2', 'ADX', '0');
INSERT INTO `t_system_region_info` VALUES ('542426', '54', '24', '26', '申扎县', '西藏自治区', '那曲地区', '申扎县', '', '0', '2', 'SZX', '0');
INSERT INTO `t_system_region_info` VALUES ('542427', '54', '24', '27', '索县', '西藏自治区', '那曲地区', '索县', '', '0', '2', 'SX', '0');
INSERT INTO `t_system_region_info` VALUES ('542428', '54', '24', '28', '班戈县', '西藏自治区', '那曲地区', '班戈县', '', '0', '2', 'BGX', '0');
INSERT INTO `t_system_region_info` VALUES ('542429', '54', '24', '29', '巴青县', '西藏自治区', '那曲地区', '巴青县', '', '0', '2', 'BQX', '0');
INSERT INTO `t_system_region_info` VALUES ('542430', '54', '24', '30', '尼玛县', '西藏自治区', '那曲地区', '尼玛县', '', '0', '2', 'NMX', '0');
INSERT INTO `t_system_region_info` VALUES ('542500', '54', '25', '0', '阿里地区', '西藏自治区', '阿里地区', '', '', '0', '1', 'ALDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('542521', '54', '25', '21', '普兰县', '西藏自治区', '阿里地区', '普兰县', '', '0', '2', 'PLX', '0');
INSERT INTO `t_system_region_info` VALUES ('542522', '54', '25', '22', '札达县', '西藏自治区', '阿里地区', '札达县', '', '0', '2', 'ZDX', '0');
INSERT INTO `t_system_region_info` VALUES ('542523', '54', '25', '23', '噶尔县', '西藏自治区', '阿里地区', '噶尔县', '', '0', '2', 'GEX', '0');
INSERT INTO `t_system_region_info` VALUES ('542524', '54', '25', '24', '日土县', '西藏自治区', '阿里地区', '日土县', '', '0', '2', 'RTX', '0');
INSERT INTO `t_system_region_info` VALUES ('542525', '54', '25', '25', '革吉县', '西藏自治区', '阿里地区', '革吉县', '', '0', '2', 'GJX', '0');
INSERT INTO `t_system_region_info` VALUES ('542526', '54', '25', '26', '改则县', '西藏自治区', '阿里地区', '改则县', '', '0', '2', 'GZX', '0');
INSERT INTO `t_system_region_info` VALUES ('542527', '54', '25', '27', '措勤县', '西藏自治区', '阿里地区', '措勤县', '', '0', '2', 'CQX', '0');
INSERT INTO `t_system_region_info` VALUES ('542600', '54', '26', '0', '林芝地区', '西藏自治区', '林芝地区', '', '', '0', '1', 'LZDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('542621', '54', '26', '21', '林芝县', '西藏自治区', '林芝地区', '林芝县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('542622', '54', '26', '22', '工布江达县', '西藏自治区', '林芝地区', '工布江达县', '', '0', '2', 'GBJDX', '0');
INSERT INTO `t_system_region_info` VALUES ('542623', '54', '26', '23', '米林县', '西藏自治区', '林芝地区', '米林县', '', '0', '2', 'MLX', '0');
INSERT INTO `t_system_region_info` VALUES ('542624', '54', '26', '24', '墨脱县', '西藏自治区', '林芝地区', '墨脱县', '', '0', '2', 'MTX', '0');
INSERT INTO `t_system_region_info` VALUES ('542625', '54', '26', '25', '波密县', '西藏自治区', '林芝地区', '波密县', '', '0', '2', 'BMX', '0');
INSERT INTO `t_system_region_info` VALUES ('542626', '54', '26', '26', '察隅县', '西藏自治区', '林芝地区', '察隅县', '', '0', '2', 'CYX', '0');
INSERT INTO `t_system_region_info` VALUES ('542627', '54', '26', '27', '朗县', '西藏自治区', '林芝地区', '朗县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('610000', '61', '0', '0', '陕西省', '陕西省', '', '', '', '0', '0', 'SXS', '0');
INSERT INTO `t_system_region_info` VALUES ('610100', '61', '1', '0', '西安市', '陕西省', '西安市', '', '', '0', '1', 'XAS', '0');
INSERT INTO `t_system_region_info` VALUES ('610101', '61', '1', '1', '市辖区', '陕西省', '西安市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610102', '61', '1', '2', '新城区', '陕西省', '西安市', '新城区', '', '0', '2', 'XCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610103', '61', '1', '3', '碑林区', '陕西省', '西安市', '碑林区', '', '0', '2', 'BLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610104', '61', '1', '4', '莲湖区', '陕西省', '西安市', '莲湖区', '', '0', '2', 'LHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610111', '61', '1', '11', '灞桥区', '陕西省', '西安市', '灞桥区', '', '0', '2', 'BQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610112', '61', '1', '12', '未央区', '陕西省', '西安市', '未央区', '', '0', '2', 'WYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610113', '61', '1', '13', '雁塔区', '陕西省', '西安市', '雁塔区', '', '0', '2', 'YDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610114', '61', '1', '14', '阎良区', '陕西省', '西安市', '阎良区', '', '0', '2', 'YLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610115', '61', '1', '15', '临潼区', '陕西省', '西安市', '临潼区', '', '0', '2', 'LTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610116', '61', '1', '16', '长安区', '陕西省', '西安市', '长安区', '', '0', '2', 'CAQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610122', '61', '1', '22', '蓝田县', '陕西省', '西安市', '蓝田县', '', '0', '2', 'LTX', '0');
INSERT INTO `t_system_region_info` VALUES ('610124', '61', '1', '24', '周至县', '陕西省', '西安市', '周至县', '', '0', '2', 'ZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('610125', '61', '1', '25', '户县', '陕西省', '西安市', '户县', '', '0', '2', 'HX', '0');
INSERT INTO `t_system_region_info` VALUES ('610126', '61', '1', '26', '高陵县', '陕西省', '西安市', '高陵县', '', '0', '2', 'GLX', '0');
INSERT INTO `t_system_region_info` VALUES ('610200', '61', '2', '0', '铜川市', '陕西省', '铜川市', '', '', '0', '1', 'TCS', '0');
INSERT INTO `t_system_region_info` VALUES ('610201', '61', '2', '1', '市辖区', '陕西省', '铜川市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610202', '61', '2', '2', '王益区', '陕西省', '铜川市', '王益区', '', '0', '2', 'WYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610203', '61', '2', '3', '印台区', '陕西省', '铜川市', '印台区', '', '0', '2', 'YTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610204', '61', '2', '4', '耀州区', '陕西省', '铜川市', '耀州区', '', '0', '2', 'YZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610222', '61', '2', '22', '宜君县', '陕西省', '铜川市', '宜君县', '', '0', '2', 'YJX', '0');
INSERT INTO `t_system_region_info` VALUES ('610300', '61', '3', '0', '宝鸡市', '陕西省', '宝鸡市', '', '', '0', '1', 'BJS', '0');
INSERT INTO `t_system_region_info` VALUES ('610301', '61', '3', '1', '市辖区', '陕西省', '宝鸡市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610302', '61', '3', '2', '渭滨区', '陕西省', '宝鸡市', '渭滨区', '', '0', '2', 'WBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610303', '61', '3', '3', '金台区', '陕西省', '宝鸡市', '金台区', '', '0', '2', 'JTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610304', '61', '3', '4', '陈仓区', '陕西省', '宝鸡市', '陈仓区', '', '0', '2', 'CCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610322', '61', '3', '22', '凤翔县', '陕西省', '宝鸡市', '凤翔县', '', '0', '2', 'FXX', '0');
INSERT INTO `t_system_region_info` VALUES ('610323', '61', '3', '23', '岐山县', '陕西省', '宝鸡市', '岐山县', '', '0', '2', 'QSX', '0');
INSERT INTO `t_system_region_info` VALUES ('610324', '61', '3', '24', '扶风县', '陕西省', '宝鸡市', '扶风县', '', '0', '2', 'FFX', '0');
INSERT INTO `t_system_region_info` VALUES ('610326', '61', '3', '26', '眉县', '陕西省', '宝鸡市', '眉县', '', '0', '2', 'MX', '0');
INSERT INTO `t_system_region_info` VALUES ('610327', '61', '3', '27', '陇县', '陕西省', '宝鸡市', '陇县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('610328', '61', '3', '28', '千阳县', '陕西省', '宝鸡市', '千阳县', '', '0', '2', 'QYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610329', '61', '3', '29', '麟游县', '陕西省', '宝鸡市', '麟游县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610330', '61', '3', '30', '凤县', '陕西省', '宝鸡市', '凤县', '', '0', '2', 'FX', '0');
INSERT INTO `t_system_region_info` VALUES ('610331', '61', '3', '31', '太白县', '陕西省', '宝鸡市', '太白县', '', '0', '2', 'TBX', '0');
INSERT INTO `t_system_region_info` VALUES ('610400', '61', '4', '0', '咸阳市', '陕西省', '咸阳市', '', '', '0', '1', 'XYS', '0');
INSERT INTO `t_system_region_info` VALUES ('610401', '61', '4', '1', '市辖区', '陕西省', '咸阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610402', '61', '4', '2', '秦都区', '陕西省', '咸阳市', '秦都区', '', '0', '2', 'QDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610403', '61', '4', '3', '杨陵区', '陕西省', '咸阳市', '杨陵区', '', '0', '2', 'YLQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610404', '61', '4', '4', '渭城区', '陕西省', '咸阳市', '渭城区', '', '0', '2', 'WCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610422', '61', '4', '22', '三原县', '陕西省', '咸阳市', '三原县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610423', '61', '4', '23', '泾阳县', '陕西省', '咸阳市', '泾阳县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610424', '61', '4', '24', '乾县', '陕西省', '咸阳市', '乾县', '', '0', '2', 'GX', '0');
INSERT INTO `t_system_region_info` VALUES ('610425', '61', '4', '25', '礼泉县', '陕西省', '咸阳市', '礼泉县', '', '0', '2', 'LQX', '0');
INSERT INTO `t_system_region_info` VALUES ('610426', '61', '4', '26', '永寿县', '陕西省', '咸阳市', '永寿县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('610427', '61', '4', '27', '彬县', '陕西省', '咸阳市', '彬县', '', '0', '2', 'BX', '0');
INSERT INTO `t_system_region_info` VALUES ('610428', '61', '4', '28', '长武县', '陕西省', '咸阳市', '长武县', '', '0', '2', 'CWX', '0');
INSERT INTO `t_system_region_info` VALUES ('610429', '61', '4', '29', '旬邑县', '陕西省', '咸阳市', '旬邑县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610430', '61', '4', '30', '淳化县', '陕西省', '咸阳市', '淳化县', '', '0', '2', 'CHX', '0');
INSERT INTO `t_system_region_info` VALUES ('610431', '61', '4', '31', '武功县', '陕西省', '咸阳市', '武功县', '', '0', '2', 'WGX', '0');
INSERT INTO `t_system_region_info` VALUES ('610481', '61', '4', '81', '兴平市', '陕西省', '咸阳市', '兴平市', '', '0', '2', 'XPS', '0');
INSERT INTO `t_system_region_info` VALUES ('610500', '61', '5', '0', '渭南市', '陕西省', '渭南市', '', '', '0', '1', 'WNS', '0');
INSERT INTO `t_system_region_info` VALUES ('610501', '61', '5', '1', '市辖区', '陕西省', '渭南市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610502', '61', '5', '2', '临渭区', '陕西省', '渭南市', '临渭区', '', '0', '2', 'LWQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610521', '61', '5', '21', '华县', '陕西省', '渭南市', '华县', '', '0', '2', 'HX', '0');
INSERT INTO `t_system_region_info` VALUES ('610522', '61', '5', '22', '潼关县', '陕西省', '渭南市', '潼关县', '', '0', '2', 'TGX', '0');
INSERT INTO `t_system_region_info` VALUES ('610523', '61', '5', '23', '大荔县', '陕西省', '渭南市', '大荔县', '', '0', '2', 'DLX', '0');
INSERT INTO `t_system_region_info` VALUES ('610524', '61', '5', '24', '合阳县', '陕西省', '渭南市', '合阳县', '', '0', '2', 'GYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610525', '61', '5', '25', '澄城县', '陕西省', '渭南市', '澄城县', '', '0', '2', 'CCX', '0');
INSERT INTO `t_system_region_info` VALUES ('610526', '61', '5', '26', '蒲城县', '陕西省', '渭南市', '蒲城县', '', '0', '2', 'PCX', '0');
INSERT INTO `t_system_region_info` VALUES ('610527', '61', '5', '27', '白水县', '陕西省', '渭南市', '白水县', '', '0', '2', 'BSX', '0');
INSERT INTO `t_system_region_info` VALUES ('610528', '61', '5', '28', '富平县', '陕西省', '渭南市', '富平县', '', '0', '2', 'FPX', '0');
INSERT INTO `t_system_region_info` VALUES ('610581', '61', '5', '81', '韩城市', '陕西省', '渭南市', '韩城市', '', '0', '2', 'HCS', '0');
INSERT INTO `t_system_region_info` VALUES ('610582', '61', '5', '82', '华阴市', '陕西省', '渭南市', '华阴市', '', '0', '2', 'HYS', '0');
INSERT INTO `t_system_region_info` VALUES ('610600', '61', '6', '0', '延安市', '陕西省', '延安市', '', '', '0', '1', 'YAS', '0');
INSERT INTO `t_system_region_info` VALUES ('610601', '61', '6', '1', '市辖区', '陕西省', '延安市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610602', '61', '6', '2', '宝塔区', '陕西省', '延安市', '宝塔区', '', '0', '2', 'BDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610621', '61', '6', '21', '延长县', '陕西省', '延安市', '延长县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('610622', '61', '6', '22', '延川县', '陕西省', '延安市', '延川县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('610623', '61', '6', '23', '子长县', '陕西省', '延安市', '子长县', '', '0', '2', 'ZCX', '0');
INSERT INTO `t_system_region_info` VALUES ('610624', '61', '6', '24', '安塞县', '陕西省', '延安市', '安塞县', '', '0', '2', 'ASX', '0');
INSERT INTO `t_system_region_info` VALUES ('610625', '61', '6', '25', '志丹县', '陕西省', '延安市', '志丹县', '', '0', '2', 'ZDX', '0');
INSERT INTO `t_system_region_info` VALUES ('610626', '61', '6', '26', '吴起县', '陕西省', '延安市', '吴起县', '', '0', '2', 'WQX', '0');
INSERT INTO `t_system_region_info` VALUES ('610627', '61', '6', '27', '甘泉县', '陕西省', '延安市', '甘泉县', '', '0', '2', 'GQX', '0');
INSERT INTO `t_system_region_info` VALUES ('610628', '61', '6', '28', '富县', '陕西省', '延安市', '富县', '', '0', '2', 'FX', '0');
INSERT INTO `t_system_region_info` VALUES ('610629', '61', '6', '29', '洛川县', '陕西省', '延安市', '洛川县', '', '0', '2', 'LCX', '0');
INSERT INTO `t_system_region_info` VALUES ('610630', '61', '6', '30', '宜川县', '陕西省', '延安市', '宜川县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('610631', '61', '6', '31', '黄龙县', '陕西省', '延安市', '黄龙县', '', '0', '2', 'HLX', '0');
INSERT INTO `t_system_region_info` VALUES ('610632', '61', '6', '32', '黄陵县', '陕西省', '延安市', '黄陵县', '', '0', '2', 'HLX', '0');
INSERT INTO `t_system_region_info` VALUES ('610700', '61', '7', '0', '汉中市', '陕西省', '汉中市', '', '', '0', '1', 'HZS', '0');
INSERT INTO `t_system_region_info` VALUES ('610701', '61', '7', '1', '市辖区', '陕西省', '汉中市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610702', '61', '7', '2', '汉台区', '陕西省', '汉中市', '汉台区', '', '0', '2', 'HTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610721', '61', '7', '21', '南郑县', '陕西省', '汉中市', '南郑县', '', '0', '2', 'NZX', '0');
INSERT INTO `t_system_region_info` VALUES ('610722', '61', '7', '22', '城固县', '陕西省', '汉中市', '城固县', '', '0', '2', 'CGX', '0');
INSERT INTO `t_system_region_info` VALUES ('610723', '61', '7', '23', '洋县', '陕西省', '汉中市', '洋县', '', '0', '2', 'YX', '0');
INSERT INTO `t_system_region_info` VALUES ('610724', '61', '7', '24', '西乡县', '陕西省', '汉中市', '西乡县', '', '0', '2', 'XXX', '0');
INSERT INTO `t_system_region_info` VALUES ('610725', '61', '7', '25', '勉县', '陕西省', '汉中市', '勉县', '', '0', '2', 'MX', '0');
INSERT INTO `t_system_region_info` VALUES ('610726', '61', '7', '26', '宁强县', '陕西省', '汉中市', '宁强县', '', '0', '2', 'NJX', '0');
INSERT INTO `t_system_region_info` VALUES ('610727', '61', '7', '27', '略阳县', '陕西省', '汉中市', '略阳县', '', '0', '2', 'LYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610728', '61', '7', '28', '镇巴县', '陕西省', '汉中市', '镇巴县', '', '0', '2', 'ZBX', '0');
INSERT INTO `t_system_region_info` VALUES ('610729', '61', '7', '29', '留坝县', '陕西省', '汉中市', '留坝县', '', '0', '2', 'LBX', '0');
INSERT INTO `t_system_region_info` VALUES ('610730', '61', '7', '30', '佛坪县', '陕西省', '汉中市', '佛坪县', '', '0', '2', 'FPX', '0');
INSERT INTO `t_system_region_info` VALUES ('610800', '61', '8', '0', '榆林市', '陕西省', '榆林市', '', '', '0', '1', 'YLS', '0');
INSERT INTO `t_system_region_info` VALUES ('610801', '61', '8', '1', '市辖区', '陕西省', '榆林市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610802', '61', '8', '2', '榆阳区', '陕西省', '榆林市', '榆阳区', '', '0', '2', 'YYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610821', '61', '8', '21', '神木县', '陕西省', '榆林市', '神木县', '', '0', '2', 'SMX', '0');
INSERT INTO `t_system_region_info` VALUES ('610822', '61', '8', '22', '府谷县', '陕西省', '榆林市', '府谷县', '', '0', '2', 'FGX', '0');
INSERT INTO `t_system_region_info` VALUES ('610823', '61', '8', '23', '横山县', '陕西省', '榆林市', '横山县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('610824', '61', '8', '24', '靖边县', '陕西省', '榆林市', '靖边县', '', '0', '2', 'JBX', '0');
INSERT INTO `t_system_region_info` VALUES ('610825', '61', '8', '25', '定边县', '陕西省', '榆林市', '定边县', '', '0', '2', 'DBX', '0');
INSERT INTO `t_system_region_info` VALUES ('610826', '61', '8', '26', '绥德县', '陕西省', '榆林市', '绥德县', '', '0', '2', 'SDX', '0');
INSERT INTO `t_system_region_info` VALUES ('610827', '61', '8', '27', '米脂县', '陕西省', '榆林市', '米脂县', '', '0', '2', 'MZX', '0');
INSERT INTO `t_system_region_info` VALUES ('610828', '61', '8', '28', '佳县', '陕西省', '榆林市', '佳县', '', '0', '2', 'JX', '0');
INSERT INTO `t_system_region_info` VALUES ('610829', '61', '8', '29', '吴堡县', '陕西省', '榆林市', '吴堡县', '', '0', '2', 'WBX', '0');
INSERT INTO `t_system_region_info` VALUES ('610830', '61', '8', '30', '清涧县', '陕西省', '榆林市', '清涧县', '', '0', '2', 'QJX', '0');
INSERT INTO `t_system_region_info` VALUES ('610831', '61', '8', '31', '子洲县', '陕西省', '榆林市', '子洲县', '', '0', '2', 'ZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('610900', '61', '9', '0', '安康市', '陕西省', '安康市', '', '', '0', '1', 'AKS', '0');
INSERT INTO `t_system_region_info` VALUES ('610901', '61', '9', '1', '市辖区', '陕西省', '安康市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610902', '61', '9', '2', '汉滨区', '陕西省', '安康市', '汉滨区', '', '0', '2', 'HBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('610921', '61', '9', '21', '汉阴县', '陕西省', '安康市', '汉阴县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610922', '61', '9', '22', '石泉县', '陕西省', '安康市', '石泉县', '', '0', '2', 'SQX', '0');
INSERT INTO `t_system_region_info` VALUES ('610923', '61', '9', '23', '宁陕县', '陕西省', '安康市', '宁陕县', '', '0', '2', 'NSX', '0');
INSERT INTO `t_system_region_info` VALUES ('610924', '61', '9', '24', '紫阳县', '陕西省', '安康市', '紫阳县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610925', '61', '9', '25', '岚皋县', '陕西省', '安康市', '岚皋县', '', '0', '2', 'LGX', '0');
INSERT INTO `t_system_region_info` VALUES ('610926', '61', '9', '26', '平利县', '陕西省', '安康市', '平利县', '', '0', '2', 'PLX', '0');
INSERT INTO `t_system_region_info` VALUES ('610927', '61', '9', '27', '镇坪县', '陕西省', '安康市', '镇坪县', '', '0', '2', 'ZPX', '0');
INSERT INTO `t_system_region_info` VALUES ('610928', '61', '9', '28', '旬阳县', '陕西省', '安康市', '旬阳县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('610929', '61', '9', '29', '白河县', '陕西省', '安康市', '白河县', '', '0', '2', 'BHX', '0');
INSERT INTO `t_system_region_info` VALUES ('611000', '61', '10', '0', '商洛市', '陕西省', '商洛市', '', '', '0', '1', 'SLS', '0');
INSERT INTO `t_system_region_info` VALUES ('611001', '61', '10', '1', '市辖区', '陕西省', '商洛市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('611002', '61', '10', '2', '商州区', '陕西省', '商洛市', '商州区', '', '0', '2', 'SZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('611021', '61', '10', '21', '洛南县', '陕西省', '商洛市', '洛南县', '', '0', '2', 'LNX', '0');
INSERT INTO `t_system_region_info` VALUES ('611022', '61', '10', '22', '丹凤县', '陕西省', '商洛市', '丹凤县', '', '0', '2', 'DFX', '0');
INSERT INTO `t_system_region_info` VALUES ('611023', '61', '10', '23', '商南县', '陕西省', '商洛市', '商南县', '', '0', '2', 'SNX', '0');
INSERT INTO `t_system_region_info` VALUES ('611024', '61', '10', '24', '山阳县', '陕西省', '商洛市', '山阳县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('611025', '61', '10', '25', '镇安县', '陕西省', '商洛市', '镇安县', '', '0', '2', 'ZAX', '0');
INSERT INTO `t_system_region_info` VALUES ('611026', '61', '10', '26', '柞水县', '陕西省', '商洛市', '柞水县', '', '0', '2', 'ZSX', '0');
INSERT INTO `t_system_region_info` VALUES ('620000', '62', '0', '0', '甘肃省', '甘肃省', '', '', '', '0', '0', 'GSS', '0');
INSERT INTO `t_system_region_info` VALUES ('620100', '62', '1', '0', '兰州市', '甘肃省', '兰州市', '', '', '0', '1', 'LZS', '0');
INSERT INTO `t_system_region_info` VALUES ('620101', '62', '1', '1', '市辖区', '甘肃省', '兰州市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620102', '62', '1', '2', '城关区', '甘肃省', '兰州市', '城关区', '', '0', '2', 'CGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620103', '62', '1', '3', '七里河区', '甘肃省', '兰州市', '七里河区', '', '0', '2', 'QLHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620104', '62', '1', '4', '西固区', '甘肃省', '兰州市', '西固区', '', '0', '2', 'XGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620105', '62', '1', '5', '安宁区', '甘肃省', '兰州市', '安宁区', '', '0', '2', 'ANQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620111', '62', '1', '11', '红古区', '甘肃省', '兰州市', '红古区', '', '0', '2', 'GGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620121', '62', '1', '21', '永登县', '甘肃省', '兰州市', '永登县', '', '0', '2', 'YDX', '0');
INSERT INTO `t_system_region_info` VALUES ('620122', '62', '1', '22', '皋兰县', '甘肃省', '兰州市', '皋兰县', '', '0', '2', 'GLX', '0');
INSERT INTO `t_system_region_info` VALUES ('620123', '62', '1', '23', '榆中县', '甘肃省', '兰州市', '榆中县', '', '0', '2', 'YZX', '0');
INSERT INTO `t_system_region_info` VALUES ('620200', '62', '2', '0', '嘉峪关市', '甘肃省', '嘉峪关市', '', '', '0', '1', 'JYGS', '0');
INSERT INTO `t_system_region_info` VALUES ('620201', '62', '2', '1', '市辖区', '甘肃省', '嘉峪关市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620300', '62', '3', '0', '金昌市', '甘肃省', '金昌市', '', '', '0', '1', 'JCS', '0');
INSERT INTO `t_system_region_info` VALUES ('620301', '62', '3', '1', '市辖区', '甘肃省', '金昌市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620302', '62', '3', '2', '金川区', '甘肃省', '金昌市', '金川区', '', '0', '2', 'JCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620321', '62', '3', '21', '永昌县', '甘肃省', '金昌市', '永昌县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('620400', '62', '4', '0', '白银市', '甘肃省', '白银市', '', '', '0', '1', 'BYS', '0');
INSERT INTO `t_system_region_info` VALUES ('620401', '62', '4', '1', '市辖区', '甘肃省', '白银市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620402', '62', '4', '2', '白银区', '甘肃省', '白银市', '白银区', '', '0', '2', 'BYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620403', '62', '4', '3', '平川区', '甘肃省', '白银市', '平川区', '', '0', '2', 'PCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620421', '62', '4', '21', '靖远县', '甘肃省', '白银市', '靖远县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('620422', '62', '4', '22', '会宁县', '甘肃省', '白银市', '会宁县', '', '0', '2', 'HNX', '0');
INSERT INTO `t_system_region_info` VALUES ('620423', '62', '4', '23', '景泰县', '甘肃省', '白银市', '景泰县', '', '0', '2', 'JTX', '0');
INSERT INTO `t_system_region_info` VALUES ('620500', '62', '5', '0', '天水市', '甘肃省', '天水市', '', '', '0', '1', 'TSS', '0');
INSERT INTO `t_system_region_info` VALUES ('620501', '62', '5', '1', '市辖区', '甘肃省', '天水市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620502', '62', '5', '2', '秦州区', '甘肃省', '天水市', '秦州区', '', '0', '2', 'QZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620503', '62', '5', '3', '麦积区', '甘肃省', '天水市', '麦积区', '', '0', '2', 'MJQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620521', '62', '5', '21', '清水县', '甘肃省', '天水市', '清水县', '', '0', '2', 'QSX', '0');
INSERT INTO `t_system_region_info` VALUES ('620522', '62', '5', '22', '秦安县', '甘肃省', '天水市', '秦安县', '', '0', '2', 'QAX', '0');
INSERT INTO `t_system_region_info` VALUES ('620523', '62', '5', '23', '甘谷县', '甘肃省', '天水市', '甘谷县', '', '0', '2', 'GGX', '0');
INSERT INTO `t_system_region_info` VALUES ('620524', '62', '5', '24', '武山县', '甘肃省', '天水市', '武山县', '', '0', '2', 'WSX', '0');
INSERT INTO `t_system_region_info` VALUES ('620525', '62', '5', '25', '张家川回族自治县', '甘肃省', '天水市', '张家川回族自治县', '', '0', '2', 'ZJCHZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('620600', '62', '6', '0', '武威市', '甘肃省', '武威市', '', '', '0', '1', 'WWS', '0');
INSERT INTO `t_system_region_info` VALUES ('620601', '62', '6', '1', '市辖区', '甘肃省', '武威市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620602', '62', '6', '2', '凉州区', '甘肃省', '武威市', '凉州区', '', '0', '2', 'LZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620621', '62', '6', '21', '民勤县', '甘肃省', '武威市', '民勤县', '', '0', '2', 'MQX', '0');
INSERT INTO `t_system_region_info` VALUES ('620622', '62', '6', '22', '古浪县', '甘肃省', '武威市', '古浪县', '', '0', '2', 'GLX', '0');
INSERT INTO `t_system_region_info` VALUES ('620623', '62', '6', '23', '天祝藏族自治县', '甘肃省', '武威市', '天祝藏族自治县', '', '0', '2', 'TZCZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('620700', '62', '7', '0', '张掖市', '甘肃省', '张掖市', '', '', '0', '1', 'ZYS', '0');
INSERT INTO `t_system_region_info` VALUES ('620701', '62', '7', '1', '市辖区', '甘肃省', '张掖市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620702', '62', '7', '2', '甘州区', '甘肃省', '张掖市', '甘州区', '', '0', '2', 'GZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620721', '62', '7', '21', '肃南裕固族自治县', '甘肃省', '张掖市', '肃南裕固族自治县', '', '0', '2', 'SNYGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('620722', '62', '7', '22', '民乐县', '甘肃省', '张掖市', '民乐县', '', '0', '2', 'MLX', '0');
INSERT INTO `t_system_region_info` VALUES ('620723', '62', '7', '23', '临泽县', '甘肃省', '张掖市', '临泽县', '', '0', '2', 'LZX', '0');
INSERT INTO `t_system_region_info` VALUES ('620724', '62', '7', '24', '高台县', '甘肃省', '张掖市', '高台县', '', '0', '2', 'GTX', '0');
INSERT INTO `t_system_region_info` VALUES ('620725', '62', '7', '25', '山丹县', '甘肃省', '张掖市', '山丹县', '', '0', '2', 'SDX', '0');
INSERT INTO `t_system_region_info` VALUES ('620800', '62', '8', '0', '平凉市', '甘肃省', '平凉市', '', '', '0', '1', 'PLS', '0');
INSERT INTO `t_system_region_info` VALUES ('620801', '62', '8', '1', '市辖区', '甘肃省', '平凉市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620802', '62', '8', '2', '崆峒区', '甘肃省', '平凉市', '崆峒区', '', '0', '2', 'KDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620821', '62', '8', '21', '泾川县', '甘肃省', '平凉市', '泾川县', '', '0', '2', 'JCX', '0');
INSERT INTO `t_system_region_info` VALUES ('620822', '62', '8', '22', '灵台县', '甘肃省', '平凉市', '灵台县', '', '0', '2', 'LTX', '0');
INSERT INTO `t_system_region_info` VALUES ('620823', '62', '8', '23', '崇信县', '甘肃省', '平凉市', '崇信县', '', '0', '2', 'CXX', '0');
INSERT INTO `t_system_region_info` VALUES ('620824', '62', '8', '24', '华亭县', '甘肃省', '平凉市', '华亭县', '', '0', '2', 'HTX', '0');
INSERT INTO `t_system_region_info` VALUES ('620825', '62', '8', '25', '庄浪县', '甘肃省', '平凉市', '庄浪县', '', '0', '2', 'ZLX', '0');
INSERT INTO `t_system_region_info` VALUES ('620826', '62', '8', '26', '静宁县', '甘肃省', '平凉市', '静宁县', '', '0', '2', 'JNX', '0');
INSERT INTO `t_system_region_info` VALUES ('620900', '62', '9', '0', '酒泉市', '甘肃省', '酒泉市', '', '', '0', '1', 'JQS', '0');
INSERT INTO `t_system_region_info` VALUES ('620901', '62', '9', '1', '市辖区', '甘肃省', '酒泉市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620902', '62', '9', '2', '肃州区', '甘肃省', '酒泉市', '肃州区', '', '0', '2', 'SZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('620921', '62', '9', '21', '金塔县', '甘肃省', '酒泉市', '金塔县', '', '0', '2', 'JDX', '0');
INSERT INTO `t_system_region_info` VALUES ('620922', '62', '9', '22', '瓜州县', '甘肃省', '酒泉市', '瓜州县', '', '0', '2', 'GZX', '0');
INSERT INTO `t_system_region_info` VALUES ('620923', '62', '9', '23', '肃北蒙古族自治县', '甘肃省', '酒泉市', '肃北蒙古族自治县', '', '0', '2', 'SBMGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('620924', '62', '9', '24', '阿克塞哈萨克族自治县', '甘肃省', '酒泉市', '阿克塞哈萨克族自治县', '', '0', '2', 'AKSHSKZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('620981', '62', '9', '81', '玉门市', '甘肃省', '酒泉市', '玉门市', '', '0', '2', 'YMS', '0');
INSERT INTO `t_system_region_info` VALUES ('620982', '62', '9', '82', '敦煌市', '甘肃省', '酒泉市', '敦煌市', '', '0', '2', 'DHS', '0');
INSERT INTO `t_system_region_info` VALUES ('621000', '62', '10', '0', '庆阳市', '甘肃省', '庆阳市', '', '', '0', '1', 'QYS', '0');
INSERT INTO `t_system_region_info` VALUES ('621001', '62', '10', '1', '市辖区', '甘肃省', '庆阳市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('621002', '62', '10', '2', '西峰区', '甘肃省', '庆阳市', '西峰区', '', '0', '2', 'XFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('621021', '62', '10', '21', '庆城县', '甘肃省', '庆阳市', '庆城县', '', '0', '2', 'QCX', '0');
INSERT INTO `t_system_region_info` VALUES ('621022', '62', '10', '22', '环县', '甘肃省', '庆阳市', '环县', '', '0', '2', 'HX', '0');
INSERT INTO `t_system_region_info` VALUES ('621023', '62', '10', '23', '华池县', '甘肃省', '庆阳市', '华池县', '', '0', '2', 'HCX', '0');
INSERT INTO `t_system_region_info` VALUES ('621024', '62', '10', '24', '合水县', '甘肃省', '庆阳市', '合水县', '', '0', '2', 'GSX', '0');
INSERT INTO `t_system_region_info` VALUES ('621025', '62', '10', '25', '正宁县', '甘肃省', '庆阳市', '正宁县', '', '0', '2', 'ZNX', '0');
INSERT INTO `t_system_region_info` VALUES ('621026', '62', '10', '26', '宁县', '甘肃省', '庆阳市', '宁县', '', '0', '2', 'NX', '0');
INSERT INTO `t_system_region_info` VALUES ('621027', '62', '10', '27', '镇原县', '甘肃省', '庆阳市', '镇原县', '', '0', '2', 'ZYX', '0');
INSERT INTO `t_system_region_info` VALUES ('621100', '62', '11', '0', '定西市', '甘肃省', '定西市', '', '', '0', '1', 'DXS', '0');
INSERT INTO `t_system_region_info` VALUES ('621101', '62', '11', '1', '市辖区', '甘肃省', '定西市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('621102', '62', '11', '2', '安定区', '甘肃省', '定西市', '安定区', '', '0', '2', 'ADQ', '0');
INSERT INTO `t_system_region_info` VALUES ('621121', '62', '11', '21', '通渭县', '甘肃省', '定西市', '通渭县', '', '0', '2', 'TWX', '0');
INSERT INTO `t_system_region_info` VALUES ('621122', '62', '11', '22', '陇西县', '甘肃省', '定西市', '陇西县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('621123', '62', '11', '23', '渭源县', '甘肃省', '定西市', '渭源县', '', '0', '2', 'WYX', '0');
INSERT INTO `t_system_region_info` VALUES ('621124', '62', '11', '24', '临洮县', '甘肃省', '定西市', '临洮县', '', '0', '2', 'LTX', '0');
INSERT INTO `t_system_region_info` VALUES ('621125', '62', '11', '25', '漳县', '甘肃省', '定西市', '漳县', '', '0', '2', 'ZX', '0');
INSERT INTO `t_system_region_info` VALUES ('621126', '62', '11', '26', '岷县', '甘肃省', '定西市', '岷县', '', '0', '2', 'MX', '0');
INSERT INTO `t_system_region_info` VALUES ('621200', '62', '12', '0', '陇南市', '甘肃省', '陇南市', '', '', '0', '1', 'LNS', '0');
INSERT INTO `t_system_region_info` VALUES ('621201', '62', '12', '1', '市辖区', '甘肃省', '陇南市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('621202', '62', '12', '2', '武都区', '甘肃省', '陇南市', '武都区', '', '0', '2', 'WDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('621221', '62', '12', '21', '成县', '甘肃省', '陇南市', '成县', '', '0', '2', 'CX', '0');
INSERT INTO `t_system_region_info` VALUES ('621222', '62', '12', '22', '文县', '甘肃省', '陇南市', '文县', '', '0', '2', 'WX', '0');
INSERT INTO `t_system_region_info` VALUES ('621223', '62', '12', '23', '宕昌县', '甘肃省', '陇南市', '宕昌县', '', '0', '2', 'DCX', '0');
INSERT INTO `t_system_region_info` VALUES ('621224', '62', '12', '24', '康县', '甘肃省', '陇南市', '康县', '', '0', '2', 'KX', '0');
INSERT INTO `t_system_region_info` VALUES ('621225', '62', '12', '25', '西和县', '甘肃省', '陇南市', '西和县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('621226', '62', '12', '26', '礼县', '甘肃省', '陇南市', '礼县', '', '0', '2', 'LX', '0');
INSERT INTO `t_system_region_info` VALUES ('621227', '62', '12', '27', '徽县', '甘肃省', '陇南市', '徽县', '', '0', '2', 'HX', '0');
INSERT INTO `t_system_region_info` VALUES ('621228', '62', '12', '28', '两当县', '甘肃省', '陇南市', '两当县', '', '0', '2', 'LDX', '0');
INSERT INTO `t_system_region_info` VALUES ('622900', '62', '29', '0', '临夏回族自治州', '甘肃省', '临夏回族自治州', '', '', '0', '1', 'LXHZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('622901', '62', '29', '1', '临夏市', '甘肃省', '临夏回族自治州', '临夏市', '', '0', '2', 'LXS', '0');
INSERT INTO `t_system_region_info` VALUES ('622921', '62', '29', '21', '临夏县', '甘肃省', '临夏回族自治州', '临夏县', '', '0', '2', 'LXX', '0');
INSERT INTO `t_system_region_info` VALUES ('622922', '62', '29', '22', '康乐县', '甘肃省', '临夏回族自治州', '康乐县', '', '0', '2', 'KLX', '0');
INSERT INTO `t_system_region_info` VALUES ('622923', '62', '29', '23', '永靖县', '甘肃省', '临夏回族自治州', '永靖县', '', '0', '2', 'YJX', '0');
INSERT INTO `t_system_region_info` VALUES ('622924', '62', '29', '24', '广河县', '甘肃省', '临夏回族自治州', '广河县', '', '0', '2', 'AHX', '0');
INSERT INTO `t_system_region_info` VALUES ('622925', '62', '29', '25', '和政县', '甘肃省', '临夏回族自治州', '和政县', '', '0', '2', 'HZX', '0');
INSERT INTO `t_system_region_info` VALUES ('622926', '62', '29', '26', '东乡族自治县', '甘肃省', '临夏回族自治州', '东乡族自治县', '', '0', '2', 'DXZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('622927', '62', '29', '27', '积石山保安族东乡族撒拉族自治县', '甘肃省', '临夏回族自治州', '积石山保安族东乡族撒拉族自治县', '', '0', '2', 'JSSBAZDXZSLZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('623000', '62', '30', '0', '甘南藏族自治州', '甘肃省', '甘南藏族自治州', '', '', '0', '1', 'GNCZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('623001', '62', '30', '1', '合作市', '甘肃省', '甘南藏族自治州', '合作市', '', '0', '2', 'GZS', '0');
INSERT INTO `t_system_region_info` VALUES ('623021', '62', '30', '21', '临潭县', '甘肃省', '甘南藏族自治州', '临潭县', '', '0', '2', 'LTX', '0');
INSERT INTO `t_system_region_info` VALUES ('623022', '62', '30', '22', '卓尼县', '甘肃省', '甘南藏族自治州', '卓尼县', '', '0', '2', 'ZNX', '0');
INSERT INTO `t_system_region_info` VALUES ('623023', '62', '30', '23', '舟曲县', '甘肃省', '甘南藏族自治州', '舟曲县', '', '0', '2', 'ZQX', '0');
INSERT INTO `t_system_region_info` VALUES ('623024', '62', '30', '24', '迭部县', '甘肃省', '甘南藏族自治州', '迭部县', '', '0', '2', 'DBX', '0');
INSERT INTO `t_system_region_info` VALUES ('623025', '62', '30', '25', '玛曲县', '甘肃省', '甘南藏族自治州', '玛曲县', '', '0', '2', 'MQX', '0');
INSERT INTO `t_system_region_info` VALUES ('623026', '62', '30', '26', '碌曲县', '甘肃省', '甘南藏族自治州', '碌曲县', '', '0', '2', 'LQX', '0');
INSERT INTO `t_system_region_info` VALUES ('623027', '62', '30', '27', '夏河县', '甘肃省', '甘南藏族自治州', '夏河县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('630000', '63', '0', '0', '青海省', '青海省', '', '', '', '0', '0', 'QHS', '0');
INSERT INTO `t_system_region_info` VALUES ('630100', '63', '1', '0', '西宁市', '青海省', '西宁市', '', '', '0', '1', 'XNS', '0');
INSERT INTO `t_system_region_info` VALUES ('630101', '63', '1', '1', '市辖区', '青海省', '西宁市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('630102', '63', '1', '2', '城东区', '青海省', '西宁市', '城东区', '', '0', '2', 'CDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('630103', '63', '1', '3', '城中区', '青海省', '西宁市', '城中区', '', '0', '2', 'CZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('630104', '63', '1', '4', '城西区', '青海省', '西宁市', '城西区', '', '0', '2', 'CXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('630105', '63', '1', '5', '城北区', '青海省', '西宁市', '城北区', '', '0', '2', 'CBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('630121', '63', '1', '21', '大通回族土族自治县', '青海省', '西宁市', '大通回族土族自治县', '', '0', '2', 'DTHZTZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('630122', '63', '1', '22', '湟中县', '青海省', '西宁市', '湟中县', '', '0', '2', 'HZX', '0');
INSERT INTO `t_system_region_info` VALUES ('630123', '63', '1', '23', '湟源县', '青海省', '西宁市', '湟源县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('632100', '63', '21', '0', '海东地区', '青海省', '海东地区', '', '', '0', '1', 'HDDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('632121', '63', '21', '21', '平安县', '青海省', '海东地区', '平安县', '', '0', '2', 'PAX', '0');
INSERT INTO `t_system_region_info` VALUES ('632122', '63', '21', '22', '民和回族土族自治县', '青海省', '海东地区', '民和回族土族自治县', '', '0', '2', 'MHHZTZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('632123', '63', '21', '23', '乐都县', '青海省', '海东地区', '乐都县', '', '0', '2', 'LDX', '0');
INSERT INTO `t_system_region_info` VALUES ('632126', '63', '21', '26', '互助土族自治县', '青海省', '海东地区', '互助土族自治县', '', '0', '2', 'HZTZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('632127', '63', '21', '27', '化隆回族自治县', '青海省', '海东地区', '化隆回族自治县', '', '0', '2', 'HLHZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('632128', '63', '21', '28', '循化撒拉族自治县', '青海省', '海东地区', '循化撒拉族自治县', '', '0', '2', 'XHSLZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('632200', '63', '22', '0', '海北藏族自治州', '青海省', '海北藏族自治州', '', '', '0', '1', 'HBCZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('632221', '63', '22', '21', '门源回族自治县', '青海省', '海北藏族自治州', '门源回族自治县', '', '0', '2', 'MYHZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('632222', '63', '22', '22', '祁连县', '青海省', '海北藏族自治州', '祁连县', '', '0', '2', 'QLX', '0');
INSERT INTO `t_system_region_info` VALUES ('632223', '63', '22', '23', '海晏县', '青海省', '海北藏族自治州', '海晏县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('632224', '63', '22', '24', '刚察县', '青海省', '海北藏族自治州', '刚察县', '', '0', '2', 'GCX', '0');
INSERT INTO `t_system_region_info` VALUES ('632300', '63', '23', '0', '黄南藏族自治州', '青海省', '黄南藏族自治州', '', '', '0', '1', 'HNCZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('632321', '63', '23', '21', '同仁县', '青海省', '黄南藏族自治州', '同仁县', '', '0', '2', 'TRX', '0');
INSERT INTO `t_system_region_info` VALUES ('632322', '63', '23', '22', '尖扎县', '青海省', '黄南藏族自治州', '尖扎县', '', '0', '2', 'JZX', '0');
INSERT INTO `t_system_region_info` VALUES ('632323', '63', '23', '23', '泽库县', '青海省', '黄南藏族自治州', '泽库县', '', '0', '2', 'ZKX', '0');
INSERT INTO `t_system_region_info` VALUES ('632324', '63', '23', '24', '河南蒙古族自治县', '青海省', '黄南藏族自治州', '河南蒙古族自治县', '', '0', '2', 'HNMGZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('632500', '63', '25', '0', '海南藏族自治州', '青海省', '海南藏族自治州', '', '', '0', '1', 'HNCZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('632521', '63', '25', '21', '共和县', '青海省', '海南藏族自治州', '共和县', '', '0', '2', 'GHX', '0');
INSERT INTO `t_system_region_info` VALUES ('632522', '63', '25', '22', '同德县', '青海省', '海南藏族自治州', '同德县', '', '0', '2', 'TDX', '0');
INSERT INTO `t_system_region_info` VALUES ('632523', '63', '25', '23', '贵德县', '青海省', '海南藏族自治州', '贵德县', '', '0', '2', 'GDX', '0');
INSERT INTO `t_system_region_info` VALUES ('632524', '63', '25', '24', '兴海县', '青海省', '海南藏族自治州', '兴海县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('632525', '63', '25', '25', '贵南县', '青海省', '海南藏族自治州', '贵南县', '', '0', '2', 'GNX', '0');
INSERT INTO `t_system_region_info` VALUES ('632600', '63', '26', '0', '果洛藏族自治州', '青海省', '果洛藏族自治州', '', '', '0', '1', 'GLCZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('632621', '63', '26', '21', '玛沁县', '青海省', '果洛藏族自治州', '玛沁县', '', '0', '2', 'MQX', '0');
INSERT INTO `t_system_region_info` VALUES ('632622', '63', '26', '22', '班玛县', '青海省', '果洛藏族自治州', '班玛县', '', '0', '2', 'BMX', '0');
INSERT INTO `t_system_region_info` VALUES ('632623', '63', '26', '23', '甘德县', '青海省', '果洛藏族自治州', '甘德县', '', '0', '2', 'GDX', '0');
INSERT INTO `t_system_region_info` VALUES ('632624', '63', '26', '24', '达日县', '青海省', '果洛藏族自治州', '达日县', '', '0', '2', 'DRX', '0');
INSERT INTO `t_system_region_info` VALUES ('632625', '63', '26', '25', '久治县', '青海省', '果洛藏族自治州', '久治县', '', '0', '2', 'JZX', '0');
INSERT INTO `t_system_region_info` VALUES ('632626', '63', '26', '26', '玛多县', '青海省', '果洛藏族自治州', '玛多县', '', '0', '2', 'MDX', '0');
INSERT INTO `t_system_region_info` VALUES ('632700', '63', '27', '0', '玉树藏族自治州', '青海省', '玉树藏族自治州', '', '', '0', '1', 'YSCZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('632721', '63', '27', '21', '玉树县', '青海省', '玉树藏族自治州', '玉树县', '', '0', '2', 'YSX', '0');
INSERT INTO `t_system_region_info` VALUES ('632722', '63', '27', '22', '杂多县', '青海省', '玉树藏族自治州', '杂多县', '', '0', '2', 'ZDX', '0');
INSERT INTO `t_system_region_info` VALUES ('632723', '63', '27', '23', '称多县', '青海省', '玉树藏族自治州', '称多县', '', '0', '2', 'CDX', '0');
INSERT INTO `t_system_region_info` VALUES ('632724', '63', '27', '24', '治多县', '青海省', '玉树藏族自治州', '治多县', '', '0', '2', 'ZDX', '0');
INSERT INTO `t_system_region_info` VALUES ('632725', '63', '27', '25', '囊谦县', '青海省', '玉树藏族自治州', '囊谦县', '', '0', '2', 'NQX', '0');
INSERT INTO `t_system_region_info` VALUES ('632726', '63', '27', '26', '曲麻莱县', '青海省', '玉树藏族自治州', '曲麻莱县', '', '0', '2', 'QMLX', '0');
INSERT INTO `t_system_region_info` VALUES ('632800', '63', '28', '0', '海西蒙古族藏族自治州', '青海省', '海西蒙古族藏族自治州', '', '', '0', '1', 'HXMGZCZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('632801', '63', '28', '1', '格尔木市', '青海省', '海西蒙古族藏族自治州', '格尔木市', '', '0', '2', 'GEMS', '0');
INSERT INTO `t_system_region_info` VALUES ('632802', '63', '28', '2', '德令哈市', '青海省', '海西蒙古族藏族自治州', '德令哈市', '', '0', '2', 'DLHS', '0');
INSERT INTO `t_system_region_info` VALUES ('632821', '63', '28', '21', '乌兰县', '青海省', '海西蒙古族藏族自治州', '乌兰县', '', '0', '2', 'WLX', '0');
INSERT INTO `t_system_region_info` VALUES ('632822', '63', '28', '22', '都兰县', '青海省', '海西蒙古族藏族自治州', '都兰县', '', '0', '2', 'DLX', '0');
INSERT INTO `t_system_region_info` VALUES ('632823', '63', '28', '23', '天峻县', '青海省', '海西蒙古族藏族自治州', '天峻县', '', '0', '2', 'TJX', '0');
INSERT INTO `t_system_region_info` VALUES ('640000', '64', '0', '0', '宁夏回族自治区', '宁夏回族自治区', '', '', '', '0', '0', 'NXHZZZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640100', '64', '1', '0', '银川市', '宁夏回族自治区', '银川市', '', '', '0', '1', 'YCS', '0');
INSERT INTO `t_system_region_info` VALUES ('640101', '64', '1', '1', '市辖区', '宁夏回族自治区', '银川市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640104', '64', '1', '4', '兴庆区', '宁夏回族自治区', '银川市', '兴庆区', '', '0', '2', 'XQQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640105', '64', '1', '5', '西夏区', '宁夏回族自治区', '银川市', '西夏区', '', '0', '2', 'XXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640106', '64', '1', '6', '金凤区', '宁夏回族自治区', '银川市', '金凤区', '', '0', '2', 'JFQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640121', '64', '1', '21', '永宁县', '宁夏回族自治区', '银川市', '永宁县', '', '0', '2', 'YNX', '0');
INSERT INTO `t_system_region_info` VALUES ('640122', '64', '1', '22', '贺兰县', '宁夏回族自治区', '银川市', '贺兰县', '', '0', '2', 'HLX', '0');
INSERT INTO `t_system_region_info` VALUES ('640181', '64', '1', '81', '灵武市', '宁夏回族自治区', '银川市', '灵武市', '', '0', '2', 'LWS', '0');
INSERT INTO `t_system_region_info` VALUES ('640200', '64', '2', '0', '石嘴山市', '宁夏回族自治区', '石嘴山市', '', '', '0', '1', 'SZSS', '0');
INSERT INTO `t_system_region_info` VALUES ('640201', '64', '2', '1', '市辖区', '宁夏回族自治区', '石嘴山市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640202', '64', '2', '2', '大武口区', '宁夏回族自治区', '石嘴山市', '大武口区', '', '0', '2', 'DWKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640205', '64', '2', '5', '惠农区', '宁夏回族自治区', '石嘴山市', '惠农区', '', '0', '2', 'HNQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640221', '64', '2', '21', '平罗县', '宁夏回族自治区', '石嘴山市', '平罗县', '', '0', '2', 'PLX', '0');
INSERT INTO `t_system_region_info` VALUES ('640300', '64', '3', '0', '吴忠市', '宁夏回族自治区', '吴忠市', '', '', '0', '1', 'WZS', '0');
INSERT INTO `t_system_region_info` VALUES ('640301', '64', '3', '1', '市辖区', '宁夏回族自治区', '吴忠市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640302', '64', '3', '2', '利通区', '宁夏回族自治区', '吴忠市', '利通区', '', '0', '2', 'LTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640303', '64', '3', '3', '红寺堡区', '宁夏回族自治区', '吴忠市', '红寺堡区', '', '0', '2', 'GSBQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640323', '64', '3', '23', '盐池县', '宁夏回族自治区', '吴忠市', '盐池县', '', '0', '2', 'YCX', '0');
INSERT INTO `t_system_region_info` VALUES ('640324', '64', '3', '24', '同心县', '宁夏回族自治区', '吴忠市', '同心县', '', '0', '2', 'TXX', '0');
INSERT INTO `t_system_region_info` VALUES ('640381', '64', '3', '81', '青铜峡市', '宁夏回族自治区', '吴忠市', '青铜峡市', '', '0', '2', 'QTXS', '0');
INSERT INTO `t_system_region_info` VALUES ('640400', '64', '4', '0', '固原市', '宁夏回族自治区', '固原市', '', '', '0', '1', 'GYS', '0');
INSERT INTO `t_system_region_info` VALUES ('640401', '64', '4', '1', '市辖区', '宁夏回族自治区', '固原市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640402', '64', '4', '2', '原州区', '宁夏回族自治区', '固原市', '原州区', '', '0', '2', 'YZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640422', '64', '4', '22', '西吉县', '宁夏回族自治区', '固原市', '西吉县', '', '0', '2', 'XJX', '0');
INSERT INTO `t_system_region_info` VALUES ('640423', '64', '4', '23', '隆德县', '宁夏回族自治区', '固原市', '隆德县', '', '0', '2', 'LDX', '0');
INSERT INTO `t_system_region_info` VALUES ('640424', '64', '4', '24', '泾源县', '宁夏回族自治区', '固原市', '泾源县', '', '0', '2', 'JYX', '0');
INSERT INTO `t_system_region_info` VALUES ('640425', '64', '4', '25', '彭阳县', '宁夏回族自治区', '固原市', '彭阳县', '', '0', '2', 'PYX', '0');
INSERT INTO `t_system_region_info` VALUES ('640500', '64', '5', '0', '中卫市', '宁夏回族自治区', '中卫市', '', '', '0', '1', 'ZWS', '0');
INSERT INTO `t_system_region_info` VALUES ('640501', '64', '5', '1', '市辖区', '宁夏回族自治区', '中卫市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640502', '64', '5', '2', '沙坡头区', '宁夏回族自治区', '中卫市', '沙坡头区', '', '0', '2', 'SPTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('640521', '64', '5', '21', '中宁县', '宁夏回族自治区', '中卫市', '中宁县', '', '0', '2', 'ZNX', '0');
INSERT INTO `t_system_region_info` VALUES ('640522', '64', '5', '22', '海原县', '宁夏回族自治区', '中卫市', '海原县', '', '0', '2', 'HYX', '0');
INSERT INTO `t_system_region_info` VALUES ('650000', '65', '0', '0', '新疆维吾尔自治区', '新疆维吾尔自治区', '', '', '', '0', '0', 'XJWWEZZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650100', '65', '1', '0', '乌鲁木齐市', '新疆维吾尔自治区', '乌鲁木齐市', '', '', '0', '1', 'WLMJS', '0');
INSERT INTO `t_system_region_info` VALUES ('650101', '65', '1', '1', '市辖区', '新疆维吾尔自治区', '乌鲁木齐市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650102', '65', '1', '2', '天山区', '新疆维吾尔自治区', '乌鲁木齐市', '天山区', '', '0', '2', 'TSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650103', '65', '1', '3', '沙依巴克区', '新疆维吾尔自治区', '乌鲁木齐市', '沙依巴克区', '', '0', '2', 'SYBKQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650104', '65', '1', '4', '新市区', '新疆维吾尔自治区', '乌鲁木齐市', '新市区', '', '0', '2', 'XSQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650105', '65', '1', '5', '水磨沟区', '新疆维吾尔自治区', '乌鲁木齐市', '水磨沟区', '', '0', '2', 'SMGQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650106', '65', '1', '6', '头屯河区', '新疆维吾尔自治区', '乌鲁木齐市', '头屯河区', '', '0', '2', 'TTHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650107', '65', '1', '7', '达坂城区', '新疆维吾尔自治区', '乌鲁木齐市', '达坂城区', '', '0', '2', 'DBCQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650109', '65', '1', '9', '米东区', '新疆维吾尔自治区', '乌鲁木齐市', '米东区', '', '0', '2', 'MDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650121', '65', '1', '21', '乌鲁木齐县', '新疆维吾尔自治区', '乌鲁木齐市', '乌鲁木齐县', '', '0', '2', 'WLMJX', '0');
INSERT INTO `t_system_region_info` VALUES ('650200', '65', '2', '0', '克拉玛依市', '新疆维吾尔自治区', '克拉玛依市', '', '', '0', '1', 'KLMYS', '0');
INSERT INTO `t_system_region_info` VALUES ('650201', '65', '2', '1', '市辖区', '新疆维吾尔自治区', '克拉玛依市', '市辖区', '', '0', '2', 'SXQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650202', '65', '2', '2', '独山子区', '新疆维吾尔自治区', '克拉玛依市', '独山子区', '', '0', '2', 'DSZQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650203', '65', '2', '3', '克拉玛依区', '新疆维吾尔自治区', '克拉玛依市', '克拉玛依区', '', '0', '2', 'KLMYQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650204', '65', '2', '4', '白碱滩区', '新疆维吾尔自治区', '克拉玛依市', '白碱滩区', '', '0', '2', 'BJTQ', '0');
INSERT INTO `t_system_region_info` VALUES ('650205', '65', '2', '5', '乌尔禾区', '新疆维吾尔自治区', '克拉玛依市', '乌尔禾区', '', '0', '2', 'WEHQ', '0');
INSERT INTO `t_system_region_info` VALUES ('652100', '65', '21', '0', '吐鲁番地区', '新疆维吾尔自治区', '吐鲁番地区', '', '', '0', '1', 'TLFDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('652101', '65', '21', '1', '吐鲁番市', '新疆维吾尔自治区', '吐鲁番地区', '吐鲁番市', '', '0', '2', 'TLFS', '0');
INSERT INTO `t_system_region_info` VALUES ('652122', '65', '21', '22', '鄯善县', '新疆维吾尔自治区', '吐鲁番地区', '鄯善县', '', '0', '2', 'SSX', '0');
INSERT INTO `t_system_region_info` VALUES ('652123', '65', '21', '23', '托克逊县', '新疆维吾尔自治区', '吐鲁番地区', '托克逊县', '', '0', '2', 'TKXX', '0');
INSERT INTO `t_system_region_info` VALUES ('652200', '65', '22', '0', '哈密地区', '新疆维吾尔自治区', '哈密地区', '', '', '0', '1', 'HMDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('652201', '65', '22', '1', '哈密市', '新疆维吾尔自治区', '哈密地区', '哈密市', '', '0', '2', 'HMS', '0');
INSERT INTO `t_system_region_info` VALUES ('652222', '65', '22', '22', '巴里坤哈萨克自治县', '新疆维吾尔自治区', '哈密地区', '巴里坤哈萨克自治县', '', '0', '2', 'BLKHSKZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('652223', '65', '22', '23', '伊吾县', '新疆维吾尔自治区', '哈密地区', '伊吾县', '', '0', '2', 'YWX', '0');
INSERT INTO `t_system_region_info` VALUES ('652300', '65', '23', '0', '昌吉回族自治州', '新疆维吾尔自治区', '昌吉回族自治州', '', '', '0', '1', 'CJHZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('652301', '65', '23', '1', '昌吉市', '新疆维吾尔自治区', '昌吉回族自治州', '昌吉市', '', '0', '2', 'CJS', '0');
INSERT INTO `t_system_region_info` VALUES ('652302', '65', '23', '2', '阜康市', '新疆维吾尔自治区', '昌吉回族自治州', '阜康市', '', '0', '2', 'FKS', '0');
INSERT INTO `t_system_region_info` VALUES ('652323', '65', '23', '23', '呼图壁县', '新疆维吾尔自治区', '昌吉回族自治州', '呼图壁县', '', '0', '2', 'HTBX', '0');
INSERT INTO `t_system_region_info` VALUES ('652324', '65', '23', '24', '玛纳斯县', '新疆维吾尔自治区', '昌吉回族自治州', '玛纳斯县', '', '0', '2', 'MNSX', '0');
INSERT INTO `t_system_region_info` VALUES ('652325', '65', '23', '25', '奇台县', '新疆维吾尔自治区', '昌吉回族自治州', '奇台县', '', '0', '2', 'JTX', '0');
INSERT INTO `t_system_region_info` VALUES ('652327', '65', '23', '27', '吉木萨尔县', '新疆维吾尔自治区', '昌吉回族自治州', '吉木萨尔县', '', '0', '2', 'JMSEX', '0');
INSERT INTO `t_system_region_info` VALUES ('652328', '65', '23', '28', '木垒哈萨克自治县', '新疆维吾尔自治区', '昌吉回族自治州', '木垒哈萨克自治县', '', '0', '2', 'MLHSKZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('652700', '65', '27', '0', '博尔塔拉蒙古自治州', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '', '', '0', '1', 'BEDLMGZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('652701', '65', '27', '1', '博乐市', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '博乐市', '', '0', '2', 'BLS', '0');
INSERT INTO `t_system_region_info` VALUES ('652722', '65', '27', '22', '精河县', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '精河县', '', '0', '2', 'JHX', '0');
INSERT INTO `t_system_region_info` VALUES ('652723', '65', '27', '23', '温泉县', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '温泉县', '', '0', '2', 'WQX', '0');
INSERT INTO `t_system_region_info` VALUES ('652800', '65', '28', '0', '巴音郭楞蒙古自治州', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '', '', '0', '1', 'BYGLMGZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('652801', '65', '28', '1', '库尔勒市', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '库尔勒市', '', '0', '2', 'KELS', '0');
INSERT INTO `t_system_region_info` VALUES ('652822', '65', '28', '22', '轮台县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '轮台县', '', '0', '2', 'LTX', '0');
INSERT INTO `t_system_region_info` VALUES ('652823', '65', '28', '23', '尉犁县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '尉犁县', '', '0', '2', 'WLX', '0');
INSERT INTO `t_system_region_info` VALUES ('652824', '65', '28', '24', '若羌县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '若羌县', '', '0', '2', 'RQX', '0');
INSERT INTO `t_system_region_info` VALUES ('652825', '65', '28', '25', '且末县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '且末县', '', '0', '2', 'JMX', '0');
INSERT INTO `t_system_region_info` VALUES ('652826', '65', '28', '26', '焉耆回族自治县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '焉耆回族自治县', '', '0', '2', 'YQHZZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('652827', '65', '28', '27', '和静县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '和静县', '', '0', '2', 'HJX', '0');
INSERT INTO `t_system_region_info` VALUES ('652828', '65', '28', '28', '和硕县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '和硕县', '', '0', '2', 'HSX', '0');
INSERT INTO `t_system_region_info` VALUES ('652829', '65', '28', '29', '博湖县', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '博湖县', '', '0', '2', 'BHX', '0');
INSERT INTO `t_system_region_info` VALUES ('652900', '65', '29', '0', '阿克苏地区', '新疆维吾尔自治区', '阿克苏地区', '', '', '0', '1', 'AKSDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('652901', '65', '29', '1', '阿克苏市', '新疆维吾尔自治区', '阿克苏地区', '阿克苏市', '', '0', '2', 'AKSS', '0');
INSERT INTO `t_system_region_info` VALUES ('652922', '65', '29', '22', '温宿县', '新疆维吾尔自治区', '阿克苏地区', '温宿县', '', '0', '2', 'WSX', '0');
INSERT INTO `t_system_region_info` VALUES ('652923', '65', '29', '23', '库车县', '新疆维吾尔自治区', '阿克苏地区', '库车县', '', '0', '2', 'KCX', '0');
INSERT INTO `t_system_region_info` VALUES ('652924', '65', '29', '24', '沙雅县', '新疆维吾尔自治区', '阿克苏地区', '沙雅县', '', '0', '2', 'SYX', '0');
INSERT INTO `t_system_region_info` VALUES ('652925', '65', '29', '25', '新和县', '新疆维吾尔自治区', '阿克苏地区', '新和县', '', '0', '2', 'XHX', '0');
INSERT INTO `t_system_region_info` VALUES ('652926', '65', '29', '26', '拜城县', '新疆维吾尔自治区', '阿克苏地区', '拜城县', '', '0', '2', 'BCX', '0');
INSERT INTO `t_system_region_info` VALUES ('652927', '65', '29', '27', '乌什县', '新疆维吾尔自治区', '阿克苏地区', '乌什县', '', '0', '2', 'WSX', '0');
INSERT INTO `t_system_region_info` VALUES ('652928', '65', '29', '28', '阿瓦提县', '新疆维吾尔自治区', '阿克苏地区', '阿瓦提县', '', '0', '2', 'AWDX', '0');
INSERT INTO `t_system_region_info` VALUES ('652929', '65', '29', '29', '柯坪县', '新疆维吾尔自治区', '阿克苏地区', '柯坪县', '', '0', '2', 'KPX', '0');
INSERT INTO `t_system_region_info` VALUES ('653000', '65', '30', '0', '克孜勒苏柯尔克孜自治州', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '', '', '0', '1', 'KZLSKEKZZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('653001', '65', '30', '1', '阿图什市', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿图什市', '', '0', '2', 'ATSS', '0');
INSERT INTO `t_system_region_info` VALUES ('653022', '65', '30', '22', '阿克陶县', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿克陶县', '', '0', '2', 'AKTX', '0');
INSERT INTO `t_system_region_info` VALUES ('653023', '65', '30', '23', '阿合奇县', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿合奇县', '', '0', '2', 'AGJX', '0');
INSERT INTO `t_system_region_info` VALUES ('653024', '65', '30', '24', '乌恰县', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '乌恰县', '', '0', '2', 'WQX', '0');
INSERT INTO `t_system_region_info` VALUES ('653100', '65', '31', '0', '喀什地区', '新疆维吾尔自治区', '喀什地区', '', '', '0', '1', 'KSDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('653101', '65', '31', '1', '喀什市', '新疆维吾尔自治区', '喀什地区', '喀什市', '', '0', '2', 'KSS', '0');
INSERT INTO `t_system_region_info` VALUES ('653121', '65', '31', '21', '疏附县', '新疆维吾尔自治区', '喀什地区', '疏附县', '', '0', '2', 'SFX', '0');
INSERT INTO `t_system_region_info` VALUES ('653122', '65', '31', '22', '疏勒县', '新疆维吾尔自治区', '喀什地区', '疏勒县', '', '0', '2', 'SLX', '0');
INSERT INTO `t_system_region_info` VALUES ('653123', '65', '31', '23', '英吉沙县', '新疆维吾尔自治区', '喀什地区', '英吉沙县', '', '0', '2', 'YJSX', '0');
INSERT INTO `t_system_region_info` VALUES ('653124', '65', '31', '24', '泽普县', '新疆维吾尔自治区', '喀什地区', '泽普县', '', '0', '2', 'ZPX', '0');
INSERT INTO `t_system_region_info` VALUES ('653125', '65', '31', '25', '莎车县', '新疆维吾尔自治区', '喀什地区', '莎车县', '', '0', '2', 'SCX', '0');
INSERT INTO `t_system_region_info` VALUES ('653126', '65', '31', '26', '叶城县', '新疆维吾尔自治区', '喀什地区', '叶城县', '', '0', '2', 'XCX', '0');
INSERT INTO `t_system_region_info` VALUES ('653127', '65', '31', '27', '麦盖提县', '新疆维吾尔自治区', '喀什地区', '麦盖提县', '', '0', '2', 'MGDX', '0');
INSERT INTO `t_system_region_info` VALUES ('653128', '65', '31', '28', '岳普湖县', '新疆维吾尔自治区', '喀什地区', '岳普湖县', '', '0', '2', 'YPHX', '0');
INSERT INTO `t_system_region_info` VALUES ('653129', '65', '31', '29', '伽师县', '新疆维吾尔自治区', '喀什地区', '伽师县', '', '0', '2', 'GSX', '0');
INSERT INTO `t_system_region_info` VALUES ('653130', '65', '31', '30', '巴楚县', '新疆维吾尔自治区', '喀什地区', '巴楚县', '', '0', '2', 'BCX', '0');
INSERT INTO `t_system_region_info` VALUES ('653131', '65', '31', '31', '塔什库尔干塔吉克自治县', '新疆维吾尔自治区', '喀什地区', '塔什库尔干塔吉克自治县', '', '0', '2', 'DSKEGDJKZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('653200', '65', '32', '0', '和田地区', '新疆维吾尔自治区', '和田地区', '', '', '0', '1', 'HTDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('653201', '65', '32', '1', '和田市', '新疆维吾尔自治区', '和田地区', '和田市', '', '0', '2', 'HTS', '0');
INSERT INTO `t_system_region_info` VALUES ('653221', '65', '32', '21', '和田县', '新疆维吾尔自治区', '和田地区', '和田县', '', '0', '2', 'HTX', '0');
INSERT INTO `t_system_region_info` VALUES ('653222', '65', '32', '22', '墨玉县', '新疆维吾尔自治区', '和田地区', '墨玉县', '', '0', '2', 'MYX', '0');
INSERT INTO `t_system_region_info` VALUES ('653223', '65', '32', '23', '皮山县', '新疆维吾尔自治区', '和田地区', '皮山县', '', '0', '2', 'PSX', '0');
INSERT INTO `t_system_region_info` VALUES ('653224', '65', '32', '24', '洛浦县', '新疆维吾尔自治区', '和田地区', '洛浦县', '', '0', '2', 'LPX', '0');
INSERT INTO `t_system_region_info` VALUES ('653225', '65', '32', '25', '策勒县', '新疆维吾尔自治区', '和田地区', '策勒县', '', '0', '2', 'CLX', '0');
INSERT INTO `t_system_region_info` VALUES ('653226', '65', '32', '26', '于田县', '新疆维吾尔自治区', '和田地区', '于田县', '', '0', '2', 'YTX', '0');
INSERT INTO `t_system_region_info` VALUES ('653227', '65', '32', '27', '民丰县', '新疆维吾尔自治区', '和田地区', '民丰县', '', '0', '2', 'MFX', '0');
INSERT INTO `t_system_region_info` VALUES ('654000', '65', '40', '0', '伊犁哈萨克自治州', '新疆维吾尔自治区', '伊犁哈萨克自治州', '', '', '0', '1', 'YLHSKZZZ', '0');
INSERT INTO `t_system_region_info` VALUES ('654002', '65', '40', '2', '伊宁市', '新疆维吾尔自治区', '伊犁哈萨克自治州', '伊宁市', '', '0', '2', 'YNS', '0');
INSERT INTO `t_system_region_info` VALUES ('654003', '65', '40', '3', '奎屯市', '新疆维吾尔自治区', '伊犁哈萨克自治州', '奎屯市', '', '0', '2', 'KTS', '0');
INSERT INTO `t_system_region_info` VALUES ('654021', '65', '40', '21', '伊宁县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '伊宁县', '', '0', '2', 'YNX', '0');
INSERT INTO `t_system_region_info` VALUES ('654022', '65', '40', '22', '察布查尔锡伯自治县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '察布查尔锡伯自治县', '', '0', '2', 'CBCEXBZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('654023', '65', '40', '23', '霍城县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '霍城县', '', '0', '2', 'HCX', '0');
INSERT INTO `t_system_region_info` VALUES ('654024', '65', '40', '24', '巩留县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '巩留县', '', '0', '2', 'GLX', '0');
INSERT INTO `t_system_region_info` VALUES ('654025', '65', '40', '25', '新源县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '新源县', '', '0', '2', 'XYX', '0');
INSERT INTO `t_system_region_info` VALUES ('654026', '65', '40', '26', '昭苏县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '昭苏县', '', '0', '2', 'ZSX', '0');
INSERT INTO `t_system_region_info` VALUES ('654027', '65', '40', '27', '特克斯县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '特克斯县', '', '0', '2', 'TKSX', '0');
INSERT INTO `t_system_region_info` VALUES ('654028', '65', '40', '28', '尼勒克县', '新疆维吾尔自治区', '伊犁哈萨克自治州', '尼勒克县', '', '0', '2', 'NLKX', '0');
INSERT INTO `t_system_region_info` VALUES ('654200', '65', '42', '0', '塔城地区', '新疆维吾尔自治区', '塔城地区', '', '', '0', '1', 'DCDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('654201', '65', '42', '1', '塔城市', '新疆维吾尔自治区', '塔城地区', '塔城市', '', '0', '2', 'DCS', '0');
INSERT INTO `t_system_region_info` VALUES ('654202', '65', '42', '2', '乌苏市', '新疆维吾尔自治区', '塔城地区', '乌苏市', '', '0', '2', 'WSS', '0');
INSERT INTO `t_system_region_info` VALUES ('654221', '65', '42', '21', '额敏县', '新疆维吾尔自治区', '塔城地区', '额敏县', '', '0', '2', 'EMX', '0');
INSERT INTO `t_system_region_info` VALUES ('654223', '65', '42', '23', '沙湾县', '新疆维吾尔自治区', '塔城地区', '沙湾县', '', '0', '2', 'SWX', '0');
INSERT INTO `t_system_region_info` VALUES ('654224', '65', '42', '24', '托里县', '新疆维吾尔自治区', '塔城地区', '托里县', '', '0', '2', 'TLX', '0');
INSERT INTO `t_system_region_info` VALUES ('654225', '65', '42', '25', '裕民县', '新疆维吾尔自治区', '塔城地区', '裕民县', '', '0', '2', 'YMX', '0');
INSERT INTO `t_system_region_info` VALUES ('654226', '65', '42', '26', '和布克赛尔蒙古自治县', '新疆维吾尔自治区', '塔城地区', '和布克赛尔蒙古自治县', '', '0', '2', 'HBKSEMGZZX', '0');
INSERT INTO `t_system_region_info` VALUES ('654300', '65', '43', '0', '阿勒泰地区', '新疆维吾尔自治区', '阿勒泰地区', '', '', '0', '1', 'ALTDQ', '0');
INSERT INTO `t_system_region_info` VALUES ('654301', '65', '43', '1', '阿勒泰市', '新疆维吾尔自治区', '阿勒泰地区', '阿勒泰市', '', '0', '2', 'ALTS', '0');
INSERT INTO `t_system_region_info` VALUES ('654321', '65', '43', '21', '布尔津县', '新疆维吾尔自治区', '阿勒泰地区', '布尔津县', '', '0', '2', 'BEJX', '0');
INSERT INTO `t_system_region_info` VALUES ('654322', '65', '43', '22', '富蕴县', '新疆维吾尔自治区', '阿勒泰地区', '富蕴县', '', '0', '2', 'FYX', '0');
INSERT INTO `t_system_region_info` VALUES ('654323', '65', '43', '23', '福海县', '新疆维吾尔自治区', '阿勒泰地区', '福海县', '', '0', '2', 'FHX', '0');
INSERT INTO `t_system_region_info` VALUES ('654324', '65', '43', '24', '哈巴河县', '新疆维吾尔自治区', '阿勒泰地区', '哈巴河县', '', '0', '2', 'HBHX', '0');
INSERT INTO `t_system_region_info` VALUES ('654325', '65', '43', '25', '青河县', '新疆维吾尔自治区', '阿勒泰地区', '青河县', '', '0', '2', 'QHX', '0');
INSERT INTO `t_system_region_info` VALUES ('654326', '65', '43', '26', '吉木乃县', '新疆维吾尔自治区', '阿勒泰地区', '吉木乃县', '', '0', '2', 'JMNX', '0');
INSERT INTO `t_system_region_info` VALUES ('659000', '65', '90', '0', '自治区直辖县级行政区划', '新疆维吾尔自治区', '自治区直辖县级行政区划', '', '', '0', '1', 'ZZQZXXJHZQH', '0');
INSERT INTO `t_system_region_info` VALUES ('659001', '65', '90', '1', '石河子市', '新疆维吾尔自治区', '自治区直辖县级行政区划', '石河子市', '', '0', '2', 'SHZS', '0');
INSERT INTO `t_system_region_info` VALUES ('659002', '65', '90', '2', '阿拉尔市', '新疆维吾尔自治区', '自治区直辖县级行政区划', '阿拉尔市', '', '0', '2', 'ALES', '0');
INSERT INTO `t_system_region_info` VALUES ('659003', '65', '90', '3', '图木舒克市', '新疆维吾尔自治区', '自治区直辖县级行政区划', '图木舒克市', '', '0', '2', 'TMSKS', '0');
INSERT INTO `t_system_region_info` VALUES ('659004', '65', '90', '4', '五家渠市', '新疆维吾尔自治区', '自治区直辖县级行政区划', '五家渠市', '', '0', '2', 'WJQS', '0');

-- ----------------------------
-- Table structure for `t_system_role`
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
-- Records of t_system_role
-- ----------------------------
INSERT INTO `t_system_role` VALUES ('1', '超级管理员', '最高权限', '0', 'admin', '2016-09-27 00:00:30', '2016-03-02 00:00:30', 'admin');
INSERT INTO `t_system_role` VALUES ('101611081948578551', 'test', '1', '0', 'admin', '2016-11-08 19:48:58', null, null);

-- ----------------------------
-- Table structure for `t_system_role_function`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role_function`;
CREATE TABLE `t_system_role_function` (
  `role_id` varchar(25) NOT NULL COMMENT '角色id',
  `function_id` varchar(25) NOT NULL COMMENT '功能id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与功能的关系表';

-- ----------------------------
-- Records of t_system_role_function
-- ----------------------------
INSERT INTO `t_system_role_function` VALUES ('1', '510');
INSERT INTO `t_system_role_function` VALUES ('1', '511');
INSERT INTO `t_system_role_function` VALUES ('1', '512');
INSERT INTO `t_system_role_function` VALUES ('1', '513');
INSERT INTO `t_system_role_function` VALUES ('1', '514');
INSERT INTO `t_system_role_function` VALUES ('1', '515');
INSERT INTO `t_system_role_function` VALUES ('1', '516');
INSERT INTO `t_system_role_function` VALUES ('1', '713');
INSERT INTO `t_system_role_function` VALUES ('1', '714');
INSERT INTO `t_system_role_function` VALUES ('1', '715');
INSERT INTO `t_system_role_function` VALUES ('1', '716');
INSERT INTO `t_system_role_function` VALUES ('1', '717');
INSERT INTO `t_system_role_function` VALUES ('1', '718');
INSERT INTO `t_system_role_function` VALUES ('1', '719');
INSERT INTO `t_system_role_function` VALUES ('1', '720');
INSERT INTO `t_system_role_function` VALUES ('1', '721');
INSERT INTO `t_system_role_function` VALUES ('1', '722');
INSERT INTO `t_system_role_function` VALUES ('1', '723');
INSERT INTO `t_system_role_function` VALUES ('1', '724');
INSERT INTO `t_system_role_function` VALUES ('1', '725');
INSERT INTO `t_system_role_function` VALUES ('1', '726');
INSERT INTO `t_system_role_function` VALUES ('1', '727');
INSERT INTO `t_system_role_function` VALUES ('1', '216');
INSERT INTO `t_system_role_function` VALUES ('1', '217');
INSERT INTO `t_system_role_function` VALUES ('1', '218');
INSERT INTO `t_system_role_function` VALUES ('1', '219');
INSERT INTO `t_system_role_function` VALUES ('1', '220');
INSERT INTO `t_system_role_function` VALUES ('1', '221');
INSERT INTO `t_system_role_function` VALUES ('1', '222');
INSERT INTO `t_system_role_function` VALUES ('1', '223');
INSERT INTO `t_system_role_function` VALUES ('1', '224');
INSERT INTO `t_system_role_function` VALUES ('1', '225');
INSERT INTO `t_system_role_function` VALUES ('1', '226');
INSERT INTO `t_system_role_function` VALUES ('1', '227');
INSERT INTO `t_system_role_function` VALUES ('1', '228');
INSERT INTO `t_system_role_function` VALUES ('1', '229');
INSERT INTO `t_system_role_function` VALUES ('1', '230');
INSERT INTO `t_system_role_function` VALUES ('1', '231');
INSERT INTO `t_system_role_function` VALUES ('1', '232');
INSERT INTO `t_system_role_function` VALUES ('1', '233');
INSERT INTO `t_system_role_function` VALUES ('1', '234');
INSERT INTO `t_system_role_function` VALUES ('1', '235');
INSERT INTO `t_system_role_function` VALUES ('1', '236');
INSERT INTO `t_system_role_function` VALUES ('1', '237');
INSERT INTO `t_system_role_function` VALUES ('1', '238');
INSERT INTO `t_system_role_function` VALUES ('1', '239');
INSERT INTO `t_system_role_function` VALUES ('1', '240');

INSERT INTO `t_system_role_function` VALUES ('1', '301');
INSERT INTO `t_system_role_function` VALUES ('1', '302');
INSERT INTO `t_system_role_function` VALUES ('1', '303');
INSERT INTO `t_system_role_function` VALUES ('1', '304');
INSERT INTO `t_system_role_function` VALUES ('1', '305');
INSERT INTO `t_system_role_function` VALUES ('1', '306');
INSERT INTO `t_system_role_function` VALUES ('1', '307');
INSERT INTO `t_system_role_function` VALUES ('1', '308');
INSERT INTO `t_system_role_function` VALUES ('1', '309');
INSERT INTO `t_system_role_function` VALUES ('1', '310');
INSERT INTO `t_system_role_function` VALUES ('1', '311');
INSERT INTO `t_system_role_function` VALUES ('1', '312');
INSERT INTO `t_system_role_function` VALUES ('1', '313');
INSERT INTO `t_system_role_function` VALUES ('1', '314');
INSERT INTO `t_system_role_function` VALUES ('1', '315');
INSERT INTO `t_system_role_function` VALUES ('1', '316');
INSERT INTO `t_system_role_function` VALUES ('1', '317');
INSERT INTO `t_system_role_function` VALUES ('1', '318');
INSERT INTO `t_system_role_function` VALUES ('1', '319');
INSERT INTO `t_system_role_function` VALUES ('1', '320');
INSERT INTO `t_system_role_function` VALUES ('1', '321');
INSERT INTO `t_system_role_function` VALUES ('1', '322');
INSERT INTO `t_system_role_function` VALUES ('1', '323');
INSERT INTO `t_system_role_function` VALUES ('1', '324');
INSERT INTO `t_system_role_function` VALUES ('1', '325');
INSERT INTO `t_system_role_function` VALUES ('1', '326');
INSERT INTO `t_system_role_function` VALUES ('1', '327');
INSERT INTO `t_system_role_function` VALUES ('1', '328');
INSERT INTO `t_system_role_function` VALUES ('1', '329');
INSERT INTO `t_system_role_function` VALUES ('1', '330');
INSERT INTO `t_system_role_function` VALUES ('1', '331');
INSERT INTO `t_system_role_function` VALUES ('1', '332');
INSERT INTO `t_system_role_function` VALUES ('1', '333');
INSERT INTO `t_system_role_function` VALUES ('1', '334');
INSERT INTO `t_system_role_function` VALUES ('1', '335');
INSERT INTO `t_system_role_function` VALUES ('1', '401');
INSERT INTO `t_system_role_function` VALUES ('1', '402');
INSERT INTO `t_system_role_function` VALUES ('1', '403');
INSERT INTO `t_system_role_function` VALUES ('1', '404');
INSERT INTO `t_system_role_function` VALUES ('1', '405');
INSERT INTO `t_system_role_function` VALUES ('1', '406');
INSERT INTO `t_system_role_function` VALUES ('1', '407');
INSERT INTO `t_system_role_function` VALUES ('1', '408');
INSERT INTO `t_system_role_function` VALUES ('1', '409');
INSERT INTO `t_system_role_function` VALUES ('1', '410');
INSERT INTO `t_system_role_function` VALUES ('1', '411');
INSERT INTO `t_system_role_function` VALUES ('1', '501');
INSERT INTO `t_system_role_function` VALUES ('1', '502');
INSERT INTO `t_system_role_function` VALUES ('1', '503');
INSERT INTO `t_system_role_function` VALUES ('1', '504');
INSERT INTO `t_system_role_function` VALUES ('1', '505');
INSERT INTO `t_system_role_function` VALUES ('1', '506');
INSERT INTO `t_system_role_function` VALUES ('1', '507');
INSERT INTO `t_system_role_function` VALUES ('1', '508');
INSERT INTO `t_system_role_function` VALUES ('1', '509');
INSERT INTO `t_system_role_function` VALUES ('1', '101');
INSERT INTO `t_system_role_function` VALUES ('1', '102');
INSERT INTO `t_system_role_function` VALUES ('1', '103');
INSERT INTO `t_system_role_function` VALUES ('1', '104');
INSERT INTO `t_system_role_function` VALUES ('1', '105');
INSERT INTO `t_system_role_function` VALUES ('1', '106');
INSERT INTO `t_system_role_function` VALUES ('1', '107');
INSERT INTO `t_system_role_function` VALUES ('1', '517');
INSERT INTO `t_system_role_function` VALUES ('1', '518');
INSERT INTO `t_system_role_function` VALUES ('1', '519');
INSERT INTO `t_system_role_function` VALUES ('1', '520');
INSERT INTO `t_system_role_function` VALUES ('1', '521');
INSERT INTO `t_system_role_function` VALUES ('1', '522');
INSERT INTO `t_system_role_function` VALUES ('1', '523');
INSERT INTO `t_system_role_function` VALUES ('1', '524');
INSERT INTO `t_system_role_function` VALUES ('1', '525');
INSERT INTO `t_system_role_function` VALUES ('1', '526');
INSERT INTO `t_system_role_function` VALUES ('1', '527');
INSERT INTO `t_system_role_function` VALUES ('1', '528');
INSERT INTO `t_system_role_function` VALUES ('1', '529');
INSERT INTO `t_system_role_function` VALUES ('1', '530');
INSERT INTO `t_system_role_function` VALUES ('1', '531');
INSERT INTO `t_system_role_function` VALUES ('1', '532');
INSERT INTO `t_system_role_function` VALUES ('1', '533');
INSERT INTO `t_system_role_function` VALUES ('1', '534');
INSERT INTO `t_system_role_function` VALUES ('1', '535');
INSERT INTO `t_system_role_function` VALUES ('1', '536');
INSERT INTO `t_system_role_function` VALUES ('1', '537');
INSERT INTO `t_system_role_function` VALUES ('1', '538');
INSERT INTO `t_system_role_function` VALUES ('1', '539');
INSERT INTO `t_system_role_function` VALUES ('1', '540');
INSERT INTO `t_system_role_function` VALUES ('1', '541');
INSERT INTO `t_system_role_function` VALUES ('1', '542');
INSERT INTO `t_system_role_function` VALUES ('1', '543');
INSERT INTO `t_system_role_function` VALUES ('1', '544');
INSERT INTO `t_system_role_function` VALUES ('1', '545');
INSERT INTO `t_system_role_function` VALUES ('1', '546');
INSERT INTO `t_system_role_function` VALUES ('1', '547');
INSERT INTO `t_system_role_function` VALUES ('1', '548');
INSERT INTO `t_system_role_function` VALUES ('1', '549');
INSERT INTO `t_system_role_function` VALUES ('1', '550');
INSERT INTO `t_system_role_function` VALUES ('1', '551');
INSERT INTO `t_system_role_function` VALUES ('1', '552');
INSERT INTO `t_system_role_function` VALUES ('1', '553');
INSERT INTO `t_system_role_function` VALUES ('1', '554');
INSERT INTO `t_system_role_function` VALUES ('1', '555');
INSERT INTO `t_system_role_function` VALUES ('1', '556');
INSERT INTO `t_system_role_function` VALUES ('1', '557');
INSERT INTO `t_system_role_function` VALUES ('1', '558');
INSERT INTO `t_system_role_function` VALUES ('1', '559');
INSERT INTO `t_system_role_function` VALUES ('1', '560');
INSERT INTO `t_system_role_function` VALUES ('1', '561');
INSERT INTO `t_system_role_function` VALUES ('1', '562');
INSERT INTO `t_system_role_function` VALUES ('1', '563');
INSERT INTO `t_system_role_function` VALUES ('1', '564');
INSERT INTO `t_system_role_function` VALUES ('1', '565');
INSERT INTO `t_system_role_function` VALUES ('1', '566');
INSERT INTO `t_system_role_function` VALUES ('1', '567');
INSERT INTO `t_system_role_function` VALUES ('1', '568');
INSERT INTO `t_system_role_function` VALUES ('1', '569');
INSERT INTO `t_system_role_function` VALUES ('1', '570');
INSERT INTO `t_system_role_function` VALUES ('1', '571');
INSERT INTO `t_system_role_function` VALUES ('1', '572');
INSERT INTO `t_system_role_function` VALUES ('1', '573');
INSERT INTO `t_system_role_function` VALUES ('1', '601');
INSERT INTO `t_system_role_function` VALUES ('1', '602');
INSERT INTO `t_system_role_function` VALUES ('1', '603');
INSERT INTO `t_system_role_function` VALUES ('1', '604');
INSERT INTO `t_system_role_function` VALUES ('1', '605');
INSERT INTO `t_system_role_function` VALUES ('1', '606');
INSERT INTO `t_system_role_function` VALUES ('1', '607');
INSERT INTO `t_system_role_function` VALUES ('1', '608');
INSERT INTO `t_system_role_function` VALUES ('1', '609');
INSERT INTO `t_system_role_function` VALUES ('1', '610');
INSERT INTO `t_system_role_function` VALUES ('1', '611');
INSERT INTO `t_system_role_function` VALUES ('1', '612');
INSERT INTO `t_system_role_function` VALUES ('1', '613');
INSERT INTO `t_system_role_function` VALUES ('1', '614');
INSERT INTO `t_system_role_function` VALUES ('1', '615');
INSERT INTO `t_system_role_function` VALUES ('1', '616');
INSERT INTO `t_system_role_function` VALUES ('1', '617');
INSERT INTO `t_system_role_function` VALUES ('1', '618');
INSERT INTO `t_system_role_function` VALUES ('1', '619');
INSERT INTO `t_system_role_function` VALUES ('1', '620');
INSERT INTO `t_system_role_function` VALUES ('1', '621');
INSERT INTO `t_system_role_function` VALUES ('1', '622');
INSERT INTO `t_system_role_function` VALUES ('1', '623');
INSERT INTO `t_system_role_function` VALUES ('1', '624');
INSERT INTO `t_system_role_function` VALUES ('1', '701');
INSERT INTO `t_system_role_function` VALUES ('1', '702');
INSERT INTO `t_system_role_function` VALUES ('1', '703');
INSERT INTO `t_system_role_function` VALUES ('1', '704');
INSERT INTO `t_system_role_function` VALUES ('1', '705');
INSERT INTO `t_system_role_function` VALUES ('1', '706');
INSERT INTO `t_system_role_function` VALUES ('1', '707');
INSERT INTO `t_system_role_function` VALUES ('1', '708');
INSERT INTO `t_system_role_function` VALUES ('1', '709');
INSERT INTO `t_system_role_function` VALUES ('1', '710');
INSERT INTO `t_system_role_function` VALUES ('1', '711');
INSERT INTO `t_system_role_function` VALUES ('1', '712');
INSERT INTO `t_system_role_function` VALUES ('1', '201');
INSERT INTO `t_system_role_function` VALUES ('1', '202');
INSERT INTO `t_system_role_function` VALUES ('1', '203');
INSERT INTO `t_system_role_function` VALUES ('1', '204');
INSERT INTO `t_system_role_function` VALUES ('1', '205');
INSERT INTO `t_system_role_function` VALUES ('1', '206');
INSERT INTO `t_system_role_function` VALUES ('1', '207');
INSERT INTO `t_system_role_function` VALUES ('1', '208');
INSERT INTO `t_system_role_function` VALUES ('1', '209');
INSERT INTO `t_system_role_function` VALUES ('1', '210');
INSERT INTO `t_system_role_function` VALUES ('1', '211');
INSERT INTO `t_system_role_function` VALUES ('1', '212');
INSERT INTO `t_system_role_function` VALUES ('1', '213');
INSERT INTO `t_system_role_function` VALUES ('1', '214');
INSERT INTO `t_system_role_function` VALUES ('1', '215');
INSERT INTO `t_system_role_function` VALUES ('1', '216');
INSERT INTO `t_system_role_function` VALUES ('1', '217');
INSERT INTO `t_system_role_function` VALUES ('1', '218');
INSERT INTO `t_system_role_function` VALUES ('1', '219');
INSERT INTO `t_system_role_function` VALUES ('1', '220');
INSERT INTO `t_system_role_function` VALUES ('1', '221');
INSERT INTO `t_system_role_function` VALUES ('1', '222');
INSERT INTO `t_system_role_function` VALUES ('1', '223');
INSERT INTO `t_system_role_function` VALUES ('1', '224');
INSERT INTO `t_system_role_function` VALUES ('1', '225');
INSERT INTO `t_system_role_function` VALUES ('1', '226');
INSERT INTO `t_system_role_function` VALUES ('1', '227');
INSERT INTO `t_system_role_function` VALUES ('1', '228');
INSERT INTO `t_system_role_function` VALUES ('1', '229');
INSERT INTO `t_system_role_function` VALUES ('1', '230');
INSERT INTO `t_system_role_function` VALUES ('1', '231');
INSERT INTO `t_system_role_function` VALUES ('1', '232');
INSERT INTO `t_system_role_function` VALUES ('1', '233');
INSERT INTO `t_system_role_function` VALUES ('1', '234');
INSERT INTO `t_system_role_function` VALUES ('1', '235');
INSERT INTO `t_system_role_function` VALUES ('1', '236');
INSERT INTO `t_system_role_function` VALUES ('1', '237');
INSERT INTO `t_system_role_function` VALUES ('1', '238');
INSERT INTO `t_system_role_function` VALUES ('1', '239');
INSERT INTO `t_system_role_function` VALUES ('1', '240');
INSERT INTO `t_system_role_function` VALUES ('1', '241');
INSERT INTO `t_system_role_function` VALUES ('1', '242');
INSERT INTO `t_system_role_function` VALUES ('1', '243');
INSERT INTO `t_system_role_function` VALUES ('1', '244');
INSERT INTO `t_system_role_function` VALUES ('1', '245');
INSERT INTO `t_system_role_function` VALUES ('1', '246');
INSERT INTO `t_system_role_function` VALUES ('1', '247');
INSERT INTO `t_system_role_function` VALUES ('1', '248');
INSERT INTO `t_system_role_function` VALUES ('1', '249');
INSERT INTO `t_system_role_function` VALUES ('1', '250');
INSERT INTO `t_system_role_function` VALUES ('1', '251');
INSERT INTO `t_system_role_function` VALUES ('1', '252');
INSERT INTO `t_system_role_function` VALUES ('1', '253');
INSERT INTO `t_system_role_function` VALUES ('1', '254');
INSERT INTO `t_system_role_function` VALUES ('1', '255');
INSERT INTO `t_system_role_function` VALUES ('1', '256');
INSERT INTO `t_system_role_function` VALUES ('1', '257');
INSERT INTO `t_system_role_function` VALUES ('1', '258');
INSERT INTO `t_system_role_function` VALUES ('1', '259');
INSERT INTO `t_system_role_function` VALUES ('1', '260');
INSERT INTO `t_system_role_function` VALUES ('1', '261');
INSERT INTO `t_system_role_function` VALUES ('1', '262');
INSERT INTO `t_system_role_function` VALUES ('1', '263');
INSERT INTO `t_system_role_function` VALUES ('1', '264');
INSERT INTO `t_system_role_function` VALUES ('1', '265');
INSERT INTO `t_system_role_function` VALUES ('1', '266');
INSERT INTO `t_system_role_function` VALUES ('1', '267');
INSERT INTO `t_system_role_function` VALUES ('1', '268');
INSERT INTO `t_system_role_function` VALUES ('1', '269');
INSERT INTO `t_system_role_function` VALUES ('1', '270');
INSERT INTO `t_system_role_function` VALUES ('1', '271');
INSERT INTO `t_system_role_function` VALUES ('1', '272');
INSERT INTO `t_system_role_function` VALUES ('1', '273');
INSERT INTO `t_system_role_function` VALUES ('1', '274');
INSERT INTO `t_system_role_function` VALUES ('1', '275');
INSERT INTO `t_system_role_function` VALUES ('1', '276');
INSERT INTO `t_system_role_function` VALUES ('1', '277');
INSERT INTO `t_system_role_function` VALUES ('1', '278');
INSERT INTO `t_system_role_function` VALUES ('1', '279');
INSERT INTO `t_system_role_function` VALUES ('1', '280');
INSERT INTO `t_system_role_function` VALUES ('1', '281');
INSERT INTO `t_system_role_function` VALUES ('1', '282');
INSERT INTO `t_system_role_function` VALUES ('1', '283');
INSERT INTO `t_system_role_function` VALUES ('1', '284');
INSERT INTO `t_system_role_function` VALUES ('1', '285');
INSERT INTO `t_system_role_function` VALUES ('1', '286');
INSERT INTO `t_system_role_function` VALUES ('1', '287');
INSERT INTO `t_system_role_function` VALUES ('1', '288');
INSERT INTO `t_system_role_function` VALUES ('1', '289');
INSERT INTO `t_system_role_function` VALUES ('1', '290');
INSERT INTO `t_system_role_function` VALUES ('1', '291');
INSERT INTO `t_system_role_function` VALUES ('1', '292');
INSERT INTO `t_system_role_function` VALUES ('1', '293');
INSERT INTO `t_system_role_function` VALUES ('1', '294');
INSERT INTO `t_system_role_function` VALUES ('1', '295');
INSERT INTO `t_system_role_function` VALUES ('1', '296');
INSERT INTO `t_system_role_function` VALUES ('1', '297');
INSERT INTO `t_system_role_function` VALUES ('1', '298');
INSERT INTO `t_system_role_function` VALUES ('1', '299');
INSERT INTO `t_system_role_function` VALUES ('1', '300');
INSERT INTO `t_system_role_function` VALUES ('1', '301');
INSERT INTO `t_system_role_function` VALUES ('1', '302');
INSERT INTO `t_system_role_function` VALUES ('1', '303');
INSERT INTO `t_system_role_function` VALUES ('1', '304');
INSERT INTO `t_system_role_function` VALUES ('1', '305');
INSERT INTO `t_system_role_function` VALUES ('1', '306');
INSERT INTO `t_system_role_function` VALUES ('1', '307');
INSERT INTO `t_system_role_function` VALUES ('1', '308');
INSERT INTO `t_system_role_function` VALUES ('1', '309');
INSERT INTO `t_system_role_function` VALUES ('1', '310');
INSERT INTO `t_system_role_function` VALUES ('1', '311');
INSERT INTO `t_system_role_function` VALUES ('1', '312');
INSERT INTO `t_system_role_function` VALUES ('1', '313');
INSERT INTO `t_system_role_function` VALUES ('1', '314');
INSERT INTO `t_system_role_function` VALUES ('1', '315');
INSERT INTO `t_system_role_function` VALUES ('1', '316');
INSERT INTO `t_system_role_function` VALUES ('1', '317');
INSERT INTO `t_system_role_function` VALUES ('1', '318');
INSERT INTO `t_system_role_function` VALUES ('1', '319');
INSERT INTO `t_system_role_function` VALUES ('1', '320');
INSERT INTO `t_system_role_function` VALUES ('1', '321');
INSERT INTO `t_system_role_function` VALUES ('1', '322');
INSERT INTO `t_system_role_function` VALUES ('1', '325');
INSERT INTO `t_system_role_function` VALUES ('1', '328');
INSERT INTO `t_system_role_function` VALUES ('1', '329');
INSERT INTO `t_system_role_function` VALUES ('1', '330');
INSERT INTO `t_system_role_function` VALUES ('1', '331');
INSERT INTO `t_system_role_function` VALUES ('1', '332');
INSERT INTO `t_system_role_function` VALUES ('1', '333');
INSERT INTO `t_system_role_function` VALUES ('1', '334');
INSERT INTO `t_system_role_function` VALUES ('1', '335');
INSERT INTO `t_system_role_function` VALUES ('1', '336');
INSERT INTO `t_system_role_function` VALUES ('1', '337');
INSERT INTO `t_system_role_function` VALUES ('1', '338');
INSERT INTO `t_system_role_function` VALUES ('1', '339');
INSERT INTO `t_system_role_function` VALUES ('1', '340');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '101');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '102');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '103');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '104');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '105');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '106');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '107');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '201');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '202');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '203');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '204');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '205');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '206');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '207');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '208');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '209');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '210');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '211');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '212');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '213');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '214');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '215');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '216');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '217');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '218');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '219');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '220');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '221');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '222');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '223');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '224');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '225');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '226');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '227');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '228');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '229');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '230');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '231');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '232');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '233');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '234');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '235');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '236');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '237');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '238');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '239');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '301');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '302');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '303');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '304');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '305');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '306');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '307');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '308');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '309');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '310');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '311');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '312');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '314');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '315');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '316');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '317');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '318');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '319');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '320');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '321');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '322');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '323');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '324');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '325');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '326');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '327');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '328');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '329');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '330');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '331');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '332');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '333');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '334');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '335');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '400');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '401');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '402');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '403');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '404');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '405');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '406');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '407');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '408');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '409');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '410');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '501');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '502');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '503');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '504');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '505');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '506');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '507');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '508');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '509');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '510');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '511');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '512');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '513');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '514');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '515');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '516');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '517');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '518');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '519');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '520');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '521');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '522');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '523');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '524');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '525');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '526');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '527');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '528');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '529');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '530');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '531');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '532');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '533');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '534');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '535');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '536');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '537');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '538');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '539');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '540');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '541');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '542');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '543');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '544');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '545');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '546');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '547');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '548');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '549');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '550');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '551');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '552');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '553');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '554');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '555');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '556');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '557');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '558');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '559');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '560');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '561');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '562');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '563');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '564');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '565');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '566');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '567');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '568');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '569');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '570');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '571');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '572');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '573');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '601');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '602');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '603');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '604');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '605');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '606');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '607');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '608');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '609');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '610');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '611');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '612');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '613');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '614');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '615');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '616');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '617');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '618');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '619');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '620');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '621');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '622');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '623');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '624');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '701');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '702');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '703');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '704');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '705');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '706');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '707');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '708');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '709');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '710');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '711');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '712');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '713');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '714');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '715');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '716');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '717');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '718');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '719');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '720');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '721');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '722');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '723');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '724');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '725');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '726');
INSERT INTO `t_system_role_function` VALUES ('101611081948578551', '727');

-- ----------------------------
-- Table structure for `t_system_send_count`
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
-- Records of t_system_send_count
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_site_template`
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
-- Records of t_system_site_template
-- ----------------------------
INSERT INTO `t_system_site_template` VALUES ('1', '001', '1', '【{0}】尊敬的用户：您的登录验证码是：{1},{2}秒内有效，请尽快验证。（为了您的账号安全，请勿将验证码告诉他人）', '1', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '002', '1', '【{0}】尊敬的用户：您的验证码是：{1},{2}秒内有效，请尽快验证。（为了您的账号安全，请勿将验证码告诉他人）', '2', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '003', '1', '【{0}】尊敬的用户：您于{1}成功修改提现密码，请您牢记。（如非本人操作请立即联系客服，电话{2}）', '3', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '004', '1', '尊敬的{0}用户：恭喜您提交的\"{1}“项目认证资料已通过审核。', '4', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '005', '1', '尊敬的{0}用户：很抱歉，您提交的\"{1}“项目认证资料未通过审核，请您重新填写正确的认证资料后再提交审核。', '5', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '006', '1', '尊敬的{0}用户：您对“{1}”项目的订单{2}，金额{3}元，已支付成功，感谢您对我们的关注与支持！', '6', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '007', '1', '【{0}】尊敬的用户：您对“{1}”项目的订单“{2}”，因“{3}”而未支持成功，退款金额{4}元已返还至您支付时使用的账户中，请查收，感谢您的参与。如有疑问请咨询平台客服{5}。', '7', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '008', '1', '【{0}】尊敬的用户：恭喜您，您发起的“{1}”项目已众筹成功，感谢您对我们的关注与支持！', '8', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '009', '1', '【{0}】尊敬的用户：您发起的“{1}”项目众筹失败，感谢您的参与。如有疑问请咨询平台客服{2}。', '9', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '010', '1', '【{0}】尊敬的用户：您支持的“{1}”项目众筹失败，将在3个工作日内退款给您，感谢您的参与。如有疑问请咨询平台客服{2}。', '10', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '011', '1', '【{0}】尊敬的用户：您支持的“{1}”项目众筹失败，退款金额已返还至您支付时使用的账户中，请查收，感谢您的参与。如有疑问请咨询平台客服{2}。', '11', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '012', '1', '【{0}】尊敬的用户：您支持的“{1}”项目已被删除，将在3个工作日内退款给您，感谢您的参与。如有疑问请咨询平台客服{2}。', '12', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '013', '1', '【{0}】尊敬的用户：您支持的“{1}”项目已被删除，退款金额已返还至您支付时使用的账户中，请查收，感谢您的参与。如有疑问请咨询平台客服{2}。', '13', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '014', '1', '【{0}】尊敬的用户：您在{1}申请提现{2}元，平台将会在3个工作日内处理，如非本人操作请立即联系平台客服{3}。', '14', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '015', '1', '【{0}】尊敬的用户：您在{1}成功提现{2}元，提现手续费{3}元，实际到账金额{4}元，到账银行卡尾号{5}。感谢您对我们的关注与支持。如有疑问请咨询平台客服{6}。', '15', '0', null);
INSERT INTO `t_system_site_template` VALUES ('1', '016', '1', '【{0}】尊敬的用户：您于{1}提交的{2}元提现申请，平台未审核通过，您可向平台客服联系了解未通过原因，再重新发起提现申请，如有疑问请咨询平台客服{3}。', '16', '0', null);

-- ----------------------------
-- Table structure for `t_system_user`
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
-- Records of t_system_user
-- ----------------------------
INSERT INTO `t_system_user` VALUES ('10000000000', '1', '系统管理员', '0', 'admin', '2aw/Cl.FAVx2M', '2016-09-27 00:00:45', '2016-09-27 00:00:45', '1', 'system', '192.168.23.107', '1');
INSERT INTO `t_system_user` VALUES ('13145808000', '1', 'test', '1016092714494314742', 'testzh', '2aw/Cl.FAVx2M', '2016-09-27 14:49:43', '2016-09-27 14:49:43', '0', 'admin', null, '1');

-- ----------------------------
-- Table structure for `t_system_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user_role`;
CREATE TABLE `t_system_user_role` (
  `role_id` varchar(25) NOT NULL COMMENT '角色ID',
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色的关系表';

-- ----------------------------
-- Records of t_system_user_role
-- ----------------------------
INSERT INTO `t_system_user_role` VALUES ('1', '0');
INSERT INTO `t_system_user_role` VALUES ('101611081948578551', '1016092714494314742');

-- ----------------------------
-- Table structure for `t_system_verify_code`
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
-- Records of t_system_verify_code
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_version_management`
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
-- Records of t_system_version_management
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` varchar(25) NOT NULL COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL unique COMMENT '用户登录用户名(此刻为手机号)',
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
  `last_login_ip` varchar(30) NOT NULL COMMENT '最后一次登录ip',
  `pwd_error_count` int(2) DEFAULT NULL COMMENT '当日交易密码错误次数',
  `fail_login_count` int(2) DEFAULT NULL COMMENT '当日登录失败次数',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户总表';

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_account_flow_record`
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
-- Records of t_user_account_flow_record
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_account_record`
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
-- Records of t_user_account_record
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_bank`
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
-- Records of t_user_bank
-- ----------------------------
INSERT INTO `t_user_bank` VALUES ('1', '中国银行', '1', '38', 'images/banklogo/38.png');
INSERT INTO `t_user_bank` VALUES ('10', '招商银行', '1', '45', 'images/banklogo/45.png');
INSERT INTO `t_user_bank` VALUES ('11', '邮政储蓄银行', '1', '48', 'images/banklogo/48.png');
INSERT INTO `t_user_bank` VALUES ('12', '民生银行', '1', '42', 'images/banklogo/42.png');
INSERT INTO `t_user_bank` VALUES ('13', '兴业银行', '1', '75', 'images/banklogo/75.png');
INSERT INTO `t_user_bank` VALUES ('14', '广东发展银行', '1', '43', 'images/banklogo/43.png');
INSERT INTO `t_user_bank` VALUES ('15', '东莞银行', '1', '20', 'images/banklogo/20.png');
INSERT INTO `t_user_bank` VALUES ('16', '深圳发展银行', '1', '72', 'images/banklogo/72.png');
INSERT INTO `t_user_bank` VALUES ('17', '中信银行', '1', '51', 'images/banklogo/51.png');
INSERT INTO `t_user_bank` VALUES ('18', '华夏银行', '1', '44', 'images/banklogo/44.png');
INSERT INTO `t_user_bank` VALUES ('19', '中国光大银行', '1', '46', 'images/banklogo/46.png');
INSERT INTO `t_user_bank` VALUES ('2', '工商银行', '1', '39', 'images/banklogo/39.png');
INSERT INTO `t_user_bank` VALUES ('20', '北京银行', '1', '12', 'images/banklogo/12.png');
INSERT INTO `t_user_bank` VALUES ('21', '上海银行', '1', '06', 'images/banklogo/06.png');
INSERT INTO `t_user_bank` VALUES ('22', '天津银行', '1', '52', 'images/banklogo/52.png');
INSERT INTO `t_user_bank` VALUES ('23', '大连银行', '1', '53', 'images/banklogo/53.png');
INSERT INTO `t_user_bank` VALUES ('24', '杭州银行', '1', '11', 'images/banklogo/11.png');
INSERT INTO `t_user_bank` VALUES ('25', '宁波银行', '1', '10', 'images/banklogo/10.png');
INSERT INTO `t_user_bank` VALUES ('26', '厦门银行', '1', '55', 'images/banklogo/55.png');
INSERT INTO `t_user_bank` VALUES ('27', '广州银行', '1', '56', 'images/banklogo/56.png');
INSERT INTO `t_user_bank` VALUES ('28', '平安银行', '1', '08', 'images/banklogo/08.png');
INSERT INTO `t_user_bank` VALUES ('29', '浙商银行', '1', '40', 'images/banklogo/40.png');
INSERT INTO `t_user_bank` VALUES ('3', '农业银行', '1', '37', 'images/banklogo/37.png');
INSERT INTO `t_user_bank` VALUES ('30', '上海农村商业银行', '1', '57', 'images/banklogo/57.png');
INSERT INTO `t_user_bank` VALUES ('31', '重庆银行', '1', '58', 'images/banklogo/58.png');
INSERT INTO `t_user_bank` VALUES ('32', '江苏银行', '1', '13', 'images/banklogo/13.png');
INSERT INTO `t_user_bank` VALUES ('33', '农村信用合作社', '1', '76', 'images/banklogo/76.png');
INSERT INTO `t_user_bank` VALUES ('34', '广州农村商业银行', '1', '21', 'images/banklogo/21.png');
INSERT INTO `t_user_bank` VALUES ('35', '四川成都龙泉驿稠州村镇银行', '1', '60', 'images/banklogo/60.png');
INSERT INTO `t_user_bank` VALUES ('36', '内蒙古银行', '1', '61', 'images/banklogo/61.png');
INSERT INTO `t_user_bank` VALUES ('37', '深圳农村商业银行', '1', '25', 'images/banklogo/25.png');
INSERT INTO `t_user_bank` VALUES ('38', '贵阳银行', '1', '63', 'images/banklogo/63.png');
INSERT INTO `t_user_bank` VALUES ('39', '贵州银行', '1', '64', 'images/banklogo/64.png');
INSERT INTO `t_user_bank` VALUES ('4', '交通银行', '1', '34', 'images/banklogo/34.png');
INSERT INTO `t_user_bank` VALUES ('40', '贵阳农村商业银行', '1', '65', 'images/banklogo/65.png');
INSERT INTO `t_user_bank` VALUES ('41', '南充市商业银行', '1', '66', 'images/banklogo/66.png');
INSERT INTO `t_user_bank` VALUES ('42', '东莞农商银行', '1', '31', 'images/banklogo/31.png');
INSERT INTO `t_user_bank` VALUES ('43', '徽商银行', '1', '77', 'images/banklogo/77.png');
INSERT INTO `t_user_bank` VALUES ('44', '河北银行', '1', '14', 'images/banklogo/14.png');
INSERT INTO `t_user_bank` VALUES ('45', '重庆农村商业银行', '1', '78', 'images/banklogo/78.png');
INSERT INTO `t_user_bank` VALUES ('46', '呼和浩特金谷农村商业银行', '1', '79', 'images/banklogo/79.png');
INSERT INTO `t_user_bank` VALUES ('47', '吴江农村商业银行', '1', '80', 'images/banklogo/80.png');
INSERT INTO `t_user_bank` VALUES ('48', '宁夏银行', '1', '81', 'images/banklogo/81.png');
INSERT INTO `t_user_bank` VALUES ('49', '石嘴山银行', '1', '82', 'images/banklogo/82.png');
INSERT INTO `t_user_bank` VALUES ('5', '广发银行', '1', '09', 'images/banklogo/09.png');
INSERT INTO `t_user_bank` VALUES ('50', '黄河农村商业银行', '1', '83', 'images/banklogo/83.png');
INSERT INTO `t_user_bank` VALUES ('51', '德阳银行', '1', '84', 'images/banklogo/84.png');
INSERT INTO `t_user_bank` VALUES ('52', '昆明富滇银行', '1', '85', 'images/banklogo/85.png');
INSERT INTO `t_user_bank` VALUES ('53', '云南省农村信用社', '1', '86', 'images/banklogo/86.png');
INSERT INTO `t_user_bank` VALUES ('54', '郑州银行', '1', 'ZZYH', 'images/banklogo/ZZYH.png');
INSERT INTO `t_user_bank` VALUES ('55', '潍坊银行', '1', '87', 'images/banklogo/87.png');
INSERT INTO `t_user_bank` VALUES ('56', '渤海银行', '1', '88', 'images/banklogo/88.png');
INSERT INTO `t_user_bank` VALUES ('57', '安徽凤阳农村商业银行', '1', '89', 'images/banklogo/89.png');
INSERT INTO `t_user_bank` VALUES ('58', '富滇银行', '1', '85', 'images/banklogo/85.png');
INSERT INTO `t_user_bank` VALUES ('59', '玉溪市商业银行', '1', '90', 'images/banklogo/90.png');
INSERT INTO `t_user_bank` VALUES ('6', '深发银行', '1', '74', 'images/banklogo/74.png');
INSERT INTO `t_user_bank` VALUES ('60', '曲靖市商业银行', '1', '91', 'images/banklogo/91.png');
INSERT INTO `t_user_bank` VALUES ('61', '泰安市商业银行', '1', '92', 'images/banklogo/92.png');
INSERT INTO `t_user_bank` VALUES ('62', '汇丰银行', '1', '28', 'images/banklogo/28.png');
INSERT INTO `t_user_bank` VALUES ('63', '河北邯郸农村信用社', '1', '93', 'images/banklogo/93.png');
INSERT INTO `t_user_bank` VALUES ('64', '江苏江南农村商业银行', '1', '94', 'images/banklogo/94.png');
INSERT INTO `t_user_bank` VALUES ('65', '湖北省农村信用社', '1', '95', 'images/banklogo/95.png');
INSERT INTO `t_user_bank` VALUES ('66', '湖北银行', '1', '96', 'images/banklogo/96.png');
INSERT INTO `t_user_bank` VALUES ('67', '汉口银行', '1', 'HKYH', 'images/banklogo/HKYH.png');
INSERT INTO `t_user_bank` VALUES ('68', '襄阳市农村商业银行', '1', '97', 'images/banklogo/97.png');
INSERT INTO `t_user_bank` VALUES ('69', '南京银行', '1', '71', 'images/banklogo/71.png');
INSERT INTO `t_user_bank` VALUES ('7', '建设银行', '1', '36', 'images/banklogo/36.png');
INSERT INTO `t_user_bank` VALUES ('70', '贵州花溪农村商业银行', '1', '98', 'images/banklogo/98.png');
INSERT INTO `t_user_bank` VALUES ('71', '包商银行', '1', '23', 'images/banklogo/23.png');
INSERT INTO `t_user_bank` VALUES ('72', '柳州银行', '1', '99', 'images/banklogo/99.png');
INSERT INTO `t_user_bank` VALUES ('73', '广西农村信用社', '1', '100', 'images/banklogo/100.png');
INSERT INTO `t_user_bank` VALUES ('74', '桂林银行', '1', '22', 'images/banklogo/22.png');
INSERT INTO `t_user_bank` VALUES ('75', '广西北部湾银行', '1', '101', 'images/banklogo/101.png');
INSERT INTO `t_user_bank` VALUES ('76', '贵州贞丰农村商业银行股份有限公司', '1', '102', 'images/banklogo/102.png');
INSERT INTO `t_user_bank` VALUES ('77', '四川农村信用社', '1', '103', 'images/banklogo/103.png');
INSERT INTO `t_user_bank` VALUES ('78', '长春农商银行', '1', '104', 'images/banklogo/104.png');
INSERT INTO `t_user_bank` VALUES ('79', '吉林省农业信用社', '1', '105', 'images/banklogo/105.png');
INSERT INTO `t_user_bank` VALUES ('8', '上海浦东银行', '1', '05', 'images/banklogo/05.png');
INSERT INTO `t_user_bank` VALUES ('80', '吉林银行', '1', '106', 'images/banklogo/106.png');
INSERT INTO `t_user_bank` VALUES ('81', '浙江农信银行', '1', '107', 'images/banklogo/107.png');
INSERT INTO `t_user_bank` VALUES ('82', '苏州银行', '1', '108', 'images/banklogo/108.png');
INSERT INTO `t_user_bank` VALUES ('83', '江苏长江商业银行', '1', '109', 'images/banklogo/109.png');
INSERT INTO `t_user_bank` VALUES ('84', '北京农村商业银行', '1', '67', 'images/banklogo/67.png');
INSERT INTO `t_user_bank` VALUES ('85', '合肥科技农村商业银行', '1', '110', 'images/banklogo/110.png');
INSERT INTO `t_user_bank` VALUES ('86', '湖北嘉鱼农村商业银行', '1', '111', 'images/banklogo/111.png');
INSERT INTO `t_user_bank` VALUES ('87', '江苏长江商业银行', '1', '109', 'images/banklogo/109.png');
INSERT INTO `t_user_bank` VALUES ('9', '浙江泰隆商业银行', '1', '49', 'images/banklogo/49.png');

-- ----------------------------
-- Table structure for `t_user_capital_account`
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
-- Records of t_user_capital_account
-- ----------------------------
INSERT INTO `t_user_capital_account` VALUES ('0', '0.00', '0.00', '2016-11-11 11:23:48');

-- ----------------------------
-- Table structure for `t_user_notify`
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
-- Records of t_user_notify
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_shipping_address`
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
-- Records of t_user_shipping_address
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_third_party`
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

-- ----------------------------
-- Records of t_user_third_party
-- ----------------------------
