/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1 MySQL
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : 127.0.0.1:3306
 Source Schema         : ruoyi-vue-pro

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 13/01/2024 11:09:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for crm_business
-- ----------------------------
DROP TABLE IF EXISTS `crm_business`;
CREATE TABLE `crm_business`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商机名称',
  `status_type_id` bigint NULL DEFAULT NULL COMMENT '商机状态类型编号',
  `status_id` bigint NULL DEFAULT NULL COMMENT '商机状态编号',
  `contact_next_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `customer_id` bigint NOT NULL COMMENT '客户编号',
  `deal_time` datetime NULL DEFAULT NULL COMMENT '预计成交日期',
  `price` bigint NULL DEFAULT NULL COMMENT '商机金额',
  `discount_percent` decimal(10, 2) NULL DEFAULT NULL COMMENT '整单折扣',
  `product_price` decimal(18, 2) NULL DEFAULT NULL COMMENT '产品总金额',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `owner_user_id` bigint NULL DEFAULT NULL COMMENT '负责人的用户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `end_status` int NOT NULL COMMENT '1赢单2输单3无效',
  `end_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结束时的备注',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '逻辑删除',
  `contact_last_time` datetime NULL DEFAULT NULL COMMENT '最后跟进时间',
  `follow_up_status` int NULL DEFAULT NULL COMMENT '跟进状态',
  `tenant_id` bigint NULL DEFAULT 0 COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商机表';

