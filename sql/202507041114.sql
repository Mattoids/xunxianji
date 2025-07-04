ALTER TABLE `club` ADD COLUMN `clubautosh` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动审核' AFTER `clubczb`;

ALTER TABLE `club` ADD COLUMN `clubupexp` int(11) NOT NULL DEFAULT 0 COMMENT '升级经验' AFTER `clubautosh`;

ALTER TABLE `clubplayer` ADD COLUMN `qiandao` date NULL DEFAULT NULL COMMENT '签到时间' AFTER `uclv`;

ALTER TABLE `clubplayer` ADD COLUMN `clubexp` int(11) NOT NULL DEFAULT 0 COMMENT '帮派建设度' AFTER `qiandao`;

ALTER TABLE `club` ADD COLUMN `clubmxsum` varchar(255) NOT NULL DEFAULT 20 COMMENT '可以容纳的人数' AFTER `clubupexp`;

CREATE TABLE `clubplayerapply` (
   `clubid` int(11) NOT NULL COMMENT '门派ID',
   `sid` varchar(255) NOT NULL,
   `uid` int(11) DEFAULT NULL COMMENT '用户ID',
   PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='申请加入';