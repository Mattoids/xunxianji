ALTER TABLE `game1` ADD COLUMN `autozd` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动战斗' AFTER `ispvp`;
ALTER TABLE `game1` ADD COLUMN `autoxg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动寻怪' AFTER `autozd`;
ALTER TABLE `game1` ADD COLUMN `autoxc` tinyint(1) NOT NULL DEFAULT 0 COMMENT '使用血池' AFTER `autoxg`;

ALTER TABLE `yaopin` ADD COLUMN `isyg` varchar(255) NOT NULL DEFAULT 0 COMMENT '是否永久 0-否 1-是' AFTER `ypjg`;
ALTER TABLE `playeryaopin` ADD COLUMN `isyg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否永久 0-否 1-是' AFTER `ypjg`;

INSERT INTO `yaopin` (`ypname`, `ypid`, `yphp`, `ypgj`, `ypfy`, `ypxx`, `ypbj`, `ypjg`, `isyg`) VALUES ('初级血池', 10, 2000000, 0, 0, 0, 0, 200000, 1);
INSERT INTO `yaopin` (`ypname`, `ypid`, `yphp`, `ypgj`, `ypfy`, `ypxx`, `ypbj`, `ypjg`, `isyg`) VALUES ('高级血池', 11, 5000000, 0, 0, 0, 0, 450000, 1);