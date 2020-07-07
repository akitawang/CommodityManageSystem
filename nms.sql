/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50168
Source Host           : localhost:3306
Source Database       : nms

Target Server Type    : MYSQL
Target Server Version : 50168
File Encoding         : 65001

Date: 2020-07-07 17:22:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `useraccount` varchar(255) DEFAULT NULL,
  `userpass` varchar(255) DEFAULT NULL,
  `userphone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  `useremail` varchar(255) DEFAULT NULL,
  `outdate` datetime DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `per_certification` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '178000000', 'Akitawang', 'root', '00000@qq.com', '2020-06-12 22:06:22', 'B1BE1F22D4CD4248D1CFD1E7304E0104', null);
INSERT INTO `admin` VALUES ('3', 'admin1', '123456', '', 'Akitawang2', 'salesman', 'dsa@foxmail.com', null, null, '');
INSERT INTO `admin` VALUES ('4', 'wangxizhong', '123456', '', 'Akitawang2', 'manageman', 'asda@foxmail.com', null, null, '');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `cat` varchar(255) DEFAULT NULL,
  `se_cat` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `favorites` varchar(255) DEFAULT NULL,
  `like` varchar(255) DEFAULT NULL,
  `watch` int(255) DEFAULT NULL,
  `admin_id` int(255) DEFAULT NULL,
  `art_abstract` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_admin` (`admin_id`),
  CONSTRAINT `fk_article_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for cat
-- ----------------------------
DROP TABLE IF EXISTS `cat`;
CREATE TABLE `cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cat
-- ----------------------------
INSERT INTO `cat` VALUES ('12', '啊啊', '');
INSERT INTO `cat` VALUES ('13', '啊啊啊', '');
INSERT INTO `cat` VALUES ('14', '啊啊', '');
INSERT INTO `cat` VALUES ('15', '啊啊啊', '');
INSERT INTO `cat` VALUES ('17', '灌灌灌灌', '');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `cat` varchar(255) DEFAULT NULL,
  `se_cat` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `born_date` varchar(255) DEFAULT NULL,
  `invalid_date` varchar(255) DEFAULT NULL,
  `standards` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `photo` longtext,
  `in_price` double DEFAULT NULL,
  `out_price` double DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', '华为P40', '500', '', '     ', '', '2020-07-06', '', '', '', '', '1', '', 'none', '1', '1', '');
