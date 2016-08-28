/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100110
Source Host           : localhost:3306
Source Database       : springmvcadmin

Target Server Type    : MYSQL
Target Server Version : 100110
File Encoding         : 65001

Date: 2016-08-28 10:27:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `aadi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `asoyadi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `amail` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `asifre` varchar(32) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'Ali', 'Bilmem', 'ali@ali.com', 'c4ca4238a0b923820dcc509a6f75849b');

-- ----------------------------
-- Table structure for haberekle
-- ----------------------------
DROP TABLE IF EXISTS `haberekle`;
CREATE TABLE `haberekle` (
  `haberid` int(10) NOT NULL AUTO_INCREMENT,
  `haberKat` int(11) DEFAULT NULL,
  `haberAdi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `hicerik` text COLLATE utf8_turkish_ci,
  `haberTarih` datetime DEFAULT NULL,
  PRIMARY KEY (`haberid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- ----------------------------
-- Records of haberekle
-- ----------------------------
INSERT INTO `haberekle` VALUES ('3', '7', 'deneme', '<p>asdlfnasdf</p>\r\n', '2016-08-25 18:41:16');
INSERT INTO `haberekle` VALUES ('4', '7', 'lasndlaksnd', '<p>asdkfnaşsdfnasdf</p>\r\n', '2016-08-25 18:43:14');
INSERT INTO `haberekle` VALUES ('5', '8', 'deneme5 ', '<p>deneme5&nbsp;</p>\r\n\r\n<p>deneme5&nbsp;</p>\r\n\r\n<p>deneme5&nbsp;</p>\r\n\r\n<p>deneme5</p>\r\n', '2016-08-25 18:44:09');
INSERT INTO `haberekle` VALUES ('6', '8', 'yine deneme', '<p>deneniyor denen&uuml;yor denen&uuml;yor deneniyor deneniyor&nbsp;</p>\r\n', '2016-08-25 20:09:27');
INSERT INTO `haberekle` VALUES ('7', '7', 'denemelerdevam', '<p>aşdsjnfşasdnfşasdf</p>\r\n', '2016-08-25 20:10:21');
INSERT INTO `haberekle` VALUES ('8', '8', 'oldu ', '<p>lkjandlkşdksşdksa</p>\r\n', '2016-08-25 22:43:40');
INSERT INTO `haberekle` VALUES ('9', '7', 'oldu mu ', '<p>oldu dddddd</p>\r\n', '2016-08-25 22:46:57');
INSERT INTO `haberekle` VALUES ('10', '7', 'oldsadasdas', '<p>asdfsad</p>\r\n', '2016-08-25 22:47:40');
INSERT INTO `haberekle` VALUES ('11', '7', 'lasnfsldf', '<p>lsfkmlasdkmf</p>\r\n', '2016-08-26 02:21:10');
INSERT INTO `haberekle` VALUES ('12', '8', 'ghjghj', '<p>ghjgh</p>\r\n', '2016-08-27 10:30:24');
INSERT INTO `haberekle` VALUES ('13', '7', 'ccc', '<p>ccc</p>\r\n', '2016-08-27 11:04:16');
INSERT INTO `haberekle` VALUES ('14', '7', 'asas', 'asas', '2016-08-27 13:31:24');

-- ----------------------------
-- Table structure for haberkategori
-- ----------------------------
DROP TABLE IF EXISTS `haberkategori`;
CREATE TABLE `haberkategori` (
  `hkatid` int(11) NOT NULL AUTO_INCREMENT,
  `hkadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `hkdetay` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `hktarih` datetime DEFAULT NULL,
  PRIMARY KEY (`hkatid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of haberkategori
-- ----------------------------
INSERT INTO `haberkategori` VALUES ('7', 'sdfs-', 'dfsdfs-', '2016-08-21 10:26:01');
INSERT INTO `haberkategori` VALUES ('8', 'aa', 'aa', '2016-08-27 10:30:15');

-- ----------------------------
-- Table structure for iletisim
-- ----------------------------
DROP TABLE IF EXISTS `iletisim`;
CREATE TABLE `iletisim` (
  `iletID` int(11) NOT NULL AUTO_INCREMENT,
  `il` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ilce` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `adres` varchar(500) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `gsm` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`iletID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of iletisim
-- ----------------------------
INSERT INTO `iletisim` VALUES ('8', 'Ankara', 'Kızılay', 'Java Mahallesi Spring sokağı MVC apartmanı No Admin', '0212 1907 fb', '0212 fb 1907', '0532 büyük fb', 'fb@şampiyon.com');
INSERT INTO `iletisim` VALUES ('9', 'İstanbul', 'Beşiktaş', 'Her ne ise', '09009603635', '09009603636', '05436598656', 'hakanozer02@gmail.com');

-- ----------------------------
-- Table structure for urunkategori
-- ----------------------------
DROP TABLE IF EXISTS `urunkategori`;
CREATE TABLE `urunkategori` (
  `ukatid` int(11) NOT NULL AUTO_INCREMENT,
  `ukadi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `ukdetay` varchar(5000) COLLATE utf8_turkish_ci NOT NULL,
  `uktarih` datetime NOT NULL,
  PRIMARY KEY (`ukatid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- ----------------------------
-- Records of urunkategori
-- ----------------------------
INSERT INTO `urunkategori` VALUES ('9', 'Elektronik', '', '2016-07-31 10:03:38');
INSERT INTO `urunkategori` VALUES ('10', 'Beyaz Eşya', '', '2016-07-31 10:03:46');
INSERT INTO `urunkategori` VALUES ('11', 'Tekstil', '', '2016-07-31 10:04:08');
INSERT INTO `urunkategori` VALUES ('12', 'Ayakkabı', '', '2016-07-31 10:04:20');

-- ----------------------------
-- Table structure for urunler
-- ----------------------------
DROP TABLE IF EXISTS `urunler`;
CREATE TABLE `urunler` (
  `urid` int(11) NOT NULL AUTO_INCREMENT,
  `katid` int(11) NOT NULL,
  `ubaslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `ukisaAciklama` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `udetay` varchar(5000) COLLATE utf8_turkish_ci NOT NULL,
  `ufiyat` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `uTarih` datetime NOT NULL,
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- ----------------------------
-- Records of urunler
-- ----------------------------
INSERT INTO `urunler` VALUES ('1', '10', 'Buz dolabı', 'Buz dolabı kısa açıklama', '<h1>Buz dolabı <q><em><strong>defaylı</strong></em></q> a&ccedil;ıklama</h1>\n', '2000', '2016-07-31 12:30:24');
INSERT INTO `urunler` VALUES ('2', '9', 'Çamaşır Makinesi', 'jkljkl', '<p>jkljkljk jkl jkljkljkljk</p>\r\n', '34', '2016-07-31 12:31:11');
INSERT INTO `urunler` VALUES ('3', '12', 'Ütü', 'ghjgh', '<p>ghjgh</p>\r\n', '34', '2016-07-31 12:32:23');
INSERT INTO `urunler` VALUES ('4', '9', 'Ayakkabı', 'fghfg', '<p>fghfghfg</p>\r\n', '43', '2016-07-31 12:33:52');
INSERT INTO `urunler` VALUES ('5', '9', 'Audi', 'Çok güzel Araba :(', '<p>Araba a&ccedil;ıklaması</p>\r\n', '100.000', '2016-08-13 11:59:06');
INSERT INTO `urunler` VALUES ('6', '10', 'No Frost  Buz Dolabı', 'No Frost  Buz Dolabı Açıklamsı', '<p>No Frost &nbsp;Buz Dolabı Detay</p>\r\n', '2000', '2016-08-14 13:41:10');

-- ----------------------------
-- Table structure for urunresimler
-- ----------------------------
DROP TABLE IF EXISTS `urunresimler`;
CREATE TABLE `urunresimler` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `urunID` int(11) DEFAULT NULL,
  `radi` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `rtarih` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- ----------------------------
-- Records of urunresimler
-- ----------------------------
INSERT INTO `urunresimler` VALUES ('32', '3', 'utu.jpg', '2016-08-13 12:12:30');
INSERT INTO `urunresimler` VALUES ('33', '2', 'camasir.jpg', '2016-08-13 12:12:41');
INSERT INTO `urunresimler` VALUES ('35', '4', 'ayakkabi.jpg', '2016-08-13 12:13:08');
INSERT INTO `urunresimler` VALUES ('41', '5', 'audi_20160814101734_0.jpg', '2016-08-14 10:17:34');
INSERT INTO `urunresimler` VALUES ('42', '1', 'buz_dolabi_20160814133726_0.jpg', '2016-08-14 13:37:26');
INSERT INTO `urunresimler` VALUES ('45', '6', 'buz_dolabi_no_20160814134958_0.jpg', '2016-08-14 13:49:58');
