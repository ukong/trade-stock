DROP DATABASE IF EXISTS `trade_stock`;
CREATE DATABASE `trade_stock` CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
USE `trade_stock`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

SET NAMES utf8mb4;
SET
    FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`
(
    `client_id`               varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `resource_ids`            varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `client_secret`           varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `scope`                   varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `authorized_grant_types`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `authorities`             varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `access_token_validity`   int(11)                                                  NULL DEFAULT NULL,
    `refresh_token_validity`  int(11)                                                  NULL DEFAULT NULL,
    `additional_information`  varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `autoapprove`             varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details`
VALUES ('admin', NULL, '$2a$10$WlcsKblH683c4wnMXVH23uMtj5lMv5CVuJKkkIk9qsBGffQjdEWfK', 'read_writer',
        'password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details`
VALUES ('app', NULL, '$2a$10$E7K8.NbyZCt.mW4Qo.P1veLCOdICkqLN3As.oSg/He/VGVDsZEN5G', 'server', 'password,refresh_token',
        NULL, NULL, NULL, NULL, NULL, 'true');

-- ----------------------------
-- Table structure for t_authority_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_menu`;
CREATE TABLE `t_authority_menu`
(
    `id`                bigint(19)                                              NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `parentId`          bigint(19)                                              NOT NULL COMMENT '??????menu_id',
    `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????id',
    `menuCode`          varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
    `menuName`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????',
    `menuUri`           varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????URI',
    `menuLevel`         tinyint(3)                                              NOT NULL COMMENT '????????????',
    `operationSecurity` tinyint(3)                                              NOT NULL COMMENT '????????????????????????(0?????????(??????), 1??????)',
    `menuSeq`           tinyint(3)                                              NOT NULL COMMENT '????????????',
    `menuIco`           varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `status`            tinyint(3)                                              NOT NULL COMMENT '????????????(0??????,1??????)',
    `isOpen`            tinyint(3)                                              NULL DEFAULT 0 COMMENT '??????2???????????????.0??????,1??????',
    `isShow`            tinyint(3)                                              NULL DEFAULT NULL COMMENT '???????????? (0--???  1--???)',
    `componentSrc`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????(??????????????????)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_authority_menu
-- ----------------------------
INSERT INTO `t_authority_menu`
VALUES (1, -1, 'COMPANY', 'Sys', '????????????', '/sys', 0, 1, 0, 'example', 1, 0, 1, 'Layout');
INSERT INTO `t_authority_menu`
VALUES (2, 1, 'COMPANY', 'SysAdmin', '????????????', '/sys/admin', 0, 1, 0, 'table', 1, 0, 1, '/sysAdmin/index');
INSERT INTO `t_authority_menu`
VALUES (3, 1, 'COMPANY', 'SysAccess', '????????????', 'access', 0, 1, 2, 'table', 1, 0, 1, '/sysAccess/index');
INSERT INTO `t_authority_menu`
VALUES (4, 1, 'COMPANY', 'SysRole', '????????????', 'role', 0, 1, 1, 'table', 1, 0, 1, '/sysRole/index');

-- ----------------------------
-- Table structure for t_authority_menu_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_menu_operation`;
CREATE TABLE `t_authority_menu_operation`
(
    `id`                  bigint(19)                                               NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `menuId`              bigint(19)                                               NULL DEFAULT NULL COMMENT '???????????????id',
    `operationName`       varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '????????????',
    `operationUri`        varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '??????URI??????',
    `operationIco`        varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '????????????',
    `status`              tinyint(3)                                               NOT NULL COMMENT '??????(0??????1??????)',
    `operationResouceUrl` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????url',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `fkmenuId` (`menuId`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 12149
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '???????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_authority_menu_operation
-- ----------------------------
INSERT INTO `t_authority_menu_operation`
VALUES (10123, 2, '??????', 'add', NULL, 1, '23424');
INSERT INTO `t_authority_menu_operation`
VALUES (10124, 2, '??????', 'update', NULL, 1, '1312');
INSERT INTO `t_authority_menu_operation`
VALUES (10125, 2, '??????', 'delete', NULL, 1, '23432');
INSERT INTO `t_authority_menu_operation`
VALUES (10126, 2, '????????????', 'reset', NULL, 1, '242');
INSERT INTO `t_authority_menu_operation`
VALUES (10127, 2, '??????/??????', 'disable', NULL, 1, '23424');
INSERT INTO `t_authority_menu_operation`
VALUES (10128, 3, '????????????', 'addMenu', NULL, 1, '3242');
INSERT INTO `t_authority_menu_operation`
VALUES (10129, 3, '??????', 'addIurisdiction', NULL, 1, '2343242');
INSERT INTO `t_authority_menu_operation`
VALUES (10130, 3, '????????????', 'updateMenu', NULL, 1, '23424');
INSERT INTO `t_authority_menu_operation`
VALUES (10131, 3, '??????', 'updateIurisdiction', NULL, 1, '242');
INSERT INTO `t_authority_menu_operation`
VALUES (10132, 3, '????????????', 'deleteMenu', NULL, 1, '2343242');
INSERT INTO `t_authority_menu_operation`
VALUES (10133, 4, '??????', 'add', NULL, 1, '1312');
INSERT INTO `t_authority_menu_operation`
VALUES (10134, 4, '??????', 'update', NULL, 1, '2342');
INSERT INTO `t_authority_menu_operation`
VALUES (10135, 4, '??????', 'privileges', NULL, 1, '234');
INSERT INTO `t_authority_menu_operation`
VALUES (10136, 4, '??????', 'delete', NULL, 1, '23424');
INSERT INTO `t_authority_menu_operation`
VALUES (12146, 2, '????????????', 'pageView', NULL, 1, 'pageView');
INSERT INTO `t_authority_menu_operation`
VALUES (12147, 3, '????????????', 'pageView', NULL, 1, 'pageView');
INSERT INTO `t_authority_menu_operation`
VALUES (12148, 4, '????????????', 'pageView', NULL, 1, 'pageView');

-- ----------------------------
-- Table structure for t_authority_no_limit_uri
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_no_limit_uri`;
CREATE TABLE `t_authority_no_limit_uri`
(
    `id`         bigint(19)                                              NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `noLimitUri` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????uri',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_noLimitUri` (`noLimitUri`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '???????????????(??????????????????)'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_authority_no_limit_uri
-- ----------------------------

-- ----------------------------
-- Table structure for t_authority_role
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_role`;
CREATE TABLE `t_authority_role`
(
    `id`                bigint(19)                                              NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????id',
    `institutionId`     bigint(19)                                              NULL DEFAULT NULL COMMENT '??????????????????????????????id',
    `roleName`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????',
    `roleDec`           varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
    `isAdmin`           tinyint(3)                                              NULL DEFAULT 0 COMMENT '1:???????????????????????????,0: ????????????',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10172
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_authority_role
-- ----------------------------
INSERT INTO `t_authority_role`
VALUES (1, 'GROUPS', 9999, 'admin', ' ?????????', 1);
INSERT INTO `t_authority_role`
VALUES (10171, 'COMPANY', 10065, '??????????????????????????????', '1', 1);

-- ----------------------------
-- Table structure for t_authority_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_role_menu`;
CREATE TABLE `t_authority_role_menu`
(
    `id`     bigint(19) NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `roleId` bigint(19) NOT NULL COMMENT '???????????????id',
    `menuId` bigint(19) NOT NULL COMMENT '??????id',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `index_roleId_menuId` (`roleId`, `menuId`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 23646
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '?????????????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_authority_role_menu
-- ----------------------------
INSERT INTO `t_authority_role_menu`
VALUES (23645, 10171, 1);
INSERT INTO `t_authority_role_menu`
VALUES (23579, 10171, 2);
INSERT INTO `t_authority_role_menu`
VALUES (23580, 10171, 4);

-- ----------------------------
-- Table structure for t_authority_role_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_role_operation`;
CREATE TABLE `t_authority_role_operation`
(
    `id`          bigint(19) NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `roleId`      bigint(19) NULL DEFAULT NULL COMMENT '???????????????id',
    `operationId` bigint(19) NULL DEFAULT NULL COMMENT '???????????????id',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `fk_operation_role_id` (`operationId`, `roleId`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 50400
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '?????????????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_authority_role_operation
-- ----------------------------
INSERT INTO `t_authority_role_operation`
VALUES (50389, 10171, 10123);
INSERT INTO `t_authority_role_operation`
VALUES (50390, 10171, 10124);
INSERT INTO `t_authority_role_operation`
VALUES (50391, 10171, 10125);
INSERT INTO `t_authority_role_operation`
VALUES (50392, 10171, 10126);
INSERT INTO `t_authority_role_operation`
VALUES (50393, 10171, 10127);
INSERT INTO `t_authority_role_operation`
VALUES (50395, 10171, 10133);
INSERT INTO `t_authority_role_operation`
VALUES (50396, 10171, 10134);
INSERT INTO `t_authority_role_operation`
VALUES (50397, 10171, 10135);
INSERT INTO `t_authority_role_operation`
VALUES (50398, 10171, 10136);
INSERT INTO `t_authority_role_operation`
VALUES (50394, 10171, 12146);
INSERT INTO `t_authority_role_operation`
VALUES (50399, 10171, 12148);

-- ----------------------------
-- Table structure for t_authority_user
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_user`;
CREATE TABLE `t_authority_user`
(
    `id`                 bigint(19)                                              NOT NULL AUTO_INCREMENT COMMENT '???????????????id',
    `userAccount`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????(?????????)',
    `userPassword`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????',
    `userName`           varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????',
    `phone`              varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????',
    `email`              varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '??????',
    `lastLoginTime`      datetime                                                NULL DEFAULT NULL COMMENT '??????????????????',
    `lastLoginIp`        varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????IP',
    `createTime`         datetime                                                NOT NULL COMMENT '??????????????????',
    `creatorUserAccount` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '??????????????????',
    `status`             tinyint(3)                                              NOT NULL COMMENT '??????(0??????1??????)',
    `isAdmin`            tinyint(3)                                              NULL DEFAULT 0 COMMENT '???????????????(0???1???)',
    `remark`             varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_userAccount` (`userAccount`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10490
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_authority_user
-- ----------------------------
INSERT INTO `t_authority_user`
VALUES (10352, 'company_mina03', '$2a$10$j8e0.JsACxELrw4QxZPSO.Syxik/IbRRm4ZGu8BF2nMEk0ecF3EGu', 'company_mina03', NULL,
        NULL, '2019-05-17 09:08:44', '10.185.18.124', '2019-05-07 18:34:27', NULL, 1, 1, NULL);
INSERT INTO `t_authority_user`
VALUES (10429, 'haper_center2', '4QrcOUm6Wau+VuBX8g+IPg==', 'haper_center2', NULL, NULL, '2019-05-17 15:23:35',
        '10.185.18.124', '2019-05-10 19:27:15', NULL, 1, 1, NULL);

-- ----------------------------
-- Table structure for t_authority_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_user_role`;
CREATE TABLE `t_authority_user_role`
(
    `id`                bigint(19)                                             NOT NULL AUTO_INCREMENT COMMENT '??????id',
    `userId`            bigint(19)                                             NULL     DEFAULT NULL COMMENT '??????id',
    `roleId`            bigint(19)                                             NOT NULL COMMENT '??????id',
    `roleName`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '????????????',
    `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '??????????????????',
    `institutionId`     bigint(19)                                             NULL     DEFAULT NULL COMMENT '????????????????????????????????????id',
    `institutionName`   varchar(46) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '???????????????????????????',
    `createBy`          bigint(19)                                             NULL     DEFAULT NULL COMMENT '?????????id',
    `createUser`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '???????????????',
    `createTime`        datetime                                               NULL     DEFAULT NULL COMMENT '????????????',
    `lastUpdateBy`      bigint(19)                                             NULL     DEFAULT NULL COMMENT '???????????????id',
    `lastUpdateUser`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '?????????????????????',
    `lastUpdateTime`    datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10430
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '?????????????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_authority_user_role
-- ----------------------------
INSERT INTO `t_authority_user_role`
VALUES (10352, 10223, 10171, '??????????????????????????????', 'COMPNAY', 10065, 'B?????????', 1, '???????????????', '2019-04-22 09:24:13', 1, '???????????????',
        '2019-04-22 09:24:13');
INSERT INTO `t_authority_user_role`
VALUES (10429, 10246, 10171, '??????????????????????????????', 'COMPANY', 10065, 'B?????????', 1, '???????????????', '2019-04-30 10:45:00', 1, '???????????????',
        '2019-04-30 14:29:52');

-- ----------------------------
-- Table structure for t_institution
-- ----------------------------
DROP TABLE IF EXISTS `t_institution`;
CREATE TABLE `t_institution`
(
    `id`                    bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '??????id',
    `institutionTypeId`     varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '????????????id',
    `detailInstitutionId`   bigint(20)                                              NULL DEFAULT NULL COMMENT '????????????id',
    `detailInstitutionName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10066
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_institution
-- ----------------------------
INSERT INTO `t_institution`
VALUES (10065, 'COMPANY', 192418, '???????????????');

-- ----------------------------
-- Table structure for t_institution_type
-- ----------------------------
DROP TABLE IF EXISTS `t_institution_type`;
CREATE TABLE `t_institution_type`
(
    `institutionTypeId`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????id',
    `institutionTypeName` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
    `sort`                tinyint(3)                                             NULL DEFAULT NULL COMMENT '????????????',
    PRIMARY KEY (`institutionTypeId`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '?????????????????????(????????????????????????)'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_institution_type
-- ----------------------------
INSERT INTO `t_institution_type`
VALUES ('COMPANY', '?????????', 3);
INSERT INTO `t_institution_type`
VALUES ('GROUPS', '????????????', 1);
INSERT INTO `t_institution_type`
VALUES ('SERVICE_OPERATE', '????????????', 2);

-- ----------------------------
-- Table structure for t_seq
-- ----------------------------
DROP TABLE IF EXISTS `t_seq`;
CREATE TABLE `t_seq`
(
    `code`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '????????????',
    `nextId` bigint(21)                                                   NULL DEFAULT NULL COMMENT '???????????????ID',
    PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_seq
-- ----------------------------
INSERT INTO `t_seq`
VALUES ('USER_NO', 105);

-- ----------------------------
-- Table structure for t_trade_account
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_account`;
CREATE TABLE `t_trade_account`
(
    `id`           bigint(20)                                                   NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `accountNo`    varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '????????????',
    `balance`      double(12, 2)                                                NULL DEFAULT NULL COMMENT '??????',
    `tradeGroupId` bigint(20)                                                   NOT NULL COMMENT '?????????ID',
    `active_time`  datetime                                                     NULL DEFAULT NULL COMMENT '????????????',
    `status`       tinyint(3)                                                   NOT NULL COMMENT '??????(0:??????, 1:??????, 2:??????)',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_accountNo` (`accountNo`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '???????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_account
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_deal
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_deal`;
CREATE TABLE `t_trade_deal`
(
    `id`           bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '??????, ????????????',
    `tradeOrderId` bigint(20)   NOT NULL COMMENT '???????????????',
    `accountId`    bigint(20)   NOT NULL COMMENT '????????????ID',
    `stockId`      bigint(20)   NOT NULL COMMENT '??????ID',
    `stockMarket`  tinyint(3)   NULL DEFAULT NULL COMMENT '????????????(0:?????????, 1:?????????,2:??????, 3:??????)',
    `execVolume`   int(11)      NULL DEFAULT NULL COMMENT '????????????',
    `execPrice`    double(8, 2) NULL DEFAULT NULL COMMENT '????????????',
    `execTime`     datetime     NULL DEFAULT NULL COMMENT '????????????',
    `direction`    tinyint(2)   NOT NULL COMMENT '????????????',
    `profit`       double(8, 2) NULL DEFAULT NULL COMMENT '??????',
    `commission`   double(6, 2) NULL DEFAULT NULL COMMENT '??????',
    `taxes`        double(6, 2) NULL DEFAULT NULL COMMENT '??????',
    `status`       tinyint(2)   NOT NULL COMMENT '??????(0:??????,1:??????)',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_accountId` (`accountId`) USING BTREE,
    INDEX `idx_orderId` (`tradeOrderId`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '???????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_deal
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_global_config
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_global_config`;
CREATE TABLE `t_trade_global_config`
(
    `id`       bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `code`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '???????????????',
    `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '????????????(BASIC:????????????, BUSINESS: ????????????,  SYSTEM:???????????????)',
    `value`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '???????????????',
    `status`   tinyint(2)                                                    NOT NULL COMMENT '??????(0:??????, 1:??????)',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_key` (`code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '?????????????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_global_config
-- ----------------------------
INSERT INTO `t_trade_global_config`
VALUES (1, 'REG_OPEN_ACCOUNT', 'SYSTEM', 'N', 0);

-- ----------------------------
-- Table structure for t_trade_group
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_group`;
CREATE TABLE `t_trade_group`
(
    `id`              bigint(20)                                                   NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `groupNo`         varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '???????????????',
    `groupName`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '???????????????',
    `currency`        double(12, 2)                                                NULL DEFAULT NULL COMMENT '????????????(CNY:?????????, HKD:??????,USD:??????)',
    `companyId`       bigint(20)                                                   NOT NULL COMMENT '??????ID',
    `commission_rate` double(2, 2)                                                 NULL DEFAULT NULL COMMENT '????????????, ??????:%',
    `taxes_rate`      double(2, 2)                                                 NULL DEFAULT NULL COMMENT '????????????, ??????:%',
    `level`           tinyint(3)                                                   NULL DEFAULT NULL COMMENT '????????????(0:??????,1:VIP)',
    `status`          tinyint(3)                                                   NOT NULL COMMENT '??????(0:??????, 1:??????)',
    `createTime`      datetime                                                     NULL DEFAULT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_groupNo` (`groupNo`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_order
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_order`;
CREATE TABLE `t_trade_order`
(
    `id`         bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `accountId`  bigint(20)   NOT NULL COMMENT '????????????ID',
    `stockId`    bigint(20)   NOT NULL COMMENT '??????ID',
    `status`     tinyint(3)   NOT NULL COMMENT '??????(0:?????????, 1:????????????, 2:????????????, 3:????????????, 4:????????????)',
    `type`       tinyint(3)   NOT NULL COMMENT '????????????(0:?????????, 1:?????????)',
    `direction`  tinyint(2)   NOT NULL COMMENT '????????????',
    `initVolume` int(11)      NOT NULL COMMENT '???????????????',
    `execVolume` int(11)      NULL DEFAULT NULL COMMENT '????????????',
    `execPrice`  double(8, 2) NULL DEFAULT NULL COMMENT '????????????',
    `execTime`   datetime     NULL DEFAULT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_account_id` (`accountId`) USING BTREE,
    INDEX `idx_stockid` (`stockId`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_position
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_position`;
CREATE TABLE `t_trade_position`
(
    `id`              bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '??????, ????????????',
    `tradeOrderId`    bigint(20)   NOT NULL COMMENT '???????????????',
    `accountId`       bigint(20)   NOT NULL COMMENT '????????????ID',
    `stockId`         bigint(20)   NOT NULL COMMENT '??????ID',
    `costPrice`       double(8, 2) NULL DEFAULT NULL COMMENT '?????????',
    `volume`          int(11)      NOT NULL COMMENT '????????????',
    `stockMarket`     tinyint(3)   NULL DEFAULT NULL COMMENT '????????????(0: ?????????, 1:?????????,2:??????, 3:??????)',
    `avgPrice`        double(6, 2) NOT NULL COMMENT '????????????',
    `validSellVolume` int(11)      NULL DEFAULT NULL COMMENT '????????????(T+1????????????)',
    `profit`          double(8, 2) NULL DEFAULT NULL COMMENT '??????',
    `execTime`        datetime     NULL DEFAULT NULL COMMENT '????????????',
    `status`          tinyint(2)   NOT NULL COMMENT '??????(0:??????,1:??????)',
    `interest`        double(8, 2) NULL DEFAULT NULL COMMENT '??????????????????',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_accountId` (`accountId`) USING BTREE,
    INDEX `idx_orderId` (`tradeOrderId`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_position
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_stock`;
CREATE TABLE `t_trade_stock`
(
    `id`            bigint(20)                                                   NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `name`          varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '??????',
    `code`          varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '????????????',
    `categoryId`    bigint(20)                                                   NOT NULL COMMENT '????????????ID',
    `marketNo`      tinyint(3)                                                   NULL     DEFAULT NULL COMMENT '????????????(0: ?????????, 1:?????????,2:??????, 3:??????)',
    `currency`      double(12, 2)                                                NULL     DEFAULT NULL COMMENT '????????????(CNY:?????????, HKD:??????,USD:??????)',
    `unit`          int(11)                                                      NOT NULL DEFAULT 100 COMMENT '????????????(?????????:100)',
    `tag`           tinyint(3)                                                   NULL     DEFAULT NULL COMMENT '??????(0:??????, 1:??????)',
    `status`        tinyint(2)                                                   NOT NULL COMMENT '??????(0:??????, 1:??????)',
    `marketSource`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '????????????',
    `display_order` int(11)                                                      NULL     DEFAULT NULL COMMENT '????????????, ????????????',
    `updateTime`    datetime                                                     NULL     DEFAULT NULL COMMENT '????????????',
    `createTime`    datetime                                                     NULL     DEFAULT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `idx_code` (`code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '???????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_stock
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_stock_category
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_stock_category`;
CREATE TABLE `t_trade_stock_category`
(
    `id`     bigint(20)                                                   NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `name`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????',
    `code`   varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '????????????',
    `status` tinyint(2)                                                   NOT NULL COMMENT '??????(0:??????, 1:??????)',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_code` (`code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '???????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_stock_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_trade_user
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_user`;
CREATE TABLE `t_trade_user`
(
    `id`            bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `userNo`        varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '????????????',
    `name`          varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '????????????',
    `userPwd`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '????????????',
    `phone`         varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '????????????',
    `companyId`     bigint(20)                                                    NULL DEFAULT NULL COMMENT '??????ID',
    `email`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '??????',
    `address`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????',
    `lastLoginIp`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '????????????????????????IP',
    `lastLoginTime` datetime                                                      NULL DEFAULT NULL COMMENT '????????????????????????',
    `status`        tinyint(3)                                                    NOT NULL COMMENT '??????(0:??????, 1:??????, 2:??????)',
    `createTime`    datetime                                                      NULL DEFAULT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_userNo` (`userNo`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 25
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_user
-- ----------------------------
INSERT INTO `t_trade_user`
VALUES (1, 'admin', 'admin', '$2a$10$j8e0.JsACxELrw4QxZPSO.Syxik/IbRRm4ZGu8BF2nMEk0ecF3EGu', '123', 1, 'test2', NULL,
        NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user`
VALUES (8, 'test', 'test123', '$2a$10$DwPT.LbjQMHad/dJrgjJ0etA7lB7Z.PHAFq48.ri8d8OGf7dremi2', '13800', NULL, NULL, NULL,
        NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user`
VALUES (10, '00000102', 'test123', 'test', '138001', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user`
VALUES (11, '00000103', 'test123123', '123', '23213121', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user`
VALUES (12, '00000104', 'test1', '123456', '13800138000', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user`
VALUES (23, '00000115', '', '1qaz2w', '15011039537', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_trade_user`
VALUES (24, '00000105', 'test1234', '4QrcOUm6Wau+VuBX8g+IPg==', '13800138001', NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for t_trade_user_file
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_user_file`;
CREATE TABLE `t_trade_user_file`
(
    `id`         bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '????????????',
    `userId`     bigint(16)                                                    NOT NULL COMMENT '??????ID',
    `bizType`    tinyint(3)                                                    NOT NULL COMMENT '????????????(0:?????????, 1:?????????, 2:?????????)',
    `fileId`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '??????ID',
    `filename`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '????????????',
    `fileType`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '????????????',
    `filePath`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '????????????',
    `status`     tinyint(3)                                                    NOT NULL COMMENT '??????(0:??????, 1:??????)',
    `createTime` datetime                                                      NULL     DEFAULT NULL COMMENT '????????????',
    `updateTime` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_userId` (`userId`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '???????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_trade_user_file
-- ----------------------------
INSERT INTO `t_trade_user_file`
VALUES (1, 1, 0, '1154689090281672704', '1563872639386.png', 'image/png', NULL, 0, '2019-07-26 04:02:10',
        '2019-07-27 01:02:05');

SET
    FOREIGN_KEY_CHECKS = 1;