-- ----------------------------
-- Records of crm_business
-- ----------------------------
BEGIN;
INSERT INTO `crm_business` (`id`, `name`, `status_type_id`, `status_id`, `contact_next_time`, `customer_id`, `deal_time`, `price`, `discount_percent`, `product_price`, `remark`, `creator`, `updater`, `owner_user_id`, `create_time`, `update_time`, `end_status`, `end_remark`, `deleted`, `contact_last_time`, `follow_up_status`, `tenant_id`) VALUES (4, '一个商机', 3, 4, NULL, 2, NULL, 10, NULL, NULL, NULL, '', '', NULL, '2023-11-30 12:05:16', '2023-11-30 12:05:16', 0, NULL, b'0', NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_business_status
-- ----------------------------
DROP TABLE IF EXISTS `crm_business_status`;
CREATE TABLE `crm_business_status`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` bigint NOT NULL COMMENT '状态类型编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态类型名',
  `percent` int NOT NULL COMMENT '赢单率',
  `sort` int NOT NULL DEFAULT 1 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商机状态表';

-- ----------------------------
-- Records of crm_business_status
-- ----------------------------
BEGIN;
INSERT INTO `crm_business_status` (`id`, `type_id`, `name`, `percent`, `sort`, `creator`, `create_time`, `updater`, `update_time`, `tenant_id`, `deleted`) VALUES (4, 3, '小状态', 10, 1, '', '2023-11-30 12:18:42', '', '2023-11-30 12:18:47', 1, b'0');
COMMIT;

-- ----------------------------
-- Table structure for crm_business_status_type
-- ----------------------------
DROP TABLE IF EXISTS `crm_business_status_type`;
CREATE TABLE `crm_business_status_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态类型名',
  `dept_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '使用的部门编号',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商机状态类型表';

-- ----------------------------
-- Records of crm_business_status_type
-- ----------------------------
BEGIN;
INSERT INTO `crm_business_status_type` (`id`, `name`, `dept_ids`, `status`, `creator`, `create_time`, `updater`, `update_time`, `tenant_id`, `deleted`) VALUES (3, '大状态', ' ', 1, '', '2023-11-30 12:18:22', '', '2023-11-30 12:18:26', 1, b'0');
COMMIT;

-- ----------------------------
-- Table structure for crm_clue
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue`;
CREATE TABLE `crm_clue`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，主键自增',
  `transform_status` tinyint NULL DEFAULT NULL COMMENT '转化状态',
  `follow_up_status` tinyint NULL DEFAULT NULL COMMENT '跟进状态',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '线索名称',
  `customer_id` bigint NOT NULL COMMENT '客户id',
  `contact_next_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `owner_user_id` bigint NOT NULL COMMENT '负责人的用户编号',
  `contact_last_time` datetime NULL DEFAULT NULL COMMENT '最后跟进时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '线索表';

-- ----------------------------
-- Records of crm_clue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for crm_contact
-- ----------------------------
DROP TABLE IF EXISTS `crm_contact`;
CREATE TABLE `crm_contact`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` bigint NULL DEFAULT NULL COMMENT '客户编号',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人名称',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `telephone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `post` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职务',
  `area_id` bigint NULL DEFAULT NULL COMMENT '地区',
  `detail_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `owner_user_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人用户编号',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '直系上属',
  `qq` int NULL DEFAULT NULL,
  `wechat` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `master` bit(1) NULL DEFAULT NULL COMMENT '是否关键决策人',
  `contact_last_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后跟进内容',
  `contact_last_time` datetime NULL DEFAULT NULL COMMENT '最后跟进时间',
  `contact_next_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  `tenant_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'CRM 联系人';

-- ----------------------------
-- Records of crm_contact
-- ----------------------------
BEGIN;
INSERT INTO `crm_contact` (`id`, `customer_id`, `name`, `mobile`, `telephone`, `email`, `post`, `area_id`, `detail_address`, `remark`, `owner_user_id`, `parent_id`, `qq`, `wechat`, `sex`, `master`, `contact_last_content`, `contact_last_time`, `contact_next_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (9, 2, '土豆', '15601691300', '18818260277', NULL, 'CEO', 120101, '1111', NULL, NULL, 11, NULL, NULL, 1, b'0', NULL, '2024-01-17 00:00:00', '2024-01-26 23:10:11', '1', '2023-11-29 14:02:45', '1', '2024-01-03 23:17:17', b'0', 1), (10, 2, '番茄', '15601691301', NULL, NULL, 'CTO', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, b'0', NULL, NULL, NULL, '1', '2023-11-29 14:02:45', '1', '2023-11-29 14:02:45', b'0', 1), (11, NULL, '深夜牛排', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, b'0', NULL, NULL, NULL, '1', '2024-01-03 23:16:54', '1', '2024-01-03 23:16:54', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_contact_business
-- ----------------------------
DROP TABLE IF EXISTS `crm_contact_business`;
CREATE TABLE `crm_contact_business`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `contact_id` int NULL DEFAULT NULL COMMENT '联系人id',
  `business_id` int NULL DEFAULT NULL COMMENT '商机id',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '联系人商机关联表';

-- ----------------------------
-- Records of crm_contact_business
-- ----------------------------
BEGIN;
INSERT INTO `crm_contact_business` (`id`, `contact_id`, `business_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (29, 9, 4, '1', '2023-12-31 23:11:50', '1', '2023-12-23 22:44:34', b'1', 1), (30, 9, 4, '1', '2024-01-02 17:02:39', '1', '2023-12-23 23:33:39', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_contract
-- ----------------------------
DROP TABLE IF EXISTS `crm_contract`;
CREATE TABLE `crm_contract`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，主键自增',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '合同名称',
  `customer_id` bigint NULL DEFAULT NULL COMMENT '客户编号',
  `business_id` bigint NULL DEFAULT NULL COMMENT '商机编号',
  `process_instance_id` bigint NULL DEFAULT NULL COMMENT '工作流编号',
  `order_date` datetime NULL DEFAULT NULL COMMENT '下单日期',
  `owner_user_id` bigint NULL DEFAULT NULL COMMENT '负责人的用户编号',
  `no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '合同编号',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `price` int NULL DEFAULT NULL COMMENT '合同金额',
  `discount_percent` int NULL DEFAULT NULL COMMENT '整单折扣',
  `product_price` int NULL DEFAULT NULL COMMENT '产品总金额',
  `contact_id` bigint NULL DEFAULT NULL COMMENT '联系人编号',
  `sign_user_id` bigint NULL DEFAULT NULL COMMENT '公司签约人',
  `contact_last_time` datetime NULL DEFAULT NULL COMMENT '最后跟进时间',
  `audit_status` tinyint NOT NULL COMMENT '审批状态',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '合同表';

-- ----------------------------
-- Records of crm_contract
-- ----------------------------
BEGIN;
INSERT INTO `crm_contract` (`id`, `name`, `customer_id`, `business_id`, `process_instance_id`, `order_date`, `owner_user_id`, `no`, `start_time`, `end_time`, `price`, `discount_percent`, `product_price`, `contact_id`, `sign_user_id`, `contact_last_time`, `audit_status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '小合同', 2, NULL, NULL, NULL, NULL, 'X110', '2023-10-01 00:00:00', '2023-10-11 00:00:00', 100, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1', '2023-11-30 09:19:33', '', '2023-11-30 09:39:11', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_customer
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer`;
CREATE TABLE `crm_customer`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，主键自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `follow_up_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '跟进状态',
  `lock_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '锁定状态',
  `deal_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '成交状态',
  `industry_id` int NULL DEFAULT NULL COMMENT '所属行业',
  `level` int NULL DEFAULT NULL COMMENT '客户等级',
  `source` int NULL DEFAULT NULL COMMENT '客户来源',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机',
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `website` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网址',
  `qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `description` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户描述',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `owner_user_id` bigint NULL DEFAULT NULL COMMENT '负责人的用户编号',
  `area_id` bigint NULL DEFAULT NULL COMMENT '地区编号',
  `detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细地址',
  `longitude` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地理位置经度',
  `latitude` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地理位置维度',
  `contact_last_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后跟进内容',
  `contact_last_time` datetime NULL DEFAULT NULL COMMENT '最后跟进时间',
  `contact_next_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_user_id`(`owner_user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户表';

-- ----------------------------
-- Records of crm_customer
-- ----------------------------
BEGIN;
INSERT INTO `crm_customer` (`id`, `name`, `follow_up_status`, `lock_status`, `deal_status`, `industry_id`, `level`, `source`, `mobile`, `telephone`, `website`, `qq`, `wechat`, `email`, `description`, `remark`, `owner_user_id`, `area_id`, `detail_address`, `longitude`, `latitude`, `contact_last_content`, `contact_last_time`, `contact_next_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '啦啦啦啦', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-01-04 21:39:13', NULL, '1', '2023-11-18 21:47:30', '1', '2023-12-25 15:16:51', b'0', 1), (2, '测试客户', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-05 21:39:09', NULL, '1', '2023-11-25 10:38:05', '1', '2023-12-26 22:20:30', b'0', 1), (3, '可爱客户', 0, 0, 0, 2, 1, 1, '15601691300', '18818260277', 'http://www.iocoder.cn', '', NULL, '111@qq.com', NULL, '啦啦啦啦', 1, NULL, NULL, NULL, NULL, NULL, '2024-01-06 21:39:04', '2024-01-24 04:00:00', '1', '2023-12-30 20:59:05', '1', '2023-12-25 15:16:42', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_customer_limit_config
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_limit_config`;
CREATE TABLE `crm_customer_limit_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` int NOT NULL COMMENT '规则类型 1: 拥有客户数限制，2:锁定客户数限制',
  `user_ids` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则适用人群',
  `dept_ids` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则适用部门',
  `max_count` int NOT NULL COMMENT '数量上限',
  `deal_count_enabled` tinyint NULL DEFAULT NULL COMMENT '成交客户是否占有拥有客户数(当 type = 1 时)',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户限制配置表';

-- ----------------------------
-- Records of crm_customer_limit_config
-- ----------------------------
BEGIN;
INSERT INTO `crm_customer_limit_config` (`id`, `type`, `user_ids`, `dept_ids`, `max_count`, `deal_count_enabled`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, '115', '100', 12, 0, '1', '2023-11-18 22:04:11', '1', '2024-01-03 20:09:35', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_customer_pool_config
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_pool_config`;
CREATE TABLE `crm_customer_pool_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `enabled` tinyint(1) NOT NULL COMMENT '是否启用客户公海',
  `contact_expire_days` int NULL DEFAULT NULL COMMENT '未跟进放入公海天数',
  `deal_expire_days` int NULL DEFAULT NULL COMMENT '未成交放入公海天数',
  `notify_enabled` tinyint(1) NULL DEFAULT NULL COMMENT '是否开启提前提醒',
  `notify_days` int NULL DEFAULT NULL COMMENT '提前提醒天数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户公海配置表';

-- ----------------------------
-- Records of crm_customer_pool_config
-- ----------------------------
BEGIN;
INSERT INTO `crm_customer_pool_config` (`id`, `enabled`, `contact_expire_days`, `deal_expire_days`, `notify_enabled`, `notify_days`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, 1, 33, 1, 333, '1', '2023-11-18 21:52:52', '1', '2024-01-03 19:55:48', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_permission
-- ----------------------------
DROP TABLE IF EXISTS `crm_permission`;
CREATE TABLE `crm_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `biz_type` tinyint NOT NULL DEFAULT 100 COMMENT '数据类型',
  `biz_id` bigint NOT NULL DEFAULT 0 COMMENT '数据编号',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户编号',
  `level` int NOT NULL DEFAULT 0 COMMENT '会员等级',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'CRM 数据权限表';

-- ----------------------------
-- Records of crm_permission
-- ----------------------------
BEGIN;
INSERT INTO `crm_permission` (`id`, `biz_type`, `biz_id`, `user_id`, `level`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (21, 2, 2, 1, 1, '1', '2023-11-25 10:38:05', '1', '2023-12-26 22:20:30', b'1', 1), (22, 3, 9, 1, 1, '1', '2023-11-29 14:02:45', '1', '2023-11-29 14:02:45', b'0', 1), (25, 6, 4, 1, 1, '1', '2023-12-06 09:10:06', '1', '2023-12-06 09:10:06', b'0', 1), (26, 2, 3, 1, 1, '1', '2023-12-30 20:59:05', '1', '2023-12-30 20:59:05', b'0', 1), (27, 2, 3, 114, 3, '1', '2024-01-03 14:38:54', '1', '2024-01-03 14:42:46', b'0', 1), (28, 2, 3, 103, 2, '1', '2024-01-03 14:42:55', '1', '2024-01-03 14:42:55', b'0', 1), (29, 3, 11, 1, 1, '1', '2024-01-03 23:16:54', '1', '2024-01-03 23:16:54', b'0', 1), (30, 6, 5, 1, 1, '1', '2024-01-13 10:13:33', '1', '2024-01-13 10:13:33', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_product
-- ----------------------------
DROP TABLE IF EXISTS `crm_product`;
CREATE TABLE `crm_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品编码',
  `unit` tinyint NULL DEFAULT NULL COMMENT '单位',
  `price` bigint NULL DEFAULT 0 COMMENT '价格',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态',
  `category_id` bigint NOT NULL COMMENT '产品分类编号',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '产品描述',
  `owner_user_id` bigint NOT NULL COMMENT '负责人的用户编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '产品表';

-- ----------------------------
-- Records of crm_product
-- ----------------------------
BEGIN;
INSERT INTO `crm_product` (`id`, `name`, `no`, `unit`, `price`, `status`, `category_id`, `description`, `owner_user_id`, `creator`, `create_time`, `updater`, `update_time`, `tenant_id`, `deleted`) VALUES (3, '商品001', 'X001', 1, 100, 1, 1, '我就介绍下', 1, '1', '2023-12-05 14:52:01', '', '2023-12-05 15:04:59', 1, b'0'), (4, '商品002', 'Q200', 1, 10010, 0, 2, NULL, 1, '1', '2023-12-06 09:10:06', '1', '2023-12-06 12:31:01', 1, b'0'), (5, '我是产品', 'A110', 1, 100, 0, 2, '啦啦啦啦', 1, '1', '2024-01-13 10:13:33', '1', '2024-01-13 10:21:01', 1, b'0');
COMMIT;

-- ----------------------------
-- Table structure for crm_product_category
-- ----------------------------
DROP TABLE IF EXISTS `crm_product_category`;
CREATE TABLE `crm_product_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint NOT NULL COMMENT '父级编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'CRM 产品分类表';

-- ----------------------------
-- Records of crm_product_category
-- ----------------------------
BEGIN;
INSERT INTO `crm_product_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '普通分类', 0, '', '2023-12-05 14:54:34', '', '2023-12-05 14:54:37', b'0', 1), (2, '二级分类', 1, '', '2023-12-06 01:09:27', '', '2023-12-06 01:09:41', b'0', 1), (6, '另外一个分类', 0, '1', '2023-12-06 12:55:07', '1', '2023-12-06 12:55:07', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_receivable
-- ----------------------------
DROP TABLE IF EXISTS `crm_receivable`;
CREATE TABLE `crm_receivable`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '回款编号',
  `plan_id` bigint NULL DEFAULT NULL COMMENT '回款计划ID',
  `customer_id` bigint NULL DEFAULT NULL COMMENT '客户ID',
  `contract_id` bigint NULL DEFAULT NULL COMMENT '合同ID',
  `audit_status` tinyint NULL DEFAULT NULL COMMENT '审批状态',
  `process_instance_id` bigint NULL DEFAULT NULL COMMENT '工作流编号',
  `return_time` datetime NULL DEFAULT NULL COMMENT '回款日期',
  `return_type` int NULL DEFAULT NULL COMMENT '回款方式',
  `price` int NULL DEFAULT NULL COMMENT '回款金额',
  `owner_user_id` bigint NULL DEFAULT NULL COMMENT '负责人的用户编号',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '回款管理';

-- ----------------------------
-- Records of crm_receivable
-- ----------------------------
BEGIN;
INSERT INTO `crm_receivable` (`id`, `no`, `plan_id`, `customer_id`, `contract_id`, `audit_status`, `process_instance_id`, `return_time`, `return_type`, `price`, `owner_user_id`, `sort`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (10, 'Q233', 1, 2, 1, 10, NULL, '2023-12-01 19:02:17', 1, 88, 1, NULL, NULL, '1', '2023-12-01 10:44:16', '', '2023-12-01 14:36:59', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for crm_receivable_plan
-- ----------------------------
DROP TABLE IF EXISTS `crm_receivable_plan`;
CREATE TABLE `crm_receivable_plan`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` bigint NULL DEFAULT NULL COMMENT '期数',
  `receivable_id` bigint NULL DEFAULT NULL COMMENT '回款ID',
  `finish_status` bit(1) NOT NULL COMMENT '完成状态',
  `price` int NULL DEFAULT NULL COMMENT '计划回款金额',
  `return_time` datetime NULL DEFAULT NULL COMMENT '计划回款日期',
  `remind_days` bigint NULL DEFAULT NULL COMMENT '提前几天提醒',
  `remind_time` datetime NULL DEFAULT NULL COMMENT '提醒日期',
  `customer_id` bigint NULL DEFAULT NULL COMMENT '客户ID',
  `contract_id` bigint NULL DEFAULT NULL COMMENT '合同ID',
  `owner_user_id` bigint NULL DEFAULT NULL COMMENT '负责人',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '回款计划';

-- ----------------------------
-- Records of crm_receivable_plan
-- ----------------------------
BEGIN;
INSERT INTO `crm_receivable_plan` (`id`, `period`, `receivable_id`, `finish_status`, `price`, `return_time`, `remind_days`, `remind_time`, `customer_id`, `contract_id`, `owner_user_id`, `sort`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 10, 10, b'0', 100, '2023-12-01 22:28:13', 10, NULL, 2, 1, 1, NULL, 'abc', '1', '2023-12-01 14:24:53', '', '2023-12-01 14:45:29', b'0', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