INSERT INTO `commodity` VALUES ('5', '华为P40pro', '94', '', '    ', '', '1', '', '', '', '', '1.7', '', 'none', '1', '1', '');
INSERT INTO `commodity` VALUES ('6', '华为Mate30', '15', '', '', '', '1', '', '', '', '', '1', '', 'none', '1', '1', null);
INSERT INTO `commodity` VALUES ('7', '华为Mate30pro', '15', '', '', '', '2020-07-03', '', '', '', '', '1', '', 'none', '1', '1', null);
INSERT INTO `commodity` VALUES ('8', 'iPhone11', '15', '', '', '', '2020-07-03', '', '', '', '', '0', '', 'none', '0', '0', null);
INSERT INTO `commodity` VALUES ('9', 'iPhone11pro', '552', null, null, null, null, null, null, null, null, '0', null, null, '0', '0', null);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `op_date` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `operator_account` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '2020-07-05 15:34:45', '登录系统', 'admin');
INSERT INTO `log` VALUES ('2', '2020-07-05 16:17:59', '登录系统', 'admin');
INSERT INTO `log` VALUES ('3', '2020-07-05 16:20:48', '登录系统', 'admin');
INSERT INTO `log` VALUES ('4', '2020-07-05 16:30:39', '添加了分类', null);
INSERT INTO `log` VALUES ('5', '2020-07-05 16:32:27', '登录系统', 'admin');
INSERT INTO `log` VALUES ('6', '2020-07-05 16:40:26', '登录系统', 'admin');
INSERT INTO `log` VALUES ('7', '2020-07-05 16:45:35', '添加了分类', '未获取到');
INSERT INTO `log` VALUES ('8', '2020-07-05 16:47:42', '添加了分类', null);
INSERT INTO `log` VALUES ('9', '2020-07-05 16:48:19', '添加了分类', null);
INSERT INTO `log` VALUES ('10', '2020-07-05 16:49:45', '登录系统', 'admin');
INSERT INTO `log` VALUES ('11', '2020-07-05 16:49:51', '添加了分类', 'admin');
INSERT INTO `log` VALUES ('12', '2020-07-05 16:50:38', '删除了了分类', 'admin');
INSERT INTO `log` VALUES ('13', '2020-07-05 16:50:49', '更新了分类', 'admin');
INSERT INTO `log` VALUES ('14', '2020-07-05 17:09:00', '登录系统', 'admin');
INSERT INTO `log` VALUES ('15', '2020-07-05 17:21:20', '登录系统', 'admin');
INSERT INTO `log` VALUES ('16', '2020-07-05 17:23:35', '登录系统', 'admin');
INSERT INTO `log` VALUES ('17', '2020-07-05 17:23:55', '添加了分类:灌灌灌灌', 'admin');
INSERT INTO `log` VALUES ('18', '2020-07-05 17:33:12', '登录系统', 'admin');
INSERT INTO `log` VALUES ('19', '2020-07-06 16:28:21', '登录系统', 'admin');
INSERT INTO `log` VALUES ('20', '2020-07-06 17:42:18', '登录系统', 'admin');
INSERT INTO `log` VALUES ('21', '2020-07-06 18:01:22', '登录系统', 'admin');
INSERT INTO `log` VALUES ('22', '2020-07-06 20:32:51', '登录系统', 'admin');
INSERT INTO `log` VALUES ('23', '2020-07-06 20:33:21', '更新了商品:a', 'admin');
INSERT INTO `log` VALUES ('24', '2020-07-06 20:33:31', '删除了商品:11', 'admin');
INSERT INTO `log` VALUES ('25', '2020-07-06 20:35:46', '删除了商品:1', 'admin');
INSERT INTO `log` VALUES ('26', '2020-07-06 20:36:46', '登录系统', 'admin');
INSERT INTO `log` VALUES ('27', '2020-07-06 21:22:14', '登录系统', 'admin');
INSERT INTO `log` VALUES ('28', '2020-07-07 15:03:54', '登录系统', 'admin');
INSERT INTO `log` VALUES ('29', '2020-07-07 15:15:13', '登录系统', 'admin');
INSERT INTO `log` VALUES ('30', '2020-07-07 15:22:21', '登录系统', 'admin');
INSERT INTO `log` VALUES ('31', '2020-07-07 15:26:21', '登录系统', 'admin');
INSERT INTO `log` VALUES ('32', '2020-07-07 15:26:24', '登录系统', 'admin');
INSERT INTO `log` VALUES ('33', '2020-07-07 15:26:36', '售出了商品:null，数量为：3件', 'admin');
INSERT INTO `log` VALUES ('34', '2020-07-07 15:31:42', '登录系统', 'admin');
INSERT INTO `log` VALUES ('35', '2020-07-07 15:36:28', '售出了商品:a，数量为：111件', 'admin');
INSERT INTO `log` VALUES ('36', '2020-07-07 15:38:42', '售出了商品:a，数量为：2222件', 'admin');
INSERT INTO `log` VALUES ('37', '2020-07-07 15:39:57', '售出了商品:a，数量为：3232件', null);
INSERT INTO `log` VALUES ('38', '2020-07-07 15:39:57', '售出了商品:a，数量为：1件', null);
INSERT INTO `log` VALUES ('39', '2020-07-07 15:39:57', '售出了商品:a，数量为：111件', null);
INSERT INTO `log` VALUES ('40', '2020-07-07 15:41:09', '登录系统', 'admin');
INSERT INTO `log` VALUES ('41', '2020-07-07 15:41:20', '售出了商品:a，数量为：555件', 'admin');
INSERT INTO `log` VALUES ('42', '2020-07-07 15:43:45', '售出了商品:a，数量为：3333件', 'admin');
INSERT INTO `log` VALUES ('43', '2020-07-07 16:38:37', '登录系统', 'admin');
INSERT INTO `log` VALUES ('44', '2020-07-07 16:40:50', '退回了商品:华为mate30pro，数量为：558件', 'admin');
INSERT INTO `log` VALUES ('45', '2020-07-07 16:43:21', '售出了商品:1，数量为：40件', 'admin');
INSERT INTO `log` VALUES ('46', '2020-07-07 16:44:05', '售出了商品:1，数量为：10件', 'admin');
INSERT INTO `log` VALUES ('47', '2020-07-07 16:44:21', '退回了商品:1，数量为：40件', 'admin');
INSERT INTO `log` VALUES ('48', '2020-07-07 16:50:20', '售出了商品:1，数量为：1件', 'admin');
INSERT INTO `log` VALUES ('49', '2020-07-07 16:50:32', '退回了商品:1，数量为：1件', 'admin');
INSERT INTO `log` VALUES ('50', '2020-07-07 16:58:30', '登录系统', 'admin');
INSERT INTO `log` VALUES ('51', '2020-07-07 16:59:01', '注册新用户', 'admin1');
INSERT INTO `log` VALUES ('52', '2020-07-07 17:01:23', '登录系统', 'admin1');
INSERT INTO `log` VALUES ('53', '2020-07-07 17:01:45', '售出了商品:1，数量为：10件', 'admin1');
INSERT INTO `log` VALUES ('54', '2020-07-07 17:02:04', '登录系统', 'admin');
INSERT INTO `log` VALUES ('55', '2020-07-07 17:02:34', '注册新用户', 'wangxizhong');
INSERT INTO `log` VALUES ('56', '2020-07-07 17:02:42', '登录系统', 'wangxizhong');

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) DEFAULT NULL,
  `sale_price` double DEFAULT NULL,
  `sale_number` int(11) DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  `sale_name` varchar(255) DEFAULT NULL,
  `sale_order` varchar(255) DEFAULT NULL,
  `sale_status` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES ('1', '9', '50', '558', '2020-07-07 16:40:50', '华为mate30pro', 'SP55820200707151546', '退货', '的');
