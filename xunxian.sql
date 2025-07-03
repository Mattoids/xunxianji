/*
 Navicat Premium Data Transfer

 Source Server         : flarum
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44-log)
 Source Host           : localhost:3306
 Source Schema         : xunxian

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44-log)
 File Encoding         : 65001

 Date: 03/07/2025 12:05:41
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
  `clubname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `clubinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `clublv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `clubid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `clubno1` int(11) NOT NULL DEFAULT 0,
  `clubexp` int(11) NOT NULL DEFAULT 0,
  `clubyxb` int(11) NOT NULL DEFAULT 0,
  `clubczb` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clubid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of club
-- ----------------------------

-- ----------------------------
-- Table structure for clubplayer
-- ----------------------------
DROP TABLE IF EXISTS `clubplayer`;
CREATE TABLE `clubplayer`  (
  `clubid` int(11) NOT NULL DEFAULT 0,
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT 0,
  `uclv` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clubplayer
-- ----------------------------

-- ----------------------------
-- Table structure for daoju
-- ----------------------------
DROP TABLE IF EXISTS `daoju`;
CREATE TABLE `daoju`  (
  `djname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `djzl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `djinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `djid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `dhm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `dhzb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `dhdj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `dhyp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `dhyxb` int(11) NOT NULL DEFAULT 0,
  `dhczb` int(11) NOT NULL DEFAULT 0,
  `dhname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `dhexp` int(11) NOT NULL DEFAULT 0,
  `dhid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dhjiu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否永久不删除1是0否',
  PRIMARY KEY (`dhid`) USING BTREE,
  INDEX `dhm`(`dhm`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of duihuan
-- ----------------------------
INSERT INTO `duihuan` VALUES ('6666', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 1, 1);
INSERT INTO `duihuan` VALUES ('240C93CAEA5F1FA9', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 2, 0);
INSERT INTO `duihuan` VALUES ('2B5BAECC1CBA455C', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 3, 0);
INSERT INTO `duihuan` VALUES ('49852B2FA355EA54', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 4, 0);
INSERT INTO `duihuan` VALUES ('8048AE4F8EF869EE', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 5, 0);
INSERT INTO `duihuan` VALUES ('870C85455682BC80', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 6, 0);
INSERT INTO `duihuan` VALUES ('C2BAF2D5ADF0C03E', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 7, 0);
INSERT INTO `duihuan` VALUES ('I3P7ER2P4XI379FA', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 8, 0);
INSERT INTO `duihuan` VALUES ('MDZRWOZLS8CDO1SI', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 9, 0);
INSERT INTO `duihuan` VALUES ('K5HBOEFWE0UU', '33', '1|100', '9|100', 0, 0, '新手升级包', 88888, 10, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '兑换记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of duihuan_son
-- ----------------------------

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
-- Table structure for fangshi_dj
-- ----------------------------
DROP TABLE IF EXISTS `fangshi_dj`;
CREATE TABLE `fangshi_dj`  (
  `djid` int(11) NOT NULL DEFAULT 0,
  `djcount` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0,
  `pay` int(11) NOT NULL DEFAULT 0,
  `payid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `djname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `djinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`payid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fangshi_dj
-- ----------------------------

-- ----------------------------
-- Table structure for fangshi_zb
-- ----------------------------
DROP TABLE IF EXISTS `fangshi_zb`;
CREATE TABLE `fangshi_zb`  (
  `zbnowid` int(11) NOT NULL DEFAULT 0,
  `zbname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `qianghua` int(11) NOT NULL DEFAULT 0,
  `pay` int(11) NOT NULL DEFAULT 0,
  `payid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zbinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbgj` int(11) NOT NULL DEFAULT 0,
  `zbfy` int(11) NOT NULL DEFAULT 0,
  `zbbj` int(11) NOT NULL DEFAULT 0,
  `zbxx` int(11) NOT NULL DEFAULT 0,
  `zbid` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0,
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbhp` int(11) NOT NULL DEFAULT 0,
  `zblv` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`payid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fangshi_zb
-- ----------------------------

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
  `uname` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ulv` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `uyxb` int(11) NOT NULL DEFAULT 2000,
  `uczb` int(11) NOT NULL DEFAULT 100,
  `uexp` int(11) NOT NULL DEFAULT 0,
  `vip` int(11) NOT NULL DEFAULT 0,
  `uhp` int(11) NOT NULL DEFAULT 35,
  `umaxhp` int(11) NOT NULL DEFAULT 35,
  `ugj` int(11) NOT NULL DEFAULT 12,
  `ufy` int(11) NOT NULL DEFAULT 5,
  `usex` int(11) NOT NULL DEFAULT 1,
  `endtime` datetime NULL DEFAULT NULL,
  `nowmid` int(11) NOT NULL DEFAULT 225,
  `uwx` int(11) NOT NULL DEFAULT 0,
  `nowguaiwu` int(11) NOT NULL DEFAULT 0,
  `tool1` int(11) NOT NULL DEFAULT 0,
  `tool2` int(11) NOT NULL DEFAULT 0,
  `tool3` int(11) NOT NULL DEFAULT 0,
  `tool4` int(11) NOT NULL DEFAULT 0,
  `tool5` int(11) NOT NULL DEFAULT 0,
  `tool6` int(11) NOT NULL DEFAULT 0,
  `ubj` int(11) NOT NULL DEFAULT 0,
  `uxx` int(11) NOT NULL DEFAULT 0,
  `sfzx` int(11) NOT NULL DEFAULT 0,
  `qandaotime` datetime NULL DEFAULT NULL,
  `xiuliantime` datetime NULL DEFAULT NULL,
  `sfxl` int(11) NOT NULL DEFAULT 0,
  `yp1` int(11) NOT NULL DEFAULT 0,
  `yp2` int(11) NOT NULL DEFAULT 0,
  `yp3` int(11) NOT NULL DEFAULT 0,
  `cw` int(11) NOT NULL DEFAULT 0,
  `jn1` int(11) NOT NULL DEFAULT 0,
  `jn2` int(11) NOT NULL DEFAULT 0,
  `jn3` int(11) NOT NULL DEFAULT 0,
  `ispvp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game1
-- ----------------------------
INSERT INTO `game1` VALUES (1, '96c35b991f08a8a0179f2da27f08a500', '2438831a8bd71374a57261befea3d81f', 'mattoid', 1, 2000, 100, 0, 0, 35, 35, 12, 5, 1, '2025-07-03 04:04:56', 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ggliaotian
-- ----------------------------
INSERT INTO `ggliaotian` VALUES ('系统通知', '万中无一的mattoid踏上了仙途', 1, 0);

-- ----------------------------
-- Table structure for guaiwu
-- ----------------------------
DROP TABLE IF EXISTS `guaiwu`;
CREATE TABLE `guaiwu`  (
  `gname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `glv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ginfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gsex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `ghp` int(11) NOT NULL DEFAULT 0,
  `ggj` int(11) NOT NULL DEFAULT 0,
  `gfy` int(11) NOT NULL DEFAULT 0,
  `gbj` int(11) NOT NULL DEFAULT 0,
  `gxx` int(11) NOT NULL DEFAULT 0,
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
  `jnname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `jnid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jngj` int(11) NOT NULL DEFAULT 0,
  `jnfy` int(11) NOT NULL DEFAULT 0,
  `jnbj` int(11) NOT NULL DEFAULT 0,
  `jnxx` int(11) NOT NULL DEFAULT 0,
  `jndj` int(11) NOT NULL DEFAULT 0,
  `djcount` int(11) NOT NULL DEFAULT 0,
  `xiaohao` int(11) NOT NULL DEFAULT 0,
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
  `mname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mgid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mnpc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mgtime` datetime NULL DEFAULT NULL,
  `ms` int(11) NOT NULL DEFAULT 0,
  `midinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `midboss` int(11) NOT NULL DEFAULT 0,
  `mup` int(11) NOT NULL DEFAULT 0,
  `mdown` int(11) NOT NULL DEFAULT 0,
  `mleft` int(11) NOT NULL DEFAULT 0,
  `mright` int(11) NOT NULL DEFAULT 0,
  `mqy` int(11) NOT NULL DEFAULT 0,
  `playerinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `ispvp` int(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 274 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mid
-- ----------------------------
INSERT INTO `mid` VALUES ('村广场', 225, '', '11,17', '0000-00-00 00:00:00', 0, '村里的广场，闲时貌似很多人都回在这里', 0, 0, 0, 0, 226, 14, '额热向村东 走去', 0);
INSERT INTO `mid` VALUES ('村东', 226, '', '18', '0000-00-00 00:00:00', 0, '村东处', 0, 0, 0, 225, 228, 14, '额热向村口[战斗] 走去', 0);
INSERT INTO `mid` VALUES ('村口[战斗]', 228, '55|3,56|2', '', '2025-05-07 21:41:57', 0, '村口，经常有怪物来袭', 0, 0, 0, 226, 229, 14, '额热向小树林 走去', 1);
INSERT INTO `mid` VALUES ('小树林', 229, '56|2,57|5', '', '2017-01-04 17:38:48', 0, '', 0, 0, 0, 228, 230, 14, '额热向树林深处 走去', 0);
INSERT INTO `mid` VALUES ('树林深处', 230, '58|4,2|2', '', '2025-05-09 00:03:59', 0, '', 0, 0, 0, 229, 231, 14, '额热向村广场 走去', 0);
INSERT INTO `mid` VALUES ('山林外围', 231, '62|3,61|2', '', '2025-05-07 18:35:06', 0, '山林外围', 0, 0, 0, 230, 232, 14, '额热向树林深处 走去', 0);
INSERT INTO `mid` VALUES ('山中湖泊', 232, '63|2,64|5', '', '2017-01-04 12:20:20', 0, '山中湖泊', 0, 0, 0, 231, 233, 14, '额热向山林外围 走去', 0);
INSERT INTO `mid` VALUES ('湖中小岛', 233, '65|6', '', '2017-01-04 17:39:44', 0, '湖中小岛', 0, 0, 0, 232, 235, 14, '那欧向山脉东出口 走去', 0);
INSERT INTO `mid` VALUES ('山脉东出口', 235, '66|3,67|4', '', '2017-01-04 17:40:07', 0, '', 0, 0, 0, 233, 236, 14, '文峰向城西郊 走去', 0);
INSERT INTO `mid` VALUES ('城西郊', 236, '69|5', '', '2025-05-07 18:35:38', 0, '', 0, 0, 0, 235, 237, 16, '文峰向聚仙城西 走去', 0);
INSERT INTO `mid` VALUES ('聚仙城西', 237, '', '13,14', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 236, 238, 16, '文峰向聚仙西街 走去', 0);
INSERT INTO `mid` VALUES ('聚仙西街', 238, '', '15', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 237, 239, 16, '文峰向聚仙城中心 走去', 0);
INSERT INTO `mid` VALUES ('聚仙城中心', 239, '', '16,17', '0000-00-00 00:00:00', 0, '', 0, 0, 273, 238, 240, 16, '额热向门派管理处 走去', 0);
INSERT INTO `mid` VALUES ('聚仙东街', 240, '', '23', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 239, 241, 16, '文峰向聚仙城中心 走去', 0);
INSERT INTO `mid` VALUES ('聚仙城东', 241, '', '', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 240, 242, 16, '文峰向聚仙城中心 走去', 0);
INSERT INTO `mid` VALUES ('城东郊', 242, '70|3,71|2', '', '2016-08-24 02:10:07', 0, '', 0, 0, 0, 241, 243, 16, '没有角色向魔化洞窟 走去', 0);
INSERT INTO `mid` VALUES ('魔化洞窟', 243, '72|6', '', '2016-08-21 19:08:10', 0, '', 0, 246, 0, 242, 244, 16, '没有角色向洞窟出口 走去', 0);
INSERT INTO `mid` VALUES ('洞窟出口', 244, '74|5', '', '2016-08-21 19:01:07', 0, '', 0, 0, 0, 243, 245, 17, '没有角色向魔化平原 走去', 0);
INSERT INTO `mid` VALUES ('魔化平原', 245, '73|4', '', '2016-08-22 14:09:28', 0, '', 0, 0, 0, 244, 247, 17, '没有角色向部落西郊 走去', 0);
INSERT INTO `mid` VALUES ('洞窟深处', 246, '75|1', '', '2016-08-22 15:34:56', 200, '', 0, 0, 243, 0, 0, 17, '没有角色向魔化洞窟 走去', 0);
INSERT INTO `mid` VALUES ('部落西郊', 247, '76|4,77|2', '', '2016-08-23 11:52:26', 0, '', 0, 0, 0, 245, 248, 17, '没有角色向部落西 走去', 0);
INSERT INTO `mid` VALUES ('部落西', 248, '', '20', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 247, 249, 17, '文峰向部落中心 走去', 0);
INSERT INTO `mid` VALUES ('部落中心', 249, '', '15,17,21', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 248, 250, 17, '文峰向部落东 走去', 0);
INSERT INTO `mid` VALUES ('部落东', 250, '', '19,22', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 249, 251, 17, '文峰向部落东郊 走去', 0);
INSERT INTO `mid` VALUES ('部落东郊', 251, '78|6', '', '2016-08-23 15:32:59', 0, '', 0, 0, 0, 250, 252, 17, '没有角色向蛮河岸边 走去', 0);
INSERT INTO `mid` VALUES ('蛮河岸边', 252, '78|2,79|4', '', '2016-08-21 13:16:30', 0, '', 0, 0, 0, 251, 253, 17, '没有角色向渡河港口 走去', 0);
INSERT INTO `mid` VALUES ('渡河港口', 253, '80|5', '', '2016-08-20 13:51:25', 0, '', 0, 0, 0, 252, 254, 17, '没有角色向蛮河对岸 走去', 0);
INSERT INTO `mid` VALUES ('蛮河对岸', 254, '81|6', '', '2016-08-20 13:53:02', 0, '', 0, 0, 0, 253, 255, 17, '没有角色向未知山岭1 走去', 0);
INSERT INTO `mid` VALUES ('未知山岭1', 255, '82|7', '', '2016-08-22 06:55:18', 0, '', 0, 0, 0, 254, 256, 18, '文峰向未知山岭2 走去', 0);
INSERT INTO `mid` VALUES ('未知山岭2', 256, '83|5', '', '2016-08-22 06:55:32', 30, '', 0, 257, 0, 255, 258, 18, '文峰向未知山岭3 走去', 0);
INSERT INTO `mid` VALUES ('无人山洞', 257, '84|1', '', '2017-01-04 17:14:02', 200, '', 0, 0, 256, 0, 0, 18, '文峰向未知山岭2 走去', 0);
INSERT INTO `mid` VALUES ('未知山岭3', 258, '85|6', '', '2016-08-21 17:26:27', 200, '', 0, 0, 0, 256, 259, 18, '文峰向风铃古镇西 走去', 0);
INSERT INTO `mid` VALUES ('风铃古镇西', 259, '', '15', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 258, 260, 18, '文峰向风铃古镇 走去', 0);
INSERT INTO `mid` VALUES ('风铃古镇', 260, '', '24', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 259, 261, 18, '文峰向村广场 走去', 0);
INSERT INTO `mid` VALUES ('风铃古镇东', 261, '', '19', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 260, 262, 18, '文峰向妖兽丛林外部1 走去', 0);
INSERT INTO `mid` VALUES ('妖兽丛林外部1', 262, '86|3', '', '2016-08-23 14:30:22', 200, '', 0, 0, 0, 261, 263, 18, '文峰向妖兽丛林外部2 走去', 0);
INSERT INTO `mid` VALUES ('妖兽丛林外部2', 263, '87|7', '', '2016-08-21 09:46:46', 0, '', 0, 0, 0, 262, 264, 18, '文峰向丛林深处妖兽山 走去', 0);
INSERT INTO `mid` VALUES ('丛林深处妖兽山', 264, '88|5', '', '2016-08-23 11:54:01', 100, '', 0, 0, 0, 263, 265, 18, '文峰向万妖山底部 走去', 0);
INSERT INTO `mid` VALUES ('万妖山底部', 265, '89|4,90|4', '', '2025-05-07 20:35:55', 0, '', 0, 0, 0, 264, 266, 18, '文峰向万妖山腰 走去', 0);
INSERT INTO `mid` VALUES ('万妖山腰', 266, '91|3,92|5', '', '2016-08-19 10:05:38', 0, '', 0, 268, 267, 265, 269, 18, '文峰向村广场 走去', 0);
INSERT INTO `mid` VALUES ('妖王殿外围', 267, '94|3,95|3', '24', '2025-05-07 22:02:06', 0, '', 0, 266, 0, 0, 0, 20, '额热向炎阳城中心 走去', 0);
INSERT INTO `mid` VALUES ('万妖山顶', 268, '93|7', '', '2016-08-23 15:34:56', 0, '', 0, 0, 266, 0, 0, 18, '文峰向万妖山腰 走去', 0);
INSERT INTO `mid` VALUES ('炎阳郊外', 269, '96|4,97|4', '', '2016-08-22 07:01:01', 0, '', 0, 0, 0, 266, 270, 21, '文峰向部落中心 走去', 0);
INSERT INTO `mid` VALUES ('炎阳西郊', 270, '98|7', '', '2016-08-23 15:33:16', 0, '', 0, 0, 0, 269, 271, 21, '文峰向炎阳郊外 走去', 0);
INSERT INTO `mid` VALUES ('炎阳西街', 271, '', '', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 270, 272, 21, '文峰向炎阳西郊 走去', 0);
INSERT INTO `mid` VALUES ('炎阳城中心', 272, '', '24,25', '0000-00-00 00:00:00', 0, '', 0, 0, 0, 271, 0, 21, '额热向村广场 走去', 0);
INSERT INTO `mid` VALUES ('门派管理处', 273, '', '26', '0000-00-00 00:00:00', 0, '', 0, 239, 0, 0, 0, 16, '额热向妖王殿外围 走去', 0);

-- ----------------------------
-- Table structure for midguaiwu
-- ----------------------------
DROP TABLE IF EXISTS `midguaiwu`;
CREATE TABLE `midguaiwu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `ghp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `ggj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `gfy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `glv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mid` int(11) NOT NULL DEFAULT 0,
  `gyid` int(11) NOT NULL DEFAULT 0,
  `gexp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `gmaxhp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `gbj` int(11) NOT NULL DEFAULT 0,
  `gxx` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2314312 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of midguaiwu
-- ----------------------------
INSERT INTO `midguaiwu` VALUES (2249197, '魔化蛮狼', '700', '87', '71', '23', 251, 78, '173', 'e0e644a3727f0f1671e917f7b376c66f', '700', 0, 0);
INSERT INTO `midguaiwu` VALUES (2253163, '山猪', '40', '4', '4', '1', 228, 56, '8', '0e698c7ec2d718b658fa287c45929571', '40', 0, 0);
INSERT INTO `midguaiwu` VALUES (2280014, '雷萝妖', '1474', '265', '238', '39', 266, 92, '254', '099f465c0c34dd5ef59f230a21447af4', '1960', 0, 0);
INSERT INTO `midguaiwu` VALUES (2280015, '雷萝妖', '1960', '265', '238', '39', 266, 92, '254', '', '1960', 0, 0);
INSERT INTO `midguaiwu` VALUES (2290121, '魔道控兽师', '790', '99', '81', '26', 253, 80, '169', '', '790', 0, 0);
INSERT INTO `midguaiwu` VALUES (2290131, '百年蛇怪', '820', '103', '84', '27', 254, 81, '176', '', '820', 0, 0);
INSERT INTO `midguaiwu` VALUES (2290134, '百年蛇怪', '820', '103', '84', '27', 254, 81, '176', '', '820', 0, 0);
INSERT INTO `midguaiwu` VALUES (2297445, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '281', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2297446, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '281', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2297451, '赤炼蝮蛇妖', '1660', '224', '201', '33', 263, 87, '281', '', '1660', 0, 0);
INSERT INTO `midguaiwu` VALUES (2299847, '魔化蛮狼', '700', '87', '71', '23', 252, 78, '173', '', '700', 0, 0);
INSERT INTO `midguaiwu` VALUES (2299850, '魔化狂狮', '730', '91', '74', '24', 252, 79, '180', '', '730', 0, 0);
INSERT INTO `midguaiwu` VALUES (2299851, '魔化狂狮', '730', '91', '74', '24', 252, 79, '180', '', '730', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302033, '岩魔', '1560', '211', '189', '31', 258, 85, '202', '', '1560', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302036, '岩魔', '1560', '211', '189', '31', 258, 85, '202', '', '1560', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302037, '岩魔', '1560', '211', '189', '31', 258, 85, '202', '', '1560', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302423, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302424, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302425, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302426, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302427, '魔化之鸦人', '610', '76', '62', '20', 244, 74, '170', '', '610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302461, '魔化之剑魔', '550', '68', '56', '18', 243, 72, '153', '', '550', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302462, '魔化之剑魔', '550', '68', '56', '18', 243, 72, '153', '', '550', 0, 0);
INSERT INTO `midguaiwu` VALUES (2302474, '魔化之通臂猿', '490', '61', '50', '16', 242, 70, '136', '781a121e409741ff53f5978578067146', '490', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305727, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305728, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305729, '赤鳞兽', '850', '106', '87', '28', 255, 82, '238', '', '850', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305732, '棘鼠', '880', '110', '90', '29', 256, 83, '218', '', '880', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305733, '棘鼠', '880', '110', '90', '29', 256, 83, '218', '', '880', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305734, '棘鼠', '880', '110', '90', '29', 256, 83, '218', '', '880', 0, 0);
INSERT INTO `midguaiwu` VALUES (2305736, '棘鼠', '880', '110', '90', '29', 256, 83, '218', '', '880', 0, 0);
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
INSERT INTO `midguaiwu` VALUES (2310366, '魔化山魈', '640', '80', '65', '21', 246, 75, '179', '', '640', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313514, '狂暴野狼', '144', '23', '19', '6', 231, 62, '45', 'bb2a45b7652a7900e7810128a329597e', '190', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313635, '入魔蛮族战士', '640', '80', '65', '21', 247, 76, '158', '', '640', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313636, '入魔蛮族战士', '640', '80', '65', '21', 247, 76, '158', '', '640', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313637, '入魔蛮族战士', '640', '80', '65', '21', 247, 76, '158', '', '640', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313638, '入魔蛮族战士', '640', '80', '65', '21', 247, 76, '158', '', '640', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313639, '入魔蛮族祭祀', '670', '84', '68', '22', 247, 77, '187', '', '670', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313640, '入魔蛮族祭祀', '670', '84', '68', '22', 247, 77, '187', '', '670', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313641, '百年穿山甲', '2000', '150', '330', '34', 264, 88, '255', '', '2000', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313642, '百年穿山甲', '2000', '150', '330', '34', 264, 88, '255', '', '2000', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313644, '百年穿山甲', '2000', '150', '330', '34', 264, 88, '255', '', '2000', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313645, '百年穿山甲', '2000', '150', '330', '34', 264, 88, '255', '', '2000', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313678, '嗜灵鼠妖', '1610', '218', '195', '32', 262, 86, '208', '', '1610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313679, '嗜灵鼠妖', '1610', '218', '195', '32', 262, 86, '208', '', '1610', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313686, '魔化蛮狼', '700', '87', '71', '23', 251, 78, '150', '', '700', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313687, '魔化蛮狼', '700', '87', '71', '23', 251, 78, '150', '', '700', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313689, '魔化蛮狼', '700', '87', '71', '23', 251, 78, '150', '', '700', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313690, '魔化蛮狼', '700', '87', '71', '23', 251, 78, '150', '', '700', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313691, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313692, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313693, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313694, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313695, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313696, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313697, '叛兵队长', '3510', '440', '405', '50', 270, 98, '375', '', '3510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313709, '血鸦', '2010', '272', '244', '40', 268, 93, '260', '', '2010', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313710, '血鸦', '2010', '272', '244', '40', 268, 93, '260', '', '2010', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313886, '魔化之通臂猿', '490', '61', '50', '16', 242, 70, '136', '', '490', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313887, '魔化之通臂猿', '490', '61', '50', '16', 242, 70, '136', '', '490', 0, 0);
INSERT INTO `midguaiwu` VALUES (2313888, '魔化之灵猴', '520', '65', '53', '17', 242, 71, '145', '', '520', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314179, '百岁龙雀', '250', '32', '25', '8', 232, 64, '60', '', '250', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314180, '百岁龙雀', '250', '32', '25', '8', 232, 64, '60', '', '250', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314182, '百岁龙雀', '250', '32', '25', '8', 232, 64, '60', '', '250', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314183, '百岁龙雀', '250', '32', '25', '8', 232, 64, '60', '', '250', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314231, '怨灵', '1510', '204', '183', '30', 257, 84, '225', '', '1510', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314236, '老虎', '70', '8', '6', '2', 229, 57, '17', '', '70', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314238, '老虎', '70', '8', '6', '2', 229, 57, '17', '', '70', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314241, '荷花花魅', '280', '35', '28', '9', 233, 65, '68', '', '280', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314242, '荷花花魅', '280', '35', '28', '9', 233, 65, '68', '', '280', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314243, '荷花花魅', '280', '35', '28', '9', 233, 65, '68', '', '280', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314250, '雷鹰', '310', '38', '31', '10', 235, 67, '85', '', '310', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314251, '雷鹰', '310', '38', '31', '10', 235, 67, '85', '', '310', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314267, '狂暴野狼', '190', '23', '19', '6', 231, 62, '45', '', '190', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314269, '狂暴野狼', '190', '23', '19', '6', 231, 62, '45', '', '190', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314271, '嗜血野狼', '160', '22', '16', '5', 231, 61, '38', '', '160', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314274, '魔修士', '400', '49', '40', '13', 236, 69, '85', '', '400', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314275, '魔修士', '400', '49', '40', '13', 236, 69, '85', '', '400', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314276, '魔修士', '400', '49', '40', '13', 236, 69, '85', '', '400', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314277, '青古虎', '1760', '238', '214', '35', 265, 89, '228', '', '1760', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314278, '青古虎', '1760', '238', '214', '35', 265, 89, '228', '', '1760', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314279, '青古虎', '1760', '238', '214', '35', 265, 89, '228', '', '1760', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314280, '青古虎', '1760', '238', '214', '35', 265, 89, '228', '', '1760', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314281, '烈珠鹰', '1860', '252', '226', '37', 265, 90, '278', '', '1860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314282, '烈珠鹰', '1860', '252', '226', '37', 265, 90, '278', '', '1860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314283, '烈珠鹰', '1860', '252', '226', '37', 265, 90, '278', '', '1860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314284, '烈珠鹰', '1860', '252', '226', '37', 265, 90, '278', '', '1860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314285, '硬翅蜂', '40', '5', '3', '1', 228, 55, '9', '', '40', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314290, '血鸦王', '5860', '594', '558', '55', 267, 94, '358', '', '5860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314292, '血鸦王', '5860', '594', '558', '55', 267, 94, '358', '', '5860', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314293, '黑艳妖王', '4530', '653', '454', '56', 267, 95, '420', '', '4530', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314294, '黑艳妖王', '4530', '653', '454', '56', 267, 95, '420', '', '4530', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314295, '黑艳妖王', '4530', '653', '454', '56', 267, 95, '420', '', '4530', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314306, '花妖', '110', '15', '7', '3', 230, 58, '20', '', '110', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314307, '花妖', '110', '15', '7', '3', 230, 58, '20', '', '110', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314308, '花妖', '110', '15', '7', '3', 230, 58, '20', '', '110', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314309, '花妖', '110', '15', '7', '3', 230, 58, '20', '', '110', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314310, '花螺', '200', '20', '5', '4', 230, 2, '30', '', '200', 0, 0);
INSERT INTO `midguaiwu` VALUES (2314311, '花螺', '200', '20', '5', '4', 230, 2, '30', '', '200', 0, 0);

-- ----------------------------
-- Table structure for npc
-- ----------------------------
DROP TABLE IF EXISTS `npc`;
CREATE TABLE `npc`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nsex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `ninfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `muban` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `taskid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of npc
-- ----------------------------
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'npc领取记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of npc_lingqu
-- ----------------------------

-- ----------------------------
-- Table structure for playerchongwu
-- ----------------------------
DROP TABLE IF EXISTS `playerchongwu`;
CREATE TABLE `playerchongwu`  (
  `cwid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cwname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `cwhp` int(11) NOT NULL DEFAULT 0,
  `cwmaxhp` int(11) NOT NULL DEFAULT 0,
  `cwgj` int(11) NOT NULL DEFAULT 0,
  `cwfy` int(11) NOT NULL DEFAULT 0,
  `cwbj` int(11) NOT NULL DEFAULT 0,
  `cwxx` int(11) NOT NULL DEFAULT 0,
  `cwlv` int(11) NOT NULL DEFAULT 0,
  `cwexp` int(11) NOT NULL DEFAULT 0,
  `tool1` int(11) NOT NULL DEFAULT 0,
  `tool2` int(11) NOT NULL DEFAULT 0,
  `tool3` int(11) NOT NULL DEFAULT 0,
  `tool4` int(11) NOT NULL DEFAULT 0,
  `tool5` int(11) NOT NULL DEFAULT 0,
  `tool6` int(11) NOT NULL DEFAULT 0,
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uphp` int(11) NOT NULL DEFAULT 0,
  `upgj` int(11) NOT NULL DEFAULT 0,
  `upfy` int(11) NOT NULL DEFAULT 0,
  `cwpz` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cwid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerchongwu
-- ----------------------------

-- ----------------------------
-- Table structure for playerdaoju
-- ----------------------------
DROP TABLE IF EXISTS `playerdaoju`;
CREATE TABLE `playerdaoju`  (
  `djname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `djzl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `djinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT 0,
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `djsum` int(11) NOT NULL DEFAULT 0,
  `djid` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerdaoju
-- ----------------------------

-- ----------------------------
-- Table structure for playerjineng
-- ----------------------------
DROP TABLE IF EXISTS `playerjineng`;
CREATE TABLE `playerjineng`  (
  `jnname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `jnid` int(11) NOT NULL DEFAULT 0,
  `jngj` int(11) NOT NULL DEFAULT 0,
  `jnfy` int(11) NOT NULL DEFAULT 0,
  `jnbj` int(11) NOT NULL DEFAULT 0,
  `jnxx` int(11) NOT NULL DEFAULT 0,
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jncount` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerjineng
-- ----------------------------

-- ----------------------------
-- Table structure for playerrenwu
-- ----------------------------
DROP TABLE IF EXISTS `playerrenwu`;
CREATE TABLE `playerrenwu`  (
  `rwname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwzl` int(11) NOT NULL DEFAULT 0,
  `rwdj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwzb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwexp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwyxb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `rwzt` int(11) NOT NULL DEFAULT 0,
  `rwid` int(11) NOT NULL DEFAULT 0,
  `rwyq` int(11) NOT NULL DEFAULT 0,
  `rwcount` int(11) NOT NULL DEFAULT 0,
  `rwnowcount` int(11) NOT NULL DEFAULT 0,
  `rwlx` int(11) NOT NULL DEFAULT 0,
  `rwyp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `data` int(11) NOT NULL DEFAULT 0,
  `rwjineng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerrenwu
-- ----------------------------

-- ----------------------------
-- Table structure for playeryaopin
-- ----------------------------
DROP TABLE IF EXISTS `playeryaopin`;
CREATE TABLE `playeryaopin`  (
  `ypname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `ypid` int(11) NOT NULL DEFAULT 0,
  `yphp` int(11) NOT NULL DEFAULT 0,
  `ypgj` int(11) NOT NULL DEFAULT 0,
  `ypfy` int(11) NOT NULL DEFAULT 0,
  `ypxx` int(11) NOT NULL DEFAULT 0,
  `ypbj` int(11) NOT NULL DEFAULT 0,
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ypsum` int(11) NOT NULL DEFAULT 0,
  `ypjg` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playeryaopin
-- ----------------------------

-- ----------------------------
-- Table structure for playerzhuangbei
-- ----------------------------
DROP TABLE IF EXISTS `playerzhuangbei`;
CREATE TABLE `playerzhuangbei`  (
  `zbname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbgj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbfy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbbj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbxx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbid` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0,
  `zbnowid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zbhp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `qianghua` int(11) NOT NULL DEFAULT 0,
  `zblv` int(11) NOT NULL DEFAULT 0,
  `zbtool` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`zbnowid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playerzhuangbei
-- ----------------------------

-- ----------------------------
-- Table structure for qy
-- ----------------------------
DROP TABLE IF EXISTS `qy`;
CREATE TABLE `qy`  (
  `qyid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `qyname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`qyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qy
-- ----------------------------
INSERT INTO `qy` VALUES (14, '新手村', 225);
INSERT INTO `qy` VALUES (16, '聚仙城', 239);
INSERT INTO `qy` VALUES (17, '魔化区域', 249);
INSERT INTO `qy` VALUES (18, '万千山域', 260);
INSERT INTO `qy` VALUES (20, '妖王殿', 267);
INSERT INTO `qy` VALUES (21, '炎阳城', 272);

-- ----------------------------
-- Table structure for renwu
-- ----------------------------
DROP TABLE IF EXISTS `renwu`;
CREATE TABLE `renwu`  (
  `rwname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwzl` int(11) NOT NULL DEFAULT 0,
  `rwdj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwzb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwexp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwyxb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rwyq` int(11) NOT NULL DEFAULT 0,
  `rwinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `rwcount` int(11) NOT NULL DEFAULT 0,
  `rwlx` int(255) NOT NULL DEFAULT 0,
  `rwyp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastrwid` int(11) NOT NULL DEFAULT 0,
  `rwjineng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`rwid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `userpass` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('mattoid', 'LIUfei0218', '2438831a8bd71374a57261befea3d81f', '617289188@qq.com');

-- ----------------------------
-- Table structure for yaopin
-- ----------------------------
DROP TABLE IF EXISTS `yaopin`;
CREATE TABLE `yaopin`  (
  `ypname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `ypid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `yphp` int(11) NOT NULL DEFAULT 0,
  `ypgj` int(11) NOT NULL DEFAULT 0,
  `ypfy` int(11) NOT NULL DEFAULT 0,
  `ypxx` int(11) NOT NULL DEFAULT 0,
  `ypbj` int(11) NOT NULL DEFAULT 0,
  `ypjg` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ypid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yaopin
-- ----------------------------
INSERT INTO `yaopin` VALUES ('还原丹', 6, 100, 0, 0, 0, 0, 30);
INSERT INTO `yaopin` VALUES ('回血散', 7, 300, 0, 0, 0, 0, 80);
INSERT INTO `yaopin` VALUES ('回春汤', 8, 600, 0, 0, 0, 0, 155);
INSERT INTO `yaopin` VALUES ('复伤丹', 9, 1200, 0, 0, 0, 0, 310);

-- ----------------------------
-- Table structure for zhuangbei
-- ----------------------------
DROP TABLE IF EXISTS `zhuangbei`;
CREATE TABLE `zhuangbei`  (
  `zbname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbinfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbgj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbfy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbbj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbxx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zbid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zbhp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `zblv` int(11) NOT NULL DEFAULT 0,
  `zbtool` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`zbid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
