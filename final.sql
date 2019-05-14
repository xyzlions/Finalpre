/*
Navicat MySQL Data Transfer

Source Server         : JSP
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : final

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-01-04 22:52:34
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ad`
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `adid` int(11) NOT NULL,
  `adtitle` varchar(255) DEFAULT NULL,
  `adpath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO ad VALUES ('1', '獨家專利登山杖現正優惠中！！！', null);
INSERT INTO ad VALUES ('2', '岡南發泡登山拐杖，你登山的最佳好夥伴', null);

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `pid` int(30) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `pprice` int(30) NOT NULL,
  `ppic` varchar(255) NOT NULL,
  `pnum` int(30) NOT NULL,
  `mid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO cart VALUES ('7', 'MG-GO-0002', '700', 'images/product/eva_7.jpg', '3', 'abcd');
INSERT INTO cart VALUES ('1', 'LTG-BY-0001', '500', 'images/product/eva_1.jpg', '1', 'cyim4875');
INSERT INTO cart VALUES ('2', 'TG-B-0001', '450', 'images/product/eva_2.jpg', '1', 'cyim4875');
INSERT INTO cart VALUES ('7', 'MG-GO-0002', '700', 'images/product/eva_7.jpg', '1', 'null');

-- ----------------------------
-- Table structure for `counter`
-- ----------------------------
DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `count` bigint(20) NOT NULL,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of counter
-- ----------------------------
INSERT INTO counter VALUES ('1015');

-- ----------------------------
-- Table structure for `guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook` (
  `bno` int(8) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `mmail` varchar(255) DEFAULT NULL,
  `bcontent` text,
  `IP` varchar(255) DEFAULT NULL,
  `bdatetime` varchar(255) DEFAULT NULL,
  `pname` varchar(255) NOT NULL,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guestbook
-- ----------------------------
INSERT INTO guestbook VALUES ('1', '1234', '1234@12342sss.com', '好看', '0:0:0:0:0:0:0:1', '2019-01-03', 'MG-GO-0002');
INSERT INTO guestbook VALUES ('2', '1234', 'asdasd@mmail.com', '還有貨嗎?', '0:0:0:0:0:0:0:1', '2019-01-04', 'MG-GO-0005');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `mno` int(8) NOT NULL,
  `mid` varchar(255) NOT NULL,
  `mmail` varchar(255) NOT NULL,
  `mpwd` varchar(255) NOT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `mtel` int(15) DEFAULT NULL,
  `maddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO member VALUES ('1', 'cyim4875', 'xyzlions@gmail.com', 'ZG1001ZG', '管理員', null, null);
INSERT INTO member VALUES ('2', '1234', '4144144@jmail.com', '1234', 'LU', '975647855', 'Taiwan');
INSERT INTO member VALUES ('3', '4321', 'ssdd@amail.com', '4321', null, null, null);
INSERT INTO member VALUES ('4', 'abcd', 'abcd@1234mail.com', 'abcd', null, null, null);
INSERT INTO member VALUES ('5', 'abcd', 'abcd@1234mail.com', 'abcd', null, null, null);

-- ----------------------------
-- Table structure for `orderlist`
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `ono` int(11) NOT NULL,
  `mid` varchar(255) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `mmail` varchar(255) NOT NULL,
  `mtel` int(15) NOT NULL,
  `topay` varchar(255) NOT NULL,
  `trans` varchar(255) DEFAULT NULL,
  `totalprice` int(30) DEFAULT NULL,
  PRIMARY KEY (`ono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO orderlist VALUES ('1', 'abcd', 'MG-GO-0002,', '527', '75275727@sdgsd', '975348', 'cash', 'store', '2100');
INSERT INTO orderlist VALUES ('2', 'abcd', 'MG-GO-0002,', '1234', 'sadas@asdfad.com', '975348449', 'cash', 'store', '2100');
INSERT INTO orderlist VALUES ('3', '1234', 'LTG-B-0001,LG-GP-0001,', 'LOL', 'asdasd@mmail.com', '975348449', 'card', 'store', '1200');
INSERT INTO orderlist VALUES ('4', 'cyim4875', 'LTG-BY-0001,', 'sasdas', 'dsfaw@fafs.com', '752755272', 'cash', 'store', '500');
INSERT INTO orderlist VALUES ('5', 'cyim4875', 'LTG-BY-0001,', 'sasdas', 'asdasd@mmail.com', '975348449', 'cash', 'store', '500');
INSERT INTO orderlist VALUES ('6', 'cyim4875', 'LTG-BY-0001,', 'asdas', 'asdasd@mmail.com', '975348449', 'cash', 'store', '500');
INSERT INTO orderlist VALUES ('7', 'cyim4875', 'LTG-BY-0001,', 'sasdas', 'dsfaw@fafs.com', '975647855', 'cash', 'store', '500');
INSERT INTO orderlist VALUES ('8', 'cyim4875', 'LTG-BY-0001,TG-B-0001,', 'sasdas', 'dsfaw@fafs.com', '975647855', 'cash', 'store', '950');
INSERT INTO orderlist VALUES ('9', '1234', 'LTG-B-0001,LG-GP-0001,', 'sasdas', 'asdasd@mmail.com', '975348449', 'cash', 'store', '4800');
INSERT INTO orderlist VALUES ('10', '1234', 'LTG-B-0001,LG-GP-0001,', '4104', 'asdasd@mmail.com', '975647855', 'cash', 'store', '6000');
INSERT INTO orderlist VALUES ('11', '1234', '', 'LOL', 'asdasd@mmail.com', '975348449', 'cash', 'store', '0');
INSERT INTO orderlist VALUES ('12', '1234', 'LTG-BY-0001,', 'LU', 'asdasd@mmail.com', '975348157', 'cash', 'store', '2500');
INSERT INTO orderlist VALUES ('13', '1234', 'LTG-BY-0001,', 'LU', 'asdasd@mmail.com', '975348157', 'cash', 'store', '2500');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `pintroduce` varchar(255) DEFAULT NULL,
  `pprice` int(50) NOT NULL,
  `ppricesales` int(50) DEFAULT NULL,
  `ppic` varchar(255) DEFAULT NULL,
  `pstock` int(15) DEFAULT NULL,
  `ptype` varchar(255) DEFAULT NULL,
  `psize` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO product VALUES ('1', 'LTG-BY-0001', '專利樣式雙色登山拐杖握把，EVA發泡材質', '600', '500', 'images/product/eva_1.jpg', '290', '登山拐杖握把', '16mm/18mm');
INSERT INTO product VALUES ('2', 'TG-B-0001', '登山拐杖握把，EVA發泡材質\r\n\r\n', '500', '450', 'images/product/eva_2.jpg', '400', '登山拐杖握把', '16mm/18mm');
INSERT INTO product VALUES ('3', 'LTG-B-0001', '登山拐杖握把，EVA發泡材質\r\n\r\n', '500', '450', 'images/product/eva_3.jpg', '390', '登山拐杖握把', '16mm/18mm');
INSERT INTO product VALUES ('4', 'G-B-0001', '專利樣式雙色登山拐杖握把，EVA發泡材質', '500', '450', 'images/product/eva_4.jpg', '400', '登山拐杖握把', '16mm/18mm');
INSERT INTO product VALUES ('5', 'G-B-0002\r\n', '登山拐杖握把，EVA發泡材質', '500', '450', 'images/product/eva_5.jpg', '400', '登山拐杖握把', '16mm/18mm');
INSERT INTO product VALUES ('6', 'TU-BY-0001', '專利樣式雙色EVA發泡套管\r\n\r\n', '500', '450', 'images/product/eva_6.jpg', '400', '發泡套管', '16mm/18mm');
INSERT INTO product VALUES ('7', 'MG-GO-0002', '客製化雙色登山拐杖握把，EVA發泡材質', '800', '700', 'images/product/eva_7.jpg', '400', '登山拐杖握把', '16mm/18mm');
INSERT INTO product VALUES ('8', 'LG-GP-0001', '客製化雙色登山拐杖握把，EVA發泡材質', '800', '750', 'images/product/eva_8.jpg', '390', '登山拐杖握把', '16mm/18mm');
