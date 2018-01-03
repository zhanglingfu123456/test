/*
Navicat MySQL Data Transfer

Source Server         : gexin
Source Server Version : 50630
Source Host           : code-svn.iask.in:3306
Source Database       : gexin_shandian

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2017-12-10 17:44:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` varchar(64) NOT NULL COMMENT '如果 企业 就用企业id   l会计就用  会计id',
  `type` int(11) DEFAULT NULL COMMENT ' 0  企业账户    1  会计账户',
  `card_count` int(11) DEFAULT '0',
  `income` decimal(10,2) DEFAULT '0.00' COMMENT '累计收入金额',
  `withdrawals_money` decimal(10,2) DEFAULT NULL COMMENT '提现的金额',
  `icemoney` decimal(10,2) DEFAULT NULL COMMENT '冻结金额',
  `validmoney` decimal(10,2) DEFAULT NULL COMMENT '有效金额 ',
  `code` varchar(255) DEFAULT NULL COMMENT '交易码',
  `datestr` varchar(255) DEFAULT NULL COMMENT '最后交易字符串',
  `state` int(11) DEFAULT NULL COMMENT ' 0  正常  1异常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户金额信息';

-- ----------------------------
-- Table structure for t_addr_areas
-- ----------------------------
DROP TABLE IF EXISTS `t_addr_areas`;
CREATE TABLE `t_addr_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` varchar(20) NOT NULL,
  `area` varchar(50) NOT NULL,
  `cityid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8 COMMENT='行政区域县区信息表';

-- ----------------------------
-- Table structure for t_addr_cities
-- ----------------------------
DROP TABLE IF EXISTS `t_addr_cities`;
CREATE TABLE `t_addr_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `provinceid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='行政区域地州市信息表';

-- ----------------------------
-- Table structure for t_addr_provinces
-- ----------------------------
DROP TABLE IF EXISTS `t_addr_provinces`;
CREATE TABLE `t_addr_provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinceid` varchar(20) NOT NULL,
  `province` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='省份信息表';

-- ----------------------------
-- Table structure for t_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_log`;
CREATE TABLE `t_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID ',
  `log_level` varchar(255) DEFAULT NULL COMMENT '级别  ',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志的详细信息',
  `code` int(11) DEFAULT NULL COMMENT '日志代码代码',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `query` (`log_level`,`log_info`,`createtime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3975 DEFAULT CHARSET=utf8 COMMENT='系统日志信息';

-- ----------------------------
-- Table structure for t_admin_res
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_res`;
CREATE TABLE `t_admin_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(11) DEFAULT NULL COMMENT '父类ID',
  `name` varchar(111) DEFAULT NULL COMMENT '资源名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '资源的地址',
  `icon_cls` varchar(255) DEFAULT 'icol-blueprint' COMMENT '图标',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `css_tag` varchar(64) DEFAULT NULL COMMENT 'CSS 标签',
  `css_pid` int(11) DEFAULT NULL,
  `type` int(1) DEFAULT '1' COMMENT '1 功能 2 权限',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COMMENT='权限资源表';

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(55) DEFAULT NULL COMMENT '权限组名称',
  `des` varchar(255) DEFAULT NULL COMMENT '权限组名称',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `icon_cls` varchar(55) DEFAULT 'status_online' COMMENT '图标',
  `pid` int(11) DEFAULT '0' COMMENT '父类id',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Table structure for t_admin_role_res
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role_res`;
CREATE TABLE `t_admin_role_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` int(11) DEFAULT NULL COMMENT '资源ID',
  `role_id` int(11) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  KEY `FK_SYSTEM_ROLE_RES_RES_ID` (`res_id`) USING BTREE,
  KEY `FK_SYSTEM_ROLE_RES_ROLE_ID` (`role_id`) USING BTREE,
  CONSTRAINT `t_admin_role_res_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `t_admin_res` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_admin_role_res_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_admin_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3809 DEFAULT CHARSET=utf8 COMMENT='权限对应的资源信息';

-- ----------------------------
-- Table structure for t_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_user`;
CREATE TABLE `t_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` varchar(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `salt2` varchar(64) DEFAULT NULL COMMENT 'shiro安全登录撒盐',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `role_id` int(11) DEFAULT NULL COMMENT '权限组的ID',
  `state` int(11) NOT NULL COMMENT '0正常  1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='系统管理员 和区域管理员的表';

-- ----------------------------
-- Table structure for t_announcement
-- ----------------------------
DROP TABLE IF EXISTS `t_announcement`;
CREATE TABLE `t_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `announcement_title` varchar(255) DEFAULT NULL COMMENT '公告标题',
  `announcement_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `state` int(11) DEFAULT '1' COMMENT '状态： 1. 正常 2. 过时',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_banner`;
CREATE TABLE `t_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '图片的标题',
  `img` varchar(100) DEFAULT NULL COMMENT '图片',
  `url` varchar(100) DEFAULT NULL COMMENT '连接的URL地址',
  `sort` int(11) DEFAULT NULL COMMENT '排序索引',
  `state` int(11) DEFAULT NULL COMMENT '状态 0启用 1禁用',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `web_img` varchar(255) DEFAULT NULL COMMENT 'web端的图片地址',
  `web_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='轮播图片信息表';

-- ----------------------------
-- Table structure for t_data_day_shop_product
-- ----------------------------
DROP TABLE IF EXISTS `t_data_day_shop_product`;
CREATE TABLE `t_data_day_shop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) DEFAULT NULL COMMENT '店铺id',
  `date_str` varchar(255) DEFAULT NULL,
  `data_time` datetime DEFAULT NULL COMMENT '代表的时间',
  `online_product_num` int(11) DEFAULT NULL COMMENT '商品上架的数目',
  `view_product_num` int(11) DEFAULT NULL COMMENT '商品浏览的次数',
  `product_uv` int(11) DEFAULT NULL COMMENT '商品uv',
  `product_pv` int(11) DEFAULT NULL,
  `order_real` int(11) DEFAULT NULL COMMENT '真正的下单数(已经支付)',
  `order_num` int(11) DEFAULT NULL COMMENT '下单数目,不一定支付了 ',
  `pay_people_num` int(11) DEFAULT NULL COMMENT '付款人数',
  `detail_rate` varchar(255) DEFAULT NULL COMMENT '商品详情的转化率 (字符串)   52%',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1418 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_data_everyday_fans
-- ----------------------------
DROP TABLE IF EXISTS `t_data_everyday_fans`;
CREATE TABLE `t_data_everyday_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) DEFAULT NULL,
  `date_str` varchar(255) DEFAULT NULL COMMENT '记录所代表的字符串',
  `data_time` datetime DEFAULT NULL COMMENT '记录所代表的时间',
  `no_subscribe` int(11) DEFAULT NULL COMMENT '没有关注的人',
  `yes_subscribe` int(11) DEFAULT NULL COMMENT '关注的人,其实也就是粉丝的数目',
  `add_fans` int(11) DEFAULT NULL COMMENT '增加的粉丝',
  `leave_fans` int(11) DEFAULT NULL COMMENT '逃跑的粉丝',
  `real_add` int(11) DEFAULT NULL COMMENT '真正增加的粉丝',
  `createtime` datetime DEFAULT NULL COMMENT '实际创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1608 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_data_everyday_order
-- ----------------------------
DROP TABLE IF EXISTS `t_data_everyday_order`;
CREATE TABLE `t_data_everyday_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) DEFAULT NULL,
  `date_str` varchar(255) DEFAULT NULL COMMENT '代表的时间串',
  `data_time` datetime DEFAULT NULL COMMENT '数据代表的时间',
  `order_people_num` int(11) DEFAULT NULL COMMENT '下单的人数(不重复)',
  `pay_people_num` int(11) DEFAULT NULL COMMENT '付款人数(不重复)',
  `order_num` int(11) DEFAULT NULL COMMENT '订单数目(包括未付款和已经付款的)',
  `pay_order_num` int(11) DEFAULT NULL COMMENT '付款的订单数目',
  `order_amount` decimal(10,2) DEFAULT NULL COMMENT '订单的总价格',
  `pay_order_amount` decimal(10,2) DEFAULT NULL COMMENT '支付的订单总价格',
  `purchase_product_num` int(11) DEFAULT NULL COMMENT '卖的产品数量',
  `shop_uv` int(11) DEFAULT '0' COMMENT '店铺的uv',
  `shop_rate` decimal(10,2) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL COMMENT '创建的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1630 DEFAULT CHARSET=utf8 COMMENT='这是订单流量统计的表   fang   2016-08-10';

-- ----------------------------
-- Table structure for t_data_everyday_product
-- ----------------------------
DROP TABLE IF EXISTS `t_data_everyday_product`;
CREATE TABLE `t_data_everyday_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `date_str` varchar(255) DEFAULT NULL COMMENT '日期    例如  2016-07-25',
  `data_time` datetime DEFAULT NULL COMMENT '当天时间',
  `product_uv` int(11) DEFAULT '0' COMMENT '访问的uv',
  `product_pv` int(11) DEFAULT '0' COMMENT '访问的pv',
  `pay_people_num` int(11) DEFAULT '0' COMMENT '付款的人数',
  `pay_rate` decimal(10,4) DEFAULT NULL COMMENT '单凭转化率',
  `order_num` int(11) DEFAULT '0' COMMENT '下单数目',
  `pay_num` int(11) DEFAULT NULL,
  `pay_order_rate` decimal(10,4) DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27661 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_data_everyday_visit
-- ----------------------------
DROP TABLE IF EXISTS `t_data_everyday_visit`;
CREATE TABLE `t_data_everyday_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) DEFAULT NULL COMMENT '商铺的id',
  `date_str` varchar(255) DEFAULT NULL COMMENT '标志时间  例如   2016-08-08',
  `data_time` datetime DEFAULT NULL COMMENT '代表的时间   当时的时间',
  `uv` int(11) DEFAULT NULL COMMENT '店铺的uv',
  `pv` int(11) DEFAULT NULL COMMENT '店铺的pv',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1475 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_data_view_product
-- ----------------------------
DROP TABLE IF EXISTS `t_data_view_product`;
CREATE TABLE `t_data_view_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL COMMENT '商品ifd',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=730 DEFAULT CHARSET=utf8 COMMENT='数据统计   商品';

-- ----------------------------
-- Table structure for t_data_view_shop
-- ----------------------------
DROP TABLE IF EXISTS `t_data_view_shop`;
CREATE TABLE `t_data_view_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '创建时间',
  `shop_id` varchar(255) DEFAULT NULL COMMENT '店铺id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1190 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_help_center
-- ----------------------------
DROP TABLE IF EXISTS `t_help_center`;
CREATE TABLE `t_help_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) DEFAULT NULL COMMENT '帮助标题',
  `content` text COMMENT '帮助内容',
  `type` int(11) NOT NULL COMMENT '帮助类型（见类型表）',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='帮助中心相关表';

-- ----------------------------
-- Table structure for t_help_type
-- ----------------------------
DROP TABLE IF EXISTS `t_help_type`;
CREATE TABLE `t_help_type` (
  `type_id` int(11) NOT NULL COMMENT '类型id',
  `type_name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助类型';

-- ----------------------------
-- Table structure for t_im_chat_log
-- ----------------------------
DROP TABLE IF EXISTS `t_im_chat_log`;
CREATE TABLE `t_im_chat_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID自动增长',
  `entryway` varchar(60) DEFAULT NULL COMMENT '入口  web  or  weixin ',
  `shop_id` varchar(64) DEFAULT NULL COMMENT '店铺Id',
  `fans_id` int(11) DEFAULT NULL COMMENT '粉丝的ID',
  `user_role` varchar(64) DEFAULT NULL COMMENT 'helper(用户) custom(用户)',
  `to_account` varchar(50) DEFAULT NULL,
  `from_account` varchar(50) DEFAULT NULL,
  `msg_type` varchar(20) DEFAULT NULL COMMENT '消息类型  txt  img  ',
  `msg_data` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `byFansId` (`entryway`,`fans_id`) USING BTREE COMMENT '根据粉丝ID 和入口查询'
) ENGINE=InnoDB AUTO_INCREMENT=2773 DEFAULT CHARSET=utf8 COMMENT='聊天记录表';

-- ----------------------------
-- Table structure for t_im_service
-- ----------------------------
DROP TABLE IF EXISTS `t_im_service`;
CREATE TABLE `t_im_service` (
  `fans_id` int(11) NOT NULL,
  `entryway` varchar(11) NOT NULL DEFAULT '1' COMMENT '1网页web 2微信端 weixin',
  `openid` varchar(64) DEFAULT NULL COMMENT '用户的openid',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `shop_id` varchar(64) DEFAULT NULL COMMENT '店铺ID',
  `service_user_id` int(64) DEFAULT '0' COMMENT '接待的客服ID 0表示 没有接待',
  `unread_state` int(11) DEFAULT '0' COMMENT '0 表示没有未读的  大于0表示有未读的',
  `last_chat_val` varchar(1000) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '最后一条信息内容',
  `last_chat_time` datetime DEFAULT NULL COMMENT '最后通话时间',
  PRIMARY KEY (`fans_id`,`entryway`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信咨询用户表';

-- ----------------------------
-- Table structure for t_im_user_sig
-- ----------------------------
DROP TABLE IF EXISTS `t_im_user_sig`;
CREATE TABLE `t_im_user_sig` (
  `id` int(11) NOT NULL COMMENT '用户ID 主键ID',
  `sig_data` varchar(2000) NOT NULL COMMENT '签名数据',
  `type` int(11) DEFAULT '1' COMMENT '1微信  2店铺 3店铺用户',
  `sig_time` int(11) NOT NULL COMMENT '签名的时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天ID签名表';

-- ----------------------------
-- Table structure for t_im_waiter
-- ----------------------------
DROP TABLE IF EXISTS `t_im_waiter`;
CREATE TABLE `t_im_waiter` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '店铺的用户的ID',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺的ID',
  `system_type` int(255) DEFAULT '1' COMMENT '系统类型  1安卓 2 IOS',
  `platform` varchar(20) DEFAULT 'web' COMMENT '在线的平台 web app',
  `on_line_state` int(11) DEFAULT '1' COMMENT '在线状态  1离线  2在线 3繁忙',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺客服表';

-- ----------------------------
-- Table structure for t_invit_account_log
-- ----------------------------
DROP TABLE IF EXISTS `t_invit_account_log`;
CREATE TABLE `t_invit_account_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `invit_id` int(11) NOT NULL COMMENT '签约达人id',
  `month` varchar(255) NOT NULL COMMENT '月份',
  `brokerage` decimal(10,2) DEFAULT NULL COMMENT '佣金',
  `state` int(11) DEFAULT '1' COMMENT '状态(是否已支付给达人)1未支付2已支付',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='签约达人每月佣金统计';

-- ----------------------------
-- Table structure for t_invit_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_invit_apply`;
CREATE TABLE `t_invit_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(255) NOT NULL COMMENT '用户真实姓名',
  `user_address` varchar(255) NOT NULL COMMENT '用户地址',
  `user_phone` varchar(255) NOT NULL COMMENT '用户手机号码',
  `user_weixin` varchar(255) DEFAULT NULL COMMENT '微信账号',
  `user_qq` varchar(255) DEFAULT NULL COMMENT '用户qq号',
  `state` int(11) DEFAULT '0' COMMENT '状态0未处理1已处理',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='邀请用户申请信息表';

-- ----------------------------
-- Table structure for t_invit_shop_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_invit_shop_rel`;
CREATE TABLE `t_invit_shop_rel` (
  `rel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自动增长',
  `invit_user_id` int(11) NOT NULL COMMENT '推广员用户ID',
  `shop_id` varchar(255) NOT NULL COMMENT '店铺ID',
  `yj_bl` double(10,2) DEFAULT '0.80' COMMENT '佣金比例%',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户店铺关系表';

-- ----------------------------
-- Table structure for t_invit_user
-- ----------------------------
DROP TABLE IF EXISTS `t_invit_user`;
CREATE TABLE `t_invit_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_name` varchar(64) NOT NULL COMMENT '用户名用手机号码',
  `user_password` varchar(100) NOT NULL COMMENT '密码',
  `user_type` int(11) NOT NULL DEFAULT '1' COMMENT '用户类型 1.全职销售  2.兼职的，就是网站注册的',
  `user_address` varchar(255) NOT NULL COMMENT '用户地址',
  `user_weixin` varchar(255) DEFAULT NULL COMMENT '微信账户',
  `user_qq` varchar(255) DEFAULT NULL COMMENT '用户QQ',
  `invit_count` int(11) DEFAULT '0' COMMENT '邀请人员数，每次加1',
  `auth_state` int(11) DEFAULT '1' COMMENT '（认证状态 1等待认证 2认证通过',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='邀请用户表';

-- ----------------------------
-- Table structure for t_name
-- ----------------------------
DROP TABLE IF EXISTS `t_name`;
CREATE TABLE `t_name` (
  `id` int(11) NOT NULL,
  `nane` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商的ID',
  `supply_type` int(11) DEFAULT '1' COMMENT '订单类型 1自营 2供应商发货',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `order_product_name` varchar(1500) DEFAULT NULL COMMENT '订单商品名称 ,支付的时候用',
  `express_time` datetime DEFAULT NULL COMMENT '发货时间',
  `express_name` varchar(64) DEFAULT NULL COMMENT '快递公司名称',
  `express_no` varchar(64) DEFAULT NULL COMMENT '快递单号',
  `admin_remark` varchar(800) DEFAULT NULL COMMENT '管理员备注信息',
  `refund_reason` varchar(800) DEFAULT NULL COMMENT '退款理由',
  `express_address` varchar(255) NOT NULL COMMENT '收件人详细地址',
  `express_zip_code` varchar(20) DEFAULT NULL,
  `express_phone` varchar(20) NOT NULL COMMENT '收件人联系电话',
  `express_receive_name` varchar(50) DEFAULT NULL COMMENT '收件人姓名',
  `express_amount` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `change_amount` varchar(10) DEFAULT '' COMMENT '涨价或减价',
  `item_amount` decimal(10,2) DEFAULT '0.00' COMMENT '商品总价',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总金额,包括了运费',
  `fx_amount` decimal(10,2) DEFAULT '0.00' COMMENT '分销费用',
  `fx_back_amount` decimal(10,2) DEFAULT '0.00' COMMENT '分销退回的钱',
  `jy_amount` decimal(10,2) DEFAULT '0.00' COMMENT '交易手续费',
  `js_amount` decimal(10,0) DEFAULT '0' COMMENT '结算费用',
  `pay_type` int(11) DEFAULT '1' COMMENT '1支付方式  1微信支付 2积分兑换',
  `pay_id` varchar(64) DEFAULT NULL COMMENT '内部支付流水号',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '支付成功返回的流水ID',
  `pay_state` int(11) DEFAULT '1' COMMENT '支付状态1尚未支付  2支付成功 3退款了',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `user_remarks` varchar(2500) DEFAULT NULL COMMENT '订单备注信息',
  `state` int(11) DEFAULT '0' COMMENT '状态 参考状态表',
  `refund_nums` int(11) DEFAULT '0' COMMENT '退款商品的数量',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款的金额',
  `total_fee` int(11) DEFAULT '0' COMMENT '支付的金额分为单位 ,多个订单可能很多',
  `receipt_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `js_flag` int(11) DEFAULT '1' COMMENT '1 尚未结算  2 等待结算  3已经结算打款了',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `jifen` int(11) DEFAULT '0' COMMENT '   积分  fang  2016-08-17 ',
  PRIMARY KEY (`id`),
  KEY `QUERY_Sate` (`state`) USING BTREE COMMENT '状态索引',
  KEY `by_payid` (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品订单表';

-- ----------------------------
-- Table structure for t_order_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_order_cart`;
CREATE TABLE `t_order_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `sku_id` varchar(255) DEFAULT NULL COMMENT '商品ID',
  `sku_txt` varchar(255) DEFAULT '' COMMENT 'SKU属性ID',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `nums` int(11) NOT NULL DEFAULT '1' COMMENT '购买数量',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='购物车订单信息';

-- ----------------------------
-- Table structure for t_order_express
-- ----------------------------
DROP TABLE IF EXISTS `t_order_express`;
CREATE TABLE `t_order_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(250) DEFAULT NULL COMMENT '订单id',
  `express_state` int(11) DEFAULT NULL COMMENT '  物流的状态码    详细查看文档',
  `update_time` datetime DEFAULT NULL COMMENT '最近查询时间',
  `content` varchar(2550) DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '  物流的状态码    详细查看文档',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='订单的物流记录';

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID 自增长',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `order_id` varchar(64) NOT NULL COMMENT '订单ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `sku_id` varchar(64) DEFAULT '' COMMENT 'sku ID',
  `sku_text` varchar(500) DEFAULT '' COMMENT 'SKU文本信息',
  `refund_state` int(11) DEFAULT '1' COMMENT '退款状态 1正常 2申请退款中  3同意退款  4拒绝退款 5退款完成',
  `nums` int(11) NOT NULL COMMENT '购买数量',
  `jifen` int(11) DEFAULT '0' COMMENT '积分   fang   2016-08-22',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2293 DEFAULT CHARSET=utf8 COMMENT='订单商品详细信息';

-- ----------------------------
-- Table structure for t_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `t_order_refund`;
CREATE TABLE `t_order_refund` (
  `refund_id` varchar(64) NOT NULL COMMENT '主键ID 系统的ID',
  `item_id` int(11) DEFAULT NULL COMMENT '退款的商品项目ID',
  `order_id` varchar(64) NOT NULL COMMENT '退款的订单ID',
  `out_refund_no` varchar(255) NOT NULL COMMENT '微信返回的退款ID',
  `refund_fee` int(11) NOT NULL DEFAULT '0' COMMENT '退款金额',
  `refund_recv_accout` varchar(255) DEFAULT NULL COMMENT '退款到哪里去',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` int(2) DEFAULT '1' COMMENT '状态1请求成功  2退款成功  3退款失败',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单退款记录';

-- ----------------------------
-- Table structure for t_order_refund_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_order_refund_apply`;
CREATE TABLE `t_order_refund_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `item_id` int(11) DEFAULT NULL COMMENT '订单商品ID',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单ID',
  `is_receive_goods` int(11) DEFAULT NULL COMMENT '是否已经收到商品1收到 2没收到',
  `refuse_reason` varchar(500) DEFAULT NULL COMMENT '拒绝理由！',
  `refund_reason` varchar(255) DEFAULT NULL COMMENT '退款原因',
  `refund_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额（不能超过商品金额）',
  `refund_remarks` varchar(1500) DEFAULT NULL COMMENT '备注',
  `refund_phone` varchar(11) DEFAULT NULL COMMENT '退款联系人的手机号码',
  `refund_img` varchar(150) DEFAULT NULL COMMENT '退款上传图片',
  `refund_state` int(11) DEFAULT '1' COMMENT '退款状态 1等待确认 2同意退款 3拒绝 4买家已取消 5退款完成',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order_state
-- ----------------------------
DROP TABLE IF EXISTS `t_order_state`;
CREATE TABLE `t_order_state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(300) DEFAULT NULL COMMENT '状态名称',
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单状态名称';

-- ----------------------------
-- Table structure for t_page_custom
-- ----------------------------
DROP TABLE IF EXISTS `t_page_custom`;
CREATE TABLE `t_page_custom` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` varchar(255) DEFAULT NULL COMMENT '店铺ID',
  `page_title` varchar(200) DEFAULT NULL COMMENT '页面标题',
  `page_json` varchar(1000) DEFAULT NULL COMMENT '页面JSON结构',
  `page_sort` int(11) DEFAULT '0' COMMENT '排序',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='店铺自定义页面';

-- ----------------------------
-- Table structure for t_page_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `t_page_qrcode`;
CREATE TABLE `t_page_qrcode` (
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID 主键',
  `bg_img` varchar(200) DEFAULT NULL,
  `desc_text` varchar(200) DEFAULT NULL COMMENT '描述文本',
  `updatetime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='页面自定义 - 二维码';

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) DEFAULT NULL COMMENT '店铺ID',
  `supply_type` int(11) DEFAULT '1' COMMENT '供应类型 1自营 2供应商',
  `supplier_user_id` int(11) DEFAULT NULL COMMENT '供应商用户ID',
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `product_bn` varchar(255) DEFAULT NULL COMMENT '商家编码',
  `product_tag` varchar(255) DEFAULT NULL COMMENT '商品标签',
  `product_content` text COMMENT '介绍信息',
  `online_state` int(11) DEFAULT '1' COMMENT '是否上线     1上线   2下线',
  `comment_count` int(255) DEFAULT '0' COMMENT '评论数量',
  `post_fee` decimal(10,2) DEFAULT '0.00' COMMENT '邮费',
  `market_price` decimal(10,2) DEFAULT '0.00' COMMENT '市场原价',
  `divide_rate` int(11) DEFAULT '20' COMMENT '分成比例',
  `sku_json` longtext COMMENT 'SKUJSON数据',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '销售价格',
  `stock_count` int(11) DEFAULT '0' COMMENT '库存数量',
  `buy_quota` int(11) DEFAULT '0' COMMENT '每人限购多少件。0代表无限购，默认为0',
  `sale_count` int(11) DEFAULT '0' COMMENT '已售数量',
  `image_center` varchar(350) DEFAULT NULL COMMENT '核心图片(一张)',
  `image_detail` varchar(5000) DEFAULT NULL COMMENT '商品的详细图片',
  `image_banner` varchar(5000) DEFAULT NULL COMMENT '轮播图片',
  `pay_integral` int(11) DEFAULT '0' COMMENT '购买赠送积分',
  `lable_css` varchar(255) DEFAULT NULL COMMENT '标签 new    hot  pro',
  `del_state` tinyint(1) DEFAULT '0' COMMENT '删除标志0未删除 1删除了',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `introduce_reason` varchar(500) DEFAULT NULL COMMENT '推荐理由',
  `template_id` int(11) DEFAULT NULL COMMENT '物流模版   id  fang  2016-07-07',
  `product_pv` int(11) DEFAULT '0' COMMENT '商品浏览量',
  `product_uv` int(11) DEFAULT '0' COMMENT '商品浏览人数',
  `product_jifen` int(11) DEFAULT '0' COMMENT '积分',
  `enable_sku_img` int(2) DEFAULT '2' COMMENT '1 启用 2不启用',
  `sku_thumb_json` varchar(1000) DEFAULT NULL COMMENT 'SKU图片JSON',
  `jifen_buy_state` int(11) DEFAULT '2' COMMENT '是否属于积分购买产品   1  是的   2 不是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Table structure for t_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_product_sku`;
CREATE TABLE `t_product_sku` (
  `sku_id` varchar(255) NOT NULL COMMENT '主键ID',
  `product_id` int(11) DEFAULT NULL COMMENT '商品的ID',
  `sku_code` varchar(60) DEFAULT NULL COMMENT '商家编码',
  `stock_count` int(11) DEFAULT '0' COMMENT '库存的数量',
  `sale_count` int(11) DEFAULT '0' COMMENT '销售的数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '销售的价格',
  `sku_text` varchar(255) DEFAULT NULL COMMENT 'SKU全部名称',
  `sku_state` int(11) DEFAULT '1' COMMENT '状态    1 正常 2  已经修改 ',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SKU 商品属性表';

-- ----------------------------
-- Table structure for t_product_sku_key
-- ----------------------------
DROP TABLE IF EXISTS `t_product_sku_key`;
CREATE TABLE `t_product_sku_key` (
  `key_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID自动增长',
  `key_name` varchar(100) NOT NULL,
  `key_type` int(100) DEFAULT '1' COMMENT '显示类型1文字和2图片',
  `key_mode` int(11) DEFAULT '2' COMMENT '定义模式1系统   2用户自定义',
  `creator_shopid` varchar(64) DEFAULT NULL COMMENT '创建的店铺Id',
  `sort_index` int(11) DEFAULT '0' COMMENT '排序索引',
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1083 DEFAULT CHARSET=utf8 COMMENT='sku属性键表';

-- ----------------------------
-- Table structure for t_product_sku_value
-- ----------------------------
DROP TABLE IF EXISTS `t_product_sku_value`;
CREATE TABLE `t_product_sku_value` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `key_id` varchar(255) DEFAULT NULL COMMENT '属性名的ID',
  `value_name` varchar(50) DEFAULT NULL,
  `value_image` varchar(500) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否已经删除了',
  PRIMARY KEY (`value_id`),
  KEY `query` (`value_id`,`product_id`,`value_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=913 DEFAULT CHARSET=utf8 COMMENT='商品SKU 属性表';

-- ----------------------------
-- Table structure for t_product_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_product_tag`;
CREATE TABLE `t_product_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` varchar(255) NOT NULL COMMENT '店铺ID',
  `tag_name` varchar(255) NOT NULL COMMENT '标签名称',
  `product_count` int(11) DEFAULT '0' COMMENT '商品数量',
  `tag_sort` int(11) DEFAULT '0' COMMENT '数值越小越靠前',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='t_product_tag';

-- ----------------------------
-- Table structure for t_product_tag_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_product_tag_rel`;
CREATE TABLE `t_product_tag_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_id` int(11) NOT NULL COMMENT '商品的ID',
  `tag_id` int(11) NOT NULL COMMENT '标签的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8 COMMENT='标签关联表';

-- ----------------------------
-- Table structure for t_product_type
-- ----------------------------
DROP TABLE IF EXISTS `t_product_type`;
CREATE TABLE `t_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(64) DEFAULT NULL COMMENT '店铺ID',
  `type_name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `type_desc` varchar(500) DEFAULT NULL COMMENT '描述文字',
  `image` varchar(255) DEFAULT NULL COMMENT '标志图片 暂时没有',
  `state` int(11) DEFAULT '0' COMMENT '状态 0启用 1禁用',
  `sort` int(11) DEFAULT '0' COMMENT '排序越大越靠前',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='商品类型表';

-- ----------------------------
-- Table structure for t_shop_account
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_account`;
CREATE TABLE `t_shop_account` (
  `shop_id` varchar(64) NOT NULL,
  `validmoney` decimal(10,2) DEFAULT '0.00' COMMENT '可用余额',
  `icemoney` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `datestr` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT '1' COMMENT '状态 1正常  2禁用 默认1',
  `code` varchar(255) DEFAULT NULL COMMENT '账户检验,的code',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺账户';

-- ----------------------------
-- Table structure for t_shop_account_trade_log
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_account_trade_log`;
CREATE TABLE `t_shop_account_trade_log` (
  `trade_id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键ID',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `trade_type_id` int(11) NOT NULL COMMENT '类型ID',
  `business_id` varchar(255) NOT NULL COMMENT '业务ID',
  `money` decimal(10,2) NOT NULL COMMENT '交易的金额',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`trade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺交易日志';

-- ----------------------------
-- Table structure for t_shop_account_trade_type
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_account_trade_type`;
CREATE TABLE `t_shop_account_trade_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增长',
  `trade_type_name` varchar(50) NOT NULL COMMENT '交易类型名称',
  `trade_sort` int(11) DEFAULT '0' COMMENT '排序',
  `operation` varchar(255) DEFAULT '+' COMMENT '操作类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺交易类型';

-- ----------------------------
-- Table structure for t_shop_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_bankcard`;
CREATE TABLE `t_shop_bankcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `card_type` int(11) DEFAULT '1' COMMENT '1.个人  2公司',
  `create_user_id` int(11) NOT NULL COMMENT '创建的用户ID',
  `cardholder_name` varchar(50) NOT NULL COMMENT '持卡人姓名',
  `bank_no` varchar(255) NOT NULL COMMENT '银行卡号',
  `bank_name` varchar(255) NOT NULL COMMENT '银行名称',
  `bank_logo` varchar(255) DEFAULT NULL COMMENT 'logo ',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除了',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='店铺银行卡表';

-- ----------------------------
-- Table structure for t_shop_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_banner`;
CREATE TABLE `t_shop_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(100) DEFAULT NULL COMMENT '店铺的ID',
  `title` varchar(100) DEFAULT NULL COMMENT '图片的标题',
  `img` varchar(100) DEFAULT NULL COMMENT '图片',
  `url` varchar(100) DEFAULT NULL COMMENT '连接的URL地址',
  `sort` int(11) DEFAULT NULL COMMENT '排序索引',
  `state` int(11) DEFAULT NULL COMMENT '状态 0启用 1禁用',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='店铺图片轮播信息表';

-- ----------------------------
-- Table structure for t_shop_file
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_file`;
CREATE TABLE `t_shop_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_id` int(11) NOT NULL DEFAULT '1' COMMENT '标签ID',
  `shop_id` varchar(255) NOT NULL COMMENT '店铺ID',
  `file_name` varchar(500) DEFAULT NULL COMMENT '文件名字',
  `url` varchar(1000) DEFAULT NULL COMMENT '连接地址',
  `attr_heigth` int(11) DEFAULT NULL COMMENT '高度',
  `attr_width` int(11) DEFAULT NULL COMMENT '宽度',
  `attr_mime_type` varchar(100) DEFAULT NULL COMMENT '文件类型',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`file_id`),
  KEY `Shop_query` (`tag_id`,`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 COMMENT='店铺文件表';

-- ----------------------------
-- Table structure for t_shop_file_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_file_tag`;
CREATE TABLE `t_shop_file_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` varchar(64) DEFAULT NULL COMMENT '店铺ID',
  `tag_name` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='店铺文件标签';

-- ----------------------------
-- Table structure for t_shop_fx_config
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_fx_config`;
CREATE TABLE `t_shop_fx_config` (
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `fx_enable` tinyint(1) DEFAULT '0' COMMENT '是否开启分销',
  `open_model` int(11) DEFAULT '0' COMMENT '开启模式（0无门槛 1有门槛）',
  `join_money` decimal(10,2) DEFAULT '0.00' COMMENT '门槛金额',
  `fx_live` int(11) DEFAULT '3' COMMENT '（级别  1 2 3）',
  `jifen_a` int(11) DEFAULT '0' COMMENT '积分',
  `jifen_b` int(11) DEFAULT '0' COMMENT '积分',
  `jifen_c` int(11) DEFAULT '0' COMMENT '积分C',
  `reward_a` double(10,2) DEFAULT '0.00' COMMENT '1级分城比例',
  `reward_b` double(10,2) DEFAULT '0.00' COMMENT '2级分城比例',
  `reward_c` double(10,2) DEFAULT '0.00' COMMENT '3级分城比例',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺分销配置';

-- ----------------------------
-- Table structure for t_shop_info
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_info`;
CREATE TABLE `t_shop_info` (
  `shop_id` varchar(64) NOT NULL COMMENT '主键ID',
  `create_userid` int(11) NOT NULL COMMENT '创建的用户名ID',
  `shop_name` varchar(500) NOT NULL COMMENT '店铺名称',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT 'logo图片',
  `shop_type_id` int(11) DEFAULT NULL COMMENT '类型ID  外键',
  `shop_tel` varchar(20) DEFAULT NULL COMMENT '店铺联系电话',
  `shop_address` varchar(255) DEFAULT NULL COMMENT '店铺地址',
  `intro` varchar(500) DEFAULT NULL COMMENT '介绍信息',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺信息表';

-- ----------------------------
-- Table structure for t_shop_return_addr
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_return_addr`;
CREATE TABLE `t_shop_return_addr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `ship_name` varchar(200) NOT NULL COMMENT '收件人姓名',
  `ship_addr` varchar(500) NOT NULL COMMENT '退货地址',
  `ship_zip` varchar(64) DEFAULT NULL COMMENT '退货的邮编',
  `ship_mobile` varchar(64) DEFAULT NULL COMMENT '退货人的手机号码',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='店铺退货地址';

-- ----------------------------
-- Table structure for t_shop_type
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_type`;
CREATE TABLE `t_shop_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type_name` varchar(500) DEFAULT NULL COMMENT '店铺类型',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='店铺类型表';

-- ----------------------------
-- Table structure for t_shop_user
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_user`;
CREATE TABLE `t_shop_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '(用户名  用手机号码)',
  `user_password` varchar(255) DEFAULT NULL COMMENT '(密码)',
  `headimg` varchar(255) DEFAULT 'http://img.shandian001.com/logo.png' COMMENT '（头像）',
  `nickname` varchar(255) DEFAULT NULL COMMENT '（头像）',
  `state` int(11) DEFAULT '1' COMMENT '(用户状态 1正常  2禁用)',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '(创建时间)',
  `logintime` datetime DEFAULT NULL COMMENT '(最后登录时间)',
  `company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `master_name` varchar(255) DEFAULT NULL COMMENT '负责人姓名',
  `licence_image` varchar(255) DEFAULT NULL COMMENT '营业执照',
  `card_id` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `jpushid` varchar(64) DEFAULT NULL COMMENT '极光推送ID',
  `card_image_before` varchar(255) DEFAULT NULL COMMENT '身份证证明照片',
  `card_image_after` varchar(255) DEFAULT NULL COMMENT '身份证反面照片',
  `invit_user_id` int(11) DEFAULT NULL COMMENT '邀请人的用户Id',
  `auth_state` int(11) DEFAULT '0' COMMENT '认证状态  0默认      1  待认证   2已经认证  3 拒绝',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='店铺用户表';

-- ----------------------------
-- Table structure for t_shop_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_user_rel`;
CREATE TABLE `t_shop_user_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键ID',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `user_id` int(64) NOT NULL COMMENT '用户ID',
  `user_type` int(255) DEFAULT '1' COMMENT '(1超级管理员  2一般管理,3客服)',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='用户店铺映射关系';

-- ----------------------------
-- Table structure for t_shop_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_withdraw`;
CREATE TABLE `t_shop_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` varchar(64) NOT NULL COMMENT '申请的店铺ID',
  `apply_user_id` int(11) NOT NULL COMMENT '申请人的用户ID',
  `bankcard_id` int(11) NOT NULL COMMENT '银行卡ID',
  `money` decimal(10,2) NOT NULL COMMENT '提现金额',
  `outid` varchar(64) DEFAULT NULL COMMENT '打款的ID',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注信息',
  `withdraw_state` int(11) DEFAULT NULL COMMENT '1等待审核  2打款成功 3拒绝',
  `examine_userid` varchar(255) DEFAULT NULL COMMENT '审核的用户ID',
  `examine_time` datetime DEFAULT NULL COMMENT '审核时间',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='店铺提现记录';

-- ----------------------------
-- Table structure for t_supplier_rel_shop
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier_rel_shop`;
CREATE TABLE `t_supplier_rel_shop` (
  `rel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联主键ID',
  `supplier_id` int(11) NOT NULL COMMENT '供应商ID',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `add_user_id` varchar(255) NOT NULL COMMENT '添加供应商的用户id',
  `state` int(11) DEFAULT '1' COMMENT '1正常  2停止供应',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='供应商关联店铺';

-- ----------------------------
-- Table structure for t_supplier_user
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier_user`;
CREATE TABLE `t_supplier_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名 用手机号码',
  `password` varchar(64) NOT NULL COMMENT '用户密码',
  `master_name` varchar(50) NOT NULL COMMENT '联系人姓名',
  `master_address` varchar(150) DEFAULT NULL COMMENT '联系地址',
  `master_email` varchar(60) DEFAULT NULL COMMENT '联系人邮箱',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8 COMMENT='供应商用户表';

-- ----------------------------
-- Table structure for t_template_area
-- ----------------------------
DROP TABLE IF EXISTS `t_template_area`;
CREATE TABLE `t_template_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) DEFAULT NULL COMMENT '店铺的id',
  `area_id` varchar(255) DEFAULT NULL COMMENT '对应area表的areaid  ',
  `state` int(11) DEFAULT '2' COMMENT '卖得状态   1 正常卖    2  不卖(默认)',
  `template_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL COMMENT '对应的模版item',
  `updatetime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `区域id` (`area_id`),
  KEY `area_trmplate` (`area_id`,`template_id`) USING BTREE COMMENT '区域名ID+模板ID创建索引'
) ENGINE=InnoDB AUTO_INCREMENT=320708 DEFAULT CHARSET=utf8 COMMENT='这是   物流模版  每个商铺所有地址对应的表';

-- ----------------------------
-- Table structure for t_template_num
-- ----------------------------
DROP TABLE IF EXISTS `t_template_num`;
CREATE TABLE `t_template_num` (
  `shop_id` varchar(255) NOT NULL COMMENT '店铺id',
  `num` int(11) DEFAULT NULL COMMENT '数目',
  `updatetime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='这个表是存放店铺模版的数目';

-- ----------------------------
-- Table structure for t_template_wuliu
-- ----------------------------
DROP TABLE IF EXISTS `t_template_wuliu`;
CREATE TABLE `t_template_wuliu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) DEFAULT NULL COMMENT '模版名称',
  `shop_id` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_column_name` varchar(255) DEFAULT NULL COMMENT '这个字段很关键,这里存储对应 t_template_area的哪个template_id_字段 ,',
  `remain_add_json` longtext COMMENT '剩余的json数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='物流模版的列表';

-- ----------------------------
-- Table structure for t_template_wuliu_item
-- ----------------------------
DROP TABLE IF EXISTS `t_template_wuliu_item`;
CREATE TABLE `t_template_wuliu_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL COMMENT '对应 t_template_wuliu 的父id',
  `areas_id_list` varchar(12550) DEFAULT NULL,
  `first_num` int(11) DEFAULT NULL COMMENT '首件数目',
  `fee` decimal(10,2) DEFAULT '0.00' COMMENT '首件数目',
  `continue_num` int(11) DEFAULT NULL COMMENT '续件数目',
  `continue_fee` decimal(10,2) DEFAULT NULL COMMENT '续件的费用',
  `addrJson` longtext COMMENT '对应的选中json  的string  ,回填的时候用',
  `sku_area_text` longtext COMMENT '展示的数目',
  `sort` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime DEFAULT NULL,
  `item_state` int(11) DEFAULT NULL COMMENT '是否有效   1  有效   2  无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8 COMMENT='物流模板项目表';

-- ----------------------------
-- Table structure for t_user_account
-- ----------------------------
DROP TABLE IF EXISTS `t_user_account`;
CREATE TABLE `t_user_account` (
  `user_id` int(11) NOT NULL COMMENT '如果 企业 就用企业id  普通用户  会计id',
  `card_count` int(11) DEFAULT '0' COMMENT '银行卡的数量',
  `income` decimal(10,2) DEFAULT '0.00' COMMENT '累计收入金额',
  `icemoney` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `integral` int(11) DEFAULT '0' COMMENT '用户积分',
  `wait_money` decimal(10,2) DEFAULT '0.00' COMMENT '待确认金额',
  `validmoney` decimal(10,2) DEFAULT '0.00' COMMENT '有效金额 ',
  `code` varchar(64) DEFAULT NULL COMMENT '交易码',
  `datestr` varchar(64) DEFAULT NULL COMMENT '最后交易字符串',
  `state` int(11) DEFAULT NULL COMMENT ' 0  正常  1异常',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户金额信息';

-- ----------------------------
-- Table structure for t_user_account_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_account_log`;
CREATE TABLE `t_user_account_log` (
  `id` varchar(64) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `outid` varchar(64) DEFAULT NULL COMMENT '外部流水ID',
  `money` decimal(10,2) DEFAULT NULL COMMENT '流水金额',
  `trade_type_id` int(11) DEFAULT NULL COMMENT '交易类型ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` int(11) DEFAULT '1' COMMENT '状态 1正常 2临时',
  PRIMARY KEY (`id`),
  KEY `byUserId` (`user_id`,`createtime`,`trade_type_id`,`state`) USING BTREE COMMENT '根据用户idc查询流水记录'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户日志表';

-- ----------------------------
-- Table structure for t_user_account_trade_type
-- ----------------------------
DROP TABLE IF EXISTS `t_user_account_trade_type`;
CREATE TABLE `t_user_account_trade_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_type` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `operation` varchar(2) DEFAULT NULL COMMENT '操作符 + 或者 -',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='交易类型表';

-- ----------------------------
-- Table structure for t_user_address
-- ----------------------------
DROP TABLE IF EXISTS `t_user_address`;
CREATE TABLE `t_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `province_id` varchar(255) DEFAULT NULL COMMENT '省份对应的id   fang  2016-07-12 ',
  `city_id` varchar(255) DEFAULT NULL COMMENT '城市的id    fang   2016-07-12',
  `area_id` varchar(255) DEFAULT NULL COMMENT '区/县  的id   fang   2016-07-12',
  `county` varchar(20) DEFAULT NULL COMMENT '县',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `addr_str` varchar(500) DEFAULT NULL COMMENT '地址文本',
  `phone` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `receive_name` varchar(20) DEFAULT NULL COMMENT '收货人姓名',
  `is_default` int(11) DEFAULT '0' COMMENT '是否是默认的地址0不是 1是',
  `zip_code` varchar(10) DEFAULT NULL COMMENT '邮编号码',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间  默认取数据库时间',
  `del_state` int(11) DEFAULT '0' COMMENT '是否已经删除 0 整除 1删除 默认0',
  PRIMARY KEY (`id`),
  KEY `USER_MY_ADDRESS` (`user_id`,`is_default`,`zip_code`) USING BTREE COMMENT '微信用户查询自己的地址'
) ENGINE=InnoDB AUTO_INCREMENT=2288 DEFAULT CHARSET=utf8 COMMENT='用户收货地址表';

-- ----------------------------
-- Table structure for t_user_income
-- ----------------------------
DROP TABLE IF EXISTS `t_user_income`;
CREATE TABLE `t_user_income` (
  `id` varchar(64) NOT NULL COMMENT '主键ID',
  `income_level` int(11) NOT NULL DEFAULT '1' COMMENT '收益级别 1级分销 或2级分销',
  `order_id` varchar(255) NOT NULL COMMENT '订单ID',
  `user_id` int(11) NOT NULL COMMENT '分销的用户ID ，标示这个收入属于哪个用户的',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分销的金额',
  `refund_money` decimal(10,2) DEFAULT '0.00' COMMENT '退款的金额',
  `state` int(11) DEFAULT '1' COMMENT '状态1等待确认  2已经确认  3已退款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销流水日志';

-- ----------------------------
-- Table structure for t_user_label
-- ----------------------------
DROP TABLE IF EXISTS `t_user_label`;
CREATE TABLE `t_user_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` varchar(64) NOT NULL,
  `label_name` varchar(100) DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_label_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_user_label_rel`;
CREATE TABLE `t_user_label_rel` (
  `rel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自动增长',
  `label_id` int(11) DEFAULT NULL COMMENT '标签ID',
  `fans_id` int(11) DEFAULT NULL COMMENT '用户粉丝ID',
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户标签关联表';

-- ----------------------------
-- Table structure for t_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_user_notice`;
CREATE TABLE `t_user_notice` (
  `id` varchar(64) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户的ID',
  `type` varchar(15) DEFAULT '1' COMMENT '消息类型',
  `title` varchar(150) DEFAULT NULL COMMENT '标题',
  `text` varchar(1000) DEFAULT NULL COMMENT '内容',
  `url` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `commsg` (`user_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统通知的表';

-- ----------------------------
-- Table structure for t_wxuser
-- ----------------------------
DROP TABLE IF EXISTS `t_wxuser`;
CREATE TABLE `t_wxuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID 自增长',
  `openid` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT 'openid',
  `subscribe` int(11) DEFAULT NULL COMMENT '0未关注 1已经关注',
  `nickname` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '微信昵称',
  `sex` int(11) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `language` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '语言',
  `city` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '普通用户个人资料填写的城市',
  `province` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户个人资料填写的省份',
  `country` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '国家，如中国为CN',
  `headimgurl` varchar(150) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `subscribe_time` datetime DEFAULT NULL COMMENT '关注时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `groupid` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '分组ID',
  `unionid` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `uptime` int(11) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='微信用户表';

-- ----------------------------
-- Table structure for t_wx_account_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_account_auth`;
CREATE TABLE `t_wx_account_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(64) NOT NULL,
  `shop_id` varchar(64) DEFAULT NULL COMMENT '店铺ID',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '授权方昵称',
  `head_img` varchar(255) DEFAULT NULL COMMENT '授权方头像',
  `service_type_info` int(11) DEFAULT NULL COMMENT '授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号',
  `verify_type_info` int(11) DEFAULT NULL COMMENT '授权方认证类型，-1代表未认证，0代表微信认证，1代表新浪微博认证，2代表腾讯微博认证，3代表已资质认证通过但还未通过名称认证，4代表已资质认证通过、还未通过名称认证，但通过了新浪微博认证，5代表已资质认证通过、还未通过名称认证，但通过了腾讯微博认证',
  `user_name` varchar(255) DEFAULT NULL COMMENT '授权方公众号的原始ID',
  `alias` varchar(255) DEFAULT NULL COMMENT '授权方公众号所设置的微信号，可能为空',
  `business_info` varchar(255) DEFAULT NULL,
  `qrcode_url` varchar(255) DEFAULT NULL COMMENT '二维码地址',
  `authorizer_refresh_token` varchar(255) DEFAULT NULL COMMENT '刷新令牌',
  `authorizer_refresh_time` int(11) DEFAULT NULL,
  `updatetime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` int(11) DEFAULT '1' COMMENT '状态1正常  2禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='第三方微信账号授权信息';

-- ----------------------------
-- Table structure for t_wx_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_admin`;
CREATE TABLE `t_wx_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自动增长ID',
  `shop_id` varchar(255) DEFAULT NULL COMMENT '店铺ID',
  `fans_id` varchar(255) DEFAULT NULL COMMENT '用户ID对应表 t_wx_shop_user  id',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='微信管理员表';

-- ----------------------------
-- Table structure for t_wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_menu`;
CREATE TABLE `t_wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` varchar(1000) NOT NULL COMMENT '店铺ID',
  `type` varchar(50) DEFAULT NULL COMMENT '触发类型 click  view',
  `event_type` varchar(50) DEFAULT NULL COMMENT '事件类型',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `input_code` varchar(255) DEFAULT NULL COMMENT '触发的关键字',
  `url` varchar(255) DEFAULT NULL COMMENT '网页地址',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `pid` int(64) DEFAULT '0' COMMENT '父类ID 0表示没有父类  ',
  `msg_id` int(100) DEFAULT NULL COMMENT '如果是触发图文消息 就回复这个',
  `isshow` int(11) DEFAULT NULL COMMENT '是否显示',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='菜单信息';

-- ----------------------------
-- Table structure for t_wx_msgfilter
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_msgfilter`;
CREATE TABLE `t_wx_msgfilter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `shop_id` varchar(255) NOT NULL COMMENT '店铺id',
  `send_userid` int(11) NOT NULL COMMENT '发送人id',
  `apply_type` int(11) NOT NULL DEFAULT '1' COMMENT '适用类型 1群发微信 2标签批量修改 3批量加积分',
  `filter_num` int(11) DEFAULT '0' COMMENT '筛选出的粉丝数量',
  `type` int(11) DEFAULT '1' COMMENT '筛选类型1条件筛选 2手动选择',
  `fans_id` varchar(2000) DEFAULT NULL COMMENT '手动选择时的粉丝id，用逗号隔开',
  `jifen` varchar(255) DEFAULT NULL COMMENT '筛选条件：积分范围',
  `orders` varchar(255) DEFAULT NULL COMMENT '筛选条件：下单数量',
  `tags` varchar(255) DEFAULT NULL COMMENT '筛选条件：粉丝标签',
  `attention_time` int(11) DEFAULT NULL COMMENT '筛选条件：关注时间 1一周内 2两周内 3一月内 4两月内 5六月内',
  `sex` int(11) DEFAULT NULL COMMENT '筛选条件：性别0未知 1男 2女',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COMMENT='群发消息筛选表';

-- ----------------------------
-- Table structure for t_wx_msghistory
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_msghistory`;
CREATE TABLE `t_wx_msghistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `shop_id` varchar(255) NOT NULL COMMENT '店铺id',
  `msg_type` int(11) NOT NULL COMMENT '消息类型1文本 2图文 3图片',
  `msg_content` varchar(255) DEFAULT NULL COMMENT '文本消息内容',
  `msg_news_id` int(11) DEFAULT NULL COMMENT '图文消息id',
  `msg_picurl` varchar(255) DEFAULT NULL COMMENT '图片消息链接',
  `send_num` int(11) DEFAULT NULL COMMENT '发送数',
  `success_num` int(11) DEFAULT NULL COMMENT '送达数',
  `show_type` int(11) DEFAULT '0' COMMENT '是否显示',
  `state` int(11) DEFAULT '2' COMMENT '1推送完成 2正在推送',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='微信群发历史消息';

-- ----------------------------
-- Table structure for t_wx_msgnews
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_msgnews`;
CREATE TABLE `t_wx_msgnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `shop_id` varchar(64) DEFAULT NULL,
  `type` int(2) DEFAULT '1' COMMENT '图文类型  1微信图文 2高级图文',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `centent` text CHARACTER SET utf8mb4 COMMENT '详细内容',
  `centent_hash_code` int(11) DEFAULT NULL COMMENT '防止每次编辑图文都重新刷新里面的图文',
  `news_media_id` varchar(255) DEFAULT NULL COMMENT '微信图文ID',
  `wx_centent` longtext COMMENT '微信里面的内容 需要转换里面的图片',
  `pic_media_id` varchar(300) DEFAULT NULL COMMENT '微信图片ID',
  `picUrl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `showPic` int(11) DEFAULT '2' COMMENT '是否在正文里面显示图片 1显示   2不显示',
  `wx_picurl` varchar(500) DEFAULT NULL COMMENT '微信的图片地址 ',
  `url` varchar(255) DEFAULT NULL COMMENT '微信阅读全文链接',
  `view_url` varchar(1000) DEFAULT NULL COMMENT '图文浏览地址',
  `base_id` int(64) DEFAULT NULL COMMENT '图文的ID',
  `msgtype` int(11) DEFAULT '0' COMMENT '消息类型0为单条 1为多条',
  `parentType` int(11) DEFAULT '2' COMMENT '1标识父列表  多条图文是只显示父图文  2表示子文本',
  `orders` int(11) DEFAULT '0' COMMENT '排序',
  `click_count` int(11) DEFAULT '0' COMMENT '点击次数',
  `ctime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='图文消息信息';

-- ----------------------------
-- Table structure for t_wx_msgreply
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_msgreply`;
CREATE TABLE `t_wx_msgreply` (
  `msg_id` varchar(255) NOT NULL COMMENT '主键ID',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型1自动回复关键字 2二维码关键字',
  `group_id` int(11) DEFAULT NULL COMMENT '分组Id',
  `qrcode_id` int(11) DEFAULT NULL COMMENT '二维码id',
  `msg_type` int(2) NOT NULL DEFAULT '1' COMMENT '消息类型1:文本消息  2 图文消息  3 图片',
  `msg_content` varchar(500) DEFAULT NULL COMMENT '如果type为1 的时候   就读取内容',
  `msg_news_id` int(11) DEFAULT NULL COMMENT '消息的ID',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`msg_id`),
  KEY `byGroup` (`group_id`) USING BTREE COMMENT '根据分组查询'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信消息自动回复';

-- ----------------------------
-- Table structure for t_wx_msgreply_group
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_msgreply_group`;
CREATE TABLE `t_wx_msgreply_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组ID主键自动增长',
  `shop_id` varchar(255) NOT NULL COMMENT '店铺ID',
  `group_name` varchar(255) NOT NULL COMMENT '分组名称',
  `send_type` int(11) NOT NULL DEFAULT '1' COMMENT '1全部发送  2随机发送 ',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='自动回复分组表';

-- ----------------------------
-- Table structure for t_wx_msgreply_key
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_msgreply_key`;
CREATE TABLE `t_wx_msgreply_key` (
  `key_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID自动增长',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺Id',
  `group_id` int(11) NOT NULL COMMENT '分组的ID',
  `key_text` varchar(500) NOT NULL COMMENT '匹配的文本',
  `keyword_type` int(11) DEFAULT '1' COMMENT '匹配类型 1模糊匹配 2完全匹配',
  PRIMARY KEY (`key_id`),
  KEY `ByGroupId` (`group_id`) USING BTREE COMMENT '根据分组ID查询',
  FULLTEXT KEY `ByShopAndKeyText` (`shop_id`,`key_text`) COMMENT '关键字全文检索'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='微信关键字的表';

-- ----------------------------
-- Table structure for t_wx_phrase
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_phrase`;
CREATE TABLE `t_wx_phrase` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `shop_id` varchar(255) NOT NULL COMMENT '店铺id',
  `content` varchar(255) NOT NULL COMMENT '快捷回复内容',
  `create_user` int(11) DEFAULT NULL COMMENT '添加人',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='客服快捷回复语句';

-- ----------------------------
-- Table structure for t_wx_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_qrcode`;
CREATE TABLE `t_wx_qrcode` (
  `qrcode_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '二维码id',
  `shop_id` varchar(255) NOT NULL COMMENT '店铺id',
  `qrcode_name` varchar(255) NOT NULL COMMENT '二维码名称',
  `qrcode_url` varchar(255) NOT NULL COMMENT '二维码地址',
  `qrcode_value` int(11) NOT NULL COMMENT '二维码值',
  `send_type` int(11) NOT NULL DEFAULT '1' COMMENT '发送类型1全部发送 2随机发送',
  `tag` varchar(255) DEFAULT NULL COMMENT '加标签',
  `del_type` int(11) DEFAULT '0' COMMENT '是否删除0否 1是',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`qrcode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='参数二维码表';

-- ----------------------------
-- Table structure for t_wx_shop_user
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_shop_user`;
CREATE TABLE `t_wx_shop_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID自动增长',
  `appid` varchar(64) DEFAULT NULL COMMENT '微信APPID',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `userid` int(11) DEFAULT NULL COMMENT '用户ID',
  `pid` int(11) DEFAULT NULL COMMENT '推荐人的用户ID',
  `openid` varchar(64) DEFAULT NULL COMMENT '这个店铺的openid',
  `nickname` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户昵称',
  `headimgurl` varchar(1000) DEFAULT NULL COMMENT '微信用户头像',
  `consume_amount` decimal(10,2) DEFAULT '0.00' COMMENT '累计消费金额',
  `buy_count` int(11) DEFAULT '0' COMMENT '购买订单的数量',
  `fx_state` int(2) DEFAULT '1' COMMENT '分销认证的状态 1尚未加入 2已经加入',
  `jifen` int(11) DEFAULT '0' COMMENT '用户在店铺的积分',
  `sex` int(11) DEFAULT '0' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `subscribe` int(11) DEFAULT '0' COMMENT '0未关注 1已经关注',
  `level_one_openid` varchar(64) DEFAULT NULL COMMENT '一级用户的openid',
  `level_two_openid` varchar(64) DEFAULT NULL COMMENT '二级粉丝的openid',
  `level_three_openid` varchar(64) DEFAULT NULL COMMENT '三级用户的openid',
  `level_one_sum` int(11) DEFAULT '0' COMMENT '1级用户的数量',
  `level_two_sum` int(11) DEFAULT '0' COMMENT '2级用户的数量',
  `level_three_sum` int(11) DEFAULT '0' COMMENT '3级用户的数量',
  `subscribe_time` datetime DEFAULT NULL COMMENT '关注时间',
  `last_chat_time` int(11) DEFAULT NULL COMMENT '最后聊天时间戳',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '第一创建时间',
  `label_str` varchar(255) DEFAULT NULL COMMENT '粉丝标签  ',
  `label_id_str` varchar(255) DEFAULT NULL COMMENT 'label的id的一个集合',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uncode` (`shop_id`,`userid`,`openid`) USING BTREE,
  KEY `shopid_userid` (`shop_id`,`userid`) USING BTREE,
  KEY `by_openid` (`openid`) USING BTREE COMMENT '根据用openid 查询'
) ENGINE=InnoDB AUTO_INCREMENT=10020 DEFAULT CHARSET=utf8 COMMENT='店铺微信用户';

-- ----------------------------
-- Table structure for t_wx_shop_user_jifen
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_shop_user_jifen`;
CREATE TABLE `t_wx_shop_user_jifen` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` varchar(64) NOT NULL COMMENT '店铺ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `title` varchar(150) DEFAULT NULL COMMENT '积分来源描述',
  `operation` varchar(255) DEFAULT '+' COMMENT '操作符 + -',
  `jifen` int(11) DEFAULT '0' COMMENT '+-多少积分',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='用户在店铺的积分表';
