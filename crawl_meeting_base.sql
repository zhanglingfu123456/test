/*
Navicat MySQL Data Transfer

Source Server         : fang
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : meeting

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-12-10 15:55:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for crawl_meeting_base
-- ----------------------------
DROP TABLE IF EXISTS `crawl_meeting_base`;
CREATE TABLE `crawl_meeting_base` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(100) NOT NULL DEFAULT '0' COMMENT '会议标题meeting_base',
  `meeting_time` varchar(50) NOT NULL DEFAULT '00:00:00' COMMENT '会议召开时间',
  `meeting_location` varchar(30) NOT NULL DEFAULT '0' COMMENT '会议地址',
  `init_url` varchar(200) NOT NULL DEFAULT '0' COMMENT '原文链接的url地',
  `crawl_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '爬取时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1295 DEFAULT CHARSET=utf8;
