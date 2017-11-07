/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.26-log : Database - rds_db_dev
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rds_db_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `rds_db_dev`;

/*Table structure for table `baijiaxing` */

DROP TABLE IF EXISTS `baijiaxing`;

CREATE TABLE `baijiaxing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `crawler_eip` */

DROP TABLE IF EXISTS `crawler_eip`;

CREATE TABLE `crawler_eip` (
  `ip` varchar(32) NOT NULL,
  `question_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `question_catalog_url` */

DROP TABLE IF EXISTS `question_catalog_url`;

CREATE TABLE `question_catalog_url` (
  `id` bigint(20) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_apk` */

DROP TABLE IF EXISTS `t_apk`;

CREATE TABLE `t_apk` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fileName` varchar(255) NOT NULL COMMENT '文件名称',
  `eightFileUrl` varchar(255) NOT NULL COMMENT '8寸文件地址',
  `nineFileUrl` varchar(255) NOT NULL COMMENT '9寸文件地址',
  `versionCode` varchar(255) NOT NULL COMMENT '版本',
  `versionType` int(11) NOT NULL COMMENT '端',
  `fileSize` bigint(20) NOT NULL COMMENT '文件大小',
  `uploadTime` datetime NOT NULL COMMENT '上传时间',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `reviewName` varchar(255) NOT NULL COMMENT '评审单名称',
  `reviewUrl` varchar(255) NOT NULL COMMENT '评审单地址',
  `clearData` int(11) NOT NULL COMMENT '是否清空安装包数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='安装包';

/*Table structure for table `t_apk_school` */

DROP TABLE IF EXISTS `t_apk_school`;

CREATE TABLE `t_apk_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apkId` int(11) NOT NULL COMMENT '安装包',
  `schoolId` bigint(20) NOT NULL COMMENT '学校',
  `authorizeTime` datetime NOT NULL COMMENT '授权时间',
  `state` int(11) NOT NULL COMMENT '是否目标版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学校安装包';

/*Table structure for table `t_app` */

DROP TABLE IF EXISTS `t_app`;

CREATE TABLE `t_app` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(50) DEFAULT NULL,
  `app_title_path` varchar(100) DEFAULT NULL,
  `app_comment` varchar(200) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `create_userid` bigint(20) NOT NULL,
  `create_username` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_comment` varchar(1000) DEFAULT NULL,
  `update_userid` bigint(20) DEFAULT NULL,
  `update_username` varchar(200) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_comment` varchar(1000) DEFAULT NULL,
  `app_type` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_app_version` */

DROP TABLE IF EXISTS `t_app_version`;

CREATE TABLE `t_app_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `TYPE` int(11) NOT NULL COMMENT '设备类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_app_version__school` */

DROP TABLE IF EXISTS `t_app_version__school`;

CREATE TABLE `t_app_version__school` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `schoolId` bigint(20) NOT NULL COMMENT '学校',
  `versionId` bigint(20) NOT NULL COMMENT '版本',
  `TYPE` int(11) NOT NULL COMMENT '设备类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_article` */

DROP TABLE IF EXISTS `t_article`;

CREATE TABLE `t_article` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `key_point` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_assistbook_manage` */

DROP TABLE IF EXISTS `t_assistbook_manage`;

CREATE TABLE `t_assistbook_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `subject_id` int(11) NOT NULL COMMENT '科目id',
  `textbook_version_id` int(11) NOT NULL COMMENT '教材版本id',
  `grade_id` int(11) NOT NULL COMMENT '年级id',
  `origin_catalog_id` int(11) NOT NULL COMMENT '来源教辅id',
  `origin_school_id` int(11) NOT NULL COMMENT '来源学校',
  `assigner_id` int(11) NOT NULL COMMENT '分配人',
  `assign_date` datetime NOT NULL COMMENT '分配时间',
  `related_catalog_id` int(11) NOT NULL COMMENT '对应目录id',
  `related_catalog_name` varchar(50) NOT NULL COMMENT '对应目录名称',
  `related_school_id` int(11) NOT NULL COMMENT '对应学校id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` varchar(2) NOT NULL COMMENT '状态(00 有效:  99 无效)',
  PRIMARY KEY (`id`),
  KEY `Index_from_catalog_id` (`origin_catalog_id`),
  KEY `Index_to_catalog_id` (`related_catalog_id`),
  KEY `Index_subject_id` (`subject_id`),
  KEY `Index_grade_id` (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COMMENT='教辅管理表';

/*Table structure for table `t_catalog_relation` */

DROP TABLE IF EXISTS `t_catalog_relation`;

CREATE TABLE `t_catalog_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `catalog_id` bigint(20) DEFAULT NULL COMMENT '新建目录type类型为教辅的id',
  `related_catalog_id` bigint(20) DEFAULT NULL COMMENT '章节目录id',
  `create_date` datetime DEFAULT NULL COMMENT '创建id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_catalog_statistics` */

DROP TABLE IF EXISTS `t_catalog_statistics`;

CREATE TABLE `t_catalog_statistics` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `correct_rate` bigint(20) DEFAULT NULL,
  `result_times` bigint(20) DEFAULT NULL,
  `catalog_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20741 DEFAULT CHARSET=utf8;

/*Table structure for table `t_chapter_knowledge_relation` */

DROP TABLE IF EXISTS `t_chapter_knowledge_relation`;

CREATE TABLE `t_chapter_knowledge_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `chapter_id` int(11) DEFAULT NULL,
  `knowledge_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `question_num` int(11) DEFAULT NULL,
  `status` varchar(2) DEFAULT '00',
  PRIMARY KEY (`id`),
  KEY `index_chapter_id` (`chapter_id`),
  KEY `index_knowledge_id` (`knowledge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=669 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_class_course` */

DROP TABLE IF EXISTS `t_class_course`;

CREATE TABLE `t_class_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(45) NOT NULL COMMENT '标题',
  `description` varchar(400) DEFAULT NULL,
  `teacherId` int(11) NOT NULL COMMENT '老师',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `enable` int(11) NOT NULL COMMENT '是否启用',
  `subjectId` int(11) NOT NULL COMMENT '科目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COMMENT='课程';

/*Table structure for table `t_class_course__catalog` */

DROP TABLE IF EXISTS `t_class_course__catalog`;

CREATE TABLE `t_class_course__catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `catalogId` int(11) NOT NULL COMMENT '知识点',
  `courseId` int(11) NOT NULL COMMENT '课程',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8mb4 COMMENT='课程知识点关联';

/*Table structure for table `t_class_course__class` */

DROP TABLE IF EXISTS `t_class_course__class`;

CREATE TABLE `t_class_course__class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `classId` int(11) NOT NULL COMMENT '班级',
  `teacherId` int(11) NOT NULL COMMENT '老师',
  `startTime` datetime NOT NULL COMMENT '上课时间',
  `endTime` datetime DEFAULT NULL COMMENT '下课时间',
  `status` int(11) NOT NULL COMMENT '状态（上课中，已下课）',
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `description` varchar(400) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=563 DEFAULT CHARSET=utf8mb4 COMMENT='课程班级关联';

/*Table structure for table `t_class_course__class__asked_question` */

DROP TABLE IF EXISTS `t_class_course__class__asked_question`;

CREATE TABLE `t_class_course__class__asked_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `classId` int(11) NOT NULL COMMENT '班级',
  `questionId` int(11) NOT NULL COMMENT '题目',
  `teacherId` int(11) NOT NULL COMMENT '老师',
  `askTime` datetime NOT NULL COMMENT '提问时间',
  `homeworkId` int(11) NOT NULL COMMENT '作业',
  `courseClassId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='课程班级已提问题目关联';

/*Table structure for table `t_class_course__class__asked_question__student` */

DROP TABLE IF EXISTS `t_class_course__class__asked_question__student`;

CREATE TABLE `t_class_course__class__asked_question__student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `classId` int(11) NOT NULL COMMENT '班级',
  `questionId` int(11) NOT NULL COMMENT '题目',
  `studentId` int(11) NOT NULL COMMENT '学生',
  `status` int(11) NOT NULL COMMENT '状态',
  `submitTime` datetime DEFAULT NULL COMMENT '提交时间',
  `imageUrls` varchar(1000) DEFAULT NULL COMMENT '图片作答',
  `texts` varchar(1000) DEFAULT NULL COMMENT '文本作答',
  `audios` varchar(1000) DEFAULT NULL COMMENT '语音作答',
  `paths` varchar(1000) DEFAULT NULL COMMENT '笔迹作答',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `accuracy` int(11) DEFAULT NULL COMMENT '正确率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程班级已提问题目学生答案关联';

/*Table structure for table `t_class_course__class__customize_ppt` */

DROP TABLE IF EXISTS `t_class_course__class__customize_ppt`;

CREATE TABLE `t_class_course__class__customize_ppt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `classId` int(11) NOT NULL COMMENT '班级',
  `imageUrl` varchar(255) NOT NULL COMMENT '课件请求地址',
  `teacherId` int(11) NOT NULL COMMENT '老师',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `fileName` varchar(100) NOT NULL,
  `fileSize` int(10) NOT NULL,
  `courseClassId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COMMENT='课程班级推送为课件';

/*Table structure for table `t_class_course__class__customize_question` */

DROP TABLE IF EXISTS `t_class_course__class__customize_question`;

CREATE TABLE `t_class_course__class__customize_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacherId` int(11) NOT NULL COMMENT '老师',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `imageUrl` varchar(255) NOT NULL COMMENT '题目请求地址',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `classId` int(11) NOT NULL COMMENT '班级',
  `homeworkId` int(11) NOT NULL COMMENT '作业',
  `courseClassId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COMMENT='课程班级推送为题目';

/*Table structure for table `t_class_course__class__customize_question__student` */

DROP TABLE IF EXISTS `t_class_course__class__customize_question__student`;

CREATE TABLE `t_class_course__class__customize_question__student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `classId` int(11) NOT NULL COMMENT '班级',
  `customize_question_id` int(11) NOT NULL COMMENT '推送为题目',
  `studentId` int(11) NOT NULL COMMENT '学生',
  `status` int(11) NOT NULL COMMENT '状态',
  `submitTime` datetime NOT NULL COMMENT '提交时间',
  `imageUrls` varchar(1000) DEFAULT NULL COMMENT '图片作答',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程班级推送为题目学生答案';

/*Table structure for table `t_class_course__class__detection__homework` */

DROP TABLE IF EXISTS `t_class_course__class__detection__homework`;

CREATE TABLE `t_class_course__class__detection__homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `classId` int(11) NOT NULL COMMENT '班级',
  `detectionId` int(11) NOT NULL COMMENT '随堂检测模版',
  `homeworkId` int(11) NOT NULL COMMENT '随堂检测',
  `courseClassId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COMMENT='课程班级随堂检测关联';

/*Table structure for table `t_class_course__detection` */

DROP TABLE IF EXISTS `t_class_course__detection`;

CREATE TABLE `t_class_course__detection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `detectionId` int(11) NOT NULL COMMENT '随堂检测模版',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COMMENT='课程随堂检测模版关联';

/*Table structure for table `t_class_course__ppt` */

DROP TABLE IF EXISTS `t_class_course__ppt`;

CREATE TABLE `t_class_course__ppt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `pptId` varchar(36) DEFAULT NULL,
  `courseClassId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8mb4 COMMENT='课程课件关联';

/*Table structure for table `t_class_course__question` */

DROP TABLE IF EXISTS `t_class_course__question`;

CREATE TABLE `t_class_course__question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseId` int(11) NOT NULL COMMENT '课程',
  `questionId` int(11) NOT NULL COMMENT '题目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='课程题目关联';

/*Table structure for table `t_class_course_video` */

DROP TABLE IF EXISTS `t_class_course_video`;

CREATE TABLE `t_class_course_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `videoId` varchar(50) CHARACTER SET utf8 NOT NULL,
  `courseClassId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_class_detection` */

DROP TABLE IF EXISTS `t_class_detection`;

CREATE TABLE `t_class_detection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(45) NOT NULL COMMENT '标题',
  `teacherId` int(11) NOT NULL COMMENT '老师',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COMMENT='随堂检测模版';

/*Table structure for table `t_class_detection__question` */

DROP TABLE IF EXISTS `t_class_detection__question`;

CREATE TABLE `t_class_detection__question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `detectionId` int(11) NOT NULL COMMENT '随堂检测模版',
  `questionId` int(11) NOT NULL COMMENT '题目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1467 DEFAULT CHARSET=utf8mb4 COMMENT='随堂检测模版题目关联';

/*Table structure for table `t_classes` */

DROP TABLE IF EXISTS `t_classes`;

CREATE TABLE `t_classes` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `im_id` bigint(20) DEFAULT NULL,
  `imp_id` bigint(20) DEFAULT NULL,
  `class_name` varchar(30) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `grade_name` varchar(30) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(30) DEFAULT NULL,
  `class_desc` varchar(200) DEFAULT NULL,
  `leader_userid` bigint(20) DEFAULT NULL,
  `Leader_username` varchar(30) DEFAULT NULL,
  `tag_name` varchar(100) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_username` varchar(30) DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `tribe_icon` varchar(100) DEFAULT NULL,
  `tribep_icon` varchar(100) DEFAULT NULL,
  `impt_id` bigint(20) DEFAULT NULL,
  `class_start_date` datetime DEFAULT NULL,
  `notice` varchar(1000) DEFAULT NULL,
  `im_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8;

/*Table structure for table `t_classschedule` */

DROP TABLE IF EXISTS `t_classschedule`;

CREATE TABLE `t_classschedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `schoolName` varchar(255) DEFAULT NULL,
  `classId` bigint(20) DEFAULT NULL,
  `className` varchar(255) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createUserId` bigint(20) DEFAULT NULL,
  `createUserName` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_course_student_interact` */

DROP TABLE IF EXISTS `t_course_student_interact`;

CREATE TABLE `t_course_student_interact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `interact_id` int(11) NOT NULL,
  `course_question_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `stat` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `answer` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL COMMENT '提交作答时间',
  `result` int(11) DEFAULT NULL COMMENT '作答结果 1.错误,2.正确.3半对',
  `answer_img` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '学生图片提交',
  `answer_aud` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '学生音频提交',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5535 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_course_student_interact_children` */

DROP TABLE IF EXISTS `t_course_student_interact_children`;

CREATE TABLE `t_course_student_interact_children` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `children_id` int(11) DEFAULT NULL,
  `parent_question_id` int(11) DEFAULT NULL,
  `interact_id` int(11) DEFAULT NULL,
  `csi_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `answer_img` varchar(1000) DEFAULT NULL,
  `answer_aud` varchar(1000) DEFAULT NULL,
  `question_type` int(5) DEFAULT NULL,
  `feature_code` varchar(6) DEFAULT NULL,
  `result` int(5) DEFAULT NULL,
  `score` int(5) DEFAULT NULL,
  `submit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_feedback` */

DROP TABLE IF EXISTS `t_feedback`;

CREATE TABLE `t_feedback` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_id` int(11) DEFAULT NULL,
  `version_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `app_type` int(11) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_comments` varchar(1000) DEFAULT NULL,
  `update_userid` bigint(20) DEFAULT NULL,
  `update_username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `update_comments` varchar(1000) DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_feedback_question` */

DROP TABLE IF EXISTS `t_feedback_question`;

CREATE TABLE `t_feedback_question` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `question_type` int(11) DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `class_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_comments` varchar(1000) DEFAULT NULL,
  `update_userid` bigint(20) DEFAULT NULL,
  `update_username` varchar(0) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `update_comments` varchar(1000) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `homework_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1611 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_grade` */

DROP TABLE IF EXISTS `t_grade`;

CREATE TABLE `t_grade` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(30) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(30) DEFAULT NULL,
  `grade_desc` varchar(200) DEFAULT NULL,
  `leader_userid` bigint(20) DEFAULT NULL,
  `Leader_username` varchar(30) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_userid` bigint(20) DEFAULT NULL,
  `create_username` varchar(30) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `subjects` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=950 DEFAULT CHARSET=utf8;

/*Table structure for table `t_grade_leader` */

DROP TABLE IF EXISTS `t_grade_leader`;

CREATE TABLE `t_grade_leader` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `gradeid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

/*Table structure for table `t_gradeupgrade` */

DROP TABLE IF EXISTS `t_gradeupgrade`;

CREATE TABLE `t_gradeupgrade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `schoolId` bigint(20) DEFAULT NULL,
  `gradeId` bigint(20) DEFAULT NULL,
  `upgradeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8;

/*Table structure for table `t_homework` */

DROP TABLE IF EXISTS `t_homework`;

CREATE TABLE `t_homework` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `homework_name` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(30) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `class_name` varchar(30) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `grade_name` varchar(30) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(30) DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expired_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `stat` int(11) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_username` varchar(30) DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `show_stat` int(11) DEFAULT NULL,
  `homework_type` int(11) DEFAULT '1',
  `answer_time` int(11) DEFAULT NULL,
  `homework_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `create_userid` (`create_userid`),
  KEY `index_class_id` (`class_id`) USING BTREE,
  KEY `IDX_CLASS_ID_SUBJECT_ID` (`class_id`,`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58059 DEFAULT CHARSET=utf8;

/*Table structure for table `t_homework_question` */

DROP TABLE IF EXISTS `t_homework_question`;

CREATE TABLE `t_homework_question` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `homework_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `question_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `homework_id` (`homework_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233459 DEFAULT CHARSET=utf8;

/*Table structure for table `t_homework_stu` */

DROP TABLE IF EXISTS `t_homework_stu`;

CREATE TABLE `t_homework_stu` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `homework_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `submit_date` timestamp NULL DEFAULT NULL,
  `parent_sign` longtext,
  `sign_date` datetime DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `markType` int(11) DEFAULT NULL,
  `markColor` varchar(255) DEFAULT NULL,
  `total_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `homework_id` (`homework_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=349108 DEFAULT CHARSET=utf8;

/*Table structure for table `t_homeworkcache` */

DROP TABLE IF EXISTS `t_homeworkcache`;

CREATE TABLE `t_homeworkcache` (
  `_id` bigint(20) NOT NULL,
  `homework_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `grade_name` varchar(255) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `expired_time` datetime DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `show_stat` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_username` varchar(255) DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `homework_type` int(11) DEFAULT '1',
  `answer_time` int(11) DEFAULT NULL,
  `homework_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `index_subject_id` (`subject_id`),
  KEY `index_class_id` (`class_id`),
  KEY `index_create_userid` (`create_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_imlog` */

DROP TABLE IF EXISTS `t_imlog`;

CREATE TABLE `t_imlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `stat` int(11) DEFAULT NULL COMMENT '状态:  0 成功,1 失败',
  `param_log` varchar(1000) DEFAULT NULL COMMENT '这次操作openIm发送的log',
  `return_log` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '这次操作openIm返回的log',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_desc` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建描述,默认这次 im操作的一些参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5874 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_lesson` */

DROP TABLE IF EXISTS `t_lesson`;

CREATE TABLE `t_lesson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classScheduleId` bigint(20) DEFAULT NULL,
  `lesson` int(11) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `mondaySubjectId` bigint(20) DEFAULT NULL,
  `mondaySubjectName` varchar(255) DEFAULT NULL,
  `tuesdaySubjectId` bigint(20) DEFAULT NULL,
  `tuesdaySubjectName` varchar(255) DEFAULT NULL,
  `wednesdaySubjectId` bigint(20) DEFAULT NULL,
  `wednesdaySubjectName` varchar(255) DEFAULT NULL,
  `thursdaySubjectId` bigint(20) DEFAULT NULL,
  `thursdaySubjectName` varchar(255) DEFAULT NULL,
  `fridaySubjectId` bigint(20) DEFAULT NULL,
  `fridaySubjectName` varchar(255) DEFAULT NULL,
  `saturdaySubjectId` bigint(20) DEFAULT NULL,
  `saturdaySubjectName` varchar(255) DEFAULT NULL,
  `sundaySubjectId` bigint(20) DEFAULT NULL,
  `sundaySubjectName` varchar(255) DEFAULT NULL,
  `mondaySubjectDescribe` varchar(100) DEFAULT NULL,
  `tuesdaySubjectDescribe` varchar(100) DEFAULT NULL,
  `wednesdaySubjectDescribe` varchar(100) DEFAULT NULL,
  `thursdaySubjectDescribe` varchar(100) DEFAULT NULL,
  `fridaySubjectDescribe` varchar(100) DEFAULT NULL,
  `saturdaySubjectDescribe` varchar(100) DEFAULT NULL,
  `sundaySubjectDescribe` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_loginlog` */

DROP TABLE IF EXISTS `t_loginlog`;

CREATE TABLE `t_loginlog` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `imeiNumber` varchar(255) DEFAULT NULL,
  `iccId` varchar(255) DEFAULT NULL,
  `modelName` varchar(255) DEFAULT NULL,
  `versionName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=169610 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_mall_advertisement` */

DROP TABLE IF EXISTS `t_mall_advertisement`;

CREATE TABLE `t_mall_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `advertisementUrl` varchar(255) NOT NULL COMMENT '广告地址',
  `enable` int(11) NOT NULL COMMENT '是否启用',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `createUserId` int(11) NOT NULL COMMENT '创建用户',
  `updateUserId` int(11) DEFAULT NULL COMMENT '更新用户',
  `title` varchar(45) NOT NULL COMMENT '标题',
  `sequence` int(11) NOT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商城广告位';

/*Table structure for table `t_mall_application` */

DROP TABLE IF EXISTS `t_mall_application`;

CREATE TABLE `t_mall_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `detail` varchar(255) NOT NULL COMMENT '详情',
  `summary` varchar(255) NOT NULL COMMENT '简介',
  `imageUrl` varchar(255) NOT NULL COMMENT '图标',
  `downloadCount` int(11) NOT NULL DEFAULT '0' COMMENT '下载量',
  `createUserId` int(11) NOT NULL COMMENT '创建用户',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateUserId` int(11) DEFAULT NULL COMMENT '更新用户',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `enable` int(11) NOT NULL COMMENT '是否启用',
  `developer` varchar(45) NOT NULL COMMENT '开发者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用软件';

/*Table structure for table `t_mall_class__disabled_application` */

DROP TABLE IF EXISTS `t_mall_class__disabled_application`;

CREATE TABLE `t_mall_class__disabled_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classId` int(11) NOT NULL COMMENT '班级',
  `applicationId` int(11) NOT NULL COMMENT '应用软件',
  `teacherId` int(11) NOT NULL COMMENT '班主任',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级禁购应用软件';

/*Table structure for table `t_mall_classification` */

DROP TABLE IF EXISTS `t_mall_classification`;

CREATE TABLE `t_mall_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `parentId` int(11) DEFAULT NULL COMMENT '上一级',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `createUserId` int(11) NOT NULL COMMENT '创建用户',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `updateUserId` int(11) DEFAULT NULL COMMENT '更新用户',
  `enable` int(11) NOT NULL COMMENT '是否启用',
  `sequence` int(11) NOT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用分类';

/*Table structure for table `t_mall_classification__application` */

DROP TABLE IF EXISTS `t_mall_classification__application`;

CREATE TABLE `t_mall_classification__application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classificationId` int(11) NOT NULL COMMENT '应用分类',
  `applicationId` int(11) NOT NULL COMMENT '应用软件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用分类与应用软件关联表';

/*Table structure for table `t_mall_user__application` */

DROP TABLE IF EXISTS `t_mall_user__application`;

CREATE TABLE `t_mall_user__application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `studentId` int(11) NOT NULL COMMENT '学生',
  `applicationId` int(11) NOT NULL COMMENT '应用软件',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生已购应用软件';

/*Table structure for table `t_mall_version` */

DROP TABLE IF EXISTS `t_mall_version`;

CREATE TABLE `t_mall_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `applicationId` int(11) NOT NULL COMMENT '商城应用',
  `code` varchar(45) NOT NULL COMMENT '版本号',
  `downloadUrl` varchar(255) NOT NULL COMMENT '下载地址',
  `size` bigint(20) NOT NULL COMMENT '文件大小（B）',
  `createUserId` int(11) NOT NULL COMMENT '创建用户',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateUserId` int(11) DEFAULT NULL COMMENT '更新用户',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `enable` int(11) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商城应用版本';

/*Table structure for table `t_notice` */

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` longtext,
  `noticeType` int(11) DEFAULT NULL,
  `noticeStatus` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `createComments` varchar(255) DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `modifyComments` varchar(255) DEFAULT NULL,
  `createUserId` bigint(20) DEFAULT NULL,
  `modifyUserId` bigint(20) DEFAULT NULL,
  `createUserName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modifyUserName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `schoolName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `order_number` varchar(100) NOT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `class_ids` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `teacher_bright` int(11) DEFAULT NULL,
  `teacher_bright_bak` int(11) DEFAULT NULL,
  `student_black` int(11) DEFAULT NULL,
  `student_black_bak` int(11) DEFAULT NULL,
  `student_bright` int(11) DEFAULT NULL,
  `student_bright_bak` int(11) DEFAULT NULL,
  `pen` int(11) DEFAULT NULL,
  `battery` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_comment` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `_id` bigint(20) DEFAULT NULL,
  `pen_black` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_order_item` */

DROP TABLE IF EXISTS `t_order_item`;

CREATE TABLE `t_order_item` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8 NOT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `teacher_bright` int(11) DEFAULT NULL,
  `student_bright` int(11) DEFAULT NULL,
  `student_black` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_order_trace` */

DROP TABLE IF EXISTS `t_order_trace`;

CREATE TABLE `t_order_trace` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `iccid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `imei` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `handle` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `express` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `reason` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_comment` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_organize` */

DROP TABLE IF EXISTS `t_organize`;

CREATE TABLE `t_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `organize_code` varchar(100) NOT NULL COMMENT '组织编码',
  `organize_name` varchar(100) NOT NULL COMMENT '组织名称',
  `organize_type` varchar(10) NOT NULL COMMENT '组织类型',
  `sequence` int(11) DEFAULT NULL COMMENT '顺序',
  `chiefly_user_id` int(11) DEFAULT NULL COMMENT '首要负责人',
  `minor_user_id` int(11) DEFAULT NULL COMMENT '次要负责人',
  `status` varchar(2) NOT NULL COMMENT '状态',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_oganize_code` (`organize_code`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='t_organize';

/*Table structure for table `t_organize_permission` */

DROP TABLE IF EXISTS `t_organize_permission`;

CREATE TABLE `t_organize_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `organize_id` int(11) NOT NULL COMMENT '组织id',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  `status` varchar(10) NOT NULL COMMENT '状态',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='组织权限表';

/*Table structure for table `t_organize_role` */

DROP TABLE IF EXISTS `t_organize_role`;

CREATE TABLE `t_organize_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `organize_id` int(11) NOT NULL COMMENT '组织id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `status` varchar(10) NOT NULL COMMENT '状态',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='组织角色表';

/*Table structure for table `t_permission` */

DROP TABLE IF EXISTS `t_permission`;

CREATE TABLE `t_permission` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `per_name` varchar(30) DEFAULT NULL,
  `parent_value` int(11) DEFAULT NULL,
  `per_value` int(11) DEFAULT NULL,
  `per_type` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `per_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

/*Table structure for table `t_personalclassschedule` */

DROP TABLE IF EXISTS `t_personalclassschedule`;

CREATE TABLE `t_personalclassschedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `schoolName` varchar(255) DEFAULT NULL,
  `classId` bigint(20) DEFAULT NULL,
  `className` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createUserId` bigint(20) DEFAULT NULL,
  `createUserName` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_personallesson` */

DROP TABLE IF EXISTS `t_personallesson`;

CREATE TABLE `t_personallesson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `personalClassScheduleId` bigint(20) DEFAULT NULL,
  `lesson` int(11) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `mondaySubjectId` bigint(20) DEFAULT NULL,
  `mondaySubjectName` varchar(255) DEFAULT NULL,
  `tuesdaySubjectId` bigint(20) DEFAULT NULL,
  `tuesdaySubjectName` varchar(255) DEFAULT NULL,
  `wednesdaySubjectId` bigint(20) DEFAULT NULL,
  `wednesdaySubjectName` varchar(255) DEFAULT NULL,
  `thursdaySubjectId` bigint(20) DEFAULT NULL,
  `thursdaySubjectName` varchar(255) DEFAULT NULL,
  `fridaySubjectId` bigint(20) DEFAULT NULL,
  `fridaySubjectName` varchar(255) DEFAULT NULL,
  `saturdaySubjectId` bigint(20) DEFAULT NULL,
  `saturdaySubjectName` varchar(255) DEFAULT NULL,
  `sundaySubjectId` bigint(20) DEFAULT NULL,
  `sundaySubjectName` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_prep_preview` */

DROP TABLE IF EXISTS `t_prep_preview`;

CREATE TABLE `t_prep_preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacherId` int(11) NOT NULL COMMENT '发布老师',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `subjectId` int(11) NOT NULL COMMENT '科目',
  `schoolId` int(11) NOT NULL COMMENT '学校',
  `sendTime` datetime NOT NULL COMMENT '发送时间',
  `expiredTime` datetime NOT NULL COMMENT '截止时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `question` varchar(1000) DEFAULT NULL COMMENT '感想',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COMMENT='预习';

/*Table structure for table `t_prep_preview__class` */

DROP TABLE IF EXISTS `t_prep_preview__class`;

CREATE TABLE `t_prep_preview__class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `previewId` int(11) NOT NULL COMMENT '预习',
  `classId` int(11) NOT NULL COMMENT '班级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COMMENT='预习班级关联';

/*Table structure for table `t_prep_preview__ppt` */

DROP TABLE IF EXISTS `t_prep_preview__ppt`;

CREATE TABLE `t_prep_preview__ppt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `previewId` int(11) NOT NULL COMMENT '预习',
  `pptId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8mb4 COMMENT='预习课件关联';

/*Table structure for table `t_prep_preview__student` */

DROP TABLE IF EXISTS `t_prep_preview__student`;

CREATE TABLE `t_prep_preview__student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `previewId` int(11) NOT NULL COMMENT '预习',
  `studentId` int(11) NOT NULL COMMENT '学生',
  `status` int(11) NOT NULL COMMENT '状态',
  `timeCost` int(11) NOT NULL COMMENT '用时',
  `submitTime` datetime DEFAULT NULL COMMENT '提交时间',
  `answer` varchar(1000) DEFAULT NULL COMMENT '答案',
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9928 DEFAULT CHARSET=utf8mb4 COMMENT='预习学生关联';

/*Table structure for table `t_prep_preview__video` */

DROP TABLE IF EXISTS `t_prep_preview__video`;

CREATE TABLE `t_prep_preview__video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `previewId` int(11) NOT NULL COMMENT '预习',
  `videoId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8mb4 COMMENT='预习微客关联';

/*Table structure for table `t_project_params` */

DROP TABLE IF EXISTS `t_project_params`;

CREATE TABLE `t_project_params` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_name` varchar(255) DEFAULT NULL,
  `param_value` varchar(255) DEFAULT NULL,
  `param_type` int(11) DEFAULT NULL,
  `parent_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `index_uniq_paramVal` (`param_value`)
) ENGINE=InnoDB AUTO_INCREMENT=40323 DEFAULT CHARSET=utf8;

/*Table structure for table `t_question` */

DROP TABLE IF EXISTS `t_question`;

CREATE TABLE `t_question` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `analsis` text CHARACTER SET utf8 COLLATE utf8_bin,
  `analsis_thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `analsis_type` int(11) DEFAULT NULL,
  `answer_fills` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `answer_num` int(11) DEFAULT NULL,
  `answer_perch` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `arrange_times` bigint(20) DEFAULT NULL,
  `content_type` int(11) DEFAULT NULL,
  `correct_answer` text CHARACTER SET utf8 COLLATE utf8_bin,
  `correct_rate` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_userId` bigint(20) DEFAULT NULL,
  `create_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `do_times` bigint(20) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `grade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_public` int(11) NOT NULL,
  `key_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `option_num` int(11) DEFAULT NULL,
  `question_content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `question_content_thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `question_type` int(11) NOT NULL,
  `feature_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `subject_id` bigint(20) NOT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_score` int(11) DEFAULT NULL,
  `status` int(5) NOT NULL DEFAULT '0',
  `catalog_id` bigint(20) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`),
  KEY `is_public` (`is_public`),
  KEY `school_id` (`school_id`),
  KEY `subject_id` (`subject_id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `status` (`status`),
  KEY `t_question_question_type_index` (`question_type`),
  KEY `idx_t_question_create` (`create_userId`),
  KEY `index_grade` (`grade_id`),
  KEY `index_featureCode` (`feature_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4394202 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_question_cache` */

DROP TABLE IF EXISTS `t_question_cache`;

CREATE TABLE `t_question_cache` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) DEFAULT NULL,
  `question_content` text,
  `question_content_thumb` varchar(255) DEFAULT NULL,
  `is_public` int(11) DEFAULT NULL,
  `content_type` int(11) DEFAULT NULL,
  `question_type` int(11) DEFAULT NULL,
  `feature_code` varchar(6) DEFAULT NULL,
  `option_num` int(11) DEFAULT NULL,
  `correct_answer` text,
  `total_score` int(11) DEFAULT NULL,
  `analsis_type` int(11) DEFAULT NULL,
  `analsis` text,
  `analsis_thumb` varchar(255) DEFAULT NULL,
  `key_point` text,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `grade_name` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_username` varchar(255) DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `correct_rate` bigint(20) DEFAULT NULL,
  `do_times` bigint(20) DEFAULT NULL,
  `arrange_times` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `answer_num` int(11) DEFAULT NULL,
  `answer_perch` varchar(255) DEFAULT NULL,
  `answer_fills` varchar(4000) DEFAULT NULL,
  `catalog_id` bigint(20) DEFAULT NULL,
  `homework_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `index_question_cache_homeworkId` (`homework_id`) USING BTREE,
  KEY `index_q_cache_questionId` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166648 DEFAULT CHARSET=utf8;

/*Table structure for table `t_question_catalog` */

DROP TABLE IF EXISTS `t_question_catalog`;

CREATE TABLE `t_question_catalog` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catalog_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `parent_catalog_id` bigint(20) DEFAULT NULL,
  `catalog_index` int(11) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `_type` int(11) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `public_flag` int(11) DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `version_index` int(11) DEFAULT NULL,
  `book_index` int(11) DEFAULT NULL,
  `version_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `book_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `position` int(5) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL,
  `question_count` int(11) DEFAULT '0',
  `catalog_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `t_question_catalog_index` (`parent_catalog_id`),
  KEY `t_question_catalog_grade_id` (`grade_id`),
  KEY `t_question_catalog_subject_id` (`subject_id`),
  KEY `index_tqc_type` (`_type`) USING BTREE,
  KEY `inde_tqc_school` (`school_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=235226 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_question_catalog_relation` */

DROP TABLE IF EXISTS `t_question_catalog_relation`;

CREATE TABLE `t_question_catalog_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` bigint(11) NOT NULL,
  `question_id` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_question_id` (`question_id`),
  KEY `index_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8509813 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_question_catalog_relation_old` */

DROP TABLE IF EXISTS `t_question_catalog_relation_old`;

CREATE TABLE `t_question_catalog_relation_old` (
  `_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(11) DEFAULT NULL,
  `catalog_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `question_id` (`question_id`) USING BTREE,
  KEY `catalog_id` (`catalog_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4657046 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `t_question_children` */

DROP TABLE IF EXISTS `t_question_children`;

CREATE TABLE `t_question_children` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_question_id` int(11) NOT NULL COMMENT '所属题干',
  `question_type` int(11) NOT NULL COMMENT '题目类型',
  `feature_code` varchar(20) NOT NULL COMMENT '功能编码',
  `question_title` varchar(5000) DEFAULT NULL,
  `question_options_json` varchar(2000) NOT NULL COMMENT '选项json串',
  `correct_answer` varchar(3000) DEFAULT NULL COMMENT '正确答案',
  `question_analysis` varchar(3000) DEFAULT NULL COMMENT '解析',
  `knowledge_point` varchar(1000) DEFAULT NULL COMMENT '知识点',
  `question_score` int(11) DEFAULT NULL COMMENT '分数',
  `sequence` int(11) DEFAULT NULL COMMENT '顺序',
  `creator_id` int(11) NOT NULL COMMENT '创建者id',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` varchar(2) NOT NULL COMMENT '状态',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `answer_num` int(5) DEFAULT NULL,
  `difficulty` int(2) DEFAULT NULL,
  `option_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_qestion_child_qestionId` (`parent_question_id`),
  KEY `Index_qestion_child_featureCode` (`feature_code`),
  KEY `Index_qestion_child_questType` (`question_type`),
  KEY `Index_qestion_child_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14590 DEFAULT CHARSET=utf8mb4 COMMENT='t_question_children';

/*Table structure for table `t_question_copy` */

DROP TABLE IF EXISTS `t_question_copy`;

CREATE TABLE `t_question_copy` (
  `_id` bigint(20) DEFAULT NULL,
  `analsis` text CHARACTER SET utf8 COLLATE utf8_bin,
  `analsis_thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `analsis_type` int(11) DEFAULT NULL,
  `answer_fills` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `answer_num` int(11) DEFAULT NULL,
  `answer_perch` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `arrange_times` bigint(20) DEFAULT NULL,
  `content_type` int(11) DEFAULT NULL,
  `correct_answer` text CHARACTER SET utf8 COLLATE utf8_bin,
  `correct_rate` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_userId` bigint(20) DEFAULT NULL,
  `create_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `do_times` bigint(20) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `grade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_public` int(11) NOT NULL,
  `key_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `option_num` int(11) DEFAULT NULL,
  `question_content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `question_content_thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `question_type` int(11) NOT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `subject_id` bigint(20) NOT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_score` int(11) DEFAULT NULL,
  `status` int(5) NOT NULL DEFAULT '0',
  `catalog_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_question_feature` */

DROP TABLE IF EXISTS `t_question_feature`;

CREATE TABLE `t_question_feature` (
  `_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '_id',
  `question_type` int(11) NOT NULL COMMENT '题目类型',
  `feature_code` varchar(6) NOT NULL COMMENT '特征编码',
  `feature_desc` varchar(200) NOT NULL COMMENT '特征描述',
  `feature_icon` varchar(100) NOT NULL COMMENT '特征图标',
  `status` varchar(2) NOT NULL COMMENT '状态',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `auto_flag` int(2) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `Index_feature_code` (`feature_code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='题库特征表';

/*Table structure for table `t_question_option` */

DROP TABLE IF EXISTS `t_question_option`;

CREATE TABLE `t_question_option` (
  `option_content` varchar(1000) DEFAULT NULL,
  `option_title` varchar(765) DEFAULT NULL,
  `question_id` double DEFAULT NULL,
  `sequence` double DEFAULT NULL,
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4254905 DEFAULT CHARSET=utf8;

/*Table structure for table `t_question_optioncache` */

DROP TABLE IF EXISTS `t_question_optioncache`;

CREATE TABLE `t_question_optioncache` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `option_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `option_title` varchar(255) DEFAULT NULL,
  `option_content` varchar(1000) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86557 DEFAULT CHARSET=utf8;

/*Table structure for table `t_question_property` */

DROP TABLE IF EXISTS `t_question_property`;

CREATE TABLE `t_question_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) DEFAULT NULL,
  `property_key` varchar(300) DEFAULT NULL,
  `property_value` varchar(1000) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `property_desc` varchar(500) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` datetime DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=796 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_question_relation` */

DROP TABLE IF EXISTS `t_question_relation`;

CREATE TABLE `t_question_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_new` int(11) NOT NULL,
  `catalog_old` int(11) NOT NULL,
  PRIMARY KEY (`id`,`catalog_new`)
) ENGINE=InnoDB AUTO_INCREMENT=29988 DEFAULT CHARSET=utf8;

/*Table structure for table `t_question_result` */

DROP TABLE IF EXISTS `t_question_result`;

CREATE TABLE `t_question_result` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) DEFAULT NULL,
  `homework_id` bigint(20) DEFAULT NULL,
  `question_type` int(11) DEFAULT NULL,
  `solution_content_path` longtext CHARACTER SET utf8,
  `solution_content_img` varchar(1000) DEFAULT NULL,
  `solution_content_aud` varchar(1000) DEFAULT NULL,
  `correct_answer` longtext CHARACTER SET utf8,
  `total_score` int(11) DEFAULT NULL,
  `score_result` int(11) DEFAULT NULL,
  `question_score` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `total_time` int(11) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `comments_path` longtext CHARACTER SET utf8,
  `comments_img` longtext CHARACTER SET utf8,
  `comments_aud` longtext CHARACTER SET utf8,
  `create_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `create_username` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `answer_fills` varchar(255) DEFAULT NULL,
  `student_answer_fills` varchar(2000) DEFAULT NULL,
  `answer_num` int(11) DEFAULT NULL,
  `answer_perch` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `correct_answer_fills` varchar(2000) DEFAULT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `create_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `solution_content_draft` longtext CHARACTER SET utf8,
  `solution_type` int(11) DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `comments_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `solutionContentDoodles` longtext CHARACTER SET utf8,
  `audioDurations` longtext CHARACTER SET utf8,
  `answerImageHeights` longtext CHARACTER SET utf8,
  `answerImagewidths` longtext CHARACTER SET utf8,
  `startTimes` longtext CHARACTER SET utf8,
  `endTimes` longtext CHARACTER SET utf8,
  `commentsDoodles` longtext CHARACTER SET utf8,
  `curr_score` int(11) DEFAULT NULL,
  `audioColors` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `feature_code` varchar(6) DEFAULT NULL,
  `solution_content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `U_oneStudent_oneQuestionResult` (`homework_id`,`question_id`,`create_userid`),
  KEY `homework_id` (`homework_id`),
  KEY `score_result` (`score_result`),
  KEY `index_createuserid` (`create_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=523932 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_question_result_children` */

DROP TABLE IF EXISTS `t_question_result_children`;

CREATE TABLE `t_question_result_children` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `children_id` int(11) DEFAULT NULL,
  `parent_question_id` int(11) DEFAULT NULL,
  `homework_id` int(11) DEFAULT NULL,
  `create_userid` int(11) DEFAULT NULL,
  `solution_content` varchar(1000) DEFAULT NULL,
  `solution_content_img` varchar(1000) DEFAULT NULL,
  `solution_content_aud` varchar(1000) DEFAULT NULL,
  `correct_answer` varchar(1000) DEFAULT NULL,
  `question_type` int(5) DEFAULT NULL,
  `score_result` int(5) DEFAULT NULL,
  `question_score` int(5) DEFAULT NULL,
  `curr_score` int(5) DEFAULT NULL,
  `total_time` int(10) DEFAULT NULL,
  `comments_img` varchar(1000) DEFAULT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `feature_code` varchar(6) DEFAULT NULL,
  `audioDurations` varchar(100) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_qrc_children_id` (`children_id`),
  KEY `index_qrc_parent_question_id` (`parent_question_id`),
  KEY `index_qrc_homework_id` (`homework_id`),
  KEY `index_qrc_create_userid` (`create_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=53886 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_question_result_image` */

DROP TABLE IF EXISTS `t_question_result_image`;

CREATE TABLE `t_question_result_image` (
  `_id` bigint(20) NOT NULL,
  `question_result_id` bigint(20) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_question_statistics` */

DROP TABLE IF EXISTS `t_question_statistics`;

CREATE TABLE `t_question_statistics` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `correct_rate` bigint(20) DEFAULT NULL,
  `result_times` bigint(20) DEFAULT NULL,
  `homework_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60573 DEFAULT CHARSET=utf8;

/*Table structure for table `t_question_type` */

DROP TABLE IF EXISTS `t_question_type`;

CREATE TABLE `t_question_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `question_type` int(11) NOT NULL COMMENT '题目类型',
  `question_type_name` varchar(50) NOT NULL COMMENT '题目类型名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级类型',
  `feature_code_id` int(11) DEFAULT NULL COMMENT '功能编码id',
  `status` varchar(2) NOT NULL,
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_qt_question_type` (`question_type`),
  KEY `Index_qt_feature_code` (`feature_code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='题型表';

/*Table structure for table `t_resource_favorite_group` */

DROP TABLE IF EXISTS `t_resource_favorite_group`;

CREATE TABLE `t_resource_favorite_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) NOT NULL COMMENT '用户',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `sequence` int(11) DEFAULT NULL COMMENT '顺序',
  `type` int(11) NOT NULL COMMENT '类型（微客，课件）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='资源收藏组';

/*Table structure for table `t_resource_favorite_ppt` */

DROP TABLE IF EXISTS `t_resource_favorite_ppt`;

CREATE TABLE `t_resource_favorite_ppt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) NOT NULL COMMENT '用户',
  `groupId` int(11) NOT NULL COMMENT '收藏组',
  `pptId` varchar(36) NOT NULL COMMENT '课件',
  `createTime` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='资源收藏课件';

/*Table structure for table `t_resource_favorite_video` */

DROP TABLE IF EXISTS `t_resource_favorite_video`;

CREATE TABLE `t_resource_favorite_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) NOT NULL COMMENT '用户',
  `groupId` int(11) NOT NULL COMMENT '收藏组',
  `videoId` varchar(36) NOT NULL COMMENT '微客',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='资源收藏微客';

/*Table structure for table `t_resource_ppt` */

DROP TABLE IF EXISTS `t_resource_ppt`;

CREATE TABLE `t_resource_ppt` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `file_name` varchar(200) DEFAULT NULL COMMENT '文件名称',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `catalog_id` int(11) NOT NULL COMMENT '目录id',
  `create_user_id` int(11) NOT NULL COMMENT '创建人',
  `create_username` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `origin` varchar(50) DEFAULT NULL COMMENT '资源来源',
  `resource_status` int(11) DEFAULT NULL COMMENT '资源状态',
  `down_count` int(11) DEFAULT NULL COMMENT '下载次数',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `school_id` int(11) DEFAULT NULL COMMENT '学校id',
  `file_size` double DEFAULT NULL COMMENT '文件大小',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `file_type` int(11) DEFAULT '5',
  `file_describe` varchar(300) DEFAULT NULL COMMENT '描述',
  `place` varchar(50) DEFAULT NULL COMMENT '隐藏资源来源',
  `teach_type` int(5) DEFAULT NULL,
  `public_flag` int(5) DEFAULT NULL,
  `catalog_type` int(11) NOT NULL DEFAULT '1' COMMENT '区分属于1题库目录还是2校内目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='备课资源文件表';

/*Table structure for table `t_resource_video` */

DROP TABLE IF EXISTS `t_resource_video`;

CREATE TABLE `t_resource_video` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `file_name` varchar(200) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `catalog_id` int(11) NOT NULL COMMENT '目录id',
  `create_user_id` int(11) NOT NULL COMMENT '创建人',
  `create_username` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `origin` varchar(50) DEFAULT NULL COMMENT '资源来源',
  `resource_status` int(11) DEFAULT NULL COMMENT '资源状态',
  `down_count` int(11) DEFAULT NULL COMMENT '下载次数',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `school_id` int(11) DEFAULT NULL COMMENT '学校id',
  `file_size` double DEFAULT NULL COMMENT '文件大小',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `file_type` int(11) DEFAULT '5',
  `file_describe` varchar(300) DEFAULT NULL,
  `teach_type` int(5) DEFAULT NULL,
  `public_flag` int(5) DEFAULT NULL,
  `timeCost` int(11) DEFAULT NULL COMMENT '时长',
  `catalog_type` int(11) NOT NULL DEFAULT '1' COMMENT '区分属于1题库目录还是2校内目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微课资源文件表';

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT NULL,
  `role_desc` varchar(100) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `update_comments` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `canModify` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `supperUser` int(11) DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT '00' COMMENT '角色状态',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Table structure for table `t_role_permission` */

DROP TABLE IF EXISTS `t_role_permission`;

CREATE TABLE `t_role_permission` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(20) DEFAULT NULL,
  `permissionid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=766 DEFAULT CHARSET=utf8;

/*Table structure for table `t_school` */

DROP TABLE IF EXISTS `t_school`;

CREATE TABLE `t_school` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(30) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `school_desc` varchar(200) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_userid` bigint(20) DEFAULT NULL,
  `create_username` varchar(30) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) DEFAULT NULL,
  `version_index` int(11) DEFAULT NULL,
  `version_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10135 DEFAULT CHARSET=utf8;

/*Table structure for table `t_school_catalog` */

DROP TABLE IF EXISTS `t_school_catalog`;

CREATE TABLE `t_school_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_name` varchar(50) NOT NULL,
  `catalog_index` int(11) NOT NULL DEFAULT '1',
  `parent_catalog_id` int(11) NOT NULL DEFAULT '0' COMMENT '父目录id，0为顶级目录',
  `leader_parent_id` int(11) NOT NULL COMMENT '题库父目录id',
  `parent_catalog_type` int(11) NOT NULL COMMENT '区分父目录属于1题库目录还是2校内目录',
  `type` int(11) NOT NULL COMMENT '目录类型',
  `create_user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0没有资源没有子目录，1有子目录，2有资源',
  `catalog_status` int(11) NOT NULL DEFAULT '1' COMMENT '目录状态，1可用，0隐藏',
  `school_id` int(11) NOT NULL,
  `sequence` int(11) NOT NULL DEFAULT '1' COMMENT '子目录排序字段',
  `catalog_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_parent_catalog_id` (`parent_catalog_id`) USING BTREE,
  KEY `index_type` (`type`) USING BTREE,
  KEY `index_school_id` (`school_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_school_leader` */

DROP TABLE IF EXISTS `t_school_leader`;

CREATE TABLE `t_school_leader` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

/*Table structure for table `t_school_version` */

DROP TABLE IF EXISTS `t_school_version`;

CREATE TABLE `t_school_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `schoolId` bigint(20) NOT NULL COMMENT '学校',
  `versionName` varchar(255) NOT NULL COMMENT '版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_security_verification` */

DROP TABLE IF EXISTS `t_security_verification`;

CREATE TABLE `t_security_verification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `security_question` varchar(50) NOT NULL,
  `security_answer` varchar(50) NOT NULL,
  `user_id` int(10) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_service_log` */

DROP TABLE IF EXISTS `t_service_log`;

CREATE TABLE `t_service_log` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school_id` bigint(20) DEFAULT NULL,
  `begin_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Table structure for table `t_sim` */

DROP TABLE IF EXISTS `t_sim`;

CREATE TABLE `t_sim` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `sim_iccid` varchar(100) DEFAULT NULL,
  `sim_imsi` varchar(255) DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `sim_iccid` (`sim_iccid`)
) ENGINE=InnoDB AUTO_INCREMENT=2275 DEFAULT CHARSET=utf8;

/*Table structure for table `t_sim_change` */

DROP TABLE IF EXISTS `t_sim_change`;

CREATE TABLE `t_sim_change` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `iccid` varchar(30) NOT NULL,
  `imei` varchar(30) NOT NULL,
  `activated_date` datetime NOT NULL COMMENT '激活变更时间',
  `type` int(11) NOT NULL COMMENT '1 第一次激活，2 变更用户，3 普通激活流程',
  `flag` int(11) NOT NULL COMMENT '0 联通imei， 1 设备imei',
  `sim_desc` varchar(50) DEFAULT NULL COMMENT '注释',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_stu_class` */

DROP TABLE IF EXISTS `t_stu_class`;

CREATE TABLE `t_stu_class` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(20) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4073 DEFAULT CHARSET=utf8;

/*Table structure for table `t_stu_parent` */

DROP TABLE IF EXISTS `t_stu_parent`;

CREATE TABLE `t_stu_parent` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31761 DEFAULT CHARSET=utf8;

/*Table structure for table `t_stu_wrong_questions` */

DROP TABLE IF EXISTS `t_stu_wrong_questions`;

CREATE TABLE `t_stu_wrong_questions` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cout` int(11) DEFAULT NULL,
  `newest_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `score_result` int(11) DEFAULT NULL,
  `_type` int(11) DEFAULT NULL,
  `homework_id` bigint(20) DEFAULT NULL,
  `last_solution_content` longtext CHARACTER SET utf8mb4,
  `last_solution_type` int(11) DEFAULT NULL,
  `question_result_id` bigint(20) DEFAULT NULL,
  `last_answer_fills` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `last_solution_content_path` longtext,
  `last_solution_content_img` longtext,
  `last_solution_content_aud` longtext,
  `question_child_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=182342 DEFAULT CHARSET=utf8;

/*Table structure for table `t_subject_class` */

DROP TABLE IF EXISTS `t_subject_class`;

CREATE TABLE `t_subject_class` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11756 DEFAULT CHARSET=utf8;

/*Table structure for table `t_subject_textbook_relation` */

DROP TABLE IF EXISTS `t_subject_textbook_relation`;

CREATE TABLE `t_subject_textbook_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `grade_flag` int(11) NOT NULL COMMENT '年级标识',
  `subject_id` int(11) NOT NULL COMMENT '科目id',
  `textbook_version_id` int(11) NOT NULL COMMENT '教材版本id',
  `textbook_id` int(11) NOT NULL COMMENT '课本id',
  `status` varchar(2) NOT NULL COMMENT '状态',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=956 DEFAULT CHARSET=utf8mb4 COMMENT='科目教材关系表';

/*Table structure for table `t_subjects` */

DROP TABLE IF EXISTS `t_subjects`;

CREATE TABLE `t_subjects` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(30) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `is_preset` int(11) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_username` varchar(30) DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `subject_icon_url` varchar(500) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

/*Table structure for table `t_teacher_class` */

DROP TABLE IF EXISTS `t_teacher_class`;

CREATE TABLE `t_teacher_class` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(20) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2459 DEFAULT CHARSET=utf8;

/*Table structure for table `t_teacher_class_log` */

DROP TABLE IF EXISTS `t_teacher_class_log`;

CREATE TABLE `t_teacher_class_log` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(20) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_textbook` */

DROP TABLE IF EXISTS `t_textbook`;

CREATE TABLE `t_textbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `book_name` varchar(50) DEFAULT NULL COMMENT '教材课本名称',
  `book_code` varchar(40) DEFAULT NULL COMMENT '教材课本编码',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_textbooke_code` (`book_code`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COMMENT='课本表';

/*Table structure for table `t_textbook_version` */

DROP TABLE IF EXISTS `t_textbook_version`;

CREATE TABLE `t_textbook_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `version_name` varchar(150) NOT NULL COMMENT '教材版本名称',
  `version_code` varchar(120) NOT NULL COMMENT '教材版本编码',
  `status` varchar(6) NOT NULL COMMENT '状态 正常：00；99：异常',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_textbook_version_code` (`version_code`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COMMENT='教材版本表';

/*Table structure for table `t_upload_public_file` */

DROP TABLE IF EXISTS `t_upload_public_file`;

CREATE TABLE `t_upload_public_file` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_stat` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `create_username` varchar(255) DEFAULT NULL,
  `file_describe` varchar(255) DEFAULT NULL,
  `version_index` int(11) DEFAULT NULL,
  `book_index` int(11) DEFAULT NULL,
  `version_name` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `catalog_id` bigint(20) DEFAULT NULL,
  `catalog_name` varchar(255) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `feedback_describe` varchar(255) DEFAULT NULL,
  `grade_name` varchar(255) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `is_public` int(11) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `pwd` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phone_number` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `sex` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `class_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `last_login_time` timestamp NULL DEFAULT NULL,
  `save_pwd_day` int(11) DEFAULT NULL,
  `session_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `channel_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `update_comments` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `im_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `is_useable` int(11) DEFAULT NULL,
  `book_index` int(11) DEFAULT NULL,
  `book_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `version_index` int(11) DEFAULT NULL,
  `version_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `imei_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ICCID` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT '00' COMMENT '用户状态',
  PRIMARY KEY (`_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=30260 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_user_organize` */

DROP TABLE IF EXISTS `t_user_organize`;

CREATE TABLE `t_user_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `organize_id` int(11) NOT NULL COMMENT '组织id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` varchar(10) NOT NULL COMMENT '状态',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='用户组织关系表';

/*Table structure for table `t_user_permission` */

DROP TABLE IF EXISTS `t_user_permission`;

CREATE TABLE `t_user_permission` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) DEFAULT NULL,
  `permissionid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `t_user_question` */

DROP TABLE IF EXISTS `t_user_question`;

CREATE TABLE `t_user_question` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102605 DEFAULT CHARSET=utf8;

/*Table structure for table `t_user_question_group` */

DROP TABLE IF EXISTS `t_user_question_group`;

CREATE TABLE `t_user_question_group` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_user_id` bigint(20) DEFAULT NULL,
  `group_name` varchar(30) DEFAULT NULL,
  `sequence` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20424 DEFAULT CHARSET=utf8;

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `roleid` bigint(20) DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT '00' COMMENT '用户状态',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=998 DEFAULT CHARSET=utf8;

/*Table structure for table `t_version` */

DROP TABLE IF EXISTS `t_version`;

CREATE TABLE `t_version` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(30) DEFAULT NULL,
  `app_type` int(11) DEFAULT NULL,
  `must_upgrade` int(11) DEFAULT NULL,
  `app_file_name` varchar(50) DEFAULT NULL,
  `app_file_path` varchar(100) DEFAULT NULL,
  `app_file_size` bigint(20) DEFAULT NULL,
  `create_userid` bigint(20) DEFAULT NULL,
  `create_username` varchar(50) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_comments` varchar(255) DEFAULT NULL,
  `app_md5` varchar(50) DEFAULT NULL,
  `app_id` bigint(20) NOT NULL,
  `click_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `t_version_index` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
