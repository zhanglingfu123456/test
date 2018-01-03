/*
Navicat MySQL Data Transfer

Source Server         : gexin
Source Server Version : 50630
Source Host           : code-svn.iask.in:3306
Source Database       : weixing_test

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2017-12-11 22:48:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qiye_bind_user
-- ----------------------------
DROP TABLE IF EXISTS `qiye_bind_user`;
CREATE TABLE `qiye_bind_user` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) DEFAULT NULL COMMENT '类型  0  业主  1游客   2租客',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) DEFAULT NULL COMMENT '用户名字',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别。0表示未定义，1表示男性，2表示女性',
  `tel` varchar(255) DEFAULT NULL,
  `weixinid` varchar(64) DEFAULT NULL COMMENT '微信号',
  `extattr` varchar(1000) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL COMMENT '职位信息',
  `department` varchar(100) DEFAULT NULL COMMENT '部门ID',
  `email` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '关注状态: 1=已关注，2=已禁用，4=未关注',
  `xiaoqu` varchar(255) DEFAULT NULL,
  `yuanqu` varchar(255) DEFAULT NULL,
  `loudong` varchar(255) DEFAULT NULL,
  `danyuan` varchar(255) DEFAULT NULL,
  `fanghao` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL COMMENT '生日',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=405044421 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of qiye_bind_user
-- ----------------------------
INSERT INTO `qiye_bind_user` VALUES ('405044377', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWCwTJRUOVbnicTSVSEltCcf4qeNwjTX2gAR36dBevcYPaw/', 'huangjunhao', '黄俊豪', '1', '15067988453', 'huangjunhao9624', '{attrs=[]}', null, '[4, 16]', null, '1', null, null, null, null, null, '2017-07-03 10:52:26', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044378', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWBDo26KHYdWbVFdO4dRqoMh7VKfGy6OuSmqqy6tLg1Ldg/', 'xujiajun9260', '徐佳俊', '1', '13667280675', null, '{attrs=[]}', null, '[17]', null, '1', null, null, null, null, null, '2017-07-03 11:28:27', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044379', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWAqpBMUTqtvjFyYmTteVFbWBKicSAwpS3NO5ETHPEsy6Lw/', 'ALEN', '万亮', '1', '15797641647', 'wanliang10', '{attrs=[]}', null, '[4, 7, 17, 19]', null, '1', null, null, null, null, null, '2017-06-28 16:41:10', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044380', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWAYcVS7tUAayAwhO39P1FAaphJRnqicjZRlgtsbBHrOSBg/', 'TINA', 'TINA', '2', '18667195757', 'talook', '{attrs=[]}', '互联网运营', '[4, 15, 17, 18, 20]', 'talook@foxmail.com', '1', null, null, null, null, null, '2017-07-03 10:22:41', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044391', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWBDo26KHYdWbVFdO4dRqoMhXKvicTBLjTrxRLurU2GB7oQ/', 'lishu1578', '立树', '1', '15050052536', null, '{attrs=[]}', null, '[17]', null, '1', '靖江花城-MLS', '/', '2号楼', '1单元', '303', '2017-06-28 17:51:05', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044396', '2', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWDV2mRXY9iaePMe5XqxwjhVia3YsCtveU42OWB3knmVsPuQ/', 'diandainxiaonou', '李棉', '2', '13162833691', null, '{attrs=[]}', null, '[4, 17, 18]', null, '1', null, null, null, null, null, '2017-07-03 10:51:24', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044398', '2', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWA7MhMLiaOV9nFlHLR0NAe8IYaGHXVEzWroDtpF5X2diacg/', 'crystal', '陈然', '2', '18805810843', 'chenrancrystal', '{attrs=[{name=生日, value=1993/12/23}]}', null, '[4, 14, 17]', null, '1', null, null, null, null, null, '2017-07-03 10:50:59', null, '2017年-06月-29日');
INSERT INTO `qiye_bind_user` VALUES ('405044399', '2', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWBDo26KHYdWbVFdO4dRqoMhBqO3vQhEhZtfd3jiammlMibA/', 'ceshi5118', '测试', '1', '17601270239', null, '{attrs=[]}', '3', '[18]', null, '1', '世纪花城-MLS', '/', '1号楼', '/', '201', '2017-06-28 18:42:26', null, '2017年-06月-29日');
INSERT INTO `qiye_bind_user` VALUES ('405044402', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWBDo26KHYdWbVFdO4dRqoMhXOaRVSXArTkEbyXqpbd18w/', 'huangshuizhang24235', '黄水长2', '1', '15021308830', null, '{attrs=[]}', null, '[17, 18]', null, '1', '靖江花城-MLS', '/', '1号楼', '/', '401', '2017-07-02 23:14:06', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044403', '0', null, 'huangshuizhang5094', '黄水长', '1', '13816426493', null, '{\"attrs\":[{\"name\":\"小区\",\"value\":\"靖江花城-MLS\"},{\"name\":\"园区/苑\",\"value\":\"/\"},{\"name\":\"楼栋号\",\"value\":\"2号楼\"},{\"name\":\"单元号\",\"value\":\"1单元\"},{\"name\":\"房号\",\"value\":\"203\"}]}', null, null, null, null, '靖江花城-MLS', '/', '2号楼', '1单元', '203', '2017-06-28 21:18:12', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044404', null, 'http://shp.qpic.cn/bizmp/l4sKOQQrtWAqpBMUTqtvjFyYmTteVFbWhhe0uVfRanqMppIq4Gicvdw/', 'hsc', '黄水长', '1', '13816426493', null, '{attrs=[]}', '2', '[10, 14, 15, 17, 18]', null, '1', null, null, null, null, null, '2017-07-02 23:34:23', null, '2011年-07月-02日');
INSERT INTO `qiye_bind_user` VALUES ('405044405', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWBDo26KHYdWbVFdO4dRqoMhweHLD5XibSyxtBEdqiaiaYceQ/', 'gexinKelen2893', '格欣Kelen', '1', '15800935953', null, '{attrs=[]}', null, '[17]', null, '1', '靖江花城-MLS', '/', '2号楼', '1单元', '302', '2017-07-03 11:22:38', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044406', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWAqpBMUTqtvjFyYmTteVFbWpb5ALSRl1QA1Mjneiah8LUA/', 'xiaodeming', '肖得明', '1', '18606160343', 'xiaodeming0324', '{attrs=[]}', null, '[1, 4, 15, 17, 19, 20]', null, '1', null, null, null, null, null, '2017-07-02 22:52:09', null, '2017年-07月-03日');
INSERT INTO `qiye_bind_user` VALUES ('405044407', '1', null, 'huangjunhao1492', '黄俊豪', '1', '17621509624', null, null, null, null, null, null, null, null, null, null, null, '2017-06-29 14:26:23', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044408', '1', null, 'fangfang3683', '芳芳', null, '18217703546', null, null, null, null, null, null, null, null, null, null, null, '2017-06-29 14:29:56', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044409', null, 'http://shp.qpic.cn/bizmp/l4sKOQQrtWAqpBMUTqtvjFyYmTteVFbWnibEW4peTXJonLRBBvwqbqg/', 'jiandan-18', '谢晓方', '2', '18217703546', null, '{attrs=[]}', null, '[2]', null, '1', null, null, null, null, null, '2017-06-29 14:32:48', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044410', '1', null, 'abby5187', 'abby', null, '18516303510', null, null, null, null, null, null, null, null, null, null, null, '2017-06-29 14:41:08', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044411', null, 'http://shp.qpic.cn/bizmp/l4sKOQQrtWAqpBMUTqtvjFyYmTteVFbWDib5xUO831ibK2yoXJ3CrAuQ/', 'abby', '伏晓嫣', '2', '18516303510', 'fxy722', '{attrs=[]}', null, '[7]', 'abby.fu@mls-sh.com', '1', null, null, null, null, null, '2017-06-29 14:43:20', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044412', null, 'http://shp.qpic.cn/bizmp/l4sKOQQrtWBDo26KHYdWbVFdO4dRqoMh8HQ2hlOsmxb78IPFcXXTicA/', 'xiaodesong3834', '肖得松', '1', '18569471207', null, '{attrs=[]}', null, '[15, 17, 19, 20]', null, '1', null, null, null, null, null, '2017-07-03 11:12:53', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044413', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWDB5kicAKIJHzu82uVqicuMMhuSIRUsfENzCkI3d2ctSNhw/', 'zhangmengmeng5179', '张梦梦', '1', '15921705476', null, '{attrs=[]}', null, '[17]', null, '1', '靖江花城-MLS', '/', '1号楼', '/', '201', '2017-06-29 18:47:45', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044414', '0', 'http://shp.qpic.cn/bizmp/l4sKOQQrtWBbWU45caHXO81DsXh5vaZxVib2Vm5pWvibuibYia6MENZGuw/', 'chenceshi7041', '陈测试', '1', '18060877055', null, '{attrs=[]}', null, '[17]', null, '1', '靖江花城-MLS', '/', '2号楼', '1单元', '203', '2017-06-30 12:29:37', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044415', '0', null, 'lijun8924', '黎峻', '1', '15874277103', null, '{\"attrs\":[{\"name\":\"小区\",\"value\":\"世纪花城-MLS\"},{\"name\":\"园区/苑\",\"value\":\"/\"},{\"name\":\"楼栋号\",\"value\":\"2号楼\"},{\"name\":\"单元号\",\"value\":\"1单元\"},{\"name\":\"房号\",\"value\":\"202\"}]}', null, null, null, null, '世纪花城-MLS', '/', '2号楼', '1单元', '202', '2017-07-03 10:43:45', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044416', '1', null, 'Sally8964', 'Sally', null, '15675328992', null, null, null, null, null, null, null, null, null, null, null, '2017-07-03 10:58:24', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044417', null, 'http://shp.qpic.cn/bizmp/l4sKOQQrtWCwTJRUOVbnicTSVSEltCcf4BN1iaVdQia0OQR54hnzm6Frw/', 'qingyanliu', '覃艳柳', '2', '15675328992', 'qyliummn', '{attrs=[]}', null, '[2]', '476954930@qq.com', '1', null, null, null, null, null, '2017-07-03 11:15:52', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044418', null, 'http://shp.qpic.cn/bizmp/l4sKOQQrtWBDo26KHYdWbVFdO4dRqoMhEje2VUONnBZXKYkvueZ2Wg/', 'wangliangjun4942', '王梁俊', '1', '13588327387', null, '{attrs=[]}', null, '[17]', null, '1', null, null, null, null, null, '2017-07-03 11:18:04', null, null);
INSERT INTO `qiye_bind_user` VALUES ('405044420', '0', null, 'huangshuizhang32882', '黄水长3', '1', '17301782172', null, '{attrs=[]}', null, '[17]', null, '1', '靖江花城-MLS', '/', '2号楼', '1单元', '303', '2017-07-03 19:42:24', null, null);
