/*
 Navicat Premium Data Transfer

 Source Server         : 1panel-从-230
 Source Server Type    : MySQL
 Source Server Version : 50743 (5.7.43-log)
 Source Host           : 192.168.2.230:33306
 Source Schema         : xunxian

 Target Server Type    : MySQL
 Target Server Version : 50743 (5.7.43-log)
 File Encoding         : 65001

 Date: 22/09/2025 14:13:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for boss
-- ----------------------------
DROP TABLE IF EXISTS `boss`;
CREATE TABLE `boss`  (
  `bossname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `bossinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `bosslv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `bosshp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `bossmaxhp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `bossgj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `bossfy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `bossbj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `bossxx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `bosszb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `bossdj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `bossid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bs` int(255) NOT NULL DEFAULT 0,
  `bosstime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`bossid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of boss
-- ----------------------------

-- ----------------------------
-- Table structure for club
-- ----------------------------
DROP TABLE IF EXISTS `club`;
CREATE TABLE `club`  (
  `clubname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '帮派名称',
  `clubinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '帮派信息',
  `clublv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '帮派等级',
  `clubid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `clubno1` int(11) NOT NULL DEFAULT 0 COMMENT '帮派排名',
  `clubexp` int(11) NOT NULL DEFAULT 0 COMMENT '帮派建设度',
  `clubyxb` int(11) NOT NULL DEFAULT 0 COMMENT '灵石',
  `clubczb` int(11) NOT NULL DEFAULT 0 COMMENT '极品灵石',
  `clubautosh` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动审核',
  `clubupexp` int(11) NOT NULL DEFAULT 0 COMMENT '升级经验',
  `clubmxsum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '20' COMMENT '可以容纳的人数',
  PRIMARY KEY (`clubid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of club
-- ----------------------------
INSERT INTO `club` VALUES ('天下第一', '天下第一宗', '3', 4, 1, 9498, 9978281, 595, 1, 12000, '40');

-- ----------------------------
-- Table structure for clubplayer
-- ----------------------------
DROP TABLE IF EXISTS `clubplayer`;
CREATE TABLE `clubplayer`  (
  `clubid` int(11) NOT NULL DEFAULT 0 COMMENT '门派ID',
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `uclv` int(11) NOT NULL DEFAULT 0 COMMENT '用户职位',
  `qiandao` date NULL DEFAULT NULL COMMENT '签到时间',
  `clubexp` int(11) NOT NULL DEFAULT 0 COMMENT '帮派建设度',
  `gongxian` date NULL DEFAULT NULL COMMENT '贡献时间',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clubplayer
-- ----------------------------
INSERT INTO `clubplayer` VALUES (4, '013d42d65da0f8ee68846964853018c2', 2, 6, NULL, 0, NULL);
INSERT INTO `clubplayer` VALUES (4, '96c35b991f08a8a0179f2da27f08a500', 1, 1, '2025-07-08', 957997, '2025-07-05');

-- ----------------------------
-- Table structure for clubplayerapply
-- ----------------------------
DROP TABLE IF EXISTS `clubplayerapply`;
CREATE TABLE `clubplayerapply`  (
  `clubid` int(11) NOT NULL COMMENT '门派ID',
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '申请加入' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clubplayerapply
-- ----------------------------

-- ----------------------------
-- Table structure for clubstore
-- ----------------------------
DROP TABLE IF EXISTS `clubstore`;
CREATE TABLE `clubstore`  (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `wpid` int(11) NOT NULL COMMENT '物品ID',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '物品类型 0-道具 1-药品 2-装备 3-宠物',
  `price` int(11) NOT NULL DEFAULT 1 COMMENT '价格',
  `clublv` int(11) NOT NULL DEFAULT 0 COMMENT '门派等级',
  PRIMARY KEY (`csid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clubstore
-- ----------------------------
INSERT INTO `clubstore` VALUES (1, 1, 1, 20, 0);
INSERT INTO `clubstore` VALUES (2, 10, 2, 5000, 1);
INSERT INTO `clubstore` VALUES (3, 11, 2, 10000, 2);
INSERT INTO `clubstore` VALUES (4, 48, 3, 10000, 2);

-- ----------------------------
-- Table structure for clubwarehouse
-- ----------------------------
DROP TABLE IF EXISTS `clubwarehouse`;
CREATE TABLE `clubwarehouse`  (
  `cwid` int(11) NOT NULL AUTO_INCREMENT,
  `clubid` int(11) NOT NULL COMMENT '门派ID',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '物品类型',
  `num` int(11) NOT NULL COMMENT '物品数量',
  `price` int(11) NOT NULL DEFAULT 0 COMMENT '价格',
  `uclv` int(11) NOT NULL DEFAULT 0 COMMENT '职位',
  `attribute` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品属性',
  PRIMARY KEY (`cwid`) USING BTREE,
  INDEX `idx_clubid`(`clubid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clubwarehouse
-- ----------------------------
INSERT INTO `clubwarehouse` VALUES (11, 4, 'zb', 1, 1000, 6, '{\"zbname\":\"\\u519b\\u5b98\\u964c\\u5200\",\"zbinfo\":\"\\u519b\\u5b98\\u964c\\u5200\",\"zbgj\":\"30\",\"zbfy\":\"0\",\"zbbj\":\"5\",\"zbxx\":\"4\",\"zbid\":\"48\",\"uid\":\"1\",\"zbnowid\":\"46\",\"qianghua\":\"0\",\"zbhp\":\"0\",\"zblv\":\"0\",\"tool\":\"0\"}');
INSERT INTO `clubwarehouse` VALUES (13, 4, 'dj', 100, 1000, 6, '{\"djnowid\":\"1\",\"djname\":\"\\u5f3a\\u5316\\u77f3\",\"djzl\":\"2\",\"djinfo\":\"\\u5f3a\\u5316\\u88c5\\u5907\\u7528\\u7684\\u9053\\u5177\",\"djid\":\"1\",\"djsum\":\"879629\",\"djyxb\":null}');
INSERT INTO `clubwarehouse` VALUES (15, 4, 'dj', 1, 1, 6, '{\"djnowid\":\"1\",\"djname\":\"\\u5f3a\\u5316\\u77f3\",\"djzl\":\"2\",\"djinfo\":\"\\u5f3a\\u5316\\u88c5\\u5907\\u7528\\u7684\\u9053\\u5177\",\"djid\":\"1\",\"djsum\":\"879528\",\"djyxb\":null}');

-- ----------------------------
-- Table structure for clubxujing
-- ----------------------------
DROP TABLE IF EXISTS `clubxujing`;
CREATE TABLE `clubxujing`  (
  `xjid` int(11) NOT NULL AUTO_INCREMENT,
  `xjname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '虚境名称',
  `xjinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '虚境描述',
  `clublv` int(11) NOT NULL DEFAULT 0 COMMENT '门派等级',
  `duplicates` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-允许重复挑战 1-一次性副本',
  `challenge` int(11) NOT NULL DEFAULT 0 COMMENT '挑战次数（一次性副本无效）',
  PRIMARY KEY (`xjid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clubxujing
-- ----------------------------
INSERT INTO `clubxujing` VALUES (1, '每日任务', '说明：每天可以接取一轮任务，每轮10个任务，完成每个任务均会获得奖励，当完成一轮后将获得大量奖励！', 0, 0, 10);
INSERT INTO `clubxujing` VALUES (2, '无尽挑战', '说明：每天可以挑战一次，能够获得大量道具以及经验。通关挑战后还能获得门派贡献度等奖励！', 0, 0, 1);
INSERT INTO `clubxujing` VALUES (3, '桃源秘境', '说明：这里的桃花格外鲜红，需要意志力以及不服输的精神', 0, 0, 1);
INSERT INTO `clubxujing` VALUES (4, '海城秘境', '海城是一座城', 0, 0, 1);

-- ----------------------------
-- Table structure for clubxujinginfo
-- ----------------------------
DROP TABLE IF EXISTS `clubxujinginfo`;
CREATE TABLE `clubxujinginfo`  (
  `xjdid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `xjid` int(11) NOT NULL COMMENT '虚境ID',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '虚境类型',
  `xjsj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '虚境事件ID',
  `step` int(11) NOT NULL DEFAULT 0 COMMENT '步骤',
  `menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能文件',
  PRIMARY KEY (`xjdid`) USING BTREE,
  INDEX `idx_xjid`(`xjid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clubxujinginfo
-- ----------------------------
INSERT INTO `clubxujinginfo` VALUES (1, 1, 'renwu', '29,28', 1, NULL);
INSERT INTO `clubxujinginfo` VALUES (2, 2, 'boss', '0', 1, NULL);
INSERT INTO `clubxujinginfo` VALUES (3, 3, 'mid', '369', 1, NULL);
INSERT INTO `clubxujinginfo` VALUES (4, 4, 'mid', '0', 1, 'taoyuan.php');

-- ----------------------------
-- Table structure for clubxujingplayer
-- ----------------------------
DROP TABLE IF EXISTS `clubxujingplayer`;
CREATE TABLE `clubxujingplayer`  (
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `xjid` int(11) NOT NULL DEFAULT 0 COMMENT '虚境ID',
  `step` int(11) NOT NULL DEFAULT 0 COMMENT '进行步骤',
  `date` date NOT NULL COMMENT '接受日期',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '挑战次数',
  INDEX `idx_sid`(`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clubxujingplayer
-- ----------------------------
INSERT INTO `clubxujingplayer` VALUES ('96c35b991f08a8a0179f2da27f08a500', 3, 1, '2025-07-09', 1);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务场景',
  `cdj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '道具 （道具ID|数量-最大|概率10000）',
  `cyp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品',
  `ccw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宠物',
  `cexp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修为',
  `cxb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '灵石',
  `cczb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '极品灵石',
  `czb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '装备',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('clubqiandao', '1|1-10|10', '6|1-5|5000,8|1-3|1000,12|1|1', NULL, '0|1-15|10000', '0|10-50|10000', '0|1-4|10000', NULL, '帮派签到奖励');

-- ----------------------------
-- Table structure for daoju
-- ----------------------------
DROP TABLE IF EXISTS `daoju`;
CREATE TABLE `daoju`  (
  `djname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '道具名称',
  `djzl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `djinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '道具信息',
  `djid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '道具id',
  `djyxb` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`djid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of daoju
-- ----------------------------
INSERT INTO `daoju` VALUES ('强化石', '2', '强化装备用的道具', 1, 0);
INSERT INTO `daoju` VALUES ('符箓残页-初级灵', '', '兑换符箓用的', 6, 0);
INSERT INTO `daoju` VALUES ('符箓残页-初级魔', '', '兑换符箓', 7, 0);
INSERT INTO `daoju` VALUES ('硬翅蜂蜜', '', '硬翅蜂的蜂蜜', 8, 0);
INSERT INTO `daoju` VALUES ('符箓残页-初级蛮', '', '符箓残页-初级蛮', 9, 0);
INSERT INTO `daoju` VALUES ('符箓残页-中级灵', '', '符箓残页-中级灵', 10, 0);
INSERT INTO `daoju` VALUES ('初级魔灵', '', '初级魔灵', 11, 0);
INSERT INTO `daoju` VALUES ('[神器]妖王剑碎片', '', '[神器]妖王剑碎片', 12, 0);

-- ----------------------------
-- Table structure for duihuan
-- ----------------------------
DROP TABLE IF EXISTS `duihuan`;
CREATE TABLE `duihuan`  (
  `dhm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '兑换码',
  `dhzb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `dhdj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '道具',
  `dhyp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '药品',
  `dhyxb` int(11) NOT NULL DEFAULT 0 COMMENT '灵石',
  `dhczb` int(11) NOT NULL DEFAULT 0 COMMENT '极品灵石',
  `dhname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '礼包名称',
  `dhexp` int(11) NOT NULL DEFAULT 0 COMMENT '修为',
  `dhid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dhjiu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否永久不删除1是0否',
  PRIMARY KEY (`dhid`) USING BTREE,
  INDEX `dhm`(`dhm`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of duihuan
-- ----------------------------
INSERT INTO `duihuan` VALUES ('6666', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 1, 1);
INSERT INTO `duihuan` VALUES ('2B5BAECC1CBA455C', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 3, 0);
INSERT INTO `duihuan` VALUES ('49852B2FA355EA54', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 4, 0);
INSERT INTO `duihuan` VALUES ('888', '43', '1|100', '9|100', 0, 0, '终极礼包', 0, 11, 1);

-- ----------------------------
-- Table structure for duihuan_son
-- ----------------------------
DROP TABLE IF EXISTS `duihuan_son`;
CREATE TABLE `duihuan_son`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `dhm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '兑换id',
  `dhsj` datetime NULL DEFAULT NULL COMMENT '对换时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '兑换记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of duihuan_son
-- ----------------------------
INSERT INTO `duihuan_son` VALUES (1, '96c35b991f08a8a0179f2da27f08a500', '870C85455682BC80', '2025-07-03 06:52:16');
INSERT INTO `duihuan_son` VALUES (2, '96c35b991f08a8a0179f2da27f08a500', 'C2BAF2D5ADF0C03E', '2025-07-03 06:52:21');
INSERT INTO `duihuan_son` VALUES (3, '96c35b991f08a8a0179f2da27f08a500', 'I3P7ER2P4XI379FA', '2025-07-03 06:52:24');
INSERT INTO `duihuan_son` VALUES (4, '96c35b991f08a8a0179f2da27f08a500', 'MDZRWOZLS8CDO1SI', '2025-07-03 06:52:27');
INSERT INTO `duihuan_son` VALUES (5, '96c35b991f08a8a0179f2da27f08a500', 'K5HBOEFWE0UU', '2025-07-03 06:52:30');
INSERT INTO `duihuan_son` VALUES (6, '96c35b991f08a8a0179f2da27f08a500', '8048AE4F8EF869EE', '2025-07-03 06:52:37');
INSERT INTO `duihuan_son` VALUES (7, '96c35b991f08a8a0179f2da27f08a500', '6666', '2025-07-03 08:56:06');
INSERT INTO `duihuan_son` VALUES (8, '96c35b991f08a8a0179f2da27f08a500', '240C93CAEA5F1FA9', '2025-07-03 08:56:19');
INSERT INTO `duihuan_son` VALUES (9, '96c35b991f08a8a0179f2da27f08a500', '888', '2025-07-03 09:05:11');
INSERT INTO `duihuan_son` VALUES (10, '96c35b991f08a8a0179f2da27f08a500', '999', '2025-07-03 09:05:16');
INSERT INTO `duihuan_son` VALUES (11, '96c35b991f08a8a0179f2da27f08a500', '777', '2025-07-03 09:05:21');
INSERT INTO `duihuan_son` VALUES (12, '96c35b991f08a8a0179f2da27f08a500', '666', '2025-07-03 09:05:24');

-- ----------------------------
-- Table structure for exp
-- ----------------------------
DROP TABLE IF EXISTS `exp`;
CREATE TABLE `exp`  (
  `ulv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uexp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exp
-- ----------------------------

-- ----------------------------
-- Table structure for fangshi_cw
-- ----------------------------
DROP TABLE IF EXISTS `fangshi_cw`;
CREATE TABLE `fangshi_cw`  (
  `payid` int(11) NOT NULL AUTO_INCREMENT,
  `pay` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `cwid` int(11) NOT NULL COMMENT '宠物ID',
  `cwname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '宠物名称',
  `cwhp` int(11) NOT NULL DEFAULT 0 COMMENT '宠物血量',
  `cwmaxhp` int(11) NOT NULL DEFAULT 0 COMMENT '宠物最大血量',
  `cwgj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击',
  `cwfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御',
  `cwbj` int(11) NOT NULL DEFAULT 0 COMMENT '暴击',
  `cwxx` int(11) NOT NULL DEFAULT 0 COMMENT '吸血',
  `cwlv` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `cwexp` int(11) NOT NULL DEFAULT 0 COMMENT '经验',
  `tool1` int(11) NOT NULL DEFAULT 0,
  `tool2` int(11) NOT NULL DEFAULT 0,
  `tool3` int(11) NOT NULL DEFAULT 0,
  `tool4` int(11) NOT NULL DEFAULT 0,
  `tool5` int(11) NOT NULL DEFAULT 0,
  `tool6` int(11) NOT NULL DEFAULT 0,
  `uphp` int(11) NOT NULL DEFAULT 0 COMMENT '气血成长',
  `upgj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击成长',
  `upfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御成长',
  `cwpz` int(11) NOT NULL DEFAULT 0 COMMENT '品质 0-普通 1-优秀 2-卓越 3-非凡 4-完美 5-逆天',
  PRIMARY KEY (`payid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fangshi_cw
-- ----------------------------
INSERT INTO `fangshi_cw` VALUES (1, 100, 1, 7, '伶俐鼠', 100, 100, 6, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 22, 5, 6, 1);

-- ----------------------------
-- Table structure for fangshi_dj
-- ----------------------------
DROP TABLE IF EXISTS `fangshi_dj`;
CREATE TABLE `fangshi_dj`  (
  `djid` int(11) NOT NULL DEFAULT 0 COMMENT '道具ID',
  `djcount` int(11) NOT NULL DEFAULT 0 COMMENT '道具数量',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `pay` int(11) NOT NULL DEFAULT 0,
  `payid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购买ID',
  `djname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '道具名称',
  `djinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '道具信息',
  PRIMARY KEY (`payid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fangshi_dj
-- ----------------------------
INSERT INTO `fangshi_dj` VALUES (1, 100, 1, 1000, 2, '强化石', '强化装备用的道具');

-- ----------------------------
-- Table structure for fangshi_zb
-- ----------------------------
DROP TABLE IF EXISTS `fangshi_zb`;
CREATE TABLE `fangshi_zb`  (
  `zbnowid` int(11) NOT NULL DEFAULT 0 COMMENT '用户装备ID',
  `zbname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备名称',
  `qianghua` int(11) NOT NULL DEFAULT 0 COMMENT '强化次数',
  `pay` int(11) NOT NULL DEFAULT 0 COMMENT '购买金额',
  `payid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zbinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备信息',
  `zbgj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击',
  `zbfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御',
  `zbbj` int(11) NOT NULL DEFAULT 0 COMMENT '暴击',
  `zbxx` int(11) NOT NULL DEFAULT 0 COMMENT '吸血',
  `zbid` int(11) NOT NULL DEFAULT 0 COMMENT '装备ID',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbhp` int(11) NOT NULL DEFAULT 0 COMMENT '血量',
  `zblv` int(11) NOT NULL DEFAULT 0 COMMENT '装备等级',
  PRIMARY KEY (`payid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fangshi_zb
-- ----------------------------
INSERT INTO `fangshi_zb` VALUES (42, '军官陌刀', 0, 1000, 2, '军官陌刀', 30, 0, 5, 4, 48, 1, '96c35b991f08a8a0179f2da27f08a500', 0, 0);

-- ----------------------------
-- Table structure for fb
-- ----------------------------
DROP TABLE IF EXISTS `fb`;
CREATE TABLE `fb`  (
  `fbname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fbid` int(11) NOT NULL DEFAULT 0,
  `fbinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`fbid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fb
-- ----------------------------
INSERT INTO `fb` VALUES ('测试副本', 0, '测试用的副本');

-- ----------------------------
-- Table structure for fbmid
-- ----------------------------
DROP TABLE IF EXISTS `fbmid`;
CREATE TABLE `fbmid`  (
  `fmname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fmid` int(11) NOT NULL DEFAULT 0,
  `fminfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fmnpc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fmgw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fbmid
-- ----------------------------

-- ----------------------------
-- Table structure for game1
-- ----------------------------
DROP TABLE IF EXISTS `game1`;
CREATE TABLE `game1`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uname` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `ulv` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '等级',
  `uyxb` int(11) NOT NULL DEFAULT 2000 COMMENT '灵石',
  `uczb` int(11) NOT NULL DEFAULT 100 COMMENT '极品灵石',
  `uexp` int(11) NOT NULL DEFAULT 0 COMMENT '经验',
  `vip` int(11) NOT NULL DEFAULT 0,
  `uhp` int(11) NOT NULL DEFAULT 35 COMMENT '气血',
  `umaxhp` int(11) NOT NULL DEFAULT 35 COMMENT '最大气血',
  `ugj` int(11) NOT NULL DEFAULT 12 COMMENT '攻击',
  `ufy` int(11) NOT NULL DEFAULT 5 COMMENT '防御',
  `usex` int(11) NOT NULL DEFAULT 1 COMMENT '暴击',
  `endtime` datetime NULL DEFAULT NULL COMMENT '吸血',
  `nowmid` int(11) NOT NULL DEFAULT 225,
  `uwx` int(11) NOT NULL DEFAULT 0,
  `nowguaiwu` int(11) NOT NULL DEFAULT 0,
  `tool1` int(11) NOT NULL DEFAULT 0,
  `tool2` int(11) NOT NULL DEFAULT 0,
  `tool3` int(11) NOT NULL DEFAULT 0,
  `tool4` int(11) NOT NULL DEFAULT 0,
  `tool5` int(11) NOT NULL DEFAULT 0,
  `tool6` int(11) NOT NULL DEFAULT 0,
  `ubj` int(11) NOT NULL DEFAULT 0 COMMENT '暴击',
  `uxx` int(11) NOT NULL DEFAULT 0 COMMENT '吸血',
  `sfzx` int(11) NOT NULL DEFAULT 0,
  `qandaotime` datetime NULL DEFAULT NULL,
  `xiuliantime` datetime NULL DEFAULT NULL,
  `sfxl` int(11) NOT NULL DEFAULT 0,
  `yp1` int(11) NOT NULL DEFAULT 0,
  `yp2` int(11) NOT NULL DEFAULT 0,
  `yp3` int(11) NOT NULL DEFAULT 0,
  `cw` int(11) NOT NULL DEFAULT 0 COMMENT '参战宠物',
  `jn1` int(11) NOT NULL DEFAULT 0,
  `jn2` int(11) NOT NULL DEFAULT 0,
  `jn3` int(11) NOT NULL DEFAULT 0,
  `ispvp` int(11) NOT NULL DEFAULT 0,
  `autozd` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动战斗',
  `autoxg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动寻怪',
  `autoxc` tinyint(1) NOT NULL DEFAULT 0 COMMENT '使用血池',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for gameconfig
-- ----------------------------
DROP TABLE IF EXISTS `gameconfig`;
CREATE TABLE `gameconfig`  (
  `firstmid` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gameconfig
-- ----------------------------
INSERT INTO `gameconfig` VALUES (225);

-- ----------------------------
-- Table structure for ggliaotian
-- ----------------------------
DROP TABLE IF EXISTS `ggliaotian`;
CREATE TABLE `ggliaotian`  (
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发信人',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ggliaotian
-- ----------------------------
INSERT INTO `ggliaotian` VALUES ('系统通知', '万中无一的mattoid踏上了仙途', 1, 0);
INSERT INTO `ggliaotian` VALUES ('系统通知', '万中无一的传奇踏上了仙途', 2, 0);
INSERT INTO `ggliaotian` VALUES ('系统通知', '万中无一的原友踏上了仙途', 3, 0);
INSERT INTO `ggliaotian` VALUES ('系统通知', '万中无一的kalthus踏上了仙途', 4, 0);
INSERT INTO `ggliaotian` VALUES ('mattoid', '大家好', 5, 1);

-- ----------------------------
-- Table structure for guaiwu
-- ----------------------------
DROP TABLE IF EXISTS `guaiwu`;
CREATE TABLE `guaiwu`  (
  `gname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '怪物名称',
  `glv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '怪物等级',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ginfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '怪物信息',
  `gsex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '怪物性别',
  `ghp` int(11) NOT NULL DEFAULT 0 COMMENT '血量',
  `ggj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击',
  `gfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御',
  `gbj` int(11) NOT NULL DEFAULT 0 COMMENT '暴击',
  `gxx` int(11) NOT NULL DEFAULT 0 COMMENT '吸血',
  `gzb` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dljv` int(11) NOT NULL DEFAULT 0,
  `gdj` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `djjv` int(11) NOT NULL DEFAULT 0,
  `gyp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ypjv` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guaiwu
-- ----------------------------
INSERT INTO `guaiwu` VALUES ('花螺', '4', 2, '花色螺', '女', 200, 20, 5, 0, 0, '', 10, '1', 90, '', 0);
INSERT INTO `guaiwu` VALUES ('硬翅蜂', '1', 55, '硬翅蜂', '男', 40, 5, 3, 0, 0, '23', 10, '8', 30, '6', 8);
INSERT INTO `guaiwu` VALUES ('山猪', '1', 56, '山上的诸', '男', 40, 4, 4, 0, 0, '24', 10, '1', 60, '', 0);
INSERT INTO `guaiwu` VALUES ('老虎', '2', 57, '凶猛的老虎', '公', 70, 8, 6, 0, 0, '25', 10, '1', 60, '', 0);
INSERT INTO `guaiwu` VALUES ('花妖', '3', 58, '花妖,小妖', '女', 110, 15, 7, 0, 0, '26', 10, '1', 60, '', 0);
INSERT INTO `guaiwu` VALUES ('嗜血野狼', '5', 61, '嗜血野狼', '男', 160, 22, 16, 0, 0, '28', 20, '1', 60, '', 0);
INSERT INTO `guaiwu` VALUES ('狂暴野狼', '6', 62, '狂暴野狼', '男', 190, 23, 19, 0, 0, '28', 20, '1', 60, '', 0);
INSERT INTO `guaiwu` VALUES ('龙雀', '7', 63, '龙雀', '女', 220, 27, 22, 0, 0, '27', 20, '1,6', 8, '', 0);
INSERT INTO `guaiwu` VALUES ('百岁龙雀', '8', 64, '百岁龙雀', '男', 250, 32, 25, 0, 0, '29', 20, '1,6', 7, '', 0);
INSERT INTO `guaiwu` VALUES ('荷花花魅', '9', 65, '荷花花魅', '女', 280, 35, 28, 0, 0, '30', 21, '6', 17, '', 0);
INSERT INTO `guaiwu` VALUES ('血雷鹰', '12', 66, '血雷鹰', '男', 370, 46, 37, 0, 0, '32', 21, '1', 60, '', 0);
INSERT INTO `guaiwu` VALUES ('雷鹰', '10', 67, '雷鹰', '男', 310, 38, 31, 0, 0, '31', 21, '1', 60, '', 0);
INSERT INTO `guaiwu` VALUES ('魔修士', '13', 69, '魔修士', '男', 400, 49, 40, 0, 0, '', 22, '1', 60, '', 0);
INSERT INTO `guaiwu` VALUES ('魔化之通臂猿', '16', 70, '魔化之通臂猿', '男', 490, 61, 50, 0, 0, '36', 22, '', 5, '6', 5);
INSERT INTO `guaiwu` VALUES ('魔化之灵猴', '17', 71, '魔化之灵猴', '男', 520, 65, 53, 0, 0, '', 5, '1', 60, '', 5);
INSERT INTO `guaiwu` VALUES ('魔化之剑魔', '18', 72, '魔化之剑魔', '男', 550, 68, 56, 0, 0, '', 5, '7', 20, '', 5);
INSERT INTO `guaiwu` VALUES ('魔化之幼齿猫女', '19', 73, '魔化之幼齿猫女', '女', 580, 72, 59, 0, 0, '37', 5, '1,7', 5, '7', 5);
INSERT INTO `guaiwu` VALUES ('魔化之鸦人', '20', 74, '魔化之鸦人', '男', 610, 76, 62, 0, 0, '', 5, '7', 5, '', 5);
INSERT INTO `guaiwu` VALUES ('魔化山魈', '21', 75, '魔化山魈', '男', 640, 80, 65, 0, 0, '33', 20, '1,7', 20, '7', 20);
INSERT INTO `guaiwu` VALUES ('入魔蛮族战士', '21', 76, '入魔的蛮族战士', '男', 640, 80, 65, 0, 0, '34,35', 7, '1', 60, '7', 7);
INSERT INTO `guaiwu` VALUES ('入魔蛮族祭祀', '22', 77, '入魔的蛮族祭祀', '女', 670, 84, 68, 0, 0, '35', 7, '1', 60, '7', 7);
INSERT INTO `guaiwu` VALUES ('魔化蛮狼', '23', 78, '魔化的蛮狼', '男', 700, 87, 71, 0, 0, '', 7, '1', 60, '', 7);
INSERT INTO `guaiwu` VALUES ('魔化狂狮', '24', 79, '魔化狂狮', '男', 730, 91, 74, 0, 0, '', 7, '1', 60, '', 7);
INSERT INTO `guaiwu` VALUES ('魔道控兽师', '26', 80, '', '男', 790, 99, 81, 0, 0, '', 7, '1', 60, '', 7);
INSERT INTO `guaiwu` VALUES ('百年蛇怪', '27', 81, '修炼百年的蛇怪', '男', 820, 103, 84, 0, 0, '', 7, '1', 60, '', 7);
INSERT INTO `guaiwu` VALUES ('赤鳞兽', '28', 82, '赤鳞兽', '男', 850, 106, 87, 0, 0, '', 7, '1,10', 7, '', 7);
INSERT INTO `guaiwu` VALUES ('棘鼠', '29', 83, '棘鼠', '男', 880, 110, 90, 0, 0, '38', 7, '9', 20, '', 7);
INSERT INTO `guaiwu` VALUES ('怨灵', '30', 84, '怨灵', '女', 1510, 204, 183, 0, 0, '39', 8, '1', 60, '', 8);
INSERT INTO `guaiwu` VALUES ('岩魔', '31', 85, '岩魔', '男', 1560, 211, 189, 0, 0, '40', 8, '1', 60, '', 8);
INSERT INTO `guaiwu` VALUES ('嗜灵鼠妖', '32', 86, '嗜灵鼠妖', '男', 1610, 218, 195, 0, 0, '41', 8, '1', 60, '', 8);
INSERT INTO `guaiwu` VALUES ('赤炼蝮蛇妖', '33', 87, '赤炼蝮蛇妖', '女', 1660, 224, 201, 0, 0, '42', 9, '1', 60, '8', 9);
INSERT INTO `guaiwu` VALUES ('百年穿山甲', '34', 88, '百年穿山甲\r\n皮厚气血强盛', '男', 2000, 150, 330, 0, 0, '44', 9, '1', 60, '8', 9);
INSERT INTO `guaiwu` VALUES ('青古虎', '35', 89, '青古虎', '男', 1760, 238, 214, 0, 0, '', 5, '1', 60, '', 5);
INSERT INTO `guaiwu` VALUES ('烈珠鹰', '37', 90, '烈珠鹰', '男', 1860, 252, 226, 0, 0, '', 5, '1', 60, '9', 5);
INSERT INTO `guaiwu` VALUES ('白豹妖', '38', 91, '白豹妖', '男', 1910, 258, 232, 0, 0, '43', 5, '1', 60, '', 5);
INSERT INTO `guaiwu` VALUES ('雷萝妖', '39', 92, '雷萝妖', '女', 1960, 265, 238, 0, 0, '', 5, '1', 60, '', 5);
INSERT INTO `guaiwu` VALUES ('血鸦', '40', 93, '血鸦', '男', 2010, 272, 244, 0, 0, '', 5, '1', 60, '', 5);
INSERT INTO `guaiwu` VALUES ('血鸦王', '55', 94, '血鸦王', '男', 5860, 594, 558, 0, 0, '', 8, '12', 1, '', 8);
INSERT INTO `guaiwu` VALUES ('黑艳妖王', '56', 95, '黑艳妖王', '女', 4530, 653, 454, 0, 0, '', 5, '12', 1, '', 5);
INSERT INTO `guaiwu` VALUES ('劫杀者', '45', 96, '劫杀者', '男', 2260, 306, 275, 0, 0, '46', 5, '1', 60, '', 5);
INSERT INTO `guaiwu` VALUES ('精锐叛兵', '47', 97, '精锐叛兵', '男', 2360, 320, 287, 0, 0, '47', 5, '', 5, '', 5);
INSERT INTO `guaiwu` VALUES ('叛兵队长', '50', 98, '叛兵队长', '男', 3510, 440, 405, 0, 0, '48', 5, '', 5, '', 5);

-- ----------------------------
-- Table structure for im
-- ----------------------------
DROP TABLE IF EXISTS `im`;
CREATE TABLE `im`  (
  `imuid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of im
-- ----------------------------

-- ----------------------------
-- Table structure for imliaotian
-- ----------------------------
DROP TABLE IF EXISTS `imliaotian`;
CREATE TABLE `imliaotian`  (
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imuid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0,
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of imliaotian
-- ----------------------------

-- ----------------------------
-- Table structure for jineng
-- ----------------------------
DROP TABLE IF EXISTS `jineng`;
CREATE TABLE `jineng`  (
  `jnname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '技能名称',
  `jnid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '技能ID',
  `jngj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击',
  `jnfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御',
  `jnbj` int(11) NOT NULL DEFAULT 0 COMMENT '暴击',
  `jnxx` int(11) NOT NULL DEFAULT 0 COMMENT '吸血',
  `jndj` int(11) NOT NULL DEFAULT 0,
  `djcount` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  `xiaohao` int(11) NOT NULL DEFAULT 0 COMMENT '消耗',
  PRIMARY KEY (`jnid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jineng
-- ----------------------------
INSERT INTO `jineng` VALUES ('聚灵斩', 4, 10, 0, 0, 2, 6, 5, 0);
INSERT INTO `jineng` VALUES ('魔心爆发', 5, 5, 0, 10, 10, 7, 8, 0);
INSERT INTO `jineng` VALUES ('蛮力附体', 6, 7, 7, 7, 7, 9, 8, 0);
INSERT INTO `jineng` VALUES ('怒血爆', 7, 12, 2, 20, 8, 10, 10, 0);
INSERT INTO `jineng` VALUES ('初级嗜血术', 8, 1, 0, 0, 20, 11, 15, 0);

-- ----------------------------
-- Table structure for mid
-- ----------------------------
DROP TABLE IF EXISTS `mid`;
CREATE TABLE `mid`  (
  `mname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地图名称',
  `mid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地图ID',
  `mgid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '怪物ID|数量',
  `mnpc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地图NPC',
  `mgtime` datetime NULL DEFAULT NULL,
  `ms` int(11) NOT NULL DEFAULT 0 COMMENT '刷新间隔时间',
  `midinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地图信息',
  `midboss` int(11) NOT NULL DEFAULT 0 COMMENT '地图boos',
  `mup` int(11) NOT NULL DEFAULT 0 COMMENT '地图上面',
  `mdown` int(11) NOT NULL DEFAULT 0 COMMENT '地图下面',
  `mleft` int(11) NOT NULL DEFAULT 0 COMMENT '地图左面',
  `mright` int(11) NOT NULL DEFAULT 0 COMMENT '地图右面',
  `mqy` int(11) NOT NULL DEFAULT 0 COMMENT '所属区域',
  `playerinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色去向',
  `ispvp` int(255) NOT NULL DEFAULT 0 COMMENT '0-允许PK 1-安全区',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 370 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for midguaiwu
-- ----------------------------
DROP TABLE IF EXISTS `midguaiwu`;
CREATE TABLE `midguaiwu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '怪物ID',
  `gname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '怪物名称',
  `ghp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '怪物血量',
  `ggj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '怪物攻击',
  `gfy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '怪物防御',
  `glv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '怪物等级',
  `mid` int(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  `gyid` int(11) NOT NULL DEFAULT 0 COMMENT '对应怪物表的ID',
  `gexp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '携带经验',
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `gmaxhp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '怪物最大血量',
  `gbj` int(11) NOT NULL DEFAULT 0 COMMENT '怪物暴击',
  `gxx` int(11) NOT NULL DEFAULT 0 COMMENT '怪物吸血',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2315512 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of midguaiwu
-- ----------------------------
INSERT INTO `midguaiwu` VALUES (2249197, '魔化蛮狼', '700', '87', '71', '23', 251, 78, '173', 'e0e644a3727f0f1671e917f7b376c66f', '700', 0, 0);
INSERT INTO `midguaiwu` VALUES (2253163, '山猪', '40', '4', '4', '1', 228, 56, '8', '0e698c7ec2d718b658fa287c45929571', '40', 0, 0);
INSERT INTO `midguaiwu` VALUES (2280014, '雷萝妖', '1474', '265', '238', '39', 266, 92, '254', '099f465c0c34dd5ef59f230a21447af4', '1960', 0, 0);
INSERT INTO `midguaiwu` VALUES (2290121, '魔道控兽师', '790', '99', '81', '26', 253, 80, '169', '', '790', 0, 0);
INSERT INTO `midguaiwu` VALUES (2299847, '魔化蛮狼', '700', '87', '71', '23', 252, 78, '173', '', '700', 0, 0);
INSERT INTO `midguaiwu` VALUES (2299850, '魔化狂狮', '730', '91', '74', '24', 252, 79, '180', '', '730', 0, 0);
INSERT INTO `midguaiwu` VALUES (2299851, '魔化狂狮', '730', '91', '74', '24', 252, 79, '180', '', '730', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302423, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302424, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302425, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302426, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302427, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302474, '魔化之通臂猿', '490', '61', '50', '16', 242, 70, '136', '781a121e409741ff53f5978578067146', '490', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305732, '棘鼠', '880', '110', '90', '29', 256, 83, '218', '', '880', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305733, '棘鼠', '880', '110', '90', '29', 256, 83, '218', '', '880', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305734, '棘鼠', '880', '110', '90', '29', 256, 83, '218', '', '880', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305759, '劫杀者', '2260', '306', '275', '45', 269, 96, '293', '', '2260', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305760, '劫杀者', '2260', '306', '275', '45', 269, 96, '293', '', '2260', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305761, '劫杀者', '2260', '306', '275', '45', 269, 96, '293', '', '2260', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305762, '劫杀者', '2260', '306', '275', '45', 269, 96, '293', '', '2260', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305763, '精锐叛兵', '2360', '320', '287', '47', 269, 97, '400', '', '2360', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305764, '精锐叛兵', '2360', '320', '287', '47', 269, 97, '400', '', '2360', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305765, '精锐叛兵', '2360', '320', '287', '47', 269, 97, '400', '', '2360', 0, 0);
INSERT INTO `midguaiwu` VALUES (2309219, '魔化之幼齿猫女', '580', '72', '59', '19', 245, 73, '124', '', '580', 0, 0);
INSERT INTO `midguaiwu` VALUES (2309220, '魔化之幼齿猫女', '580', '72', '59', '19', 245, 73, '124', '', '580', 0, 0);
INSERT INTO `midguaiwu` VALUES (2309221, '魔化之幼齿猫女', '580', '72', '59', '19', 245, 73, '124', '', '580', 0, 0);
INSERT INTO `midguaiwu` VALUES (2309222, '魔化之幼齿猫女', '580', '72', '59', '19', 245, 73, '124', '', '580', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313514, '狂暴野狼', '144', '23', '19', '6', 231, 62, '45', 'bb2a45b7652a7900e7810128a329597e', '190', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313641, '百年穿山甲', '2000', '150', '330', '34', 264, 88, '255', '', '2000', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313642, '百年穿山甲', '2000', '150', '330', '34', 264, 88, '255', '', '2000', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313644, '百年穿山甲', '2000', '150', '330', '34', 264, 88, '255', '', '2000', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313645, '百年穿山甲', '2000', '150', '330', '34', 264, 88, '255', '', '2000', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313691, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313692, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313693, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313695, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313710, '血鸦', '2010', '272', '244', '40', 268, 93, '260', '', '2010', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314241, '荷花花魅', '280', '35', '28', '9', 233, 65, '68', '', '280', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314242, '荷花花魅', '280', '35', '28', '9', 233, 65, '68', '', '280', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314243, '荷花花魅', '280', '35', '28', '9', 233, 65, '68', '', '280', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314250, '雷鹰', '310', '38', '31', '10', 235, 67, '85', '', '310', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314251, '雷鹰', '310', '38', '31', '10', 235, 67, '85', '', '310', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314277, '青古虎', '1760', '238', '214', '35', 265, 89, '228', '', '1760', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314278, '青古虎', '1760', '238', '214', '35', 265, 89, '228', '', '1760', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314279, '青古虎', '1760', '238', '214', '35', 265, 89, '228', '', '1760', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314280, '青古虎', '1760', '238', '214', '35', 265, 89, '228', '', '1760', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314281, '烈珠鹰', '1860', '252', '226', '37', 265, 90, '278', '', '1860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314282, '烈珠鹰', '1860', '252', '226', '37', 265, 90, '278', '', '1860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314283, '烈珠鹰', '1860', '252', '226', '37', 265, 90, '278', '', '1860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314284, '烈珠鹰', '1860', '252', '226', '37', 265, 90, '278', '', '1860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314306, '花妖', '110', '15', '7', '3', 230, 58, '20', '', '110', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314307, '花妖', '110', '15', '7', '3', 230, 58, '20', '', '110', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314308, '花妖', '110', '15', '7', '3', 230, 58, '20', '', '110', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314311, '花螺', '200', '20', '5', '4', 230, 2, '30', '', '200', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314374, '狂暴野狼', '190', '23', '19', '6', 231, 62, '45', '', '190', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314388, '魔化之通臂猿', '490', '61', '50', '16', 242, 70, '136', '', '490', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314394, '老虎', '70', '8', '6', '2', 229, 57, '13', '', '70', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314395, '老虎', '70', '8', '6', '2', 229, 57, '13', '', '70', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314396, '老虎', '70', '8', '6', '2', 229, 57, '13', '', '70', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314397, '老虎', '70', '8', '6', '2', 229, 57, '13', '', '70', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314398, '老虎', '70', '8', '6', '2', 229, 57, '13', '', '70', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314399, '龙雀', '220', '27', '22', '7', 232, 63, '53', '', '220', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314400, '龙雀', '220', '27', '22', '7', 232, 63, '53', '', '220', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314402, '百岁龙雀', '250', '32', '25', '8', 232, 64, '52', '', '250', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314403, '百岁龙雀', '250', '32', '25', '8', 232, 64, '52', '', '250', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314404, '百岁龙雀', '250', '32', '25', '8', 232, 64, '52', '', '250', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314405, '百岁龙雀', '250', '32', '25', '8', 232, 64, '52', '', '250', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314406, '魔化之剑魔', '550', '68', '56', '18', 243, 72, '153', '', '550', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314407, '魔化之剑魔', '550', '68', '56', '18', 243, 72, '153', '', '550', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314408, '魔化之剑魔', '550', '68', '56', '18', 243, 72, '153', '', '550', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314409, '魔化之剑魔', '550', '68', '56', '18', 243, 72, '153', '', '550', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314410, '魔化之剑魔', '550', '68', '56', '18', 243, 72, '153', '', '550', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314411, '魔化之剑魔', '550', '68', '56', '18', 243, 72, '153', '', '550', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314551, '入魔蛮族战士', '640', '80', '65', '21', 247, 76, '179', '', '640', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314552, '入魔蛮族战士', '640', '80', '65', '21', 247, 76, '179', '', '640', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314553, '入魔蛮族战士', '640', '80', '65', '21', 247, 76, '179', '', '640', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314554, '入魔蛮族战士', '640', '80', '65', '21', 247, 76, '179', '', '640', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314601, '魔化蛮狼', '700', '87', '71', '23', 251, 78, '196', '', '700', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314607, '百年蛇怪', '820', '103', '84', '27', 254, 81, '203', '', '820', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314608, '百年蛇怪', '820', '103', '84', '27', 254, 81, '203', '', '820', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314609, '百年蛇怪', '820', '103', '84', '27', 254, 81, '203', '', '820', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314610, '百年蛇怪', '820', '103', '84', '27', 254, 81, '203', '', '820', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314611, '百年蛇怪', '820', '103', '84', '27', 254, 81, '203', '', '820', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314612, '百年蛇怪', '820', '103', '84', '27', 254, 81, '203', '', '820', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314613, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314614, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314615, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314616, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314617, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314618, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314619, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314620, '岩魔', '1560', '211', '189', '31', 258, 85, '202', '', '1560', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314621, '岩魔', '1560', '211', '189', '31', 258, 85, '202', '', '1560', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314622, '岩魔', '1560', '211', '189', '31', 258, 85, '202', '', '1560', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314623, '岩魔', '1560', '211', '189', '31', 258, 85, '202', '', '1560', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314624, '岩魔', '1560', '211', '189', '31', 258, 85, '202', '', '1560', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314625, '岩魔', '1560', '211', '189', '31', 258, 85, '202', '', '1560', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314650, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '215', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314651, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '215', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314652, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '215', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314653, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '215', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314654, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '215', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314655, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '215', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314656, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '215', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314681, '白豹妖', '1910', '258', '232', '38', 266, 91, '323', '', '1910', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314682, '白豹妖', '1910', '258', '232', '38', 266, 91, '323', '', '1910', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314683, '白豹妖', '1910', '258', '232', '38', 266, 91, '323', '', '1910', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314685, '雷萝妖', '1960', '265', '238', '39', 266, 92, '293', '', '1960', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314686, '雷萝妖', '1960', '265', '238', '39', 266, 92, '293', '', '1960', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314688, '雷萝妖', '1960', '265', '238', '39', 266, 92, '293', '', '1960', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314761, '魔修士', '400', '49', '40', '13', 236, 69, '85', '', '400', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314763, '魔修士', '400', '49', '40', '13', 236, 69, '85', '', '400', 0, 0);
INSERT INTO `midguaiwu` VALUES (2315298, '嗜灵鼠妖', '1610', '218', '195', '32', 262, 86, '240', '', '1610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2315299, '嗜灵鼠妖', '1610', '218', '195', '32', 262, 86, '240', '', '1610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2315300, '嗜灵鼠妖', '1610', '218', '195', '32', 262, 86, '240', '', '1610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2315480, '黑艳妖王', '4530', '653', '454', '56', 267, 95, '364', '', '4530', 0, 0);
INSERT INTO `midguaiwu` VALUES (2315506, '硬翅蜂', '40', '5', '3', '1', 228, 55, '7', '', '40', 0, 0);
INSERT INTO `midguaiwu` VALUES (2315507, '硬翅蜂', '40', '5', '3', '1', 228, 55, '7', '', '40', 0, 0);
INSERT INTO `midguaiwu` VALUES (2315508, '硬翅蜂', '40', '5', '3', '1', 228, 55, '7', '', '40', 0, 0);
INSERT INTO `midguaiwu` VALUES (2315510, '山猪', '40', '4', '4', '1', 228, 56, '9', '', '40', 0, 0);
INSERT INTO `midguaiwu` VALUES (2315511, '怨灵', '1510', '204', '183', '30', 257, 84, '255', '', '1510', 0, 0);

-- ----------------------------
-- Table structure for npc
-- ----------------------------
DROP TABLE IF EXISTS `npc`;
CREATE TABLE `npc`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'npc名称',
  `nsex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'npc性别',
  `ninfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'npc信息',
  `muban` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能（指向实现文件）',
  `taskid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of npc
-- ----------------------------
INSERT INTO `npc` VALUES (5, '神秘人', '未知', '一个神秘的商人？魔王？', 'gaiming.php', '');
INSERT INTO `npc` VALUES (6, '深谷土地', '男', '深谷的土地管理者，洞悉这一带情况。', 'zl3.php', '39,40');
INSERT INTO `npc` VALUES (7, '村长老婆', '女', '好无聊啊，有没有人。', 'tanchu.php', '');
INSERT INTO `npc` VALUES (8, '矛十八', '男', '武功平庸，忠勇而精明不足。', 'zhuanpan.php', '');
INSERT INTO `npc` VALUES (9, '菏官', '女', '年芳十八，城市一绝。', 'aomen.php', '34,35,36');
INSERT INTO `npc` VALUES (10, '奶妈', '女', '奶妈就是有超能力，啵啵啵', 'cs.php<br>cs.php暂停', '35');
INSERT INTO `npc` VALUES (11, '村长', '男', '村长', '', '13,25,24,28');
INSERT INTO `npc` VALUES (13, '王老五', '男', '唉……一个人的日子，真的好难。', '', '24');
INSERT INTO `npc` VALUES (14, '赫炳', '男', '唉，整天站在这里真是无聊。', '', '28');
INSERT INTO `npc` VALUES (15, '周富贵[商人]', '男', '来来来   便宜', 'shangdian.php', '');
INSERT INTO `npc` VALUES (16, '聚仙城主[符箓]', '男', '聚仙城城主', 'jinengduihuan.php', '');
INSERT INTO `npc` VALUES (17, '云游仙医[治疗]', '男', '云游的仙医，似乎在哪都能看见他', 'zhiliao.php', '');
INSERT INTO `npc` VALUES (18, '王大妈', '女', '王大妈', '', '24,29');
INSERT INTO `npc` VALUES (19, '符箓大师', '男', '技能大师，负责兑换技能', 'jinengduihuan.php', '');
INSERT INTO `npc` VALUES (20, '小蛮', '女', '小蛮好怕...', '', '20');
INSERT INTO `npc` VALUES (21, '蛮族长老', '男', '蛮族长老', '', '19');
INSERT INTO `npc` VALUES (22, '蛮族猎手', '男', '老了,干不动了', '', '21');
INSERT INTO `npc` VALUES (23, '兑换大使', '男', '兑换大使', '', '27');
INSERT INTO `npc` VALUES (24, '正规仙医', '男', '正规仙医\r\n比云游的更在行', 'zhiliao_jibie1.php', '');
INSERT INTO `npc` VALUES (25, '城主雪琴', '女', '城炎阳城的城主雪琴，爱你三千次，能在这每日领取一次灵石', 'xueqin.php', '');
INSERT INTO `npc` VALUES (26, '门派管理员', '男', '门派管理', 'menpaiguanli.php', '');
INSERT INTO `npc` VALUES (27, '张三', '男', '法外狂徒', '', '30');
INSERT INTO `npc` VALUES (28, '张大妈', '女', '高级顾问', '', '33');
INSERT INTO `npc` VALUES (29, '小潘', '女', 'CDK活动', '', '32');
INSERT INTO `npc` VALUES (30, '西公子', '男', '正经人，可不是装de！', '', '');
INSERT INTO `npc` VALUES (31, '唐寅', '男', '太难了，肚子里没有墨水了', 'zhuanpan.php', '31');

-- ----------------------------
-- Table structure for npc_lingqu
-- ----------------------------
DROP TABLE IF EXISTS `npc_lingqu`;
CREATE TABLE `npc_lingqu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `dh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '兑换id',
  `dhsj` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对换时间',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兑换类型1是学琴送灵石',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'npc领取记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of npc_lingqu
-- ----------------------------
INSERT INTO `npc_lingqu` VALUES (1, '96c35b991f08a8a0179f2da27f08a500', '获取3000灵石', 1751500800, 1);
INSERT INTO `npc_lingqu` VALUES (2, '96c35b991f08a8a0179f2da27f08a500', '获取3000灵石', 1751932800, 1);

-- ----------------------------
-- Table structure for playerchongwu
-- ----------------------------
DROP TABLE IF EXISTS `playerchongwu`;
CREATE TABLE `playerchongwu`  (
  `cwid` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物ID',
  `cwname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '宠物名称',
  `cwhp` int(11) NOT NULL DEFAULT 0 COMMENT '宠物血量',
  `cwmaxhp` int(11) NOT NULL DEFAULT 0 COMMENT '宠物最大血量',
  `cwgj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击',
  `cwfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御',
  `cwbj` int(11) NOT NULL DEFAULT 0 COMMENT '暴击',
  `cwxx` int(11) NOT NULL DEFAULT 0 COMMENT '吸血',
  `cwlv` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `cwexp` int(11) NOT NULL DEFAULT 0 COMMENT '经验',
  `tool1` int(11) NOT NULL DEFAULT 0,
  `tool2` int(11) NOT NULL DEFAULT 0,
  `tool3` int(11) NOT NULL DEFAULT 0,
  `tool4` int(11) NOT NULL DEFAULT 0,
  `tool5` int(11) NOT NULL DEFAULT 0,
  `tool6` int(11) NOT NULL DEFAULT 0,
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uphp` int(11) NOT NULL DEFAULT 0 COMMENT '气血成长',
  `upgj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击成长',
  `upfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御成长',
  `cwpz` int(11) NOT NULL DEFAULT 0 COMMENT '品质 0-普通 1-优秀 2-卓越 3-非凡 4-完美 5-逆天',
  PRIMARY KEY (`cwid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerchongwu
-- ----------------------------
INSERT INTO `playerchongwu` VALUES (2, '咩咩羊', 3250, 3250, 1630, 1625, 35, 25, 71, 379938, 0, 0, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 30, 15, 15, 5);
INSERT INTO `playerchongwu` VALUES (3, '威威虎', 100, 100, 6, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 23, 4, 6, 2);
INSERT INTO `playerchongwu` VALUES (4, '乖乖狗', 100, 100, 6, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 16, 5, 8, 3);
INSERT INTO `playerchongwu` VALUES (5, '蛋蛋鸡', 100, 100, 6, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 17, 5, 6, 0);
INSERT INTO `playerchongwu` VALUES (6, '伶俐鼠', 100, 100, 6, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 17, 4, 3, 1);
INSERT INTO `playerchongwu` VALUES (7, '伶俐鼠', 100, 100, 6, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 22, 5, 6, 1);
INSERT INTO `playerchongwu` VALUES (8, '乖乖狗', 100, 100, 6, 4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 13, 5, 3, 1);

-- ----------------------------
-- Table structure for playerdaoju
-- ----------------------------
DROP TABLE IF EXISTS `playerdaoju`;
CREATE TABLE `playerdaoju`  (
  `djname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '道具名称',
  `djzl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `djinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '道具信息',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `djsum` int(11) NOT NULL DEFAULT 0 COMMENT '道具数量',
  `djid` int(11) NOT NULL DEFAULT 0 COMMENT '道具ID',
  `djnowid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`djnowid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerdaoju
-- ----------------------------
INSERT INTO `playerdaoju` VALUES ('强化石', '2', '强化装备用的道具', 1, '96c35b991f08a8a0179f2da27f08a500', 879591, 1, 1);
INSERT INTO `playerdaoju` VALUES ('硬翅蜂蜜', '', '硬翅蜂的蜂蜜', 1, '96c35b991f08a8a0179f2da27f08a500', 210, 8, 2);
INSERT INTO `playerdaoju` VALUES ('符箓残页-初级灵', '', '兑换符箓用的', 1, '96c35b991f08a8a0179f2da27f08a500', 90, 6, 3);
INSERT INTO `playerdaoju` VALUES ('符箓残页-初级魔', '', '兑换符箓', 1, '96c35b991f08a8a0179f2da27f08a500', 83, 7, 4);
INSERT INTO `playerdaoju` VALUES ('符箓残页-初级蛮', '', '符箓残页-初级蛮', 1, '96c35b991f08a8a0179f2da27f08a500', 134, 9, 5);
INSERT INTO `playerdaoju` VALUES ('符箓残页-中级灵', '', '符箓残页-中级灵', 1, '96c35b991f08a8a0179f2da27f08a500', 30, 10, 6);
INSERT INTO `playerdaoju` VALUES ('[神器]妖王剑碎片', '', '[神器]妖王剑碎片', 1, '96c35b991f08a8a0179f2da27f08a500', 190, 12, 7);
INSERT INTO `playerdaoju` VALUES ('硬翅蜂蜜', '', '硬翅蜂的蜂蜜', 3, 'acfac7534bc6fd80665c0e80fab027cc', 80, 8, 8);
INSERT INTO `playerdaoju` VALUES ('强化石', '2', '强化装备用的道具', 4, '0b747360ce77c1dbd8a053bf72ebe133', 55, 1, 9);
INSERT INTO `playerdaoju` VALUES ('硬翅蜂蜜', '', '硬翅蜂的蜂蜜', 4, '0b747360ce77c1dbd8a053bf72ebe133', 70, 8, 10);

-- ----------------------------
-- Table structure for playerjineng
-- ----------------------------
DROP TABLE IF EXISTS `playerjineng`;
CREATE TABLE `playerjineng`  (
  `jnname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '技能名称',
  `jnid` int(11) NOT NULL DEFAULT 0 COMMENT '技能ID',
  `jngj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击',
  `jnfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御',
  `jnbj` int(11) NOT NULL DEFAULT 0 COMMENT '暴击',
  `jnxx` int(11) NOT NULL DEFAULT 0 COMMENT '吸血',
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jncount` int(11) NOT NULL DEFAULT 0 COMMENT '数量'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerjineng
-- ----------------------------
INSERT INTO `playerjineng` VALUES ('聚灵斩', 4, 10, 0, 0, 2, '96c35b991f08a8a0179f2da27f08a500', 2);
INSERT INTO `playerjineng` VALUES ('魔心爆发', 5, 5, 0, 10, 10, '96c35b991f08a8a0179f2da27f08a500', 0);
INSERT INTO `playerjineng` VALUES ('蛮力附体', 6, 7, 7, 7, 7, '96c35b991f08a8a0179f2da27f08a500', 0);
INSERT INTO `playerjineng` VALUES ('怒血爆', 7, 12, 2, 20, 8, '96c35b991f08a8a0179f2da27f08a500', 0);

-- ----------------------------
-- Table structure for playerrenwu
-- ----------------------------
DROP TABLE IF EXISTS `playerrenwu`;
CREATE TABLE `playerrenwu`  (
  `rwname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `rwzl` int(11) NOT NULL DEFAULT 0 COMMENT '任务类型 1-收集 2-打怪 3-对话',
  `rwdj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '道具',
  `rwzb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备',
  `rwexp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '经验',
  `rwyxb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '灵石',
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `rwzt` int(11) NOT NULL DEFAULT 0 COMMENT '任务状态 1-进行中 2-已完成 3-已结束',
  `rwid` int(11) NOT NULL DEFAULT 0 COMMENT '任务ID',
  `rwyq` int(11) NOT NULL DEFAULT 0 COMMENT 'npcid/怪物id',
  `rwcount` int(11) NOT NULL DEFAULT 0 COMMENT '任务数量',
  `rwnowcount` int(11) NOT NULL DEFAULT 0 COMMENT '完成数量',
  `rwlx` int(11) NOT NULL DEFAULT 0,
  `rwyp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `data` int(11) NOT NULL DEFAULT 0,
  `rwjineng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '技能'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerrenwu
-- ----------------------------
INSERT INTO `playerrenwu` VALUES ('故人', 3, '1|50', '29', '400', '200', '96c35b991f08a8a0179f2da27f08a500', 2, 28, 11, 14, 0, 1, NULL, 0, '');
INSERT INTO `playerrenwu` VALUES ('狼患', 2, '1|100', '', '400', '300', '96c35b991f08a8a0179f2da27f08a500', 1, 29, 62, 10, 0, 3, NULL, 0, '');

-- ----------------------------
-- Table structure for playeryaopin
-- ----------------------------
DROP TABLE IF EXISTS `playeryaopin`;
CREATE TABLE `playeryaopin`  (
  `ypname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '药品名称',
  `ypid` int(11) NOT NULL DEFAULT 0,
  `yphp` int(11) NOT NULL DEFAULT 0 COMMENT '回复血量',
  `ypgj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击',
  `ypfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御',
  `ypxx` int(11) NOT NULL DEFAULT 0 COMMENT '吸血',
  `ypbj` int(11) NOT NULL DEFAULT 0 COMMENT '暴击',
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ypsum` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  `ypjg` int(11) NOT NULL DEFAULT 0,
  `isyg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否永久 0-否 1-是'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playeryaopin
-- ----------------------------
INSERT INTO `playeryaopin` VALUES ('复伤丹', 9, 1200, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 1192, 310, 0);
INSERT INTO `playeryaopin` VALUES ('还原丹', 6, 100, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 60, 30, 0);
INSERT INTO `playeryaopin` VALUES ('高级血池', 11, 5000000, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 5, 450000, 1);
INSERT INTO `playeryaopin` VALUES ('初级血池', 10, 1980947, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 2, 200000, 1);
INSERT INTO `playeryaopin` VALUES ('回血散', 7, 300, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 1, 80, 0);
INSERT INTO `playeryaopin` VALUES ('回春汤', 8, 600, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 9, 155, 0);
INSERT INTO `playeryaopin` VALUES ('还原丹', 6, 100, 0, 0, 0, 0, '0b747360ce77c1dbd8a053bf72ebe133', 13, 30, 0);
INSERT INTO `playeryaopin` VALUES ('袖珍血池', 12, 200000, 0, 0, 0, 0, '96c35b991f08a8a0179f2da27f08a500', 2, 35000, 1);

-- ----------------------------
-- Table structure for playerzhuangbei
-- ----------------------------
DROP TABLE IF EXISTS `playerzhuangbei`;
CREATE TABLE `playerzhuangbei`  (
  `zbname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备名称',
  `zbinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备描述',
  `zbgj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '攻击',
  `zbfy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '防御',
  `zbbj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '爆击',
  `zbxx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '吸血',
  `zbid` int(11) NOT NULL DEFAULT 0 COMMENT '装备ID',
  `uid` int(11) NOT NULL DEFAULT 0,
  `zbnowid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zbhp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '血量',
  `qianghua` int(11) NOT NULL DEFAULT 0 COMMENT '强化',
  `zblv` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `zbtool` int(11) NOT NULL DEFAULT 0 COMMENT '装备位置',
  PRIMARY KEY (`zbnowid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '装备背包' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerzhuangbei
-- ----------------------------
INSERT INTO `playerzhuangbei` VALUES ('缘风·墨魂靴', '缘风·墨魂靴', '0', '50', '3', '0', 42, 1, 33, '96c35b991f08a8a0179f2da27f08a500', '155', 30, 0, 0);
INSERT INTO `playerzhuangbei` VALUES ('缘风·破军腰带', '缘风·破军腰带', '9', '40', '0', '0', 43, 1, 36, '96c35b991f08a8a0179f2da27f08a500', '170', 30, 0, 0);
INSERT INTO `playerzhuangbei` VALUES ('缘风·兽魂项链', '缘风·兽魂项链', '30', '30', '4', '4', 44, 1, 37, '96c35b991f08a8a0179f2da27f08a500', '55', 30, 0, 0);
INSERT INTO `playerzhuangbei` VALUES ('缘风·虬雷衣', '缘风·虬雷衣', '10', '30', '0', '0', 41, 1, 39, '96c35b991f08a8a0179f2da27f08a500', '150', 30, 0, 0);
INSERT INTO `playerzhuangbei` VALUES ('[神器]妖王剑', '[神器]妖王剑\r\n妖王剑碎片合成', '124', '4', '13', '11', 45, 1, 40, '96c35b991f08a8a0179f2da27f08a500', '5', 30, 0, 0);
INSERT INTO `playerzhuangbei` VALUES ('缘风·发簪', '缘风·发簪', '13', '30', '4', '5', 49, 1, 41, '96c35b991f08a8a0179f2da27f08a500', '130', 30, 0, 0);
INSERT INTO `playerzhuangbei` VALUES ('军官陌刀', '军官陌刀', '30', '0', '5', '4', 48, 0, 42, '', '0', 0, 0, 0);
INSERT INTO `playerzhuangbei` VALUES ('新手布衣', '新手使用的布衣', '0', '2', '0', '0', 24, 3, 43, 'acfac7534bc6fd80665c0e80fab027cc', '10', 0, 0, 3);
INSERT INTO `playerzhuangbei` VALUES ('新手布衣', '新手使用的布衣', '0', '2', '0', '0', 24, 4, 44, '0b747360ce77c1dbd8a053bf72ebe133', '10', 0, 0, 3);
INSERT INTO `playerzhuangbei` VALUES ('初级嗜血剑', '初级嗜血剑', '2', '0', '1', '3', 29, 4, 45, '0b747360ce77c1dbd8a053bf72ebe133', '0', 0, 0, 1);
INSERT INTO `playerzhuangbei` VALUES ('军官陌刀', '军官陌刀', '30', '0', '5', '4', 48, 0, 46, '', '0', 0, 0, 0);
INSERT INTO `playerzhuangbei` VALUES ('新手布衣', '新手使用的布衣', '0', '2', '0', '0', 24, 1, 47, '96c35b991f08a8a0179f2da27f08a500', '10', 0, 0, 3);
INSERT INTO `playerzhuangbei` VALUES ('新手布衣', '新手使用的布衣', '0', '2', '0', '0', 24, 1, 48, '96c35b991f08a8a0179f2da27f08a500', '10', 0, 0, 3);
INSERT INTO `playerzhuangbei` VALUES ('新手布衣', '新手使用的布衣', '0', '2', '0', '0', 24, 1, 49, '96c35b991f08a8a0179f2da27f08a500', '10', 0, 0, 3);

-- ----------------------------
-- Table structure for qy
-- ----------------------------
DROP TABLE IF EXISTS `qy`;
CREATE TABLE `qy`  (
  `qyid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '区域ID',
  `qyname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域名称',
  `mid` int(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  `xjid` int(11) NOT NULL DEFAULT 0 COMMENT '虚境ID',
  PRIMARY KEY (`qyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qy
-- ----------------------------
INSERT INTO `qy` VALUES (14, '<font color=#68AD39>新</font><font color=#419435>手</font><font color=#1A7B31>村</font>', 225, 0);
INSERT INTO `qy` VALUES (16, '聚仙城', 239, 0);
INSERT INTO `qy` VALUES (17, '魔化区域', 249, 0);
INSERT INTO `qy` VALUES (18, '万千山域', 260, 0);
INSERT INTO `qy` VALUES (20, '妖王殿', 267, 0);
INSERT INTO `qy` VALUES (21, '炎阳城', 272, 0);
INSERT INTO `qy` VALUES (22, '通天府', 280, 1);
INSERT INTO `qy` VALUES (23, '天空城', 283, 1);
INSERT INTO `qy` VALUES (24, '<font color=#D65A4C>花</font><font color=#BE9774>果</font><font color=#A6D49C>山</font>', 292, 1);
INSERT INTO `qy` VALUES (25, '夕阳城', 293, 1);
INSERT INTO `qy` VALUES (26, '千水谷', 295, 1);
INSERT INTO `qy` VALUES (27, '西凉地', 297, 1);
INSERT INTO `qy` VALUES (28, '荒千里', 298, 1);
INSERT INTO `qy` VALUES (29, '<font color=#FC0000>千</font><font color=#F90000>绝</font><font color=#F60000>地</font>', 299, 1);
INSERT INTO `qy` VALUES (30, '回头岸', 300, 1);
INSERT INTO `qy` VALUES (31, '桃树林', 369, 3);

-- ----------------------------
-- Table structure for qy_copy1
-- ----------------------------
DROP TABLE IF EXISTS `qy_copy1`;
CREATE TABLE `qy_copy1`  (
  `qyid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '区域ID',
  `qyname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域名称',
  `mid` int(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  PRIMARY KEY (`qyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qy_copy1
-- ----------------------------
INSERT INTO `qy_copy1` VALUES (14, '新手村', 225);
INSERT INTO `qy_copy1` VALUES (16, '聚仙城', 239);
INSERT INTO `qy_copy1` VALUES (17, '魔化区域', 249);
INSERT INTO `qy_copy1` VALUES (18, '万千山域', 260);
INSERT INTO `qy_copy1` VALUES (20, '妖王殿', 267);
INSERT INTO `qy_copy1` VALUES (21, '炎阳城', 272);

-- ----------------------------
-- Table structure for renwu
-- ----------------------------
DROP TABLE IF EXISTS `renwu`;
CREATE TABLE `renwu`  (
  `rwname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `rwzl` int(11) NOT NULL DEFAULT 0 COMMENT '任务类型 1-收集 2-打怪 3-对话',
  `rwdj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '道具',
  `rwzb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备',
  `rwexp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '经验',
  `rwyxb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '灵石',
  `rwid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `rwyq` int(11) NOT NULL DEFAULT 0 COMMENT 'npcid/怪物id',
  `rwinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务信息',
  `rwcount` int(11) NOT NULL DEFAULT 0 COMMENT '任务数量',
  `rwlx` int(255) NOT NULL DEFAULT 0,
  `rwyp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastrwid` int(11) NOT NULL DEFAULT 0,
  `rwjineng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '技能',
  PRIMARY KEY (`rwid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of renwu
-- ----------------------------
INSERT INTO `renwu` VALUES ('山猪祸乱', 2, '1|5', '24', '100', '120', 13, 56, '最近山猪下山,扰乱了我们的生活,请帮我们赶跑他们', 5, 2, '6|3', 0, '');
INSERT INTO `renwu` VALUES ('收集蜂蜜', 1, '1|5', '23', '200', '100', 14, 8, '收集硬翅蜂的蜂蜜', 10, 2, '6|3', 0, '');
INSERT INTO `renwu` VALUES ('蛮!', 2, '1|30,9|50', '38', '500', '500', 19, 76, '魔道对这片大地始终不死心,诱惑了我们很多族人入魔了,希望你能够解救他们', 50, 1, '', -1, '');
INSERT INTO `renwu` VALUES ('杀!', 2, '1|50,9|50', '39', '600', '400', 20, 77, '我好怕,帮我杀了他们!!!', 50, 1, '', -1, '');
INSERT INTO `renwu` VALUES ('赤鳞兽皮', 2, '1|10,10|50', '39', '800', '350', 21, 82, '部落现在缺少大量兽皮过冬', 30, 2, '', -1, '');
INSERT INTO `renwu` VALUES ('找王大妈', 3, '1|20', '25', '200', '100', 24, 11, '找王大妈', 18, 3, '6|10', 25, '');
INSERT INTO `renwu` VALUES ('硬翅蜂扰', 2, '1|15,6|100,7|100', '', '200', '150', 25, 55, '硬翅蜂扰', 20, 3, '', -1, '');
INSERT INTO `renwu` VALUES ('屠尽妖王', 1, '', '45', '2000', '2000', 27, 12, '屠尽妖王', 150, 1, '9|5', -1, '');
INSERT INTO `renwu` VALUES ('故人', 3, '1|50', '29', '400', '200', 28, 11, '故人', 14, 1, '6|10', -1, '');
INSERT INTO `renwu` VALUES ('狼患', 2, '1|100', '', '400', '300', 29, 62, '狼患成灾，帮帮我们', 10, 3, '', 24, '');
INSERT INTO `renwu` VALUES ('法外狂徒', 2, '1|100', '49', '5', '5', 30, 98, '吃喝嫖赌之队长，欺负汝等文化人。', 10, 1, '', -1, '');
INSERT INTO `renwu` VALUES ('残墨收集', 1, '1|100', '49', '2500', '1500', 31, 14, '小伙子，我想你需要一本小书', 10, 1, '', -1, '');
INSERT INTO `renwu` VALUES ('水鬼闹事', 2, '1|100', '51', '1000', '1500', 32, 54, '铲除水鬼', 5, 1, '', -1, '');
INSERT INTO `renwu` VALUES ('寻老伴', 3, '1|20', '', '500', '500', 33, 28, '小伙子我想找村子里面猛男唠唠嗑', 11, 2, '', -1, '');
INSERT INTO `renwu` VALUES ('菏官魅惑', 3, '1|20', '', '500', '1000', 34, 18, '能不能打探一下菏官在干什么，我发现全村的男人都往她那里跑！', 9, 3, '', 29, '');
INSERT INTO `renwu` VALUES ('击杀血雷鹰', 2, '1|50', '', '500', '1000', 35, 66, '血鹰成灾，劳烦击杀一些。', 15, 3, '', 34, '');
INSERT INTO `renwu` VALUES ('购买药品', 3, '1|30', '', '800', '1800', 36, 9, '药品能让你持续战斗', 15, 3, '', 35, '');
INSERT INTO `renwu` VALUES ('王老五有事要说', 3, '1|20', '', '1000', '1500', 37, 15, '吹牛皮的王老五', 13, 3, '', 36, '');
INSERT INTO `renwu` VALUES ('门派管理员有什么权限？', 3, '1|50', '', '1000', '1500', 38, 13, '提示：创建门派', 26, 3, '', 37, '');
INSERT INTO `renwu` VALUES ('花果山有情况', 3, '1|30', '', '1000', '1500', 39, 26, '前去花果山查看', 6, 3, '', 38, '');
INSERT INTO `renwu` VALUES ('符箓兑换', 3, '1|30,6|50,7|50', '34', '2000', '2000', 40, 6, '消耗灵符，可提升战斗能力', 16, 3, '', 39, '');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `userpass` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('mattoid', 'LIUfei0218', '2438831a8bd71374a57261befea3d81f', '617289188@qq.com');
INSERT INTO `userinfo` VALUES ('test001', 'LIUfei0218', 'b6c19a699a7c5fb749f27b8cecda33bb', '');
INSERT INTO `userinfo` VALUES ('原神', 'yuanshenqidong', 'b52b85294f760a2c92b9bcd25e52ee38', '');
INSERT INTO `userinfo` VALUES ('kalthus', 'ly32169188', '5d92be3001b20e6f308cc573ea37dcd9', '616610272@qq.com');

-- ----------------------------
-- Table structure for yaopin
-- ----------------------------
DROP TABLE IF EXISTS `yaopin`;
CREATE TABLE `yaopin`  (
  `ypname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '药品名称',
  `ypid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `yphp` int(11) NOT NULL DEFAULT 0 COMMENT '回复血量',
  `ypgj` int(11) NOT NULL DEFAULT 0 COMMENT '攻击',
  `ypfy` int(11) NOT NULL DEFAULT 0 COMMENT '防御',
  `ypxx` int(11) NOT NULL DEFAULT 0 COMMENT '吸血',
  `ypbj` int(11) NOT NULL DEFAULT 0 COMMENT '暴击',
  `ypjg` int(11) NOT NULL DEFAULT 0 COMMENT '价格',
  `isyg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否永久 0-否 1-是',
  PRIMARY KEY (`ypid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yaopin
-- ----------------------------
INSERT INTO `yaopin` VALUES ('还原丹', 6, 100, 0, 0, 0, 0, 30, '0');
INSERT INTO `yaopin` VALUES ('回血散', 7, 300, 0, 0, 0, 0, 80, '0');
INSERT INTO `yaopin` VALUES ('回春汤', 8, 600, 0, 0, 0, 0, 155, '0');
INSERT INTO `yaopin` VALUES ('复伤丹', 9, 1200, 0, 0, 0, 0, 310, '0');
INSERT INTO `yaopin` VALUES ('初级血池', 10, 2000000, 0, 0, 0, 0, 200000, '1');
INSERT INTO `yaopin` VALUES ('高级血池', 11, 5000000, 0, 0, 0, 0, 450000, '1');
INSERT INTO `yaopin` VALUES ('袖珍血池', 12, 200000, 0, 0, 0, 0, 35000, '1');

-- ----------------------------
-- Table structure for zhuangbei
-- ----------------------------
DROP TABLE IF EXISTS `zhuangbei`;
CREATE TABLE `zhuangbei`  (
  `zbname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备名称',
  `zbinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '信息',
  `zbgj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备攻击',
  `zbfy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备防御',
  `zbbj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备爆击',
  `zbxx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备吸血',
  `zbid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zbhp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '装备血量',
  `zblv` int(11) NOT NULL DEFAULT 0 COMMENT '装备等级',
  `zbtool` int(11) NOT NULL DEFAULT 0 COMMENT '装备位置',
  PRIMARY KEY (`zbid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '装备' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of zhuangbei
-- ----------------------------
INSERT INTO `zhuangbei` VALUES ('新手木剑', '新手使用的木剑', '1', '0', '0', '1', 23, '0', 0, 1);
INSERT INTO `zhuangbei` VALUES ('新手布衣', '新手使用的布衣', '0', '2', '0', '0', 24, '10', 0, 3);
INSERT INTO `zhuangbei` VALUES ('明月之剑', '明月  明月', '3', '0', '0', '1', 25, '0', 0, 1);
INSERT INTO `zhuangbei` VALUES ('清风护甲', '取自清风常伴', '0', '5', '1', '0', 26, '25', 0, 3);
INSERT INTO `zhuangbei` VALUES ('百炼青刚剑', '百炼青刚剑', '5', '0', '0', '2', 27, '0', 0, 1);
INSERT INTO `zhuangbei` VALUES ('百炼轻蕊甲', '百炼轻蕊甲', '0', '8', '0', '0', 28, '40', 0, 3);
INSERT INTO `zhuangbei` VALUES ('初级嗜血剑', '初级嗜血剑', '2', '0', '1', '3', 29, '0', 0, 1);
INSERT INTO `zhuangbei` VALUES ('轻蕊盔', '轻蕊盔', '0', '7', '1', '0', 30, '50', 0, 2);
INSERT INTO `zhuangbei` VALUES ('雷鹰护甲', '雷鹰护甲', '0', '8', '1', '0', 31, '55', 0, 3);
INSERT INTO `zhuangbei` VALUES ('血鹰项链', '血鹰项链', '0', '3', '3', '5', 32, '20', 0, 0);
INSERT INTO `zhuangbei` VALUES ('黑魔匕首', '黑魔匕首', '14', '0', '3', '4', 33, '0', 0, 0);
INSERT INTO `zhuangbei` VALUES ('中级噬血剑', '中级噬血剑', '15', '0', '0', '4', 34, '0', 0, 0);
INSERT INTO `zhuangbei` VALUES ('普通蛮甲', '普通蛮甲', '0', '9', '2', '0', 35, '62', 0, 0);
INSERT INTO `zhuangbei` VALUES ('陨铁武棍', '陨铁武棍', '8', '3', '1', '1', 36, '0', 0, 0);
INSERT INTO `zhuangbei` VALUES ('月轮枪', '月轮枪', '10', '0', '0', '2', 37, '0', 0, 0);
INSERT INTO `zhuangbei` VALUES ('厚土甲', '厚土甲', '0', '10', '1', '0', 38, '120', 0, 0);
INSERT INTO `zhuangbei` VALUES ('嗜魂骨忍', '嗜魂骨忍', '17', '0', '5', '3', 39, '0', 0, 0);
INSERT INTO `zhuangbei` VALUES ('百斩狂澜枪', '百斩狂澜', '20', '0', '0', '5', 40, '0', 0, 0);
INSERT INTO `zhuangbei` VALUES ('缘风·虬雷衣', '缘风·虬雷衣', '0', '10', '0', '0', 41, '150', 0, 0);
INSERT INTO `zhuangbei` VALUES ('缘风·墨魂靴', '缘风·墨魂靴', '0', '10', '3', '0', 42, '155', 0, 0);
INSERT INTO `zhuangbei` VALUES ('缘风·破军腰带', '缘风·破军腰带', '0', '14', '0', '0', 43, '170', 0, 0);
INSERT INTO `zhuangbei` VALUES ('缘风·兽魂项链', '缘风·兽魂项链', '18', '12', '4', '4', 44, '55', 0, 0);
INSERT INTO `zhuangbei` VALUES ('[神器]妖王剑', '[神器]妖王剑\r\n妖王剑碎片合成', '45', '0', '13', '11', 45, '0', 0, 0);
INSERT INTO `zhuangbei` VALUES ('劫刀', '劫刀', '25', '0', '4', '5', 46, '0', 0, 0);
INSERT INTO `zhuangbei` VALUES ('军用锁子甲', '军用锁子甲', '5', '16', '5', '0', 47, '170', 0, 0);
INSERT INTO `zhuangbei` VALUES ('军官陌刀', '军官陌刀', '30', '0', '5', '4', 48, '0', 0, 0);
INSERT INTO `zhuangbei` VALUES ('缘风·发簪', '缘风·发簪', '0', '13', '4', '5', 49, '130', 0, 0);

-- ----------------------------
-- Table structure for zhurenwu
-- ----------------------------
DROP TABLE IF EXISTS `zhurenwu`;
CREATE TABLE `zhurenwu`  (
  `zrwname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zrwid` int(11) UNSIGNED NOT NULL,
  `zrwyq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `yqcount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zrwjldj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zrwjlzb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zrwjlyp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zrwjljn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `lastid` int(11) NOT NULL DEFAULT 0,
  `zrwexp` int(11) NOT NULL DEFAULT 0,
  `zrwyxb` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`zrwid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of zhurenwu
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
