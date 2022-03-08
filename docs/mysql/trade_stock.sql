DROP DATABASE IF EXISTS `trade_stock`;
CREATE DATABASE `trade_stock` CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
USE `trade_stock`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_authority_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_menu`;
CREATE TABLE `t_authority_menu`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parentId` bigint(19) NOT NULL COMMENT '上级menu_id',
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型id',
  `menuCode` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
  `menuName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menuUri` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URI',
  `menuLevel` tinyint(3) NOT NULL COMMENT '菜单等级',
  `operationSecurity` tinyint(3) NOT NULL COMMENT '是否需要操作授权(0不需要(默认), 1需要)',
  `menuSeq` tinyint(3) NOT NULL COMMENT '位置排序',
  `menuIco` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NOT NULL COMMENT '菜单状态(0无效,1有效)',
  `isOpen` tinyint(3) NULL DEFAULT 0 COMMENT '只对2级菜单生效.0闭合,1打开',
  `isShow` tinyint(3) NULL DEFAULT NULL COMMENT '是否显示 (0--否  1--是)',
  `componentSrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件标识(前后分离使用)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_menu
-- ----------------------------
INSERT INTO `t_authority_menu` VALUES (1, -1, 'COMPANY', 'Sys', '系统管理', '/sys', 0, 1, 0, 'example', 1, 0, 1, 'Layout');
INSERT INTO `t_authority_menu` VALUES (2, 1, 'COMPANY', 'SysAdmin', '用户管理', '/sys/admin', 0, 1, 0, 'table', 1, 0, 1, '/sysAdmin/index');
INSERT INTO `t_authority_menu` VALUES (3, 1, 'COMPANY', 'SysAccess', '菜单管理', 'access', 0, 1, 2, 'table', 1, 0, 1, '/sysAccess/index');
INSERT INTO `t_authority_menu` VALUES (4, 1, 'COMPANY', 'SysRole', '角色管理', 'role', 0, 1, 1, 'table', 1, 0, 1, '/sysRole/index');

-- ----------------------------
-- Table structure for t_authority_menu_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_menu_operation`;
CREATE TABLE `t_authority_menu_operation`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `menuId` bigint(19) NULL DEFAULT NULL COMMENT '自定义菜单id',
  `operationName` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `operationUri` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作URI地址',
  `operationIco` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作图标',
  `status` tinyint(3) NOT NULL COMMENT '状态(0无效1有效)',
  `operationResouceUrl` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限菜单url',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fkmenuId`(`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12149 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_menu_operation
-- ----------------------------
INSERT INTO `t_authority_menu_operation` VALUES (10123, 2, '新增', 'add', NULL, 1, '23424');
INSERT INTO `t_authority_menu_operation` VALUES (10124, 2, '修改', 'update', NULL, 1, '1312');
INSERT INTO `t_authority_menu_operation` VALUES (10125, 2, '删除', 'delete', NULL, 1, '23432');
INSERT INTO `t_authority_menu_operation` VALUES (10126, 2, '重置密码', 'reset', NULL, 1, '242');
INSERT INTO `t_authority_menu_operation` VALUES (10127, 2, '禁用/启用', 'disable', NULL, 1, '23424');
INSERT INTO `t_authority_menu_operation` VALUES (10128, 3, '增加菜单', 'addMenu', NULL, 1, '3242');
INSERT INTO `t_authority_menu_operation` VALUES (10129, 3, '增加', 'addIurisdiction', NULL, 1, '2343242');
INSERT INTO `t_authority_menu_operation` VALUES (10130, 3, '修改菜单', 'updateMenu', NULL, 1, '23424');
INSERT INTO `t_authority_menu_operation` VALUES (10131, 3, '修改', 'updateIurisdiction', NULL, 1, '242');
INSERT INTO `t_authority_menu_operation` VALUES (10132, 3, '删除菜单', 'deleteMenu', NULL, 1, '2343242');
INSERT INTO `t_authority_menu_operation` VALUES (10133, 4, '新增', 'add', NULL, 1, '1312');
INSERT INTO `t_authority_menu_operation` VALUES (10134, 4, '修改', 'update', NULL, 1, '2342');
INSERT INTO `t_authority_menu_operation` VALUES (10135, 4, '分配', 'privileges', NULL, 1, '234');
INSERT INTO `t_authority_menu_operation` VALUES (10136, 4, '删除', 'delete', NULL, 1, '23424');
INSERT INTO `t_authority_menu_operation` VALUES (12146, 2, '查看页面', 'pageView', NULL, 1, 'pageView');
INSERT INTO `t_authority_menu_operation` VALUES (12147, 3, '查看页面', 'pageView', NULL, 1, 'pageView');
INSERT INTO `t_authority_menu_operation` VALUES (12148, 4, '查看页面', 'pageView', NULL, 1, 'pageView');

