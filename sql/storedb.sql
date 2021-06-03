/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : storedb

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 03/06/2021 17:49:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `carousel_id` int NOT NULL AUTO_INCREMENT,
  `imgPath` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `describes` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, 'public/imgs/cms_1.jpg', '轮播图片1');
INSERT INTO `carousel` VALUES (2, 'public/imgs/cms_2.jpg', '轮播图片2');
INSERT INTO `carousel` VALUES (3, 'public/imgs/cms_3.jpg', '轮播图片3');
INSERT INTO `carousel` VALUES (4, 'public/imgs/cms_4.jpg', '轮播图片4');
INSERT INTO `carousel` VALUES (5, 'public/imgs/cms_5.jpg', '轮播图片5');
INSERT INTO `carousel` VALUES (6, 'public/imgs/cms_6.jpg', '轮播图片6');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '经典文学');
INSERT INTO `category` VALUES (2, '软件工程');
INSERT INTO `category` VALUES (3, '社科经营');
INSERT INTO `category` VALUES (4, '热卖小说');
INSERT INTO `category` VALUES (5, '保护套');
INSERT INTO `category` VALUES (6, '保护膜');
INSERT INTO `category` VALUES (7, '充电器');
INSERT INTO `category` VALUES (8, '充电宝');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `collect_time` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_collect_user_id`(`user_id`) USING BTREE,
  INDEX `FK_collect_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = COMPACT;

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
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = COMPACT;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_num` int NOT NULL,
  `product_price` double NOT NULL,
  `order_time` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_order_user_id`(`user_id`) USING BTREE,
  INDEX `FK_order_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (9, 1618799362476, 103, 7, 1, 55, 1618799362459);
INSERT INTO `orders` VALUES (10, 1618799492383, 103, 1, 1, 59, 1618799492373);
INSERT INTO `orders` VALUES (11, 1618799605779, 103, 1, 1, 59, 1618799605769);
INSERT INTO `orders` VALUES (12, 1618799707400, 103, 1, 1, 59, 1618799707390);
INSERT INTO `orders` VALUES (13, 1618799708039, 103, 7, 1, 55, 1618799708022);
INSERT INTO `orders` VALUES (14, 1621435721795, 103, 1, 1, 59, 1621435721785);
INSERT INTO `orders` VALUES (15, 1621435721931, 103, 7, 1, 55, 1621435721914);
INSERT INTO `orders` VALUES (16, 1621757828709, 103, 8, 1, 212, 1621757828690);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int NOT NULL,
  `product_title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_num` int NOT NULL,
  `product_sales` int NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `FK_product_category`(`category_id`) USING BTREE,
  CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '希望之线', 4, '《恶意》系列高口碑长篇，温柔中暗藏杀机。', '【现货】希望之线 东野圭吾2021新作 白夜行解忧杂货店恶意新参者沉默的巡游 日本推理小说侦探畅销书新经典', 'public/imgs/books/picture/xiwangzhixian-1.jpg', 59, 39, 200, 177);
INSERT INTO `product` VALUES (2, '文城', 4, '余华时隔8年重磅新作！', '【现货】文城 精装 余华2021新书 活着 兄弟 许三观卖血记 现当代文学长篇散文小说 正版畅销 新经典 第七天 易烊千玺 新经典', 'public/imgs/books/picture/wencheng-1.jpg', 59, 39, 200, 500);
INSERT INTO `product` VALUES (3, '还是要相信', 4, '遇见众多精彩的灵魂，分享波澜壮阔的人生', '还是要相信 陈鲁豫全新随笔集，焦虑时代的温柔回应；无论世界如何改变，还是要相信，心底最初相信的东西', 'public/imgs/books/picture/xiangxin-1.jpg', 59, 29, 200, 300);
INSERT INTO `product` VALUES (4, '惜别', 4, '以赤子之心追忆母亲与逝去的好时光', '【旗舰店直营】惜别 正版精装 止庵 母亲 亲情 文学经典 人生 遗憾 珍惜 时光 我们仨 目送 新经典', 'public/imgs/books/picture/xibie-1.jpg', 68, 46, 381, 11);
INSERT INTO `product` VALUES (5, '隐形守护者', 4, '多重工艺 更具匠心', '【正版授权】隐形守护者白金纪念册 真人互动影像设定集 steam 烧脑悬疑推理剧情，附赠趣味档案插页、收藏证书和游戏CDKEY码', 'public/imgs/books/picture/shouhu-1.jpg', 168, 149, 200, 8);
INSERT INTO `product` VALUES (6, '一只特立独行的猪', 4, '王小波代表作', '【官方直营 正版图书】一只特立独行的猪 王小波代表作 肖战朱一龙麦家李诞实锤推荐 独·家授·权 全新编排 李银河审定', 'public/imgs/books/picture/zhu-1.jpg', 59, 29, 202, 300);
INSERT INTO `product` VALUES (7, '百年孤独', 1, '20世纪最伟大的小说', '新经典旗舰店 百年孤独 霍乱时期的爱情 诺贝尔文学奖马尔克斯代表作 正版中文授权 流金岁月 朱锁锁 世界名著外国文学', 'public/imgs/books/picture/bainian-1.jpg', 55, 39, 350, 180);
INSERT INTO `product` VALUES (8, '人生海海', 1, '莫言高晓松推荐', '【官方直营正版】麦家套装全4册人生海海解密 风声 暗算 茅盾文学奖得主 莫言高晓松推荐 经典文学名著', 'public/imgs/books/picture/rensheng-1.jpg', 212, 127, 112, 10);
INSERT INTO `product` VALUES (9, '张爱玲全集', 1, '赠张爱玲《海上花落》', '【赠书正版包邮】张爱玲全集5册倾城之恋小团圆半生缘红玫瑰与白玫瑰怨女言情文学传金锁记小说传记作品集畅销书', 'public/imgs/books/picture/zhangailing-1.jpg', 258, 129, 177, 36);
INSERT INTO `product` VALUES (10, '东野圭吾恶意系列', 1, '加贺恭一郎系列10本大全套', '东野圭吾恶意系列全套10本大合集 恶意毕业沉睡的森林新参者祈祷落幕时只差一个谎言 悬疑推理侦探小说', 'public/imgs/books/picture/guigu-1.jpg', 450, 270, 296, 43);
INSERT INTO `product` VALUES (11, '你当像鸟飞往你的山', 1, '打开你生命的无限可能', '【正版包邮+赠书签】 你当像鸟飞往你的山 比尔·盖茨推荐 畅销书外国现当代文学自传体女性暖心励志长篇小说 新经典', 'public/imgs/books/picture/feiniao-1.jpg', 59, 29, 100, 297);
INSERT INTO `product` VALUES (12, '计算机网络', 2, '新华书店正版 网络技术 文轩网', '计算机网络 自顶向下方法 高校经典教材网络教程书籍 计算机网络技术基础书籍 计算机网络通信 机械工业出版社 新华正版', 'public/imgs/books/picture/wangluo-1.jpg', 62.3, 44.5, 1000, 841);
INSERT INTO `product` VALUES (13, 'JavaScript高级程序设计', 2, 'JavaScript权威指南', '【官方旗舰店】 JavaScript高级程序设计第四版 js入门到精通书籍JavaScript权威指南前端开发工程师书web开发html编程开发入门书', 'public/imgs/books/picture/js-1.jpg', 129, 106, 652, 300);
INSERT INTO `product` VALUES (14, '全3册Java从入门到精通第5版+Java面向对象编程第2版+Java编程思想第4版中文版', 2, '入门+实战+思想', 'thinking in java语言程序设计教程教材精通JAVA', 'public/imgs/books/picture/java-1.jpg', 266, 168, 56, 65);
INSERT INTO `product` VALUES (15, '需求工程', 2, '软件建模与分析 第二版', ' 高等教育出版社 9787040417142高等学校软件工程系列教材 专业软件技术人员的参考用书籍', 'public/imgs/books/picture/xuqiu.jpg', 46, 37, 20, 0);
INSERT INTO `product` VALUES (16, '软件工程导论', 2, '21世纪软件工程专业规划教材', '正版现货  第六版第6版 张海藩 牟永敏 清华大学出版社 大学计算机教材', 'public/imgs/books/picture/daolun-1.jpg', 49, 37, 711, 8);
INSERT INTO `product` VALUES (17, '算法导论第三版', 2, '严谨且易懂 算法圣经 算法标准教材', ' 原书第3版 计算机算法设计与分析书籍 计算机程序编程设计 软件工程教程教材 啊哈图解算法基础入门自学正版教材', 'public/imgs/books/picture/suanfa-1.jpg', 95, 68, 20, 8);
INSERT INTO `product` VALUES (18, '金字塔原理', 3, '麦肯锡经典培训教材', '【抖音推荐 官方正版包邮】金字塔原理 精进思考分析和表达能力 世界级企业和院校用来培训成员 逻辑思考方法', 'public/imgs/books/picture/jinzita-1.jpg', 88, 61, 20, 231);
INSERT INTO `product` VALUES (19, '任天堂哲学', 3, '经济书籍畅销书籍小说', ' 马里奥兄弟 塞尔达游戏公司 企业管理 类似华为管理法 正版图书', 'public/imgs/books/picture/tiantang-1.jpg', 68, 40, 20, 261);
INSERT INTO `product` VALUES (20, '自我领导力', 3, '一分钟经理人', '自我领导力 肯·布兰佳 请记住：日事日清 作者 个人效率管理 经管励志 正版图书', 'public/imgs/books/picture/ziwo-1.jpg', 42, 25, 20, 10);
INSERT INTO `product` VALUES (21, '成长,就是一场和自己的较量', 3, '成功经管、励志 正版图书', ' 王文华 主编 精装版 ', 'public/imgs/books/picture/jiaoliang.jpg', 38, 11, 20, 9);
INSERT INTO `product` VALUES (30, '热门推荐', 5, '', '', '', 129, 129, 20, 8);
INSERT INTO `product` VALUES (31, '热门推荐', 5, '', '', '', 69, 69, 20, 0);

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_picture
-- ----------------------------
INSERT INTO `product_picture` VALUES (1, 1, 'public/imgs/books/picture/xiwangzhixian-1.jpg', '');
INSERT INTO `product_picture` VALUES (2, 1, 'public/imgs/books/picture/xiwangzhixian-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (3, 1, 'public/imgs/books/picture/xiwangzhixian-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (4, 1, 'public/imgs/books/picture/xiwangzhixian-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (5, 1, 'public/imgs/books/picture/xiwangzhixian-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (6, 2, 'public/imgs/books/picture/wencheng-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (7, 2, 'public/imgs/books/picture/wencheng-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (8, 2, 'public/imgs/books/picture/wencheng-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (9, 2, 'public/imgs/books/picture/wencheng-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (10, 3, 'public/imgs/books/picture/xiangxin-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (11, 3, 'public/imgs/books/picture/xiangxin-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (12, 3, 'public/imgs/books/picture/xiangxin-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (13, 3, 'public/imgs/books/picture/xiangxin-4.jpg', '');
INSERT INTO `product_picture` VALUES (14, 4, 'public/imgs/books/picture/xibie-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (15, 4, 'public/imgs/books/picture/xibie-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (16, 4, 'public/imgs/books/picture/xibie-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (17, 4, 'public/imgs/books/picture/xibie-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (18, 5, 'public/imgs/books/picture/shouhu-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (19, 5, 'public/imgs/books/picture/shouhu-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (20, 5, 'public/imgs/books/picture/shouhu-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (21, 5, 'public/imgs/books/picture/shouhu-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (22, 6, 'public/imgs/books/picture/zhu-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (23, 6, 'public/imgs/books/picture/zhu-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (24, 6, 'public/imgs/books/picture/zhu-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (25, 6, 'public/imgs/books/picture/zhu-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (26, 7, 'public/imgs/books/picture/bainian-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (27, 7, 'public/imgs/books/picture/bainian-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (28, 7, 'public/imgs/books/picture/bainian-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (29, 7, 'public/imgs/books/picture/bainian-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (30, 8, 'public/imgs/books/picture/rensheng-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (31, 8, 'public/imgs/books/picture/rensheng-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (32, 8, 'public/imgs/books/picture/rensheng-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (33, 8, 'public/imgs/books/picture/rensheng-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (34, 9, 'public/imgs/books/picture/zhangailing-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (35, 9, 'public/imgs/books/picture/zhangailing-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (36, 9, 'public/imgs/books/picture/zhangailing-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (37, 9, 'public/imgs/books/picture/zhangailing-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (38, 10, 'public/imgs/books/picture/guigu-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (39, 10, 'public/imgs/books/picture/guigu-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (40, 10, 'public/imgs/books/picture/guigu-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (42, 11, 'public/imgs/books/picture/feiniao-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (43, 11, 'public/imgs/books/picture/feiniao-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (44, 11, 'public/imgs/books/picture/feiniao-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (45, 11, 'public/imgs/books/picture/feiniao-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (46, 12, 'public/imgs/books/picture/wangluo-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (47, 12, 'public/imgs/books/picture/wangluo-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (48, 12, 'public/imgs/books/picture/wangluo-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (49, 12, 'public/imgs/books/picture/wangluo-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (50, 12, 'public/imgs/books/picture/wangluo-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (51, 13, 'public/imgs/books/picture/js-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (52, 13, 'public/imgs/books/picture/js-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (53, 13, 'public/imgs/books/picture/js-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (54, 13, 'public/imgs/books/picture/js-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (55, 13, 'public/imgs/books/picture/js-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (56, 14, 'public/imgs/books/picture/java-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (57, 14, 'public/imgs/books/picture/java-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (58, 14, 'public/imgs/books/picture/java-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (59, 14, 'public/imgs/books/picture/java-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (60, 14, 'public/imgs/books/picture/java-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (61, 15, 'public/imgs/books/picture/xuqiu.jpg', NULL);
INSERT INTO `product_picture` VALUES (62, 16, 'public/imgs/books/picture/daolun-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (63, 16, 'public/imgs/books/picture/daolun-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (64, 16, 'public/imgs/books/picture/daolun-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (65, 16, 'public/imgs/books/picture/daolun-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (67, 17, 'public/imgs/books/picture/suanfa-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (68, 17, 'public/imgs/books/picture/suanfa-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (69, 17, 'public/imgs/books/picture/suanfa-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (70, 17, 'public/imgs/books/picture/suanfa-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (71, 17, 'public/imgs/books/picture/suanfa-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (72, 18, 'public/imgs/books/picture/jinzita-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (73, 18, 'public/imgs/books/picture/jinzita-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (74, 18, 'public/imgs/books/picture/jinzita-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (75, 18, 'public/imgs/books/picture/jinzita-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (76, 18, 'public/imgs/books/picture/jinzita-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (77, 19, 'public/imgs/books/picture/tiantang-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (78, 19, 'public/imgs/books/picture/tiantang-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (79, 19, 'public/imgs/books/picture/tiantang-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (80, 19, 'public/imgs/books/picture/tiantang-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (81, 19, 'public/imgs/books/picture/tiantang-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (82, 20, 'public/imgs/books/picture/ziwo-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (83, 20, 'public/imgs/books/picture/ziwo-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (84, 20, 'public/imgs/books/picture/ziwo-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (85, 20, 'public/imgs/books/picture/ziwo-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (86, 20, 'public/imgs/books/picture/ziwo-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (87, 21, 'public/imgs/books/picture/jiaoliang.jpg', NULL);
INSERT INTO `product_picture` VALUES (102, 30, 'public/imgs/one.png', NULL);
INSERT INTO `product_picture` VALUES (103, 30, 'public/imgs/two.png', NULL);
INSERT INTO `product_picture` VALUES (104, 30, 'public/imgs/three.jpg', NULL);
INSERT INTO `product_picture` VALUES (105, 31, 'public/imgs/books/zhu.jpg', NULL);
INSERT INTO `product_picture` VALUES (106, 31, 'public/imgs/books/bainian.jpg', NULL);
INSERT INTO `product_picture` VALUES (107, 31, 'public/imgs/books/rensheng.jpg', NULL);
INSERT INTO `product_picture` VALUES (108, 31, 'public/imgs/books/zhangailing.jpg', NULL);
INSERT INTO `product_picture` VALUES (109, 31, 'public/imgs/books/guigu.jpg', NULL);
INSERT INTO `product_picture` VALUES (110, 31, 'public/imgs/books/feiniao.jpg', NULL);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `num` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_user_id`(`user_id`) USING BTREE,
  INDEX `FK_shoppingCart_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES (15, 103, 4, 1);
INSERT INTO `shoppingcart` VALUES (16, 103, 13, 1);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-yellow', 'Y', 'admin', '2020-10-26 12:06:01', 'admin', '2021-02-25 14:59:04', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-10-26 12:06:01', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-10-26 12:06:01', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = COMPACT;

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
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = COMPACT;

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
INSERT INTO `sys_dict_data` VALUES (29, 1, '经典文学', '0', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:35:04', 'admin', '2020-10-27 14:35:26', NULL);
INSERT INTO `sys_dict_data` VALUES (30, 2, '软件工程', '1', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:36:04', 'admin', '2020-10-27 14:36:18', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 3, '社科经营', '2', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:36:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 4, '热门小说', '3', 'web_category_type', NULL, NULL, 'N', '0', 'admin', '2020-10-27 14:37:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = COMPACT;

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
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = COMPACT;

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
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-12 19:36:13');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-25 14:53:35');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-25 15:08:00');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-25 15:20:31');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-24 23:40:59');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-05 16:26:21');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = COMPACT;

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
INSERT INTO `sys_menu` VALUES (1106, '订单管理', 1, 1, 'orders', 'system/orders/index', 1, 0, 'C', '0', '0', 'system:orders:list', 'money', 'admin', '2021-06-03 16:47:30', '', NULL, '订单管理菜单');
INSERT INTO `sys_menu` VALUES (1107, '订单管理查询', 1106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:orders:query', '#', 'admin', '2021-06-03 16:47:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1108, '订单管理新增', 1106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:orders:add', '#', 'admin', '2021-06-03 16:47:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1109, '订单管理修改', 1106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:orders:edit', '#', 'admin', '2021-06-03 16:47:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1110, '订单管理删除', 1106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:orders:remove', '#', 'admin', '2021-06-03 16:47:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1111, '订单管理导出', 1106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:orders:export', '#', 'admin', '2021-06-03 16:47:30', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = COMPACT;

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
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.store.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-25 15:02:00');
INSERT INTO `sys_oper_log` VALUES (2, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-02-25 15:14:36');
INSERT INTO `sys_oper_log` VALUES (3, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"新增用户\'weoc123\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-05 16:40:04');
INSERT INTO `sys_oper_log` VALUES (4, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"新增用户\'weoc123\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-06 16:54:36');
INSERT INTO `sys_oper_log` VALUES (5, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc12312\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'用户名或密码错误！\",\"code\":\"004\"}', 0, NULL, '2021-04-06 18:45:37');
INSERT INTO `sys_oper_log` VALUES (6, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-07 11:21:30');
INSERT INTO `sys_oper_log` VALUES (7, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"新增用户\'weoc123\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-07 11:42:32');
INSERT INTO `sys_oper_log` VALUES (8, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-07 11:42:43');
INSERT INTO `sys_oper_log` VALUES (9, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"新增用户\'weoc123\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-07 11:42:44');
INSERT INTO `sys_oper_log` VALUES (10, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"dd155\",\"params\":{},\"userName\":\"2561\"}', '{\"msg\":\"用户\'2561\'不存在\",\"code\":\"004\"}', 0, NULL, '2021-04-07 11:43:57');
INSERT INTO `sys_oper_log` VALUES (11, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"wo123456\",\"params\":{},\"userName\":\"wo123\"}', '{\"msg\":\"用户\'wo123\'不存在\",\"code\":\"004\"}', 0, NULL, '2021-04-07 11:44:23');
INSERT INTO `sys_oper_log` VALUES (12, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-07 11:46:49');
INSERT INTO `sys_oper_log` VALUES (13, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '192.168.1.2', '内网IP', '{\"admin\":false,\"password\":\"woec123456\",\"params\":{},\"userName\":\"woec123\"}', '{\"msg\":\"用户\'woec123\'不存在\",\"code\":\"004\"}', 0, NULL, '2021-04-10 20:11:01');
INSERT INTO `sys_oper_log` VALUES (14, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-12 15:55:44');
INSERT INTO `sys_oper_log` VALUES (15, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-12 16:20:10');
INSERT INTO `sys_oper_log` VALUES (16, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-12 16:20:38');
INSERT INTO `sys_oper_log` VALUES (17, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-12 16:21:07');
INSERT INTO `sys_oper_log` VALUES (18, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"wo123456\",\"params\":{},\"userName\":\"wo123\"}', '{\"msg\":\"用户\'wo123\'不存在\",\"code\":\"004\"}', 0, NULL, '2021-04-12 16:52:17');
INSERT INTO `sys_oper_log` VALUES (19, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-12 17:04:04');
INSERT INTO `sys_oper_log` VALUES (20, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"新增用户\'weoc123\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-15 00:11:32');
INSERT INTO `sys_oper_log` VALUES (21, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"新增用户\'weoc123\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-15 00:11:36');
INSERT INTO `sys_oper_log` VALUES (22, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-15 00:23:42');
INSERT INTO `sys_oper_log` VALUES (23, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-15 00:25:34');
INSERT INTO `sys_oper_log` VALUES (24, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-15 00:27:19');
INSERT INTO `sys_oper_log` VALUES (25, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-15 00:31:44');
INSERT INTO `sys_oper_log` VALUES (26, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-15 00:31:59');
INSERT INTO `sys_oper_log` VALUES (27, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-15 00:32:01');
INSERT INTO `sys_oper_log` VALUES (28, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-15 00:33:28');
INSERT INTO `sys_oper_log` VALUES (29, '注册用户', 0, 'com.store.web.controller.system.SysLoginController.register()', 'POST', 1, NULL, NULL, '/users/register', '127.0.0.1', '内网IP', '{\"phonenumber\":\"12345\",\"admin\":false,\"password\":\"$2a$10$u69Z3nnFqsbdcZl8.hBQvu8RXn0t8lrdl9Ec8vUcphjGO9xiSP1XO\",\"postIds\":[4],\"email\":\"qq@qq.com\",\"nickName\":\"13623615696\",\"sex\":\"0\",\"deptId\":108,\"params\":{},\"userName\":\"13623615696\",\"userId\":102,\"createBy\":\"store用户\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":\"001\"}', 0, NULL, '2021-04-15 00:36:17');
INSERT INTO `sys_oper_log` VALUES (30, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"13623615696\"}', '{\"msg\":\"用户\'13623615696\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":102,\"userName\":\"13623615696\"}}', 0, NULL, '2021-04-15 00:39:31');
INSERT INTO `sys_oper_log` VALUES (31, '注册用户', 0, 'com.store.web.controller.system.SysLoginController.register()', 'POST', 1, NULL, NULL, '/users/register', '127.0.0.1', '内网IP', '{\"phonenumber\":\"12345\",\"admin\":false,\"password\":\"$2a$10$KEr/PRImk9XxKV8FkffA9.5Hy.c0ddiIyF.f7EQfM4Bs/lBpNs3C.\",\"postIds\":[4],\"email\":\"qq@qq.com\",\"nickName\":\"gao\",\"sex\":\"0\",\"deptId\":108,\"params\":{},\"userName\":\"gao\",\"userId\":103,\"createBy\":\"store用户\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":\"001\"}', 0, NULL, '2021-04-15 09:38:24');
INSERT INTO `sys_oper_log` VALUES (32, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-04-15 09:38:25');
INSERT INTO `sys_oper_log` VALUES (33, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"13623615696\"}', '{\"msg\":\"用户\'13623615696\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":102,\"userName\":\"13623615696\"}}', 0, NULL, '2021-04-16 17:16:24');
INSERT INTO `sys_oper_log` VALUES (34, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-04-16 17:18:37');
INSERT INTO `sys_oper_log` VALUES (35, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-04-16 17:21:30');
INSERT INTO `sys_oper_log` VALUES (36, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-04-16 17:23:15');
INSERT INTO `sys_oper_log` VALUES (37, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-04-16 19:36:31');
INSERT INTO `sys_oper_log` VALUES (38, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-18 17:48:50');
INSERT INTO `sys_oper_log` VALUES (39, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '192.168.1.2', '内网IP', '{\"admin\":false,\"password\":\"weoc123\",\"params\":{},\"userName\":\"weoc123\"}', '{\"msg\":\"用户\'weoc123\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":101,\"userName\":\"weoc123\"}}', 0, NULL, '2021-04-18 17:58:42');
INSERT INTO `sys_oper_log` VALUES (40, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"新增用户\'gao\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-19 11:08:58');
INSERT INTO `sys_oper_log` VALUES (41, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"新增用户\'gao\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-21 15:00:05');
INSERT INTO `sys_oper_log` VALUES (42, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-04-21 15:00:06');
INSERT INTO `sys_oper_log` VALUES (43, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"新增用户\'gao\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-21 20:18:19');
INSERT INTO `sys_oper_log` VALUES (44, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-04-21 20:18:19');
INSERT INTO `sys_oper_log` VALUES (45, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"新增用户\'gao\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-04-28 15:00:13');
INSERT INTO `sys_oper_log` VALUES (46, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-04-28 15:00:20');
INSERT INTO `sys_oper_log` VALUES (47, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"新增用户\'gao\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-05-18 17:16:31');
INSERT INTO `sys_oper_log` VALUES (48, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'用户名或密码错误！\",\"code\":\"004\"}', 0, NULL, '2021-05-18 17:16:31');
INSERT INTO `sys_oper_log` VALUES (49, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"新增用户\'gao\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-05-18 17:16:33');
INSERT INTO `sys_oper_log` VALUES (50, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-05-18 17:16:37');
INSERT INTO `sys_oper_log` VALUES (51, '检查用户是否已经存在', 0, 'com.store.web.controller.system.SysLoginController.findUserName()', 'POST', 1, NULL, NULL, '/users/findUserName', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"新增用户\'gao\'已经存在，不能注册\",\"code\":\"004\"}', 0, NULL, '2021-05-18 17:44:30');
INSERT INTO `sys_oper_log` VALUES (52, '', 0, 'com.store.web.controller.system.SysLoginController.weblogin()', 'POST', 1, NULL, NULL, '/users/login', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userName\":\"gao\"}', '{\"msg\":\"用户\'gao\'登陆成功！\",\"code\":\"001\",\"user\":{\"user_id\":103,\"userName\":\"gao\"}}', 0, NULL, '2021-05-18 17:44:37');
INSERT INTO `sys_oper_log` VALUES (53, '订单管理', 3, 'com.store.system.controller.web.WebOrdersController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orders/8', '127.0.0.1', '内网IP', '{ids=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-03 17:21:12');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = COMPACT;

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
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = COMPACT;

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
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = COMPACT;

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
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = COMPACT;

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
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
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
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', '2212121@qq.com', '15212465548', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2020-10-26 12:06:01', 'admin', '2020-10-26 12:06:01', '', '2020-11-12 16:23:52', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2020-10-26 12:06:01', 'admin', '2020-10-26 12:06:01', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 108, '测试用户', '测试用户', '00', '28118313814@qq.com', '15203446311', '0', '', '$2a$10$3xvVdkjl3YXUnbbnmZzU4.wYoHN/x4ITqtMzaAPxg9H3Pg6nQW.d2', '0', '2', '', NULL, 'admin', '2020-10-26 20:40:07', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, 108, 'weoc123', 'weoc123', '00', 'qq@qq.com', '12345', '0', '', '$2a$10$l7bPffPjMDQ0t2JSySq3AOfaM04RieOUAMwUoj36sGlDiwuEmakIe', '0', '0', '', NULL, 'store用户', '2020-10-26 20:50:08', 'admin', '2020-10-27 11:54:33', NULL);
INSERT INTO `sys_user` VALUES (102, 108, '13623615696', '13623615696', '00', 'qq@qq.com', '12345', '0', '', '$2a$10$u69Z3nnFqsbdcZl8.hBQvu8RXn0t8lrdl9Ec8vUcphjGO9xiSP1XO', '0', '0', '', NULL, 'store用户', '2021-04-15 00:36:17', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 108, 'gao', 'gao', '00', 'qq@qq.com', '12345', '0', '', '$2a$10$KEr/PRImk9XxKV8FkffA9.5Hy.c0ddiIyF.f7EQfM4Bs/lBpNs3C.', '0', '0', '', NULL, 'store用户', '2021-04-15 09:38:24', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (101, 4);
INSERT INTO `sys_user_post` VALUES (102, 4);
INSERT INTO `sys_user_post` VALUES (103, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `userName` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhoneNumber` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `userName`(`userName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'wo123', 'wo123456', NULL);
INSERT INTO `users` VALUES (2, 'sto123', 'sto123', NULL);
INSERT INTO `users` VALUES (3, 'wcl123', 'wcl123', NULL);

SET FOREIGN_KEY_CHECKS = 1;