INSERT INTO `sale` VALUES ('2', '9', '50', '550', '2020-07-07 15:15:53', '华为mate30pro', 'SP55020200707151553', null, null);
INSERT INTO `sale` VALUES ('3', '9', '500', '3', '2020-07-07 15:26:35', '华为mate30pro', 'SP320200707152635', null, null);
INSERT INTO `sale` VALUES ('4', '1', '11', '111', '2020-07-07 15:36:27', 'a', 'SP11120200707153627', null, null);
INSERT INTO `sale` VALUES ('5', '1', '23', '2222', '2020-07-07 15:38:42', 'a', 'SP222220200707153842', null, null);
INSERT INTO `sale` VALUES ('6', '1', '32', '3232', '2020-07-07 15:39:56', 'a', 'SP323220200707153956', null, null);
INSERT INTO `sale` VALUES ('7', '1', '32', '1', '2020-07-07 15:39:56', 'a', 'SP120200707153956', null, null);
INSERT INTO `sale` VALUES ('8', '1', '32', '111', '2020-07-07 15:39:56', 'a', 'SP11120200707153956', null, null);
INSERT INTO `sale` VALUES ('9', '1', '50', '555', '2020-07-07 15:41:20', 'a', 'SP55520200707154120', null, null);
INSERT INTO `sale` VALUES ('10', '1', '3', '3333', '2020-07-07 15:43:45', 'a', 'SP333320200707154345', null, null);
INSERT INTO `sale` VALUES ('11', '5', '40', '40', '2020-07-07 16:44:21', '1', 'SP4020200707164321', '退货', '搜索');
INSERT INTO `sale` VALUES ('12', '5', '1', '10', '2020-07-07 16:44:05', '1', 'SP1020200707164405', '售出', null);
INSERT INTO `sale` VALUES ('13', '5', '12', '1', '2020-07-07 16:50:32', '1', 'SP120200707165019', '退货', '0');
INSERT INTO `sale` VALUES ('14', '5', '5', '10', '2020-07-07 17:01:45', '1', 'SP1020200707170145', '售出', null);

-- ----------------------------
-- Table structure for se_cat
-- ----------------------------
DROP TABLE IF EXISTS `se_cat`;
CREATE TABLE `se_cat` (
  `se_class_name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of se_cat
-- ----------------------------

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `capital` double(255,0) DEFAULT NULL,
  `contacts` varchar(255) DEFAULT NULL,
  `contacts_phone` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
