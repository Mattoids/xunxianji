ALTER TABLE `clubplayer` ADD COLUMN `gongxian` date NULL COMMENT '贡献时间' AFTER `clubexp`, ADD COLUMN `xujing` date NULL COMMENT '攻打虚境时间' AFTER `gongxian`;

ALTER TABLE `playerdaoju` ADD COLUMN `djnowid` int(11) NOT NULL AUTO_INCREMENT AFTER `djid`, ADD PRIMARY KEY (`djnowid`);

CREATE TABLE `clubstore` (
 `csid` int(11) NOT NULL AUTO_INCREMENT,
 `wpid` int(11) NOT NULL COMMENT '物品ID',
 `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '物品类型 0-道具 1-药品 2-装备 3-宠物',
 `price` int(11) NOT NULL DEFAULT '1' COMMENT '价格',
 `clublv` int(11) NOT NULL DEFAULT '0' COMMENT '门派等级',
 PRIMARY KEY (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `clubwarehouse` (
 `cwid` int(11) NOT NULL AUTO_INCREMENT,
 `pwpid` int(11) NOT NULL COMMENT '物品ID',
 `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '物品类型 1-道具 2-药品 3-装备 4-宠物',
 `price` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
 `uclv` int(11) NOT NULL DEFAULT '0' COMMENT '职位',
 PRIMARY KEY (`cwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `fangshi_cw` (
  `payid` int(11) NOT NULL AUTO_INCREMENT,
  `pay` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `cwid` int(11) NOT NULL COMMENT '宠物ID',
  `cwname` varchar(255) NOT NULL DEFAULT '' COMMENT '宠物名称',
  `cwhp` int(11) NOT NULL DEFAULT '0' COMMENT '宠物血量',
  `cwmaxhp` int(11) NOT NULL DEFAULT '0' COMMENT '宠物最大血量',
  `cwgj` int(11) NOT NULL DEFAULT '0' COMMENT '攻击',
  `cwfy` int(11) NOT NULL DEFAULT '0' COMMENT '防御',
  `cwbj` int(11) NOT NULL DEFAULT '0' COMMENT '暴击',
  `cwxx` int(11) NOT NULL DEFAULT '0' COMMENT '吸血',
  `cwlv` int(11) NOT NULL DEFAULT '0' COMMENT '等级',
  `cwexp` int(11) NOT NULL DEFAULT '0' COMMENT '经验',
  `tool1` int(11) NOT NULL DEFAULT '0',
  `tool2` int(11) NOT NULL DEFAULT '0',
  `tool3` int(11) NOT NULL DEFAULT '0',
  `tool4` int(11) NOT NULL DEFAULT '0',
  `tool5` int(11) NOT NULL DEFAULT '0',
  `tool6` int(11) NOT NULL DEFAULT '0',
  `uphp` int(11) NOT NULL DEFAULT '0' COMMENT '气血成长',
  `upgj` int(11) NOT NULL DEFAULT '0' COMMENT '攻击成长',
  `upfy` int(11) NOT NULL DEFAULT '0' COMMENT '防御成长',
  `cwpz` int(11) NOT NULL DEFAULT '0' COMMENT '品质 0-普通 1-优秀 2-卓越 3-非凡 4-完美 5-逆天',
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;