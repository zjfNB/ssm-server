-- --------------------------------------------------------
-- 主机:                           47.101.198.61
-- 服务器版本:                        10.3.21-MariaDB - MariaDB Server
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 ssm_jsmanage_sys 的数据库结构
CREATE DATABASE IF NOT EXISTS `ssm_jsmanage_sys` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `ssm_jsmanage_sys`;

-- 导出  表 ssm_jsmanage_sys.manage 结构
DROP TABLE IF EXISTS `manage`;
CREATE TABLE IF NOT EXISTS `manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_jsmanage_sys.manage 的数据：~0 rows (大约)
DELETE FROM `manage`;
/*!40000 ALTER TABLE `manage` DISABLE KEYS */;
INSERT INTO `manage` (`id`, `userName`, `passWord`, `realName`) VALUES
	(2, 'admin', 'admin', '管理员');
/*!40000 ALTER TABLE `manage` ENABLE KEYS */;

-- 导出  表 ssm_jsmanage_sys.notice 结构
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_jsmanage_sys.notice 的数据：~1 rows (大约)
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`id`, `title`, `content`) VALUES
	(3, '本师资系统审批使用流程', '教师先提交工作审批，然后管理员审批工作。审批通过后教师可以提交工作详情审批，然后管理员审批工作详情。通过后教师提交工作与总结审批，最后由管理员审批并设置积分，最后可以参与工作的排名。');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 导出  表 ssm_jsmanage_sys.teacher 结构
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `xw` varchar(255) DEFAULT NULL COMMENT '学位',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_jsmanage_sys.teacher 的数据：~5 rows (大约)
DELETE FROM `teacher`;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`id`, `username`, `sex`, `password`, `xw`, `phone`, `isDelete`) VALUES
	(1, 'user', '男', '123456', '学位1', '123456789', 0),
	(2, '11', '男', '111111', '1', '1', 1),
	(3, '教师0211', '女', '111111', '学位111', '222222', 0),
	(4, '教师03', '女', '111111', '学位3', '3333333333', 0),
	(5, '测试001', '男', '222222', '本科', '18796252921', 0);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

-- 导出  表 ssm_jsmanage_sys.teacherclass 结构
DROP TABLE IF EXISTS `teacherclass`;
CREATE TABLE IF NOT EXISTS `teacherclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) DEFAULT NULL,
  `bj` varchar(255) DEFAULT NULL COMMENT '班级',
  `xk` varchar(255) DEFAULT NULL COMMENT '学科',
  `address` varchar(255) DEFAULT NULL COMMENT '上课地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_jsmanage_sys.teacherclass 的数据：~4 rows (大约)
DELETE FROM `teacherclass`;
/*!40000 ALTER TABLE `teacherclass` DISABLE KEYS */;
INSERT INTO `teacherclass` (`id`, `teacherId`, `bj`, `xk`, `address`) VALUES
	(1, 4, '教师03-01班级', '语文', '教学楼01'),
	(2, 4, '教师03-02班级', '数学', '教学楼02'),
	(3, 4, '教师03-03班级11', '英语11', '教学楼0311'),
	(5, 5, '教师03-01班级', '语文', 'xxxx');
/*!40000 ALTER TABLE `teacherclass` ENABLE KEYS */;

-- 导出  表 ssm_jsmanage_sys.xm 结构
DROP TABLE IF EXISTS `xm`;
CREATE TABLE `xm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `work` varchar(10) DEFAULT NULL COMMENT '类型一',
  `workType` varchar(10) DEFAULT NULL COMMENT '类型二',
  `beginDate` date DEFAULT NULL COMMENT '监考时间，开课时间，论文答辩时间',
  `status` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xm
-- ----------------------------
INSERT INTO `xm` VALUES ('10', '1', '17级计算机一班微机原理课程', '教学工作test', '授课', '专业课', '2021-04-18', '5', null);
INSERT INTO `xm` VALUES ('20', '1', '一类论文批改', null, '监考', '一类论文', '2021-04-09', '2', null);
INSERT INTO `xm` VALUES ('21', '1', '论文答辩', null, '论文', '一类论文', '2021-04-18', '8', null);
INSERT INTO `xm` VALUES ('23', '1', '实验课监考', null, '监考', '实验课', '2021-04-27', '-1', null);
/*!40000 ALTER TABLE `xm` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
