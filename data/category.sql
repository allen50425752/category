/*
Navicat MySQL Data Transfer

Source Server         : mysql_link
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : category

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-07 14:20:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '父ID',
  `cate_name` varchar(30) NOT NULL COMMENT '分类名',
  `cate_order` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '新闻', '0', '0');
INSERT INTO `category` VALUES ('2', '0', '图片', '0', '0');
INSERT INTO `category` VALUES ('3', '1', '国内新闻', '0', '0');
INSERT INTO `category` VALUES ('4', '1', '国际新闻', '0', '0');
INSERT INTO `category` VALUES ('5', '3', '北京新闻', '0', '0');
INSERT INTO `category` VALUES ('6', '4', '美国新闻', '0', '0');
INSERT INTO `category` VALUES ('7', '2', '美女图片', '0', '0');
INSERT INTO `category` VALUES ('8', '2', '风景图片', '0', '0');
INSERT INTO `category` VALUES ('9', '7', '日韩明星', '0', '0');
INSERT INTO `category` VALUES ('10', '9', '日本AV', '0', '0');

-- ----------------------------
-- Table structure for likecate
-- ----------------------------
DROP TABLE IF EXISTS `likecate`;
CREATE TABLE `likecate` (
  `id` int(10) unsigned NOT NULL,
  `path` varchar(200) NOT NULL DEFAULT '' COMMENT '全路径',
  `cate_name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名',
  `cate_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likecate
-- ----------------------------
INSERT INTO `likecate` VALUES ('1', '', '手机', '0', '0');
INSERT INTO `likecate` VALUES ('2', '1', '功能手机', '0', '0');
INSERT INTO `likecate` VALUES ('3', '1,2', '老人手机', '0', '0');
INSERT INTO `likecate` VALUES ('4', '1,2', '儿童手机', '0', '0');
INSERT INTO `likecate` VALUES ('5', '1', '智能手机', '0', '0');
INSERT INTO `likecate` VALUES ('6', '1,5', 'Android手机', '0', '0');
INSERT INTO `likecate` VALUES ('7', '1,5', 'iOS手机', '0', '0');
INSERT INTO `likecate` VALUES ('8', '1,5', 'winphoto手机', '0', '0');
INSERT INTO `likecate` VALUES ('9', '1,2,4', '色盲手机', '0', '0');
INSERT INTO `likecate` VALUES ('10', '1,2,3', '大字手机', '0', '0');
INSERT INTO `likecate` VALUES ('11', '12', '台式机', '0', '0');
INSERT INTO `likecate` VALUES ('12', '', '电脑', '0', '0');
INSERT INTO `likecate` VALUES ('13', '12,11', '一体机', '0', '0');
INSERT INTO `likecate` VALUES ('14', '12,11', '非一体机', '0', '0');
INSERT INTO `likecate` VALUES ('15', '12', '笔记本', '0', '0');
