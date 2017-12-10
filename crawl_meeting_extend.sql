/*
Navicat MySQL Data Transfer

Source Server         : fang
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : meeting

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-12-10 15:55:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for crawl_meeting_extend
-- ----------------------------
DROP TABLE IF EXISTS `crawl_meeting_extend`;
CREATE TABLE `crawl_meeting_extend` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键id',
  `content` text COMMENT '内容',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `images` varchar(800) DEFAULT NULL COMMENT '图片，以逗号隔开',
  `english_title` varchar(200) DEFAULT NULL COMMENT '会议译名',
  `subject` varchar(250) DEFAULT NULL COMMENT '特色分类',
  `start_time` varchar(50) DEFAULT NULL COMMENT '会议开始时间',
  `end_time` varchar(50) DEFAULT NULL COMMENT '会议结束时间',
  `location_country` varchar(50) DEFAULT NULL COMMENT '会议区域(国家)',
  `location_city` varchar(50) DEFAULT NULL COMMENT '会议地点(城市)',
  `main_hold` varchar(50) DEFAULT NULL COMMENT '主办单位',
  `joinly_hold` varchar(50) DEFAULT NULL COMMENT '协办单位',
  `under_take_hold` varchar(250) DEFAULT NULL COMMENT '承办单位',
  `discuss_title` varchar(50) DEFAULT NULL COMMENT '会议议题',
  `article_date` varchar(50) DEFAULT NULL COMMENT '全文截稿日期',
  `abstract_date` varchar(50) DEFAULT NULL COMMENT '摘要截稿日期',
  `receipt_date` varchar(50) DEFAULT NULL COMMENT '回执截止日期',
  `contact_people` varchar(200) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `email` varchar(50) DEFAULT NULL COMMENT 'eamil',
  `register_fee` varchar(50) DEFAULT NULL COMMENT '邮政编码',
  `meeting_url` varchar(250) DEFAULT NULL COMMENT '会议url',
  `meeting_overview` text COMMENT '会议简介',
  `essay_info` text COMMENT '征文信息',
  `contact_location` varchar(50) DEFAULT NULL COMMENT '通讯地址',
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮政编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
