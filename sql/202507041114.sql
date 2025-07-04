ALTER TABLE `club` ADD COLUMN `clubautosh` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动审核' AFTER `clubczb`;

CREATE TABLE `clubplayerapply` (
   `clubid` int(11) NOT NULL COMMENT '门派ID',
   `sid` varchar(255) NOT NULL,
   `uid` int(11) DEFAULT NULL COMMENT '用户ID',
   PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='申请加入';