-- ----------------------------
-- Table structure for t_authority_no_limit_uri
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_no_limit_uri`;
CREATE TABLE `t_authority_no_limit_uri`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `noLimitUri` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不限制的uri',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_noLimitUri`(`noLimitUri`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开放菜单表(无须权限认证)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_authority_role
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_role`;
CREATE TABLE `t_authority_role`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型id',
  `institutionId` bigint(19) NULL DEFAULT NULL COMMENT '对应机构类型下的机构id',
  `roleName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `roleDec` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `isAdmin` tinyint(3) NULL DEFAULT 0 COMMENT '1:机构下的管理员角色,0: 普通角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10172 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_role
-- ----------------------------
INSERT INTO `t_authority_role` VALUES (1, 'GROUPS', 9999, 'admin', ' 管理员', 1);
INSERT INTO `t_authority_role` VALUES (10171, 'COMPANY', 10065, '御金融公司管理员角色', '1', 1);

-- ----------------------------
-- Table structure for t_authority_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_role_menu`;
CREATE TABLE `t_authority_role_menu`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `roleId` bigint(19) NOT NULL COMMENT '自定义角色id',
  `menuId` bigint(19) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_roleId_menuId`(`roleId`, `menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23646 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_role_menu
-- ----------------------------
INSERT INTO `t_authority_role_menu` VALUES (23645, 10171, 1);
INSERT INTO `t_authority_role_menu` VALUES (23579, 10171, 2);
INSERT INTO `t_authority_role_menu` VALUES (23580, 10171, 4);

-- ----------------------------
-- Table structure for t_authority_role_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_role_operation`;
CREATE TABLE `t_authority_role_operation`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `roleId` bigint(19) NULL DEFAULT NULL COMMENT '自定义角色id',
  `operationId` bigint(19) NULL DEFAULT NULL COMMENT '自定义操作id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fk_operation_role_id`(`operationId`, `roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50400 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色操作关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_role_operation
-- ----------------------------
INSERT INTO `t_authority_role_operation` VALUES (50389, 10171, 10123);
INSERT INTO `t_authority_role_operation` VALUES (50390, 10171, 10124);
INSERT INTO `t_authority_role_operation` VALUES (50391, 10171, 10125);
INSERT INTO `t_authority_role_operation` VALUES (50392, 10171, 10126);
INSERT INTO `t_authority_role_operation` VALUES (50393, 10171, 10127);
INSERT INTO `t_authority_role_operation` VALUES (50395, 10171, 10133);
INSERT INTO `t_authority_role_operation` VALUES (50396, 10171, 10134);
INSERT INTO `t_authority_role_operation` VALUES (50397, 10171, 10135);
INSERT INTO `t_authority_role_operation` VALUES (50398, 10171, 10136);
INSERT INTO `t_authority_role_operation` VALUES (50394, 10171, 12146);
INSERT INTO `t_authority_role_operation` VALUES (50399, 10171, 12148);

-- ----------------------------
-- Table structure for t_authority_user
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_user`;
CREATE TABLE `t_authority_user`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自定义用户id',
  `userAccount` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号(登录用)',
  `userPassword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `userName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `lastLoginTime` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `lastLoginIp` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  `createTime` datetime(0) NOT NULL COMMENT '用户创建时间',
  `creatorUserAccount` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人的账号',
  `status` tinyint(3) NOT NULL COMMENT '状态(0无效1有效)',
  `isAdmin` tinyint(3) NULL DEFAULT 0 COMMENT '是否管理员(0否1是)',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_userAccount`(`userAccount`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10490 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_user
-- ----------------------------
INSERT INTO `t_authority_user` VALUES (10352, 'company_mina03', '4QrcOUm6Wau+VuBX8g+IPg==', 'company_mina03', NULL, NULL, '2019-05-17 09:08:44', '10.185.18.124', '2019-05-07 18:34:27', NULL, 1, 1, NULL);
INSERT INTO `t_authority_user` VALUES (10429, 'haper_center2', '4QrcOUm6Wau+VuBX8g+IPg==', 'haper_center2', NULL, NULL, '2019-05-17 15:23:35', '10.185.18.124', '2019-05-10 19:27:15', NULL, 1, 1, NULL);

-- ----------------------------
-- Table structure for t_authority_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_user_role`;
CREATE TABLE `t_authority_user_role`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '序列id',
  `userId` bigint(19) NULL DEFAULT NULL COMMENT '用户id',
  `roleId` bigint(19) NOT NULL COMMENT '角色id',
  `roleName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色机构类型',
  `institutionId` bigint(19) NULL DEFAULT NULL COMMENT '角色对应机构类型下的机构id',
  `institutionName` varchar(46) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色对应的机构名称',
  `createBy` bigint(19) NULL DEFAULT NULL COMMENT '创建人id',
  `createUser` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastUpdateBy` bigint(19) NULL DEFAULT NULL COMMENT '最后跟新人id',
  `lastUpdateUser` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人名称',
  `lastUpdateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10430 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_user_role
-- ----------------------------
INSERT INTO `t_authority_user_role` VALUES (10352, 10223, 10171, '御金融公司管理员角色', 'COMPNAY', 10065, 'B端公司', 1, '系统管理员', '2019-04-22 09:24:13', 1, '系统管理员', '2019-04-22 09:24:13');
INSERT INTO `t_authority_user_role` VALUES (10429, 10246, 10171, '御金融公司管理员角色', 'COMPANY', 10065, 'B端公司', 1, '系统管理员', '2019-04-30 10:45:00', 1, '系统管理员', '2019-04-30 14:29:52');

-- ----------------------------
-- Table structure for t_institution
-- ----------------------------
DROP TABLE IF EXISTS `t_institution`;
CREATE TABLE `t_institution`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `institutionTypeId` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型id',
  `detailInstitutionId` bigint(20) NULL DEFAULT NULL COMMENT '机构关联id',
  `detailInstitutionName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构关联名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10066 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_institution
-- ----------------------------
INSERT INTO `t_institution` VALUES (10065, 'COMPANY', 192418, '御金融机构');

-- ----------------------------
-- Table structure for t_institution_type
-- ----------------------------
DROP TABLE IF EXISTS `t_institution_type`;
CREATE TABLE `t_institution_type`  (
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构类型id',
  `institutionTypeName` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型名称',
  `sort` tinyint(3) NULL DEFAULT NULL COMMENT '类型排序',
  PRIMARY KEY (`institutionTypeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构类型预置表(预置机构类型标识)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_institution_type
-- ----------------------------
INSERT INTO `t_institution_type` VALUES ('COMPANY', '交易商', 3);
INSERT INTO `t_institution_type` VALUES ('GROUPS', '顶层公司', 1);
INSERT INTO `t_institution_type` VALUES ('SERVICE_OPERATE', '运营中心', 2);

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('admin', NULL, '$2a$10$WlcsKblH683c4wnMXVH23uMtj5lMv5CVuJKkkIk9qsBGffQjdEWfK', 'read_writer', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('app', NULL, '$2a$10$UJ2p2pENWWO3nKK1Aq2tmOZ2d.W6cIeGEPqDjGmuBUZTrUPKqIoOy', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');

-- ----------------------------
-- Table structure for t_seq
-- ----------------------------
DROP TABLE IF EXISTS `t_seq`;
CREATE TABLE `t_seq`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键标识',
  `nextId` bigint(21) NULL DEFAULT NULL COMMENT '下一个序列ID',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '序列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_seq
-- ----------------------------
INSERT INTO `t_seq` VALUES ('USER_NO', 105);

-- ----------------------------
-- Table structure for t_trade_account
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_account`;
CREATE TABLE `t_trade_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `accountNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易账号',
  `balance` double(12, 2) NULL DEFAULT NULL COMMENT '余额',
  `tradeGroupId` bigint(20) NOT NULL COMMENT '账户组ID',
  `active_time` datetime(0) NULL DEFAULT NULL COMMENT '开户时间',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:有效, 1:锁定, 2:禁用)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accountNo`(`accountNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_trade_deal
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_deal`;
CREATE TABLE `t_trade_deal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键, 唯一标识',
  `tradeOrderId` bigint(20) NOT NULL COMMENT '交易订单号',
  `accountId` bigint(20) NOT NULL COMMENT '交易账号ID',
  `stockId` bigint(20) NOT NULL COMMENT '股票ID',
  `stockMarket` tinyint(3) NULL DEFAULT NULL COMMENT '股票市场(0:上交所, 1:深交所,2:港股, 3:美股)',
  `execVolume` int(11) NULL DEFAULT NULL COMMENT '成交数量',
  `execPrice` double(8, 2) NULL DEFAULT NULL COMMENT '成交价格',
  `execTime` datetime(0) NULL DEFAULT NULL COMMENT '成交时间',
  `direction` tinyint(2) NOT NULL COMMENT '买卖方向',
  `profit` double(8, 2) NULL DEFAULT NULL COMMENT '盈亏',
  `commission` double(6, 2) NULL DEFAULT NULL COMMENT '佣金',
  `taxes` double(6, 2) NULL DEFAULT NULL COMMENT '税费',
  `status` tinyint(2) NOT NULL COMMENT '状态(0:有效,1:无效)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accountId`(`accountId`) USING BTREE,
  INDEX `idx_orderId`(`tradeOrderId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '成交记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_trade_global_config
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_global_config`;
CREATE TABLE `t_trade_global_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置项编号',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编号(BASIC:基础配置, BUSINESS: 业务配置,  SYSTEM:系统项配置)',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置项的值',
  `status` tinyint(2) NOT NULL COMMENT '状态(0:启用, 1:禁用)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_key`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统全局配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_global_config
-- ----------------------------
INSERT INTO `t_trade_global_config` VALUES (1, 'REG_OPEN_ACCOUNT', 'SYSTEM', 'N', 0);

-- ----------------------------
-- Table structure for t_trade_group
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_group`;
CREATE TABLE `t_trade_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `groupNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户组编号',
  `groupName` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户组名称',
  `currency` double(12, 2) NULL DEFAULT NULL COMMENT '交易币种(CNY:人民币, HKD:港币,USD:美元)',
  `companyId` bigint(20) NOT NULL COMMENT '公司ID',
  `commission_rate` double(2, 2) NULL DEFAULT NULL COMMENT '佣金比例, 单位:%',
  `taxes_rate` double(2, 2) NULL DEFAULT NULL COMMENT '税费比例, 单位:%',
  `level` tinyint(3) NULL DEFAULT NULL COMMENT '账户等级(0:普通,1:VIP)',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:启用, 1:禁用)',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupNo`(`groupNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_trade_order
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_order`;
CREATE TABLE `t_trade_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `accountId` bigint(20) NOT NULL COMMENT '交易账号ID',
  `stockId` bigint(20) NOT NULL COMMENT '股票ID',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:待成交, 1:部分成交, 2:完全成交, 3:手工撤单, 4:系统撤单)',
  `type` tinyint(3) NOT NULL COMMENT '挂单类型(0:市价单, 1:限价单)',
  `direction` tinyint(2) NOT NULL COMMENT '买卖方向',
  `initVolume` int(11) NOT NULL COMMENT '挂单的数量',
  `execVolume` int(11) NULL DEFAULT NULL COMMENT '成交数量',
  `execPrice` double(8, 2) NULL DEFAULT NULL COMMENT '成交价格',
  `execTime` datetime(0) NULL DEFAULT NULL COMMENT '成交时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account_id`(`accountId`) USING BTREE,
  INDEX `idx_stockid`(`stockId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_trade_position
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_position`;
CREATE TABLE `t_trade_position`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键, 唯一标识',
  `tradeOrderId` bigint(20) NOT NULL COMMENT '交易订单号',
  `accountId` bigint(20) NOT NULL COMMENT '交易账号ID',
  `stockId` bigint(20) NOT NULL COMMENT '股票ID',
  `costPrice` double(8, 2) NULL DEFAULT NULL COMMENT '成本价',
  `volume` int(11) NOT NULL COMMENT '持仓数量',
  `stockMarket` tinyint(3) NULL DEFAULT NULL COMMENT '股票市场(0: 上交所, 1:深交所,2:港股, 3:美股)',
  `avgPrice` double(6, 2) NOT NULL COMMENT '成交均价',
  `validSellVolume` int(11) NULL DEFAULT NULL COMMENT '可卖数量(T+1制度使用)',
  `profit` double(8, 2) NULL DEFAULT NULL COMMENT '盈亏',
  `execTime` datetime(0) NULL DEFAULT NULL COMMENT '成交时间',
  `status` tinyint(2) NOT NULL COMMENT '状态(0:有效,1:无效)',
  `interest` double(8, 2) NULL DEFAULT NULL COMMENT '持仓累计利息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accountId`(`accountId`) USING BTREE,
  INDEX `idx_orderId`(`tradeOrderId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_trade_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_stock`;
CREATE TABLE `t_trade_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票编号',
  `categoryId` bigint(20) NOT NULL COMMENT '股票分类ID',
  `marketNo` tinyint(3) NULL DEFAULT NULL COMMENT '股票市场(0: 上交所, 1:深交所,2:港股, 3:美股)',
  `currency` double(12, 2) NULL DEFAULT NULL COMMENT '交易币种(CNY:人民币, HKD:港币,USD:美元)',
  `unit` int(11) NOT NULL DEFAULT 100 COMMENT '股票单位(默认为:100)',
  `tag` tinyint(3) NULL DEFAULT NULL COMMENT '标签(0:普通, 1:热门)',
  `status` tinyint(2) NOT NULL COMMENT '状态(0:启用, 1:禁用)',
  `marketSource` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行情来源',
  `display_order` int(11) NULL DEFAULT NULL COMMENT '显示顺序, 升序排列',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_trade_stock_category
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_stock_category`;
CREATE TABLE `t_trade_stock_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编号',
  `status` tinyint(2) NOT NULL COMMENT '状态(0:启用, 1:禁用)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_trade_user
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_user`;
CREATE TABLE `t_trade_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `userNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `userPwd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `companyId` bigint(20) NULL DEFAULT NULL COMMENT '公司ID',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `lastLoginIp` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近一次用户登陆IP',
  `lastLoginTime` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:有效, 1:锁定, 2:禁用)',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userNo`(`userNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_user
-- ----------------------------
INSERT INTO `t_trade_user` VALUES (1, 'admin', 'admin', '$2a$10$DwPT.LbjQMHad/dJrgjJ0etA7lB7Z.PHAFq48.ri8d8OGf7dremi2', '123', 1, 'test2', NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user` VALUES (8, 'test', 'test123', '$2a$10$DwPT.LbjQMHad/dJrgjJ0etA7lB7Z.PHAFq48.ri8d8OGf7dremi2', '13800', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user` VALUES (10, '00000102', 'test123', 'test', '138001', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user` VALUES (11, '00000103', 'test123123', '123', '23213121', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user` VALUES (12, '00000104', 'test1', '123456', '13800138000', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user` VALUES (23, '00000115', '', '1qaz2w', '15011039537', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user` VALUES (24, '00000105', 'test1234', '4QrcOUm6Wau+VuBX8g+IPg==', '13800138001', NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for t_trade_user_file
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_user_file`;
CREATE TABLE `t_trade_user_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `userId` bigint(16) NOT NULL COMMENT '用户ID',
  `bizType` tinyint(3) NOT NULL COMMENT '业务类型(0:身份证, 1:银行卡, 2:信用卡)',
  `fileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件ID',
  `filename` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `fileType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `filePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:有效, 1:无效)',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_user_file
-- ----------------------------
INSERT INTO `t_trade_user_file` VALUES (1, 1, 0, '1154689090281672704', '1563872639386.png', 'image/png', NULL, 0, '2019-07-26 04:02:10', '2019-07-27 01:02:05');

SET FOREIGN_KEY_CHECKS = 1;
