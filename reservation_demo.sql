/*
 Navicat Premium Data Transfer

 Source Server         : 234
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : 122.112.210.234:23306
 Source Schema         : reservation_demo

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 23/04/2023 19:47:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blacklist
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist`  (
  `s_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `date_begin` date NULL DEFAULT NULL COMMENT '开始时间',
  `date_end` date NULL DEFAULT NULL COMMENT '结束时间',
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `blacker_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设置者编号',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '黑名单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blacklist
-- ----------------------------
INSERT INTO `blacklist` VALUES ('32001041', '2023-04-23', '2023-04-23', '拉黑', 'admin');
INSERT INTO `blacklist` VALUES ('32001261', '2022-09-01', '2023-09-01', '拉黑', 'admin');

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `room_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室编号',
  `room_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教室名称',
  `building_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属教学楼编号',
  `room_floor` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层',
  `available_seat` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可用座位数',
  `is_multimedia_room` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多媒体教室',
  PRIMARY KEY (`room_id`, `building_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教室' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES ('101', '教室一', '1', '1', '100', '否');
INSERT INTO `classroom` VALUES ('201', '教室二', '2', '2', '20', '是');
INSERT INTO `classroom` VALUES ('301', '教室三', '3', '3', '30', '是');
INSERT INTO `classroom` VALUES ('401', '教室四', '2', '4', '40', '否');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `s_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生ID',
  `s_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '留言信息',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '留言回复',
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统留言' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1682193114827', 'xx', 'xx', '嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '哈哈', '2023-04-23 19:32:24');
INSERT INTO `message` VALUES ('1682241894632', '210519414', 'xiaogu', 'hello', NULL, '2023-04-23 17:24:54');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公告内容',
  `time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1682180912358', '这是一个公告的测试信息', '这是一个公告的测试信息，请忽略此条信息，谢谢合作！', '2023-04-22 16:28:32');
INSERT INTO `notice` VALUES ('1682184622057', '明日天气预报', '9级大风！注意安全！', '2023-04-22 22:13:50');

-- ----------------------------
-- Table structure for room_available_time_info
-- ----------------------------
DROP TABLE IF EXISTS `room_available_time_info`;
CREATE TABLE `room_available_time_info`  (
  `time_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时段编号',
  `room_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室编号',
  `building_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼编号',
  `available_date` date NOT NULL COMMENT '日期',
  `reservation_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已预约人数',
  `available_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可预约人数',
  PRIMARY KEY (`time_id`, `room_id`, `building_id`, `available_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教室可用时段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_available_time_info
-- ----------------------------
INSERT INTO `room_available_time_info` VALUES ('1', '101', '1', '2023-03-30', '-6', '96');
INSERT INTO `room_available_time_info` VALUES ('1', '101', '1', '2023-04-01', '5', '85');
INSERT INTO `room_available_time_info` VALUES ('1', '201', '2', '2023-03-30', '2', '18');
INSERT INTO `room_available_time_info` VALUES ('10', '201', '2', '2023-03-30', '1', '19');
INSERT INTO `room_available_time_info` VALUES ('11', '201', '2', '2023-03-30', '0', '20');
INSERT INTO `room_available_time_info` VALUES ('12', '201', '2', '2023-03-30', '1', '19');
INSERT INTO `room_available_time_info` VALUES ('2', '101', '1', '2023-03-30', '1', '89');
INSERT INTO `room_available_time_info` VALUES ('3', '101', '1', '2023-03-30', '-2', '92');
INSERT INTO `room_available_time_info` VALUES ('4', '201', '2', '2023-03-30', '1', '19');
INSERT INTO `room_available_time_info` VALUES ('5', '201', '2', '2023-03-30', '1', '19');
INSERT INTO `room_available_time_info` VALUES ('6', '201', '2', '2023-03-30', '0', '20');
INSERT INTO `room_available_time_info` VALUES ('7', '101', '1', '2023-03-30', '1', '89');
INSERT INTO `room_available_time_info` VALUES ('8', '101', '1', '2023-03-30', '0', '90');
INSERT INTO `room_available_time_info` VALUES ('9', '101', '1', '2023-03-30', '0', '90');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `s_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `s_year` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `s_major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `s_phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('10519414', '小顾', '123456', '软工4', '4', '软件工程', '1985176516');
INSERT INTO `student` VALUES ('210519414', 'xiaogu', '1108', '4', '4', 'ruang', NULL);
INSERT INTO `student` VALUES ('32001033', '顾宇欣', '001108', '2019', '4', '软件工程', '13773382582');
INSERT INTO `student` VALUES ('32001041', '文权', '123', '2023', '1', '软件工程', '13579246810');
INSERT INTO `student` VALUES ('32001042', '王紫龙', '123', '2023', '1', '软件工程', '13579246810');
INSERT INTO `student` VALUES ('32001120', '余家好', '123', '2021', '3', '生物', '13579246810');
INSERT INTO `student` VALUES ('32001137', '宋明明', '123', '2022', '2', '环境', '13579246810');
INSERT INTO `student` VALUES ('32001173', '张景宣', '123', '2023', '1', '环境', '13579246810');
INSERT INTO `student` VALUES ('32001199', '余钧豪', '123', '2020', '4', '生物', '13579246810');
INSERT INTO `student` VALUES ('32001257', '诸思成', '123', '2020', '4', '生物', '13579246810');
INSERT INTO `student` VALUES ('32001261', '舒恒鑫', '123', '2021', '3', '生物', '13579246810');
INSERT INTO `student` VALUES ('32001272', '徐彬涵', NULL, '2021', '3', '软件工程', '13579246810');
INSERT INTO `student` VALUES ('32001280', '李鼎辉', '123', '2022', '2', '化学', '13579246810');
INSERT INTO `student` VALUES ('32001286', '何彬玮', '123', '2022', '2', '化学', '13579246810');
INSERT INTO `student` VALUES ('32009081', '傅玉', '123', '2023', '1', '软件工程', '13579246810');
INSERT INTO `student` VALUES ('admin', 'ADMIN', '111', '', '', '', '13579246810');
INSERT INTO `student` VALUES ('xx', 'xx', 'xx', 'xx', 'xx', 'xx', 'xx');
INSERT INTO `student` VALUES ('zz', 'zz', 'zz', 'zz', 'zz', 'zz', 'zz');

-- ----------------------------
-- Table structure for student_reservation
-- ----------------------------
DROP TABLE IF EXISTS `student_reservation`;
CREATE TABLE `student_reservation`  (
  `s_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `time_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时段编号',
  `room_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室编号',
  `building_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼编号',
  `reservation_date` date NOT NULL COMMENT '预约日期',
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `room_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教室名称',
  PRIMARY KEY (`s_id`, `time_id`, `room_id`, `building_id`, `reservation_date`) USING BTREE,
  CONSTRAINT `f01` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自习预约信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_reservation
-- ----------------------------
INSERT INTO `student_reservation` VALUES ('210519414', '2', '101', '1', '2023-03-30', '预约成功', '教室一');
INSERT INTO `student_reservation` VALUES ('32001033', '1', '101', '1', '2023-03-30', '预约取消', '教室一');
INSERT INTO `student_reservation` VALUES ('32001033', '1', '201', '2', '2023-03-30', '预约取消', '教室二');
INSERT INTO `student_reservation` VALUES ('32001033', '10', '201', '2', '2023-03-30', '预约取消', '教室二');
INSERT INTO `student_reservation` VALUES ('32001033', '3', '101', '1', '2023-03-30', '预约取消', '教室一');
INSERT INTO `student_reservation` VALUES ('32001033', '8', '101', '1', '2023-03-30', '预约取消', '教室一');
INSERT INTO `student_reservation` VALUES ('32001041', '11', '201', '2', '2023-03-30', '预约取消', '教室二');
INSERT INTO `student_reservation` VALUES ('32001041', '2', '101', '1', '2023-03-30', '预约取消', '教室一');
INSERT INTO `student_reservation` VALUES ('32001041', '4', '201', '2', '2023-03-30', '预约取消', '教室二');
INSERT INTO `student_reservation` VALUES ('32001042', '7', '101', '1', '2023-03-30', '预约成功', '教室一');
INSERT INTO `student_reservation` VALUES ('32001137', '1', '101', '1', '2023-03-30', '预约成功', '教室一');
INSERT INTO `student_reservation` VALUES ('32001137', '1', '201', '2', '2023-03-30', '预约成功', '教室二');
INSERT INTO `student_reservation` VALUES ('32001137', '10', '201', '2', '2023-03-30', '预约成功', '教室二');
INSERT INTO `student_reservation` VALUES ('32001272', '1', '101', '1', '2023-03-30', '预约成功', '教室一');
INSERT INTO `student_reservation` VALUES ('32001272', '1', '201', '2', '2023-03-30', '预约成功', '教室二');
INSERT INTO `student_reservation` VALUES ('32009081', '1', '101', '1', '2023-03-30', '预约成功', '教室一');
INSERT INTO `student_reservation` VALUES ('32009081', '12', '201', '2', '2023-03-30', '预约成功', '教室二');
INSERT INTO `student_reservation` VALUES ('32009081', '2', '101', '1', '2023-03-30', '预约取消', '教室一');
INSERT INTO `student_reservation` VALUES ('32009081', '4', '201', '2', '2023-03-30', '预约成功', '教室二');
INSERT INTO `student_reservation` VALUES ('32009081', '5', '201', '2', '2023-03-30', '预约成功', '教室二');
INSERT INTO `student_reservation` VALUES ('32009081', '6', '201', '2', '2023-03-30', '预约取消', '教室二');
INSERT INTO `student_reservation` VALUES ('xx', '1', '101', '1', '2023-03-30', '预约取消', '教室一');
INSERT INTO `student_reservation` VALUES ('xx', '1', '101', '1', '2023-04-01', '预约成功', '教室一');

-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS `t_building`;
CREATE TABLE `t_building`  (
  `building_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼编号',
  `building_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼名称',
  `building_phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `building_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在校区',
  PRIMARY KEY (`building_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教学楼' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_building
-- ----------------------------
INSERT INTO `t_building` VALUES ('1', '弘毅', '110', '南校区');
INSERT INTO `t_building` VALUES ('2', '慕贤', '110', '南校区');
INSERT INTO `t_building` VALUES ('3', '致远', '110', '南校区');
INSERT INTO `t_building` VALUES ('4', '精诚', '110', '南校区');

-- ----------------------------
-- Table structure for time_table
-- ----------------------------
DROP TABLE IF EXISTS `time_table`;
CREATE TABLE `time_table`  (
  `time_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时段编号',
  `time_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时段名称',
  `time_begin` time NULL DEFAULT NULL COMMENT '开始时间',
  `time_end` time NULL DEFAULT NULL COMMENT '结束时间',
  `room_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室编号',
  `building_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教学楼',
  PRIMARY KEY (`time_id`, `room_id`, `building_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '时段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time_table
-- ----------------------------
INSERT INTO `time_table` VALUES ('1', '时段一', '07:00:00', '08:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('1', '时段一', '07:00:00', '08:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('1', '时段一', '07:00:00', '08:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('10', '时段十', '16:00:00', '17:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('10', '时段十', '16:00:00', '17:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('10', '时段十', '16:00:00', '17:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('11', '时段十一', '17:00:00', '18:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('11', '时段十一', '17:00:00', '18:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('11', '时段十一', '17:00:00', '18:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('12', '时段十二', '18:00:00', '19:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('12', '时段十二', '18:00:00', '19:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('12', '时段十二', '18:00:00', '19:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('2', '时段二', '08:00:00', '09:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('2', '时段二', '08:00:00', '09:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('2', '时段二', '08:00:00', '09:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('3', '时段三', '09:00:00', '10:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('3', '时段三', '09:00:00', '10:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('3', '时段三', '09:00:00', '10:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('4', '时段四', '10:00:00', '11:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('4', '时段四', '10:00:00', '11:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('4', '时段四', '10:00:00', '11:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('5', '时段五', '11:00:00', '12:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('5', '时段五', '11:00:00', '12:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('5', '时段五', '11:00:00', '12:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('6', '时段六', '12:00:00', '13:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('6', '时段六', '12:00:00', '13:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('6', '时段六', '12:00:00', '13:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('7', '时段七', '13:00:00', '14:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('7', '时段七', '13:00:00', '14:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('7', '时段七', '13:00:00', '14:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('8', '时段八', '14:00:00', '15:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('8', '时段八', '14:00:00', '15:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('8', '时段八', '14:00:00', '15:00:00', '301', '3');
INSERT INTO `time_table` VALUES ('9', '时段九', '15:00:00', '16:00:00', '101', '1');
INSERT INTO `time_table` VALUES ('9', '时段九', '15:00:00', '16:00:00', '201', '2');
INSERT INTO `time_table` VALUES ('9', '时段九', '15:00:00', '16:00:00', '301', '3');

SET FOREIGN_KEY_CHECKS = 1;
