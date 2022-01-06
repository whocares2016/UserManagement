/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jspm09921gsyhglxt

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-12-27 15:48:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '帐号',
  `pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员';

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `bumen`
-- ----------------------------
DROP TABLE IF EXISTS `bumen`;
CREATE TABLE `bumen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bumenmingcheng` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='部门';

-- ----------------------------
-- Records of bumen
-- ----------------------------
INSERT INTO `bumen` VALUES ('1', '人事部');
INSERT INTO `bumen` VALUES ('2', '销售部');
INSERT INTO `bumen` VALUES ('3', '生产部');

-- ----------------------------
-- Table structure for `gongzuoshijian`
-- ----------------------------
DROP TABLE IF EXISTS `gongzuoshijian`;
CREATE TABLE `gongzuoshijian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yuangong` int(10) unsigned NOT NULL COMMENT '员工ID',
  `gonghao` varchar(64) NOT NULL DEFAULT '' COMMENT '工号',
  `xingming` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `bumen` int(10) unsigned NOT NULL COMMENT '部门',
  `zhiwei` int(10) unsigned NOT NULL COMMENT '职位',
  `gongzuoriqi` varchar(25) NOT NULL COMMENT '工作日期',
  `kaishishiduan` varchar(25) NOT NULL COMMENT '开始时段',
  `jieshushiduan` varchar(25) NOT NULL COMMENT '结束时段',
  `gongzuobeizhu` text NOT NULL COMMENT '工作备注',
  `tianjiaren` varchar(64) NOT NULL DEFAULT '' COMMENT '添加人',
  PRIMARY KEY (`id`),
  KEY `gongzuoshijian_yuangong_index` (`yuangong`),
  KEY `gongzuoshijian_bumen_index` (`bumen`),
  KEY `gongzuoshijian_zhiwei_index` (`zhiwei`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='工作时间';

-- ----------------------------
-- Records of gongzuoshijian
-- ----------------------------
INSERT INTO `gongzuoshijian` VALUES ('1', '1', '999', '小红', '1', '1', '2022-01-01', '14:00', '16:00', '方式多少地方', 'admin');
INSERT INTO `gongzuoshijian` VALUES ('2', '1', '999', '小红', '1', '1', '2022-01-02', '09:00', '17:35', '顺风顺水的', 'admin');
INSERT INTO `gongzuoshijian` VALUES ('3', '2', '888', '小王', '2', '2', '2022-01-01', '08:00', '19:30', '是的发送到发送到', 'admin');
INSERT INTO `gongzuoshijian` VALUES ('4', '3', '777', '老王', '2', '3', '2022-01-01', '10:30', '16:30', '发送到发送到', 'admin');
INSERT INTO `gongzuoshijian` VALUES ('5', '4', '666', '李四', '3', '4', '2021-12-31', '08:00', '20:30', '是发送到发送到', 'admin');
INSERT INTO `gongzuoshijian` VALUES ('6', '5', '555', '小伟', '3', '3', '2021-12-31', '10:30', '17:00', '水电费是的范德萨', 'admin');

-- ----------------------------
-- Table structure for `xinzixinxi`
-- ----------------------------
DROP TABLE IF EXISTS `xinzixinxi`;
CREATE TABLE `xinzixinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xinzibianhao` varchar(50) NOT NULL DEFAULT '' COMMENT '薪资编号',
  `yuefen` varchar(25) NOT NULL COMMENT '月份',
  `yuangong` int(10) unsigned NOT NULL COMMENT '员工ID',
  `gonghao` varchar(64) NOT NULL DEFAULT '' COMMENT '工号',
  `xingming` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `bumen` int(10) unsigned NOT NULL COMMENT '部门',
  `zhiwei` int(10) unsigned NOT NULL COMMENT '职位',
  `jibengongzi` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '基本工资',
  `jiabangongzi` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加班工资',
  `quanqinjiang` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '全勤奖',
  `youxiuyuangong` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优秀员工',
  `shebao` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '社保',
  `gongjijin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '公积金',
  `gerensuodeshui` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '个人所得税',
  `yingfaxinzi` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应发薪资',
  `shifaxinzi` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实发薪资',
  PRIMARY KEY (`id`),
  KEY `xinzixinxi_yuangong_index` (`yuangong`),
  KEY `xinzixinxi_bumen_index` (`bumen`),
  KEY `xinzixinxi_zhiwei_index` (`zhiwei`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='薪资信息';

-- ----------------------------
-- Records of xinzixinxi
-- ----------------------------
INSERT INTO `xinzixinxi` VALUES ('1', '12271537191796', '2021-10', '1', '999', '小红', '1', '1', '2550.00', '2000.00', '300.00', '200.00', '300.00', '300.00', '200.00', '5050.00', '4250.00');
INSERT INTO `xinzixinxi` VALUES ('2', '12271537461225', '2021-11', '1', '999', '小红', '1', '1', '2250.00', '2650.00', '300.00', '0.00', '300.00', '300.00', '200.00', '5200.00', '4400.00');
INSERT INTO `xinzixinxi` VALUES ('3', '12271538038067', '2021-10', '2', '888', '小王', '2', '2', '2550.00', '4235.00', '300.00', '300.00', '300.00', '300.00', '200.00', '7385.00', '6585.00');
INSERT INTO `xinzixinxi` VALUES ('4', '12271538216003', '2021-11', '2', '888', '小王', '2', '2', '2550.00', '4120.00', '300.00', '0.00', '300.00', '300.00', '200.00', '6970.00', '6170.00');
INSERT INTO `xinzixinxi` VALUES ('5', '12271538401637', '2021-10', '3', '777', '老王', '2', '3', '2550.00', '5680.00', '0.00', '0.00', '300.00', '300.00', '200.00', '8230.00', '7430.00');
INSERT INTO `xinzixinxi` VALUES ('6', '12271538581244', '2021-11', '3', '777', '老王', '2', '3', '2550.00', '6583.00', '0.00', '0.00', '300.00', '300.00', '200.00', '9133.00', '8333.00');
INSERT INTO `xinzixinxi` VALUES ('7', '12271545261271', '2021-10', '5', '555', '小伟', '3', '3', '2550.00', '6423.00', '300.00', '0.00', '300.00', '300.00', '250.00', '9273.00', '8423.00');
INSERT INTO `xinzixinxi` VALUES ('8', '12271545401676', '2021-11', '5', '555', '小伟', '3', '3', '2550.00', '6320.00', '0.00', '0.00', '300.00', '300.00', '200.00', '8870.00', '8070.00');
INSERT INTO `xinzixinxi` VALUES ('9', '12271546069648', '2021-10', '4', '666', '李四', '3', '4', '2550.00', '3210.00', '300.00', '200.00', '300.00', '300.00', '200.00', '6260.00', '5460.00');
INSERT INTO `xinzixinxi` VALUES ('10', '12271546211805', '2021-11', '4', '666', '李四', '3', '4', '2550.00', '3320.00', '300.00', '300.00', '300.00', '300.00', '200.00', '6470.00', '5670.00');

-- ----------------------------
-- Table structure for `yuangong`
-- ----------------------------
DROP TABLE IF EXISTS `yuangong`;
CREATE TABLE `yuangong` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gonghao` varchar(50) NOT NULL DEFAULT '' COMMENT '工号',
  `mima` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `xingming` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `xingbie` varchar(10) NOT NULL COMMENT '性别',
  `lianxifangshi` varchar(50) NOT NULL DEFAULT '' COMMENT '联系方式',
  `bumen` int(10) unsigned NOT NULL COMMENT '部门',
  `zhiwei` int(10) unsigned NOT NULL COMMENT '职位',
  PRIMARY KEY (`id`),
  KEY `yuangong_bumen_index` (`bumen`),
  KEY `yuangong_zhiwei_index` (`zhiwei`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='员工';

-- ----------------------------
-- Records of yuangong
-- ----------------------------
INSERT INTO `yuangong` VALUES ('1', '999', '999', '小红', '女', '12345678901', '1', '1');
INSERT INTO `yuangong` VALUES ('2', '888', '888', '小王', '男', '12345678902', '2', '2');
INSERT INTO `yuangong` VALUES ('3', '777', '777', '老王', '男', '12345654545', '2', '3');
INSERT INTO `yuangong` VALUES ('4', '666', '666', '李四', '男', '12345678955', '3', '4');
INSERT INTO `yuangong` VALUES ('5', '555', '555', '小伟', '男', '12345678459', '3', '3');

-- ----------------------------
-- Table structure for `zhiwei`
-- ----------------------------
DROP TABLE IF EXISTS `zhiwei`;
CREATE TABLE `zhiwei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zhiweimingcheng` varchar(255) NOT NULL DEFAULT '' COMMENT '职位名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='职位';

-- ----------------------------
-- Records of zhiwei
-- ----------------------------
INSERT INTO `zhiwei` VALUES ('1', '文员');
INSERT INTO `zhiwei` VALUES ('2', '销售员');
INSERT INTO `zhiwei` VALUES ('3', '经理');
INSERT INTO `zhiwei` VALUES ('4', '生产员');
