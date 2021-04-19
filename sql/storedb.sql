/*
 Navicat Premium Data Transfer

 Source Server         : stroe
 Source Server Type    : MySQL
 Source Server Version : 50561
 Source Host           : localhost:3306
 Source Schema         : storedb

 Target Server Type    : MySQL
 Target Server Version : 50561
 File Encoding         : 65001

 Date: 12/11/2020 20:55:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT,
  `imgPath` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `describes` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, 'public/imgs/cms_1.jpg', '轮播图片1');
INSERT INTO `carousel` VALUES (2, 'public/imgs/cms_2.jpg', '轮播图片2');
INSERT INTO `carousel` VALUES (3, 'public/imgs/cms_3.jpg', '轮播图图片3');
INSERT INTO `carousel` VALUES (4, 'public/imgs/cms_4.jpg', '轮播图片4');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '手机');
INSERT INTO `category` VALUES (2, '电视机');
INSERT INTO `category` VALUES (3, '空调');
INSERT INTO `category` VALUES (4, '洗衣机');
INSERT INTO `category` VALUES (5, '保护套');
INSERT INTO `category` VALUES (6, '保护膜');
INSERT INTO `category` VALUES (7, '充电器');
INSERT INTO `category` VALUES (8, '充电宝');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `collect_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_collect_user_id`(`user_id`) USING BTREE,
  INDEX `FK_collect_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (5, 'carousel', '轮播图片管理', 'Carousel', 'crud', 'com.store.system', 'system', 'carousel', '轮播图片管理', 'store', '0', '/', '{\"parentMenuId\":1}', 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:27:53', '轮播图片管理');
INSERT INTO `gen_table` VALUES (8, 'orders', '订单管理', 'Orders', 'crud', 'com.store.system', 'system', 'orders', '订单管理', 'store', '0', '/', '{\"parentMenuId\":1}', 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:32:25', '订单管理');
INSERT INTO `gen_table` VALUES (10, 'product_picture', '产品详细管理', 'ProductPicture', 'crud', 'com.store.system', 'system', 'picture', '产品详细管理', 'store', '0', '/', '{\"parentMenuId\":1}', 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:34:07', '产品详细管理');
INSERT INTO `gen_table` VALUES (11, 'collect', '个人收藏表', 'Collect', 'crud', 'com.store.system', 'system', 'collect', '个人收藏', 'store', '0', '/', '{\"parentMenuId\":1}', 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:13:51', '个人收藏');
INSERT INTO `gen_table` VALUES (12, 'shoppingcart', '个人购物车表', 'Shoppingcart', 'crud', 'com.store.system', 'system', 'shoppingcart', '个人购物车', 'store', '0', '/', '{\"parentMenuId\":1}', 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:15:35', '个人购物车表');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (44, '5', 'carousel_id', '轮播图片地址', 'int(11)', 'Long', 'carouselId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:27:53');
INSERT INTO `gen_table_column` VALUES (45, '5', 'imgPath', '轮播图片路径', 'char(50)', 'String', 'imgpath', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:27:53');
INSERT INTO `gen_table_column` VALUES (46, '5', 'describes', '轮播图片秒速', 'char(50)', 'String', 'describes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:27:53');
INSERT INTO `gen_table_column` VALUES (53, '8', 'id', '订单表示符', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:32:25');
INSERT INTO `gen_table_column` VALUES (54, '8', 'order_id', '订单id', 'bigint(20)', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:32:25');
INSERT INTO `gen_table_column` VALUES (55, '8', 'user_id', '用户id', 'int(11)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:32:25');
INSERT INTO `gen_table_column` VALUES (56, '8', 'product_id', '产品id', 'int(11)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:32:25');
INSERT INTO `gen_table_column` VALUES (57, '8', 'product_num', '产品数量', 'int(11)', 'Long', 'productNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:32:25');
INSERT INTO `gen_table_column` VALUES (58, '8', 'product_price', '产品价格', 'double', 'Long', 'productPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:32:25');
INSERT INTO `gen_table_column` VALUES (59, '8', 'order_time', '支付时间', 'bigint(20)', 'Long', 'orderTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:32:25');
INSERT INTO `gen_table_column` VALUES (70, '10', 'id', '产品详细唯一标识', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:34:07');
INSERT INTO `gen_table_column` VALUES (71, '10', 'product_id', '产品唯一标识', 'int(11)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:34:07');
INSERT INTO `gen_table_column` VALUES (72, '10', 'product_picture', '产品详细图片', 'char(200)', 'String', 'productPicture', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:34:07');
INSERT INTO `gen_table_column` VALUES (73, '10', 'intro', '产品描述', 'text', 'String', 'intro', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-02 19:26:11', '', '2020-11-02 19:34:07');
INSERT INTO `gen_table_column` VALUES (74, '11', 'id', '标识符', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:13:51');
INSERT INTO `gen_table_column` VALUES (75, '11', 'user_id', '用户id', 'int(11)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:13:51');
INSERT INTO `gen_table_column` VALUES (76, '11', 'product_id', '产品id', 'int(11)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:13:51');
INSERT INTO `gen_table_column` VALUES (77, '11', 'collect_time', '收藏时间', 'bigint(20)', 'Long', 'collectTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:13:51');
INSERT INTO `gen_table_column` VALUES (78, '12', 'id', '标识符', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:15:35');
INSERT INTO `gen_table_column` VALUES (79, '12', 'user_id', '用户id', 'int(11)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:15:35');
INSERT INTO `gen_table_column` VALUES (80, '12', 'product_id', '产品id', 'int(11)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:15:35');
INSERT INTO `gen_table_column` VALUES (81, '12', 'num', '购买数量', 'int(11)', 'Long', 'num', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-05 19:12:05', '', '2020-11-05 19:15:35');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `order_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_order_user_id`(`user_id`) USING BTREE,
  INDEX `FK_order_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_order_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_sales` int(11) NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `FK_product_category`(`category_id`) USING BTREE,
  CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Redmi K30', 1, '120Hz流速屏，全速热爱', '120Hz高帧率流速屏/ 索尼6400万前后六摄 / 6.67\'小孔径全面屏 / 最高可选8GB+256GB大存储 / 高通骁龙730G处理器 / 3D四曲面玻璃机身 / 4500mAh+27W快充 / 多功能NFC', 'public/imgs/phone/Redmi-k30.png', 2000, 1599, 10, 0);
INSERT INTO `product` VALUES (2, 'Redmi K30 5G', 1, '双模5G,120Hz流速屏', '双模5G / 三路并发 / 高通骁龙765G / 7nm 5G低功耗处理器 / 120Hz高帧率流速屏 / 6.67\'小孔径全面屏 / 索尼6400万前后六摄 / 最高可选8GB+256GB大存储 / 4500mAh+30W快充 / 3D四曲面玻璃机身 / 多功能NFC', 'public/imgs/books/Redmi-k30-5G.png', 2599, 2599, 10, 0);
INSERT INTO `product` VALUES (3, '小米CC9 Pro', 1, '1亿像素,五摄四闪', '1亿像素主摄 / 全场景五摄像头 / 四闪光灯 / 3200万自拍 / 10 倍混合光学变焦，50倍数字变焦 / 5260mAh ⼤电量 / 标配 30W疾速快充 / ⼩米⾸款超薄屏下指纹 / 德国莱茵低蓝光认证 / 多功能NFC / 红外万能遥控 / 1216超线性扬声器', 'public/imgs/books/Mi-CC9.png', 2799, 2599, 20, 0);
INSERT INTO `product` VALUES (4, 'Redmi 8', 1, '5000mAh超长续航', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB', 'public/imgs/books/Redmi-8.png', 799, 699, 20, 0);
INSERT INTO `product` VALUES (5, 'Redmi 8A', 1, '5000mAh超长续航', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB / 1200万AI后置相机', 'public/imgs/books/Redmi-8A.png', 599, 699, 20, 0);
INSERT INTO `product` VALUES (6, 'Redmi Note8 Pro', 1, '6400万全场景四摄', '6400万四摄小金刚拍照新旗舰超强解析力，超震撼', 'public/imgs/books/Redmi-Note8-pro.png', 1399, 1199, 20, 0);
INSERT INTO `product` VALUES (7, 'Redmi Note8', 1, '千元4800万四摄', '千元4800万四摄 | 高通骁龙665 | 小金刚品质保证', 'public/imgs/books/Redmi-Note8.png', 999, 999, 20, 0);
INSERT INTO `product` VALUES (8, 'Redmi 7A', 1, '小巧大电量 持久流畅', '小巧大电量，持久又流畅骁龙8核高性能处理器 | 4000mAh超长续航 | AI人脸解锁 | 整机防泼溅', 'public/imgs/books/Redmi-7A.png', 599, 539, 20, 0);
INSERT INTO `product` VALUES (9, '小米电视4A 32英寸', 2, '人工智能系统，高清液晶屏', '小米电视4A 32英寸 | 64位四核处理器 | 1GB+4GB大内存 | 人工智能系统', 'public/imgs/appliance/MiTv-4A-32.png', 799, 799, 10, 2);
INSERT INTO `product` VALUES (10, '小米全面屏电视E55A', 2, '全面屏设计，人工智能语音', '全面屏设计 | 内置小爱同学 | 4K + HDR | 杜比DTS | PatchWall | 海量内容 | 2GB + 8GB大存储 | 64位四核处理器', 'public/imgs/appliance/MiTv-E55A.png', 2099, 1899, 10, 0);
INSERT INTO `product` VALUES (11, '小米全面屏电视E65A', 2, '全面屏设计，人工智能语音', '人工智能语音系统 | 海量影视内容 | 4K 超高清屏 | 杜比音效 | 64位四核处理器 | 2GB + 8GB大存储', 'public/imgs/appliance/MiTv-E65A.png', 3999, 2799, 10, 0);
INSERT INTO `product` VALUES (12, '小米电视4X 43英寸', 2, 'FHD全高清屏，人工智能语音', '人工智能语音系统 | FHD全高清屏 | 64位四核处理器 | 海量片源 | 1GB+8GB大内存 | 钢琴烤漆', 'public/imgs/appliance/MiTv-4X-43.png', 1499, 1299, 10, 0);
INSERT INTO `product` VALUES (13, '小米电视4C 55英寸', 2, '4K HDR，人工智能系统', '人工智能 | 大内存 | 杜比音效 | 超窄边 | 4K HDR | 海量片源 | 纤薄机身| 钢琴烤漆', 'public/imgs/appliance/MiTv-4C-55.png', 1999, 1799, 10, 0);
INSERT INTO `product` VALUES (14, '小米电视4A 65英寸', 2, '4K HDR，人工智能系统', '人工智能 | 大内存 | 杜比音效 | 超窄边 | 4K HDR | 海量片源 | 纤薄机身| 钢琴烤漆', 'public/imgs/appliance/MiTv-4A-65.png', 2999, 2799, 10, 0);
INSERT INTO `product` VALUES (15, '小米壁画电视 65英寸', 2, '壁画外观，全面屏，远场语音', '纯平背板 | 通体13.9mm | 远场语音 | 4K+HDR | 杜比+DTS | 画框模式 | 内置小爱同学 | PatchWall | SoundBar+低音炮 | 四核处理器+大存储', 'public/imgs/appliance/MiTv-ArtTv-65.png', 6999, 6999, 10, 0);
INSERT INTO `product` VALUES (16, '米家互联网空调C1（一级能效）', 3, '变频节能省电，自清洁', '一级能效 | 1.5匹 | 全直流变频 | 高效制冷/热 | 静音设计 | 自清洁 | 全屋互联', 'public/imgs/appliance/AirCondition-V1C1.png', 2699, 2599, 20, 10);
INSERT INTO `product` VALUES (17, '米家空调', 3, '出众静音，快速制冷热', '大1匹 | 三级能效 | 静音 | 快速制冷热 | 广角送风 | 除湿功能 | 高密度过滤网 | 典雅外观', 'public/imgs/appliance/AirCondition-F3W1.png', 1799, 1699, 20, 8);
INSERT INTO `product` VALUES (18, '米家互联网洗烘一体机 Pro 10kg', 4, '智能洗烘，省心省力', '国标双A+级洗烘能力 / 22种洗烘模式 / 智能投放洗涤剂 / 支持小爱同学语音遥控 / 支持OTA在线智能升级 / 智能空气洗 / 除菌率达99.9%+', 'public/imgs/appliance/Washer-Pro-10.png', 2999, 2999, 20, 7);
INSERT INTO `product` VALUES (19, 'Redmi K20/ K20 Pro 怪力魔王保护壳', 5, '怪力魔王专属定制', '优选PC材料，强韧张力，经久耐用 / 精选开孔，全面贴合机身 / 手感轻薄细腻，舒适无负担 / 三款颜色可选，彰显个性，与众不同', 'public/imgs/accessory/protectingShell-RedMi-K20&pro.png', 39, 39, 20, 10);
INSERT INTO `product` VALUES (20, '小米9 ARE U OK保护壳', 5, '一个与众不同的保护壳', '彰显独特个性 / 轻薄无负担 / 优选PC材料 / 贴合机身 / 潮流五色', 'public/imgs/accessory/protectingShell-Mi-9.png', 49, 39, 20, 10);
INSERT INTO `product` VALUES (21, '小米CC9&小米CC9美图定制版 标准高透贴膜', 6, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', 'public/imgs/accessory/protectingMen-Mi-CC9.png', 19, 19, 20, 9);
INSERT INTO `product` VALUES (22, '小米CC9e 标准高透贴膜', 6, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', 'public/imgs/accessory/protectingMen-Mi-CC9e.png', 19, 19, 20, 9);
INSERT INTO `product` VALUES (23, '小米USB充电器30W快充版（1A1C）', 7, '多一种接口，多一种选择', '双口输出 / 30W 输出 / 可折叠插脚 / 小巧便携', 'public/imgs/accessory/charger-30w.png', 59, 59, 20, 8);
INSERT INTO `product` VALUES (24, '小米USB充电器快充版（18W）', 7, '安卓、苹果设备均可使用', '支持QC3.0设备充电 / 支持iOS设备充电/ 美观耐用', 'public/imgs/accessory/charger-18w.png', 29, 29, 20, 8);
INSERT INTO `product` VALUES (25, '小米USB充电器60W快充版（6口）', 7, '6口输出，USB-C输出接口', '6口输出 / USB-C输出接口 / 支持QC3.0快充协议 / 总输出功率60W', 'public/imgs/accessory/charger-60w.png', 129, 129, 20, 0);
INSERT INTO `product` VALUES (26, '小米USB充电器36W快充版（2口）', 7, '6多重安全保护，小巧便携', '双USB输出接口 / 支持QC3.0快充协议 / 多重安全保护 / 小巧便携', 'public/imgs/accessory/charger-36w.png', 59, 59, 20, 0);
INSERT INTO `product` VALUES (27, '小米车载充电器快充版', 7, '让爱车成为移动充电站', 'QC3.0 双口输出 / 智能温度控制 / 5重安全保护 / 兼容iOS&Android设备', 'public/imgs/accessory/charger-car.png', 69, 69, 20, 0);
INSERT INTO `product` VALUES (28, '小米车载充电器快充版(37W)', 7, '双口快充，车载充电更安全', '单口27W 快充 / 双口输出 / 多重安全保护', 'public/imgs/accessory/charger-car-37w.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (29, '小米二合一移动电源（充电器）', 7, '一个设备多种用途', '5000mAh充沛电量 / 多协议快充 / USB 口输出', 'public/imgs/accessory/charger-tio.png', 99, 99, 20, 0);
INSERT INTO `product` VALUES (30, '小米无线充电宝青春版10000mAh', 8, '能量满满，无线有线都能充', '10000mAh大容量 / 支持边充边放 / 有线无线都能充 / 双向快充', 'public/imgs/accessory/charger-10000mAh.png', 129, 129, 20, 8);
INSERT INTO `product` VALUES (31, '小米CC9 Pro/尊享版 撞色飘带保护壳', 5, '全面贴合，无感更舒适', '优选环保PC材质，强韧张力，全面贴合，无感更舒适', 'public/imgs/accessory/protectingShell-Mi-CC9Pro.png', 69, 69, 20, 0);
INSERT INTO `product` VALUES (32, 'Redmi K20系列 幻境之心保护壳', 5, '柔软坚韧,全面贴合', '优质环保材质，柔软坚韧 / 全面贴合，有效抵抗灰尘 / 鲜亮三种颜色可选，为爱机随时换装', 'public/imgs/accessory/protectingShell-RedMi-K20.png', 39, 39, 20, 0);
INSERT INTO `product` VALUES (33, '小米9 SE 街头风保护壳黑色', 5, '个性时尚,细节出众', '个性时尚 / 细节出众 / 纤薄轻巧 / 多彩时尚', 'public/imgs/accessory/protectingShell-Mi-9SE.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (34, '小米9 街头风保护壳 红色', 5, '个性时尚,细节出众', '时尚多彩 / 细节出众 / 纤薄轻巧 / 是腕带也是支架', 'public/imgs/accessory/protectingShell-Mi-9-red.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (35, '小米MIX 3 极简保护壳蓝色', 5, '时尚简约设计，手感细腻顺滑', '时尚简约设计，手感细腻顺滑 / 优质环保PC原材料，强韧张力，经久耐用 / 超薄 0.8MM厚度', 'public/imgs/accessory/protectingShell-Mix-3.png', 49, 12.9, 20, 0);

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_picture
-- ----------------------------
INSERT INTO `product_picture` VALUES (1, 1, 'public/imgs/books/picture/Redmi-k30-1.png', NULL);
INSERT INTO `product_picture` VALUES (2, 1, 'public/imgs/books/picture/Redmi-k30-2.png', NULL);
INSERT INTO `product_picture` VALUES (3, 1, 'public/imgs/books/picture/Redmi-k30-3.png', NULL);
INSERT INTO `product_picture` VALUES (4, 1, 'public/imgs/books/picture/Redmi-k30-4.png', NULL);
INSERT INTO `product_picture` VALUES (5, 1, 'public/imgs/books/picture/Redmi-k30-5.png', NULL);
INSERT INTO `product_picture` VALUES (6, 2, 'public/imgs/books/picture/Redmi K30 5G-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (7, 2, 'public/imgs/books/picture/Redmi K30 5G-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (8, 2, 'public/imgs/books/picture/Redmi K30 5G-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (9, 2, 'public/imgs/books/picture/Redmi K30 5G-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (10, 2, 'public/imgs/books/picture/Redmi K30 5G-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (11, 3, 'public/imgs/books/picture/MI CC9 Pro-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (12, 3, 'public/imgs/books/picture/MI CC9 Pro-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (13, 3, 'public/imgs/books/picture/MI CC9 Pro-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (14, 3, 'public/imgs/books/picture/MI CC9 Pro-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (15, 3, 'public/imgs/books/picture/MI CC9 Pro-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (16, 3, 'public/imgs/books/picture/MI CC9 Pro-6.jpg', NULL);
INSERT INTO `product_picture` VALUES (17, 4, 'public/imgs/books/picture/Redmi 8-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (18, 4, 'public/imgs/books/picture/Redmi 8-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (19, 4, 'public/imgs/books/picture/Redmi 8-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (20, 4, 'public/imgs/books/picture/Redmi 8-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (21, 4, 'public/imgs/books/picture/Redmi 8-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (22, 5, 'public/imgs/books/picture/Redmi 8A-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (23, 6, 'public/imgs/books/picture/Redmi Note8 Pro-1.png', NULL);
INSERT INTO `product_picture` VALUES (24, 6, 'public/imgs/books/picture/Redmi Note8 Pro-2.png', NULL);
INSERT INTO `product_picture` VALUES (25, 6, 'public/imgs/books/picture/Redmi Note8 Pro-3.png', NULL);
INSERT INTO `product_picture` VALUES (26, 6, 'public/imgs/books/picture/Redmi Note8 Pro-4.png', NULL);
INSERT INTO `product_picture` VALUES (27, 6, 'public/imgs/books/picture/Redmi Note8 Pro-5.png', NULL);
INSERT INTO `product_picture` VALUES (28, 7, 'public/imgs/books/picture/Redmi Note8-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (29, 7, 'public/imgs/books/picture/Redmi Note8-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (30, 7, 'public/imgs/books/picture/Redmi Note8-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (31, 7, 'public/imgs/books/picture/Redmi Note8-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (32, 7, 'public/imgs/books/picture/Redmi Note8-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (33, 8, 'public/imgs/books/picture/Redmi 7A-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (34, 8, 'public/imgs/books/picture/Redmi 7A-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (35, 8, 'public/imgs/books/picture/Redmi 7A-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (36, 8, 'public/imgs/books/picture/Redmi 7A-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (37, 8, 'public/imgs/books/picture/Redmi 7A-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (38, 9, 'public/imgs/books/picture/MiTv-4A-32-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (39, 9, 'public/imgs/books/picture/MiTv-4A-32-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (40, 9, 'public/imgs/books/picture/MiTv-4A-32-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (41, 9, 'public/imgs/books/picture/MiTv-4A-32-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (42, 10, 'public/imgs/books/picture/MiTv-E55A-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (43, 10, 'public/imgs/books/picture/MiTv-E55A-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (44, 10, 'public/imgs/books/picture/MiTv-E55A-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (45, 10, 'public/imgs/books/picture/MiTv-E55A-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (46, 11, 'public/imgs/books/picture/MiTv-E65A-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (47, 11, 'public/imgs/books/picture/MiTv-E65A-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (48, 11, 'public/imgs/books/picture/MiTv-E65A-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (49, 11, 'public/imgs/books/picture/MiTv-E65A-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (50, 12, 'public/imgs/books/picture/MiTv-4X 43-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (51, 12, 'public/imgs/books/picture/MiTv-4X 43-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (52, 12, 'public/imgs/books/picture/MiTv-4X 43-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (53, 13, 'public/imgs/books/picture/MiTv-4C 55-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (54, 13, 'public/imgs/books/picture/MiTv-4C 55-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (55, 13, 'public/imgs/books/picture/MiTv-4C 55-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (56, 14, 'public/imgs/books/picture/MiTv-4A 65-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (57, 15, 'public/imgs/books/picture/MiTv-ArtTv-65-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (58, 16, 'public/imgs/books/picture/AirCondition-V1C1-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (59, 17, 'public/imgs/books/picture/AirCondition-F3W1-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (60, 18, 'public/imgs/books/picture/Washer-Pro-10-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (61, 18, 'public/imgs/books/picture/Washer-Pro-10-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (62, 18, 'public/imgs/books/picture/Washer-Pro-10-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (63, 18, 'public/imgs/books/picture/Washer-Pro-10-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (64, 19, 'public/imgs/books/picture/protectingShell-RedMi-K20&pro-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (65, 20, 'public/imgs/books/picture/protectingShell-Mi-9-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (66, 20, 'public/imgs/books/picture/protectingShell-Mi-9-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (67, 21, 'public/imgs/books/picture/protectingMen-Mi-CC9-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (68, 22, 'public/imgs/books/picture/protectingMen-Mi-CC9e-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (69, 23, 'public/imgs/books/picture/charger-30w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (70, 23, 'public/imgs/books/picture/charger-30w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (71, 23, 'public/imgs/books/picture/charger-30w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (72, 23, 'public/imgs/books/picture/charger-30w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (73, 24, 'public/imgs/books/picture/charger-18w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (74, 24, 'public/imgs/books/picture/charger-18w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (75, 24, 'public/imgs/books/picture/charger-18w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (76, 25, 'public/imgs/books/picture/charger-60w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (77, 25, 'public/imgs/books/picture/charger-60w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (78, 25, 'public/imgs/books/picture/charger-60w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (79, 25, 'public/imgs/books/picture/charger-60w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (80, 26, 'public/imgs/books/picture/charger-36w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (81, 26, 'public/imgs/books/picture/charger-36w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (82, 26, 'public/imgs/books/picture/charger-36w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (83, 26, 'public/imgs/books/picture/charger-36w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (84, 26, 'public/imgs/books/picture/charger-36w-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (85, 27, 'public/imgs/books/picture/charger-car-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (86, 27, 'public/imgs/books/picture/charger-car-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (87, 27, 'public/imgs/books/picture/charger-car-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (88, 27, 'public/imgs/books/picture/charger-car-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (89, 27, 'public/imgs/books/picture/charger-car-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (90, 27, 'public/imgs/books/picture/charger-car-6.jpg', NULL);
INSERT INTO `product_picture` VALUES (91, 28, 'public/imgs/books/picture/charger-car-37w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (92, 28, 'public/imgs/books/picture/charger-car-37w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (93, 28, 'public/imgs/books/picture/charger-car-37w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (94, 28, 'public/imgs/books/picture/charger-car-37w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (95, 28, 'public/imgs/books/picture/charger-car-37w-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (96, 29, 'public/imgs/books/picture/charger-tio-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (97, 29, 'public/imgs/books/picture/charger-tio-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (98, 29, 'public/imgs/books/picture/charger-tio-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (99, 29, 'public/imgs/books/picture/charger-tio-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (100, 29, 'public/imgs/books/picture/charger-tio-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (101, 30, 'public/imgs/books/picture/charger-10000mAh-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (102, 30, 'public/imgs/books/picture/charger-10000mAh-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (103, 30, 'public/imgs/books/picture/charger-10000mAh-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (104, 30, 'public/imgs/books/picture/charger-10000mAh-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (105, 30, 'public/imgs/books/picture/charger-10000mAh-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (106, 31, 'public/imgs/books/picture/protectingShell-Mi-CC9Pro-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (107, 32, 'public/imgs/books/picture/protectingShell-RedMi-K20-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (108, 33, 'public/imgs/books/picture/protectingShell-Mi-9SE-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (109, 34, 'public/imgs/books/picture/protectingShell-Mi-9-red-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (110, 35, 'public/imgs/books/picture/protectingShell-Mix-3-1.jpg', NULL);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_user_id`(`user_id`) USING BTREE,
  INDEX `FK_shoppingCart_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES (1, 3, 2, 1);
INSERT INTO `shoppingcart` VALUES (3, 101, 22, 1);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2020-10-26 12:06:01', 'admin', '2020-10-27 13:56:03', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-10-26 12:06:01', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-10-26 12:06:01', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, '手机', '0', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:35:04', 'admin', '2020-10-27 14:35:26', NULL);
INSERT INTO `sys_dict_data` VALUES (30, 2, '电视机', '1', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:36:04', 'admin', '2020-10-27 14:36:18', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 3, '空调', '2', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:36:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 4, '洗衣机', '3', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:37:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 5, '保护套', '4', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:37:39', 'admin', '2020-10-27 14:37:48', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 6, '保护膜', '5', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:38:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 7, '充电器', '6', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:38:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 8, '充电宝', '7', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:38:28', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '1', 'admin', '2020-10-26 12:06:01', 'admin', '2020-10-27 14:29:50', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '1', 'admin', '2020-10-26 12:06:01', 'admin', '2020-10-27 14:29:56', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '商品类型', 'web_category_type', '0', 'admin', '2020-10-27 14:31:16', '', NULL, 'web前端的商品类型');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2020-10-26 12:06:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-12 19:36:13');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '商品管理', 0, 2, 'system', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2020-10-26 12:06:01', 'admin', '2020-11-12 16:46:03', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 4, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2020-10-26 12:06:01', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1104, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2020-10-26 12:06:01', 'admin', '2020-11-09 20:22:32', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '1', 'system:menu:list', 'tree-table', 'admin', '2020-10-26 12:06:01', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1103, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2020-10-26 12:06:01', 'admin', '2020-11-09 20:20:26', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1103, 9, 'log', 'system/log/index', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2020-10-26 12:06:01', 'admin', '2020-11-09 20:20:37', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2020-10-26 12:06:01', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2020-10-26 12:06:01', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2020-10-26 12:06:01', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2020-10-26 12:06:01', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1079, '商品管理', 1, 2, 'productTool', 'system/productTool/index', 1, 0, 'C', '0', '0', 'system:productTool:list', 'lock', 'admin', '2020-10-27 15:14:01', 'admin', '2020-10-27 15:18:01', '商品管理菜单');
INSERT INTO `sys_menu` VALUES (1080, '商品管理查询', 1079, 1, '#', '', 1, 0, 'F', '0', '0', 'system:productTool:query', '#', 'admin', '2020-10-27 15:14:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1081, '商品管理新增', 1079, 2, '#', '', 1, 0, 'F', '0', '0', 'system:productTool:add', '#', 'admin', '2020-10-27 15:14:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1082, '商品管理修改', 1079, 3, '#', '', 1, 0, 'F', '0', '0', 'system:productTool:edit', '#', 'admin', '2020-10-27 15:14:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '商品管理删除', 1079, 4, '#', '', 1, 0, 'F', '0', '0', 'system:productTool:remove', '#', 'admin', '2020-10-27 15:14:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, '商品管理导出', 1079, 5, '#', '', 1, 0, 'F', '0', '0', 'system:productTool:export', '#', 'admin', '2020-10-27 15:14:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1085, '轮播图片管理', 1105, 3, 'carousel', 'system/carousel/index', 1, 0, 'C', '0', '0', 'system:carousel:list', 'skill', 'admin', '2020-11-02 19:35:32', 'admin', '2020-11-09 20:25:22', '轮播图片管理菜单');
INSERT INTO `sys_menu` VALUES (1086, '轮播图片管理查询', 1085, 1, '#', '', 1, 0, 'F', '0', '0', 'system:carousel:query', '#', 'admin', '2020-11-02 19:35:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1087, '轮播图片管理新增', 1085, 2, '#', '', 1, 0, 'F', '0', '0', 'system:carousel:add', '#', 'admin', '2020-11-02 19:35:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1088, '轮播图片管理修改', 1085, 3, '#', '', 1, 0, 'F', '0', '0', 'system:carousel:edit', '#', 'admin', '2020-11-02 19:35:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1089, '轮播图片管理删除', 1085, 4, '#', '', 1, 0, 'F', '0', '0', 'system:carousel:remove', '#', 'admin', '2020-11-02 19:35:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1090, '轮播图片管理导出', 1085, 5, '#', '', 1, 0, 'F', '0', '0', 'system:carousel:export', '#', 'admin', '2020-11-02 19:35:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1097, '产品详细管理', 1105, 3, 'picture', 'system/picture/index', 1, 0, 'C', '0', '0', 'system:picture:list', 'form', 'admin', '2020-11-02 19:35:42', 'admin', '2020-11-09 20:25:30', '产品详细管理菜单');
INSERT INTO `sys_menu` VALUES (1098, '产品详细管理查询', 1097, 1, '#', '', 1, 0, 'F', '0', '0', 'system:picture:query', '#', 'admin', '2020-11-02 19:35:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1099, '产品详细管理新增', 1097, 2, '#', '', 1, 0, 'F', '0', '0', 'system:picture:add', '#', 'admin', '2020-11-02 19:35:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1100, '产品详细管理修改', 1097, 3, '#', '', 1, 0, 'F', '0', '0', 'system:picture:edit', '#', 'admin', '2020-11-02 19:35:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1101, '产品详细管理删除', 1097, 4, '#', '', 1, 0, 'F', '0', '0', 'system:picture:remove', '#', 'admin', '2020-11-02 19:35:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1102, '产品详细管理导出', 1097, 5, '#', '', 1, 0, 'F', '0', '0', 'system:picture:export', '#', 'admin', '2020-11-02 19:35:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1103, '参数日志管理', 0, 4, 'shop', NULL, 1, 0, 'M', '0', '0', '', 'build', 'admin', '2020-11-09 20:18:28', 'admin', '2020-11-09 20:24:27', '');
INSERT INTO `sys_menu` VALUES (1104, '角色管理', 0, 1, 'userds', NULL, 1, 0, 'M', '0', '0', '', 'people', 'admin', '2020-11-09 20:22:12', 'admin', '2020-11-09 20:24:33', '');
INSERT INTO `sys_menu` VALUES (1105, '图片管理', 0, 3, 'pict', NULL, 1, 0, 'M', '0', '0', '', 'clipboard', 'admin', '2020-11-09 20:25:08', 'admin', '2020-11-09 20:26:15', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2020-10-26 12:06:01', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2020-10-26 12:06:01', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 277 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"wo123\"}', '{\"msg\":\"新增用户\'wo123\'失败，登录账号已存在\",\"code\":1}', 0, NULL, '2020-10-26 18:52:12');
INSERT INTO `sys_oper_log` VALUES (101, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"wor123\"}', '{\"msg\":\"新增用户\'wor123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 18:57:42');
INSERT INTO `sys_oper_log` VALUES (102, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"wo123\"}', '{\"msg\":\"新增用户\'wo123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 18:58:14');
INSERT INTO `sys_oper_log` VALUES (103, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"wo123\"}', '{\"msg\":\"新增用户\'wo123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 19:05:36');
INSERT INTO `sys_oper_log` VALUES (104, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"da123\"}', '{\"msg\":\"新增用户\'da123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 20:00:09');
INSERT INTO `sys_oper_log` VALUES (105, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"da123\"}', '{\"msg\":\"新增用户\'da123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 20:00:09');
INSERT INTO `sys_oper_log` VALUES (106, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"da123\"}', '{\"msg\":\"新增用户\'da123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 20:01:38');
INSERT INTO `sys_oper_log` VALUES (107, '注册用户', 0, 'com.ruoyi.web.controller.system.SysLoginController.register()', 'POST', 1, NULL, NULL, '/users/register', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"and123\",\"params\":{},\"userName\":\"da123\"}', 'null', 1, '获取用户账户异常', '2020-10-26 20:01:38');
INSERT INTO `sys_oper_log` VALUES (108, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"da123\"}', '{\"msg\":\"新增用户\'da123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 20:04:24');
INSERT INTO `sys_oper_log` VALUES (109, '注册用户', 0, 'com.ruoyi.web.controller.system.SysLoginController.register()', 'POST', 1, NULL, NULL, '/users/register', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"and123\",\"params\":{},\"userName\":\"da123\"}', 'null', 1, '获取用户账户异常', '2020-10-26 20:04:43');
INSERT INTO `sys_oper_log` VALUES (110, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"da123\"}', '{\"msg\":\"新增用户\'da123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 20:05:37');
INSERT INTO `sys_oper_log` VALUES (111, '注册用户', 0, 'com.ruoyi.web.controller.system.SysLoginController.register()', 'POST', 1, NULL, NULL, '/users/register', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$/L/Ru2HbKPBI/k2Zzrg1J.fLIzYF03W0u7mz5jvQecSOUal7j68ou\",\"params\":{},\"userName\":\"da123\",\"createBy\":\"store用户\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\store(1)\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,                                     password,             create_by,            create_time    )values(                  ?,                                     ?,             ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value', '2020-10-26 20:05:40');
INSERT INTO `sys_oper_log` VALUES (112, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"da123\"}', '{\"msg\":\"新增用户\'da123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 20:08:53');
INSERT INTO `sys_oper_log` VALUES (113, '注册用户', 0, 'com.ruoyi.web.controller.system.SysLoginController.register()', 'POST', 1, NULL, NULL, '/users/register', '127.0.0.1', '内网IP', '{\"phonenumber\":\"1\",\"admin\":false,\"password\":\"$2a$10$axWRe6.dMos5KN8Is1Kpv.QRm9mBVi7tLgnBfSZUAwlKH0WjGujvO\",\"email\":\"qq\",\"params\":{},\"userName\":\"da123\",\"createBy\":\"store用户\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\admin\\Desktop\\store(1)\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                  user_name,             email,             phonenumber,             password,             create_by,            create_time    )values(                  ?,             ?,             ?,             ?,             ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value', '2020-10-26 20:08:56');
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15203446311\",\"admin\":false,\"password\":\"$2a$10$3xvVdkjl3YXUnbbnmZzU4.wYoHN/x4ITqtMzaAPxg9H3Pg6nQW.d2\",\"postIds\":[4],\"email\":\"28118313814@qq.com\",\"nickName\":\"测试用户\",\"sex\":\"0\",\"deptId\":108,\"params\":{},\"userName\":\"测试用户\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-26 20:40:07');
INSERT INTO `sys_oper_log` VALUES (115, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"新增用户\'weoc123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 20:49:42');
INSERT INTO `sys_oper_log` VALUES (116, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"新增用户\'weoc123\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-26 20:50:08');
INSERT INTO `sys_oper_log` VALUES (117, '注册用户', 0, 'com.ruoyi.web.controller.system.SysLoginController.register()', 'POST', 1, NULL, NULL, '/users/register', '127.0.0.1', '内网IP', '{\"phonenumber\":\"12345\",\"admin\":false,\"password\":\"$2a$10$arAzAuiqY7RwSO0WhYQjxOzMe3Vp6RhiWAe6qAk6ZtzRKDRjqo2mW\",\"postIds\":[4],\"email\":\"qq@qq.com\",\"nickName\":\"weoc123\",\"sex\":\"0\",\"deptId\":108,\"params\":{},\"userName\":\"weoc123\",\"userId\":101,\"createBy\":\"store用户\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":\"001\"}', 0, NULL, '2020-10-26 20:50:08');
INSERT INTO `sys_oper_log` VALUES (118, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"login123\",\"params\":{},\"userName\":\"login\"}', '{\"msg\":\"新增用户\'login\'不存在，可以注册\",\"code\":\"001\"}', 0, NULL, '2020-10-27 10:19:25');
INSERT INTO `sys_oper_log` VALUES (119, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"woc123\",\"params\":{},\"userName\":\"woc123\"}', '{\"code\":\"用户\'woc123\'不存在\"}', 0, NULL, '2020-10-27 10:27:57');
INSERT INTO `sys_oper_log` VALUES (120, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"woc123\",\"params\":{},\"userName\":\"woc123\"}', '{\"msg\":\"用户\'woc123\'不存在\",\"code\":\"001\"}', 0, NULL, '2020-10-27 10:29:54');
INSERT INTO `sys_oper_log` VALUES (121, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"woc123\",\"params\":{},\"userName\":\"woc123\"}', '{\"msg\":\"用户\'woc123\'不存在\",\"code\":\"001\"}', 0, NULL, '2020-10-27 10:31:04');
INSERT INTO `sys_oper_log` VALUES (122, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"woc123\",\"params\":{},\"userName\":\"woc123\"}', '{\"msg\":\"用户\'woc123\'不存在\",\"code\":\"004\"}', 0, NULL, '2020-10-27 10:31:44');
INSERT INTO `sys_oper_log` VALUES (123, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"新增用户\'weoc123\'登录成功\",\"code\":\"001\",\"data\":{\"admin\":false,\"avatar\":\"\",\"createBy\":\"store用户\",\"createTime\":1603716608000,\"delFlag\":\"0\",\"dept\":{\"children\":[],\"deptId\":108,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":\"1\",\"params\":{},\"parentId\":102,\"status\":\"0\"},\"deptId\":108,\"email\":\"qq@qq.com\",\"loginIp\":\"\",\"nickName\":\"weoc123\",\"params\":{},\"password\":\"$2a$10$arAzAuiqY7RwSO0WhYQjxOzMe3Vp6RhiWAe6qAk6ZtzRKDRjqo2mW\",\"phonenumber\":\"12345\",\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-10-27 10:32:15');
INSERT INTO `sys_oper_log` VALUES (124, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"woc123\",\"params\":{},\"userName\":\"woc123\"}', '{\"msg\":\"用户\'woc123\'不存在\",\"code\":\"004\"}', 0, NULL, '2020-10-27 10:34:52');
INSERT INTO `sys_oper_log` VALUES (125, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登录成功\",\"code\":\"001\",\"com.ruoyi.common.core.domain.entity.SysUser\":{\"admin\":false,\"avatar\":\"\",\"createBy\":\"store用户\",\"createTime\":1603716608000,\"delFlag\":\"0\",\"dept\":{\"children\":[],\"deptId\":108,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":\"1\",\"params\":{},\"parentId\":102,\"status\":\"0\"},\"deptId\":108,\"email\":\"qq@qq.com\",\"loginIp\":\"\",\"nickName\":\"weoc123\",\"params\":{},\"password\":\"$2a$10$arAzAuiqY7RwSO0WhYQjxOzMe3Vp6RhiWAe6qAk6ZtzRKDRjqo2mW\",\"phonenumber\":\"12345\",\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-10-27 10:35:22');
INSERT INTO `sys_oper_log` VALUES (126, '检查用户是否已经存在', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登录成功\",\"code\":\"001\",\"SysUser\":{\"admin\":false,\"avatar\":\"\",\"createBy\":\"store用户\",\"createTime\":1603716608000,\"delFlag\":\"0\",\"dept\":{\"children\":[],\"deptId\":108,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":\"1\",\"params\":{},\"parentId\":102,\"status\":\"0\"},\"deptId\":108,\"email\":\"qq@qq.com\",\"loginIp\":\"\",\"nickName\":\"weoc123\",\"params\":{},\"password\":\"$2a$10$arAzAuiqY7RwSO0WhYQjxOzMe3Vp6RhiWAe6qAk6ZtzRKDRjqo2mW\",\"phonenumber\":\"12345\",\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-10-27 10:36:04');
INSERT INTO `sys_oper_log` VALUES (127, '', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"user\",\"code\":\"001\",\"StoreResult\":{\"msg\":\"操作成功\",\"password\":\"$2a$10$arAzAuiqY7RwSO0WhYQjxOzMe3Vp6RhiWAe6qAk6ZtzRKDRjqo2mW\",\"code\":\"001\",\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-10-27 11:04:30');
INSERT INTO `sys_oper_log` VALUES (128, '', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123登录成功\",\"code\":\"001\",\"StoreResult\":{\"msg\":\"操作成功\",\"password\":\"$2a$10$arAzAuiqY7RwSO0WhYQjxOzMe3Vp6RhiWAe6qAk6ZtzRKDRjqo2mW\",\"code\":\"001\",\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-10-27 11:17:10');
INSERT INTO `sys_oper_log` VALUES (129, '', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"woc123\",\"params\":{},\"userName\":\"woc123\"}', '{\"msg\":\"用户\'woc123\'不存在\",\"code\":\"004\"}', 0, NULL, '2020-10-27 11:50:53');
INSERT INTO `sys_oper_log` VALUES (130, '', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'用户名或密码错误！\",\"code\":\"001\",\"user\":{\"password\":\"$2a$10$arAzAuiqY7RwSO0WhYQjxOzMe3Vp6RhiWAe6qAk6ZtzRKDRjqo2mW\",\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-10-27 11:51:09');
INSERT INTO `sys_oper_log` VALUES (131, '', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'用户名或密码错误！\",\"code\":\"004\"}', 0, NULL, '2020-10-27 11:53:39');
INSERT INTO `sys_oper_log` VALUES (132, '', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'用户名或密码错误！\",\"code\":\"004\"}', 0, NULL, '2020-10-27 11:53:52');
INSERT INTO `sys_oper_log` VALUES (133, '', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'用户名或密码错误！\",\"code\":\"004\"}', 0, NULL, '2020-10-27 11:54:04');
INSERT INTO `sys_oper_log` VALUES (134, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$l7bPffPjMDQ0t2JSySq3AOfaM04RieOUAMwUoj36sGlDiwuEmakIe\",\"updateBy\":\"admin\",\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 11:54:33');
INSERT INTO `sys_oper_log` VALUES (135, '', 0, 'com.ruoyi.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-10-27 11:54:38');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-10-27 11:58:45');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-10-27 11:58:49');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-10-27 11:58:51');
INSERT INTO `sys_oper_log` VALUES (139, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1603685161000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,2,3,100,1001,1002,1003,1004,1005,1006,1007,102,1013,1014,1015,1016,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,108,500,1040,1041,1042,501,1043,1044,1045,109,1046,1047,1048,112,113,114,1055,1056,1058,1057,1059,1060],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:02:22');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-10-27 12:02:29');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:02:31');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1050', '127.0.0.1', '内网IP', '{menuId=1050}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:02:34');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1051', '127.0.0.1', '内网IP', '{menuId=1051}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:02:37');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1052', '127.0.0.1', '内网IP', '{menuId=1052}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:02:38');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1053', '127.0.0.1', '内网IP', '{menuId=1053}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:02:40');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1054', '127.0.0.1', '内网IP', '{menuId=1054}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:02:49');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:02:54');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/111', '127.0.0.1', '内网IP', '{menuId=111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:02:57');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:03:00');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:03:03');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/103', '127.0.0.1', '内网IP', '{menuId=103}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-10-27 12:03:45');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1017', '127.0.0.1', '内网IP', '{menuId=1017}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:03:49');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1018', '127.0.0.1', '内网IP', '{menuId=1018}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:03:50');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1019', '127.0.0.1', '内网IP', '{menuId=1019}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:03:52');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1020', '127.0.0.1', '内网IP', '{menuId=1020}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:03:54');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/103', '127.0.0.1', '内网IP', '{menuId=103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:03:56');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1021', '127.0.0.1', '内网IP', '{menuId=1021}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:01');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1022', '127.0.0.1', '内网IP', '{menuId=1022}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:03');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1023', '127.0.0.1', '内网IP', '{menuId=1023}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:05');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1024', '127.0.0.1', '内网IP', '{menuId=1024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:06');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1025', '127.0.0.1', '内网IP', '{menuId=1025}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:08');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/104', '127.0.0.1', '内网IP', '{menuId=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:10');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1036', '127.0.0.1', '内网IP', '{menuId=1036}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:24');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1037', '127.0.0.1', '内网IP', '{menuId=1037}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:25');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1038', '127.0.0.1', '内网IP', '{menuId=1038}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:27');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1039', '127.0.0.1', '内网IP', '{menuId=1039}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:29');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/107', '127.0.0.1', '内网IP', '{menuId=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:31');
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1008', '127.0.0.1', '内网IP', '{menuId=1008}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:36');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1009', '127.0.0.1', '内网IP', '{menuId=1009}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:38');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1010', '127.0.0.1', '内网IP', '{menuId=1010}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:39');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1011', '127.0.0.1', '内网IP', '{menuId=1011}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:41');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1012', '127.0.0.1', '内网IP', '{menuId=1012}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:43');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/101', '127.0.0.1', '内网IP', '{menuId=101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 12:04:44');
INSERT INTO `sys_oper_log` VALUES (174, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"主框架页-默认皮肤样式名称\",\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"configType\":\"Y\",\"configValue\":\"skin-green\",\"params\":{},\"configKey\":\"sys.index.skinName\",\"createBy\":\"admin\",\"createTime\":1603685161000,\"updateBy\":\"admin\",\"configId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 13:56:03');
INSERT INTO `sys_oper_log` VALUES (175, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\"任务状态列表\",\"dictId\":4,\"params\":{},\"dictType\":\"sys_job_status\",\"createBy\":\"admin\",\"createTime\":1603685161000,\"updateBy\":\"admin\",\"dictName\":\"任务状态\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:29:50');
INSERT INTO `sys_oper_log` VALUES (176, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\"任务分组列表\",\"dictId\":5,\"params\":{},\"dictType\":\"sys_job_group\",\"createBy\":\"admin\",\"createTime\":1603685161000,\"updateBy\":\"admin\",\"dictName\":\"任务分组\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:29:56');
INSERT INTO `sys_oper_log` VALUES (177, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\"web前端的商品类型\",\"params\":{},\"dictType\":\"web_category_type\",\"createBy\":\"admin\",\"dictName\":\"商品类型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:31:16');
INSERT INTO `sys_oper_log` VALUES (178, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/4', '127.0.0.1', '内网IP', '{dictIds=4}', 'null', 1, '任务状态已分配,不能删除', '2020-10-27 14:31:30');
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100', '127.0.0.1', '内网IP', '{userIds=100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:31:51');
INSERT INTO `sys_oper_log` VALUES (180, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"手机\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:35:04');
INSERT INTO `sys_oper_log` VALUES (181, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"手机\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1603780504000,\"dictCode\":29,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:35:26');
INSERT INTO `sys_oper_log` VALUES (182, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":2,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"电视机\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:36:04');
INSERT INTO `sys_oper_log` VALUES (183, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":2,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"电视机\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1603780564000,\"dictCode\":30,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:36:18');
INSERT INTO `sys_oper_log` VALUES (184, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":3,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"空调\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:36:59');
INSERT INTO `sys_oper_log` VALUES (185, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":4,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"洗衣机\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:37:18');
INSERT INTO `sys_oper_log` VALUES (186, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"5\",\"dictSort\":6,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"保护套\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:37:39');
INSERT INTO `sys_oper_log` VALUES (187, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":5,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"保护套\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1603780659000,\"dictCode\":33,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:37:48');
INSERT INTO `sys_oper_log` VALUES (188, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"5\",\"dictSort\":6,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"保护膜\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:38:01');
INSERT INTO `sys_oper_log` VALUES (189, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"6\",\"dictSort\":7,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"保护膜\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:38:15');
INSERT INTO `sys_oper_log` VALUES (190, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"7\",\"dictSort\":8,\"params\":{},\"dictType\":\"web_category_type\",\"dictLabel\":\"充电宝\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:38:28');
INSERT INTO `sys_oper_log` VALUES (191, '字典数据', 5, 'com.ruoyi.web.controller.system.SysDictDataController.export()', 'GET', 1, 'admin', NULL, '/system/dict/data/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"d48edbcf-4bd9-4458-8086-2ab3e0e90e0a_字典数据.xlsx\",\"code\":200}', 0, NULL, '2020-10-27 14:40:17');
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'product', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:41:35');
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'product_picture', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:42:04');
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:45:09');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/product', '127.0.0.1', '内网IP', '{tableName=product}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:45:13');
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"productId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1603780895000,\"tableId\":1,\"pk\":true,\"columnName\":\"product_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"char(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1603780895000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"product_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"web_category_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"categoryId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1603780895000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"category_id\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productTitle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"char(30)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1603780895000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"product_title\"},{\"usableColumn\":false,\"columnI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:49:13');
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/product', '127.0.0.1', '内网IP', '{tableName=product}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 14:49:17');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-27 14:49:20');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 15:06:34');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'product', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 15:06:47');
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 15:07:15');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"store\",\"columns\":[{\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"productId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"商品id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1603782407000,\"tableId\":3,\"pk\":true,\"columnName\":\"product_id\"},{\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"商品名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"char(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1603782407000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"product_name\"},{\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"web_category_type\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"categoryId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"商品分类\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1603782407000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"category_id\"},{\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productTitle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"商品标题\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(30)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1603782407000,\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 15:11:13');
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-27 15:11:22');
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"lock\",\"orderNum\":\"1\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"productTool\",\"component\":\"system/productTool/index\",\"children\":[],\"createTime\":1603782841000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1079,\"menuType\":\"C\",\"perms\":\"system:productTool:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 15:17:40');
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"lock\",\"orderNum\":\"2\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"productTool\",\"component\":\"system/productTool/index\",\"children\":[],\"createTime\":1603782841000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1079,\"menuType\":\"C\",\"perms\":\"system:productTool:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 15:18:01');
INSERT INTO `sys_oper_log` VALUES (206, '商品管理', 2, 'com.ruoyi.system.controller.ProductController.edit()', 'PUT', 1, 'admin', NULL, '/system/productTool', '127.0.0.1', '内网IP', '{\"productId\":9,\"productNum\":10,\"params\":{},\"productSellingPrice\":799,\"productName\":\"小米电视4A 32英寸\",\"productTitle\":\"人工智能系统，高清液晶屏\",\"productPicture\":\"public/imgs/appliance/MiTv-4A-32.png\",\"productSales\":2,\"productIntro\":\"小米电视4A 32英寸 | 64位四核处理器 | 1GB+4GB大内存 | 人工智能系统\",\"categoryId\":2,\"productPrice\":799}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 15:22:13');
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 3, 'com.store.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:21:57');
INSERT INTO `sys_oper_log` VALUES (208, '代码生成', 3, 'com.store.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:22:00');
INSERT INTO `sys_oper_log` VALUES (209, '代码生成', 6, 'com.store.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'product,orders,collect,category,carousel,product_picture', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:26:11');
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 2, 'com.store.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"store\",\"columns\":[{\"usableColumn\":false,\"columnId\":44,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"carouselId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"轮播图片地址\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604316371000,\"tableId\":5,\"pk\":true,\"columnName\":\"carousel_id\"},{\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"imgpath\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"轮播图片路径\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604316371000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"imgPath\"},{\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"describes\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"轮播图片秒速\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604316371000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"describes\"}],\"businessName\":\"carousel\",\"moduleName\":\"system\",\"className\":\"Carousel\",\"remark\":\"轮播图片管理\",\"tableName\":\"carousel\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":1}\",\"genType\":\"0\",\"packageName\":\"com.store.system\",\"functionName\":\"轮播图片管理\",\"tree\":false,\"tableComment\":\"轮播图片管理\",\"params\":{\"parentMenuId\":1},\"tplCategory\":\"crud\",\"parentMenuId\":\"1\",\"tableId\":5,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:27:53');
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 3, 'com.store.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/6', '127.0.0.1', '内网IP', '{tableIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:28:15');
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 3, 'com.store.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{tableIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:28:27');
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 2, 'com.store.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"store\",\"columns\":[{\"usableColumn\":false,\"columnId\":53,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"订单表示符\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604316371000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":54,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604316371000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":55,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604316371000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":56,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"产品id\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604316371000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"product_', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:32:25');
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 3, 'com.store.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/9', '127.0.0.1', '内网IP', '{tableIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:32:37');
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 2, 'com.store.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"store\",\"columns\":[{\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"产品详细唯一标识\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604316371000,\"tableId\":10,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"产品唯一标识\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604316371000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"product_id\"},{\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"productPicture\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"产品详细图片\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604316371000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"product_picture\"},{\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"intro\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"产品描述\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604316371000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"intro\"}],\"bus', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:34:07');
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 8, 'com.store.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-02 19:34:16');
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"轮播图片管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"carousel\",\"component\":\"system/carousel/index\",\"children\":[],\"createTime\":1604316932000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1085,\"menuType\":\"C\",\"perms\":\"system:carousel:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:39:04');
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"3\",\"menuName\":\"产品详细管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"picture\",\"component\":\"system/picture/index\",\"children\":[],\"createTime\":1604316942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1097,\"menuType\":\"C\",\"perms\":\"system:picture:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:39:21');
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"3\",\"menuName\":\"轮播图片管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"carousel\",\"component\":\"system/carousel/index\",\"children\":[],\"createTime\":1604316932000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1085,\"menuType\":\"C\",\"perms\":\"system:carousel:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:40:20');
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":\"1\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"orders\",\"component\":\"system/orders/index\",\"children\":[],\"createTime\":1604316937000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1091,\"menuType\":\"C\",\"perms\":\"system:orders:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:41:00');
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":\"3\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"orders\",\"component\":\"system/orders/index\",\"children\":[],\"createTime\":1604316937000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1091,\"menuType\":\"C\",\"perms\":\"system:orders:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:41:15');
INSERT INTO `sys_oper_log` VALUES (222, '轮播图片管理', 1, 'com.store.system.controller.CarouselController.add()', 'POST', 1, 'admin', NULL, '/system/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"imgpath\":\"public/imgs/cms_1.jpg\",\"params\":{},\"describes\":\"轮播图片1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:50:33');
INSERT INTO `sys_oper_log` VALUES (223, '轮播图片管理', 1, 'com.store.system.controller.CarouselController.add()', 'POST', 1, 'admin', NULL, '/system/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":2,\"imgpath\":\"public/imgs/cms_2.jpg\",\"params\":{},\"describes\":\"轮播图片2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:51:02');
INSERT INTO `sys_oper_log` VALUES (224, '轮播图片管理', 1, 'com.store.system.controller.CarouselController.add()', 'POST', 1, 'admin', NULL, '/system/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":3,\"imgpath\":\"public/imgs/cms_3.jpg\",\"params\":{},\"describes\":\"轮播图图片3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:51:20');
INSERT INTO `sys_oper_log` VALUES (225, '轮播图片管理', 1, 'com.store.system.controller.CarouselController.add()', 'POST', 1, 'admin', NULL, '/system/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":4,\"imgpath\":\"public/imgs/cms_4.jpg\",\"params\":{},\"describes\":\"轮播图片4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 19:51:36');
INSERT INTO `sys_oper_log` VALUES (226, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-11-04 21:46:06');
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 6, 'com.store.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'collect,shoppingcart', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-05 19:12:05');
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 2, 'com.store.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"store\",\"columns\":[{\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"标识符\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604574725000,\"tableId\":11,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604574725000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"产品id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604574725000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"product_id\"},{\"usableColumn\":false,\"columnId\":77,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"collectTime\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"收藏时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604574725000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-05 19:13:51');
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 2, 'com.store.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"store\",\"columns\":[{\"usableColumn\":false,\"columnId\":78,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"标识符\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604574725000,\"tableId\":12,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":79,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604574725000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":80,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"产品id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604574725000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"product_id\"},{\"usableColumn\":false,\"columnId\":81,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"num\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"购买数量\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604574725000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"num\"}],\"bus', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-05 19:15:35');
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 8, 'com.store.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-05 19:15:49');
INSERT INTO `sys_oper_log` VALUES (231, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"store123\",\"params\":{},\"userName\":\"store123\"}', '{\"msg\":\"用户\'store123\'不存在\",\"code\":\"004\"}', 0, NULL, '2020-11-05 19:47:28');
INSERT INTO `sys_oper_log` VALUES (232, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-11-05 19:48:15');
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1091', '127.0.0.1', '内网IP', '{menuId=1091}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-11-09 20:01:25');
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/105', '127.0.0.1', '内网IP', '{menuId=105}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-11-09 20:02:46');
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1092', '127.0.0.1', '内网IP', '{menuId=1092}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:02:55');
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1093', '127.0.0.1', '内网IP', '{menuId=1093}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:02:57');
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1094', '127.0.0.1', '内网IP', '{menuId=1094}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:02:59');
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1095', '127.0.0.1', '内网IP', '{menuId=1095}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:03:01');
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1096', '127.0.0.1', '内网IP', '{menuId=1096}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:03:03');
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1091', '127.0.0.1', '内网IP', '{menuId=1091}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:03:05');
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1030', '127.0.0.1', '内网IP', '{menuId=1030}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-11-09 20:03:15');
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1029', '127.0.0.1', '内网IP', '{menuId=1029}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-11-09 20:03:18');
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1026', '127.0.0.1', '内网IP', '{menuId=1026}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:13:43');
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1027', '127.0.0.1', '内网IP', '{menuId=1027}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:13:46');
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1028', '127.0.0.1', '内网IP', '{menuId=1028}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:13:48');
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1029', '127.0.0.1', '内网IP', '{menuId=1029}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:13:49');
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1030', '127.0.0.1', '内网IP', '{menuId=1030}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:13:52');
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/105', '127.0.0.1', '内网IP', '{menuId=105}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-11-09 20:13:54');
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 3, 'com.store.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/105', '127.0.0.1', '内网IP', '{menuId=105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:14:35');
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 1, 'com.store.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/shop\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:18:28');
INSERT INTO `sys_oper_log` VALUES (251, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/shop\",\"children\":[],\"createTime\":1604924308000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1103,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:18:45');
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"shop\",\"children\":[],\"createTime\":1604924308000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1103,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:18:55');
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"7\",\"menuName\":\"参数设置\",\"params\":{},\"parentId\":1103,\"isCache\":\"0\",\"path\":\"config\",\"component\":\"system/config/index\",\"children\":[],\"createTime\":1603685161000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":106,\"menuType\":\"C\",\"perms\":\"system:config:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:20:26');
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"9\",\"menuName\":\"日志管理\",\"params\":{},\"parentId\":1103,\"isCache\":\"0\",\"path\":\"log\",\"component\":\"system/log/index\",\"children\":[],\"createTime\":1603685161000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":108,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:20:37');
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"1\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1603685161000,\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"修改菜单\'商品管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2020-11-09 20:20:51');
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"系统参数管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"shop\",\"children\":[],\"createTime\":1604924308000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1103,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:21:10');
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"参数日志管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"shop\",\"children\":[],\"createTime\":1604924308000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1103,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:21:22');
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 1, 'com.store.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"userds\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"新增菜单\'系统管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2020-11-09 20:21:56');
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 1, 'com.store.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"用户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"userds\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:22:12');
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"1\",\"menuName\":\"用户管理\",\"params\":{},\"parentId\":1104,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"system/user/index\",\"children\":[],\"createTime\":1603685161000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:22:32');
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"系统角色管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"userds\",\"children\":[],\"createTime\":1604924532000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1104,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:22:57');
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"1\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1603685161000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:24:14');
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"2\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1603685161000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:24:19');
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"3\",\"menuName\":\"参数日志管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"shop\",\"children\":[],\"createTime\":1604924308000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1103,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:24:27');
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"角色管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"userds\",\"children\":[],\"createTime\":1604924532000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1104,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:24:33');
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 1, 'com.store.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"2\",\"menuName\":\"图片管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"pict\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:25:08');
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"3\",\"menuName\":\"轮播图片管理\",\"params\":{},\"parentId\":1105,\"isCache\":\"0\",\"path\":\"carousel\",\"component\":\"system/carousel/index\",\"children\":[],\"createTime\":1604316932000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1085,\"menuType\":\"C\",\"perms\":\"system:carousel:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:25:22');
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"3\",\"menuName\":\"产品详细管理\",\"params\":{},\"parentId\":1105,\"isCache\":\"0\",\"path\":\"picture\",\"component\":\"system/picture/index\",\"children\":[],\"createTime\":1604316942000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1097,\"menuType\":\"C\",\"perms\":\"system:picture:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:25:30');
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"2\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1603685161000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:25:58');
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"2\",\"menuName\":\"图片管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"pict\",\"children\":[],\"createTime\":1604924708000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1105,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-09 20:26:15');
INSERT INTO `sys_oper_log` VALUES (271, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"wcl123\",\"params\":{},\"userName\":\"wcl123\"}', '{\"msg\":\"用户\'wcl123\'不存在\",\"code\":\"004\"}', 0, NULL, '2020-11-09 20:31:18');
INSERT INTO `sys_oper_log` VALUES (272, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2020-11-09 20:33:14');
INSERT INTO `sys_oper_log` VALUES (273, '个人信息', 2, 'com.store.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15212465548\",\"admin\":true,\"loginDate\":1603685161000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"2212121@qq.com\",\"nickName\":\"超级管理员\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1603685161000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 16:23:52');
INSERT INTO `sys_oper_log` VALUES (274, '用户管理', 3, 'com.store.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{userIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 16:24:23');
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.store.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"2\",\"menuName\":\"商品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1603685161000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 16:46:03');
INSERT INTO `sys_oper_log` VALUES (276, '登录日志', 9, 'com.store.web.controller.monitor.SysLogininforController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-12 17:56:35');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2020-10-26 12:06:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2020-10-26 12:06:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2020-10-26 12:06:01', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '客户', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2020-10-26 12:06:01', 'admin', '2020-10-27 12:02:22', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', '2212121@qq.com', '15212465548', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2020-10-26 12:06:01', 'admin', '2020-10-26 12:06:01', '', '2020-11-12 16:23:52', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2020-10-26 12:06:01', 'admin', '2020-10-26 12:06:01', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 108, '测试用户', '测试用户', '00', '28118313814@qq.com', '15203446311', '0', '', '$2a$10$3xvVdkjl3YXUnbbnmZzU4.wYoHN/x4ITqtMzaAPxg9H3Pg6nQW.d2', '0', '2', '', NULL, 'admin', '2020-10-26 20:40:07', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, 108, 'weoc123', 'weoc123', '00', 'qq@qq.com', '12345', '0', '', '$2a$10$l7bPffPjMDQ0t2JSySq3AOfaM04RieOUAMwUoj36sGlDiwuEmakIe', '0', '0', '', NULL, 'store用户', '2020-10-26 20:50:08', 'admin', '2020-10-27 11:54:33', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (101, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhoneNumber` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `userName`(`userName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'wo123', 'wo123456', NULL);
INSERT INTO `users` VALUES (2, 'sto123', 'sto123', NULL);
INSERT INTO `users` VALUES (3, 'wcl123', 'wcl123', NULL);

SET FOREIGN_KEY_CHECKS = 1;
