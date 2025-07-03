ALTER TABLE `xunxian`.`game1` ADD COLUMN `autozd` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动战斗' AFTER `ispvp`;

ALTER TABLE `xunxian`.`game1` ADD COLUMN `autoxg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动寻怪' AFTER `autozd`;