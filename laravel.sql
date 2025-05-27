/*
 Navicat Premium Data Transfer

 Source Server         : localHost
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : 127.0.0.1:3306
 Source Schema         : laravel

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 27/05/2025 12:49:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_statements
-- ----------------------------
DROP TABLE IF EXISTS `account_statements`;
CREATE TABLE `account_statements`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `date_search` date NOT NULL,
  `debit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `credit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `balance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accountType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_statements_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `account_statements_supplier_id_foreign`(`supplier_id`) USING BTREE,
  INDEX `account_statements_invoice_id_foreign`(`invoice_id`) USING BTREE,
  INDEX `account_statements_payment_id_foreign`(`payment_id`) USING BTREE,
  CONSTRAINT `account_statements_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_statements_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payment_invoices_old` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_statements_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_statements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users-old` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2731 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `governorate_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `city_ar` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city_en` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `street_ar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `street_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `building_no` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `addresses_country_id_foreign`(`country_id`) USING BTREE,
  INDEX `addresses_governorate_id_foreign`(`governorate_id`) USING BTREE,
  CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `addresses_governorate_id_foreign` FOREIGN KEY (`governorate_id`) REFERENCES `governorates` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9245 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `employees` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structure_levels` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `attachments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for announcement_views
-- ----------------------------
DROP TABLE IF EXISTS `announcement_views`;
CREATE TABLE `announcement_views`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 605 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for applicants
-- ----------------------------
DROP TABLE IF EXISTS `applicants`;
CREATE TABLE `applicants`  (
  `current_salary` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `marital_status` int(11) NULL DEFAULT NULL COMMENT '1: single, 2:married,3:widower,4:divorce,5:engaged',
  `military_status` tinyint(4) NULL DEFAULT NULL COMMENT '1: done, 2:exemption,3:delayed',
  `current_company` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization_id` int(11) NOT NULL,
  `application_date` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` tinyint(4) NOT NULL,
  `file_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` int(11) NULL DEFAULT NULL COMMENT '1:Linkedin,2:wuzzuf,3:internal_recommendation,4:facebook,5:website,6:email,7:walk-in,8:AM.Cham,9:Re Hiring, 10:OLX,11:EEC Recruitment Page,12:Jobs 6,13:Not Interested,14:Hold,15:hired but not start, 16:Wrong Number,17:didnt come,18:Didnt Answer,19:Forasna,20:Not Qualified,21:HR Deals,22:other',
  `filled_executed` tinyint(4) NULL DEFAULT NULL COMMENT '1: YES exceuted, 2:NO filled',
  `recommend_from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qualification_type` int(11) NOT NULL COMMENT '1: master_degree, 2:hire, 3:middle, 4:lower, 5:no_qualification',
  `university` bigint(20) NULL DEFAULT NULL,
  `faculty` bigint(20) NULL DEFAULT NULL,
  `subject` bigint(20) NULL DEFAULT NULL,
  `graduation_year` year NULL DEFAULT NULL,
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6988 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for apply_cvs
-- ----------------------------
DROP TABLE IF EXISTS `apply_cvs`;
CREATE TABLE `apply_cvs`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `middle_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `family_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nationality` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile_number` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` enum('male','female') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `marital_status` enum('single','married','divorced','widowed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `military_status` enum('complete','exemption','postponed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_can_start` date NOT NULL,
  `type_employment` enum('fulltime','parttime') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personal_skills` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `computer_skills` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lang_skill_arabic` enum('exc','good','fair') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lang_skill_english` enum('exc','good','fair') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `other` enum('exc','good','fair') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_from_school` date NULL DEFAULT NULL,
  `date_to_school` date NULL DEFAULT NULL,
  `reason_leaving` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expect_salary` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_advantage` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attachment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `work_in_company_before` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_in_company_before_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_in_company_before_location` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `have_family_in` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `have_family_in_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `have_family_in_location` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `have_legal_problem` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `have_legal_problem_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `have_diseases` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `have_diseases_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `have_political_party` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `have_political_party_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `have_current_insurance` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `have_current_insurance_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `have_problem_insurance` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `have_problem_insurance_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `smoked` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `do_you_have_other_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `applicant_acknowledgement_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `applicant_acknowledgement_sign` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `applicant_acknowledgement_date` date NULL DEFAULT NULL,
  `save_as_applicant` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cv_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for apply_cvs_educations
-- ----------------------------
DROP TABLE IF EXISTS `apply_cvs_educations`;
CREATE TABLE `apply_cvs_educations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `faculty` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `university` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_from_faculty` date NULL DEFAULT NULL,
  `date_to_faculty` date NULL DEFAULT NULL,
  `school` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_from_school` date NULL DEFAULT NULL,
  `date_to_school` date NULL DEFAULT NULL,
  `apply_cv_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for apply_cvs_experiences
-- ----------------------------
DROP TABLE IF EXISTS `apply_cvs_experiences`;
CREATE TABLE `apply_cvs_experiences`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experience_date_from` date NULL DEFAULT NULL,
  `experience_date_to` date NULL DEFAULT NULL,
  `experience_job_title` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `experience_company_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apply_cv_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for apply_cvs_trainings
-- ----------------------------
DROP TABLE IF EXISTS `apply_cvs_trainings`;
CREATE TABLE `apply_cvs_trainings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `training_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `training_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `training_date_from` date NULL DEFAULT NULL,
  `training_date_to` date NULL DEFAULT NULL,
  `apply_cv_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for approval_cycle_approval_steps
-- ----------------------------
DROP TABLE IF EXISTS `approval_cycle_approval_steps`;
CREATE TABLE `approval_cycle_approval_steps`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `approval_cycle_id` bigint(20) UNSIGNED NOT NULL,
  `approval_step_id` bigint(20) UNSIGNED NOT NULL,
  `level` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `previous_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `approval_cycle_approval_steps_approval_cycle_id_foreign`(`approval_cycle_id`) USING BTREE,
  INDEX `approval_cycle_approval_steps_approval_step_id_foreign`(`approval_step_id`) USING BTREE,
  INDEX `approval_cycle_approval_steps_next_id_foreign`(`next_id`) USING BTREE,
  INDEX `approval_cycle_approval_steps_previous_id_foreign`(`previous_id`) USING BTREE,
  CONSTRAINT `approval_cycle_approval_steps_approval_cycle_id_foreign` FOREIGN KEY (`approval_cycle_id`) REFERENCES `approval_cycles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `approval_cycle_approval_steps_approval_step_id_foreign` FOREIGN KEY (`approval_step_id`) REFERENCES `approval_steps` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `approval_cycle_approval_steps_next_id_foreign` FOREIGN KEY (`next_id`) REFERENCES `approval_cycle_approval_steps` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `approval_cycle_approval_steps_previous_id_foreign` FOREIGN KEY (`previous_id`) REFERENCES `approval_cycle_approval_steps` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for approval_cycle_views
-- ----------------------------
DROP TABLE IF EXISTS `approval_cycle_views`;
CREATE TABLE `approval_cycle_views`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `approval_step_type_detail_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `action_id` int(11) NULL DEFAULT NULL COMMENT 'is employee id that take action of approved',
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `step` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assign_to` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1441 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for approval_cycles
-- ----------------------------
DROP TABLE IF EXISTS `approval_cycles`;
CREATE TABLE `approval_cycles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for approval_steps
-- ----------------------------
DROP TABLE IF EXISTS `approval_steps`;
CREATE TABLE `approval_steps`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for approval_timeline_comments
-- ----------------------------
DROP TABLE IF EXISTS `approval_timeline_comments`;
CREATE TABLE `approval_timeline_comments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `comment_approve` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `image_approve` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `name_image_approve` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `approval_timeline_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `approval_timeline_comments_approval_timeline_id_foreign`(`approval_timeline_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7563 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for approval_timelines
-- ----------------------------
DROP TABLE IF EXISTS `approval_timelines`;
CREATE TABLE `approval_timelines`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_id` bigint(20) NOT NULL,
  `approval_cycle_approval_step_id` bigint(20) UNSIGNED NOT NULL,
  `approval_status` enum('P','A','RV','RJ') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'P' COMMENT 'P: Pending, A: Approved, RV: Revert, RJ: Reject',
  `business_action` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `approval_timelines_approval_cycle_approval_step_id_foreign`(`approval_cycle_approval_step_id`) USING BTREE,
  INDEX `approval_timelines_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62427 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for attendance_in_out
-- ----------------------------
DROP TABLE IF EXISTS `attendance_in_out`;
CREATE TABLE `attendance_in_out`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NULL DEFAULT NULL,
  `employee_code` int(11) NOT NULL,
  `shift_id` int(11) NULL DEFAULT NULL,
  `is_main_shift` tinyint(4) NULL DEFAULT NULL,
  `date` date NOT NULL,
  `time_in` time NULL DEFAULT NULL,
  `time_out` time NULL DEFAULT NULL,
  `hours` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `location_id` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `delay` tinyint(1) NOT NULL DEFAULT 0,
  `delay_change_at` date NULL DEFAULT NULL,
  `delay_change_by` int(11) NULL DEFAULT NULL,
  `delay_change_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `delay_value` time NULL DEFAULT NULL,
  `delaysDetails` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `validated` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NULL DEFAULT 4 COMMENT '0:pending, 1:approved,2:rejected,4:by Machine',
  `action_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  INDEX `date`(`date`) USING BTREE,
  INDEX `employee_code`(`employee_code`) USING BTREE,
  INDEX `employee_id_2`(`employee_id`) USING BTREE,
  INDEX `date_2`(`date`) USING BTREE,
  INDEX `delay`(`delay`) USING BTREE,
  INDEX `idx_attendance_uuid`(`uuid`) USING BTREE,
  INDEX `idx_attendance_employee_id`(`employee_id`) USING BTREE,
  INDEX `idx_attendance_shift_id`(`shift_id`) USING BTREE,
  INDEX `idx_attendance_date`(`date`) USING BTREE,
  INDEX `idx_attendance_status`(`status`) USING BTREE,
  INDEX `idx_attendance_employee_code`(`employee_code`) USING BTREE,
  INDEX `idx_attendance_created_at`(`created_at`) USING BTREE,
  INDEX `idx_attendance_employee_date`(`employee_id`, `date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for attendance_in_out_before_update
-- ----------------------------
DROP TABLE IF EXISTS `attendance_in_out_before_update`;
CREATE TABLE `attendance_in_out_before_update`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NULL DEFAULT NULL,
  `employee_code` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NULL DEFAULT NULL,
  `time_out` time NULL DEFAULT NULL,
  `hours` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `location_id` int(11) NULL DEFAULT NULL,
  `delay` tinyint(1) NOT NULL DEFAULT 0,
  `delay_value` time NULL DEFAULT NULL,
  `delaysDetails` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `validated` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NULL DEFAULT 4 COMMENT '0:pending, 1:approved,2:rejected,4:by Machine',
  `action_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21882 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for attendance_in_out_trail
-- ----------------------------
DROP TABLE IF EXISTS `attendance_in_out_trail`;
CREATE TABLE `attendance_in_out_trail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_code` int(11) NOT NULL,
  `date` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_in` time NULL DEFAULT NULL,
  `time_out` time NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `location_id` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `action_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10904 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `type_id` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deactivate_employee` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `activate_employee` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `show_exit_date` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `value` varchar(355) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for authentication_log
-- ----------------------------
DROP TABLE IF EXISTS `authentication_log`;
CREATE TABLE `authentication_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `authenticatable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `login_at` timestamp NULL DEFAULT NULL,
  `login_successful` tinyint(1) NOT NULL DEFAULT 0,
  `logout_at` timestamp NULL DEFAULT NULL,
  `cleared_by_user` tinyint(1) NOT NULL DEFAULT 0,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `authentication_log_authenticatable_type_authenticatable_id_index`(`authenticatable_type`, `authenticatable_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 76519 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bank_notebooks
-- ----------------------------
DROP TABLE IF EXISTS `bank_notebooks`;
CREATE TABLE `bank_notebooks`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_from` bigint(20) NOT NULL,
  `end_to` bigint(20) NOT NULL,
  `number_bank_notebook` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_id` bigint(20) NOT NULL,
  `version` tinyint(4) NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for banks
-- ----------------------------
DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `bank_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_ibn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `banks_bank_code_unique`(`bank_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for boards
-- ----------------------------
DROP TABLE IF EXISTS `boards`;
CREATE TABLE `boards`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `archive` tinyint(1) NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for booking_calenders
-- ----------------------------
DROP TABLE IF EXISTS `booking_calenders`;
CREATE TABLE `booking_calenders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `employee_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `send_email` tinyint(1) NOT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for business_natures
-- ----------------------------
DROP TABLE IF EXISTS `business_natures`;
CREATE TABLE `business_natures`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `business_natures_item_id_foreign`(`item_id`) USING BTREE,
  CONSTRAINT `business_natures_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for business_units
-- ----------------------------
DROP TABLE IF EXISTS `business_units`;
CREATE TABLE `business_units`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for calendar_interview
-- ----------------------------
DROP TABLE IF EXISTS `calendar_interview`;
CREATE TABLE `calendar_interview`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT NULL,
  `applicant_id` int(11) NULL DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `structure_level_id` int(11) NOT NULL,
  `date` date NULL DEFAULT NULL,
  `time` time NULL DEFAULT NULL,
  `job_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `recommended_job_level_id` int(10) UNSIGNED NOT NULL,
  `recommended_job_id` int(11) NOT NULL,
  `interviewer_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'employee_id',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contact_phone_id` int(11) NULL DEFAULT NULL,
  `hire_source_id` int(11) NULL DEFAULT NULL,
  `is_attended` tinyint(3) UNSIGNED NULL DEFAULT 2 COMMENT '1: attend, 3: not attend, 2: not yet',
  `not_attended_reason_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `not_attended_notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_accepted` tinyint(3) UNSIGNED NULL DEFAULT 2 COMMENT '1: accepted, 3: not accpeted, 2: not yet',
  `rejected_reason_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `rejected_notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `recommended_by` int(11) NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0==normal interview 1==scheduled interview',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1552 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for calendar_meeting
-- ----------------------------
DROP TABLE IF EXISTS `calendar_meeting`;
CREATE TABLE `calendar_meeting`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `room_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `from_time` time NULL DEFAULT NULL,
  `to_time` time NULL DEFAULT NULL,
  `structure_level_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emails` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `agenda` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for calendar_personal
-- ----------------------------
DROP TABLE IF EXISTS `calendar_personal`;
CREATE TABLE `calendar_personal`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `time` time NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cards
-- ----------------------------
DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` tinyint(4) NOT NULL COMMENT '0 - Normal priority ,\r\n1 - Medium priority ,\r\n2 - High priority ,\r\n3 - Hold , \r\n4 - Essay and not to - evaluation ',
  `board_id` int(11) NOT NULL,
  `time` datetime NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `change_status_by` tinyint(4) NOT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cheque_item_requests
-- ----------------------------
DROP TABLE IF EXISTS `cheque_item_requests`;
CREATE TABLE `cheque_item_requests`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `cheque_id` bigint(20) UNSIGNED NOT NULL,
  `debit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `statement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cheque_item_requests_cheque_id_foreign`(`cheque_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cheque_request_files
-- ----------------------------
DROP TABLE IF EXISTS `cheque_request_files`;
CREATE TABLE `cheque_request_files`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cheque_id` bigint(20) NOT NULL,
  `cheque_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cheque_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cheque_request_statements
-- ----------------------------
DROP TABLE IF EXISTS `cheque_request_statements`;
CREATE TABLE `cheque_request_statements`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_type` int(11) NOT NULL,
  `purchase_order_id` bigint(20) NULL DEFAULT NULL,
  `debit_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cheque_id` bigint(20) NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1359 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cheque_request_values
-- ----------------------------
DROP TABLE IF EXISTS `cheque_request_values`;
CREATE TABLE `cheque_request_values`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cheque_id` bigint(20) NOT NULL,
  `cheque_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_letter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_cheque` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7457 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cheque_requests
-- ----------------------------
DROP TABLE IF EXISTS `cheque_requests`;
CREATE TABLE `cheque_requests`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `cheque_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `number_cheque_request` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type_cheque` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requester_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `date` date NOT NULL,
  `total_debit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `exchange_rate` int(11) NULL DEFAULT NULL,
  `total_balance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_number` int(11) NULL DEFAULT NULL,
  `invoice_number` int(11) NULL DEFAULT NULL,
  `operation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `balance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `statement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_type` tinyint(4) NULL DEFAULT NULL,
  `name_type_id` bigint(20) NULL DEFAULT NULL,
  `sub_department_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency` bigint(20) NOT NULL,
  `created_at_account` timestamp NULL DEFAULT NULL,
  `cheque_old` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `exist_comment` tinyint(1) NOT NULL DEFAULT 0,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `comment_delete` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status_deactivate` tinyint(1) NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_delete_approval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `comment_delete_approval` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_approval_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cheque_requests_requester_id_foreign`(`requester_id`) USING BTREE,
  INDEX `cheque_requests_supplier_id_foreign`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6850 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for civil_image_approves
-- ----------------------------
DROP TABLE IF EXISTS `civil_image_approves`;
CREATE TABLE `civil_image_approves`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `image_approve` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `name_image_approve` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `approval_timeline_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `civil_image_approves_approval_timeline_id_foreign`(`approval_timeline_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 411 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for contact_types
-- ----------------------------
DROP TABLE IF EXISTS `contact_types`;
CREATE TABLE `contact_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = ' ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for corporate_objectives
-- ----------------------------
DROP TABLE IF EXISTS `corporate_objectives`;
CREATE TABLE `corporate_objectives`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_contract
-- ----------------------------
DROP TABLE IF EXISTS `crm_contract`;
CREATE TABLE `crm_contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT NULL,
  `quotation_id` int(11) NULL DEFAULT NULL,
  `currency_id` int(11) NULL DEFAULT NULL,
  `contact_id` int(11) NULL DEFAULT NULL,
  `contract_date` date NULL DEFAULT NULL,
  `contract_duration` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract_start_date` date NULL DEFAULT NULL,
  `contract_end_date` date NULL DEFAULT NULL,
  `contract_type` enum('purchase_order','fixed_unit_price','lump_sum','cost_plus') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attach_contract` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `related_bond` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bond_type` enum('letter_of_guarantee','check','cash') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bond_amount` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `bid_bond_status` enum('valid','expired','acquired_back') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_issuing_quotation
-- ----------------------------
DROP TABLE IF EXISTS `crm_issuing_quotation`;
CREATE TABLE `crm_issuing_quotation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `quotation_type_id` bigint(20) NULL DEFAULT NULL,
  `register_contact_id` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `opportunity_id` int(11) NULL DEFAULT NULL,
  `quotation_ref` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `revision` int(11) NULL DEFAULT NULL,
  `issued_date` date NOT NULL,
  `issued_by` bigint(20) NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `quotation_type` enum('tender','price_offer','response_to_tender') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `related_bid_bond` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bid_bond_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bid_bond_amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note_type` enum('price_note','offer_note','financial_offer') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `offer_note_attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tax_val` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `all_total` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sum_total` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `validity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `project` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `presenting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `general_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `terms_conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `payment_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `delivery_schedule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_confirmed` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `delivery_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `currency_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tax_duties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `show_price` tinyint(4) NOT NULL DEFAULT 1,
  `confirmed_by` bigint(20) NULL DEFAULT NULL,
  `contact_person_id` int(11) NULL DEFAULT NULL,
  `financial_offer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `reference` enum('news','word_of_mouth','mail','tenders_alert') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 310 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_issuing_quotation_details
-- ----------------------------
DROP TABLE IF EXISTS `crm_issuing_quotation_details`;
CREATE TABLE `crm_issuing_quotation_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `quotation_status` enum('under_revision','under_negotiations','on_hold','no_response','accepted','rejected') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `feedback_date` date NOT NULL,
  `set_notification` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_issuing_quotation_items
-- ----------------------------
DROP TABLE IF EXISTS `crm_issuing_quotation_items`;
CREATE TABLE `crm_issuing_quotation_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quotation_id` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `unit` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` int(11) NULL DEFAULT NULL,
  `unit_wight` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_total` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3508230 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_issuing_quotation_new
-- ----------------------------
DROP TABLE IF EXISTS `crm_issuing_quotation_new`;
CREATE TABLE `crm_issuing_quotation_new`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `quotation_type_id` bigint(20) NULL DEFAULT NULL,
  `register_contact_id` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `opportunity_id` int(11) NULL DEFAULT NULL,
  `quotation_ref` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `revision` int(11) NULL DEFAULT NULL,
  `issued_date` date NOT NULL,
  `issued_by` bigint(20) NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `quotation_type` enum('tender','price_offer','response_to_tender') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `related_bid_bond` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bid_bond_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bid_bond_amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note_type` enum('price_note','offer_note','financial_offer') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `offer_note_attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tax_val` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `all_total` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sum_total` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `validity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `project` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `presenting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `general_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `terms_conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `payment_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `delivery_schedule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_confirmed` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `delivery_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `currency_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tax_duties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `show_price` tinyint(4) NOT NULL DEFAULT 1,
  `confirmed_by` bigint(20) NULL DEFAULT NULL,
  `contact_person_id` int(11) NULL DEFAULT NULL,
  `financial_offer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `reference` enum('news','word_of_mouth','mail','tenders_alert') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 186 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_register_approach
-- ----------------------------
DROP TABLE IF EXISTS `crm_register_approach`;
CREATE TABLE `crm_register_approach`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `approach_for` enum('lead','opportunity','quotation') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` enum('new_contact','response_to_inquiry','follow_up','refreshing','inquiry','other') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `way_of_approach` enum('meeting','mail','phone','other') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `way_of_approach_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `made_approach_id` bigint(20) NULL DEFAULT NULL,
  `next_step_type` int(11) NULL DEFAULT NULL,
  `next_step_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_date` date NULL DEFAULT NULL,
  `conclusion_of_approach` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommendation_for_follow_up` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approach_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `close_opportunity_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_register_contact
-- ----------------------------
DROP TABLE IF EXISTS `crm_register_contact`;
CREATE TABLE `crm_register_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_type_id` int(11) NULL DEFAULT NULL,
  `industry_id` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_en` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `address_ar` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nationality` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `how_knew_about_us` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `available_opportunity` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'yes',
  `status_register` enum('prospected_client','SME','consultant','old_client','current_client') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country_id` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` enum('news','word_of_mouth','mail','tenders_alert') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 243 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_register_content_persons
-- ----------------------------
DROP TABLE IF EXISTS `crm_register_content_persons`;
CREATE TABLE `crm_register_content_persons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contact_phone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contact_country` int(11) NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contact_email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contact_person_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `contact_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 432 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_register_opportunity
-- ----------------------------
DROP TABLE IF EXISTS `crm_register_opportunity`;
CREATE TABLE `crm_register_opportunity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `industry_id` int(11) NULL DEFAULT NULL,
  `contact_type_id` int(11) NOT NULL,
  `currency_id` int(11) NULL DEFAULT NULL,
  `opportunity_reference` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `opportunity_reference_content` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attachment` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opportunity_subject` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `opportunity_details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `related_activity` int(11) NULL DEFAULT NULL,
  `owner_of_activity` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_date` date NULL DEFAULT NULL,
  `opportunity_size` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `winning_probability` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opportunity_type` enum('in_hand','tender','not_specified') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number_of_competitive` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` enum('local','international') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `submission_date` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `registration_number` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_opportunity` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 is lead',
  `close_opportunity_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `attachment_opportunity` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 is locked',
  `business_partner_contact` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 204 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_register_opportunity_details
-- ----------------------------
DROP TABLE IF EXISTS `crm_register_opportunity_details`;
CREATE TABLE `crm_register_opportunity_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(11) NULL DEFAULT NULL,
  `old_owner` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `new_owner` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `switched_by` int(11) NULL DEFAULT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_registerations
-- ----------------------------
DROP TABLE IF EXISTS `crm_registerations`;
CREATE TABLE `crm_registerations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `register_name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `from_who` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `registeration_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` enum('waiting','approved','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'waiting',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_registerations_details
-- ----------------------------
DROP TABLE IF EXISTS `crm_registerations_details`;
CREATE TABLE `crm_registerations_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `by_who` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `registeration_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for custom_calendar
-- ----------------------------
DROP TABLE IF EXISTS `custom_calendar`;
CREATE TABLE `custom_calendar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `month_id` int(11) NOT NULL,
  `month_from` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `month_to` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for custom_calendar_copy1
-- ----------------------------
DROP TABLE IF EXISTS `custom_calendar_copy1`;
CREATE TABLE `custom_calendar_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `month_id` int(11) NOT NULL,
  `month_from` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `month_to` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for delay_type
-- ----------------------------
DROP TABLE IF EXISTS `delay_type`;
CREATE TABLE `delay_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delay` int(11) NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type_name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `business_unit_id` int(11) NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `head_id` bigint(20) UNSIGNED NOT NULL,
  `head_id_hr` bigint(20) NULL DEFAULT NULL,
  `node_id` bigint(20) NULL DEFAULT NULL,
  `level_id` bigint(20) NULL DEFAULT NULL,
  `days_off` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delegated_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT 1,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sectors_head_id_foreign`(`head_id`) USING BTREE,
  INDEX `sectors_delegated_id_foreign`(`delegated_id`) USING BTREE,
  INDEX `sectors_parent_id_foreign`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for departments_new
-- ----------------------------
DROP TABLE IF EXISTS `departments_new`;
CREATE TABLE `departments_new`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `business_unit_id` int(11) NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `head_id` bigint(20) UNSIGNED NOT NULL,
  `days_off` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delegated_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT 1,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sectors_head_id_foreign`(`head_id`) USING BTREE,
  INDEX `sectors_delegated_id_foreign`(`delegated_id`) USING BTREE,
  INDEX `sectors_parent_id_foreign`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for directives
-- ----------------------------
DROP TABLE IF EXISTS `directives`;
CREATE TABLE `directives`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `attachments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for discount_types
-- ----------------------------
DROP TABLE IF EXISTS `discount_types`;
CREATE TABLE `discount_types`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `name_en` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dummy_invoices
-- ----------------------------
DROP TABLE IF EXISTS `dummy_invoices`;
CREATE TABLE `dummy_invoices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `invoice_number` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_invoice` date NOT NULL,
  `total` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value_tax` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `overall_total` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `other_discount` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_after_discount` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tax_deduction_value` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `net_total` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_taxes_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 268 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dummy_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `dummy_suppliers`;
CREATE TABLE `dummy_suppliers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tax_id_number` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_bank_transfers
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_bank_transfers`;
CREATE TABLE `e_invoice_bank_transfers`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `received_date` date NOT NULL,
  `issue_date` date NULL DEFAULT NULL,
  `deposit_date` date NULL DEFAULT NULL,
  `collect_date` date NOT NULL,
  `bank_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 776 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_banks
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_banks`;
CREATE TABLE `e_invoice_banks`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bank_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_iban` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `swift_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `banks_bank_code_unique`(`bank_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_business_client_users
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_business_client_users`;
CREATE TABLE `e_invoice_business_client_users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_client_id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `national_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_business_clients
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_business_clients`;
CREATE TABLE `e_invoice_business_clients`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address_id` bigint(20) NOT NULL,
  `gmap_url` varchar(520) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `website_url` varchar(520) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `person_note` varchar(520) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accredite_note` varchar(520) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_id_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id_number_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `commercial_registeration_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `commercial_registeration_number_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_file_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_file_number_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT 0,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `business_clients_tax_id_number_unique`(`tax_id_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_cheques
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_cheques`;
CREATE TABLE `e_invoice_cheques`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cheque_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `received_date` date NOT NULL,
  `issue_date` date NOT NULL,
  `deposit_date` date NOT NULL,
  `collect_date` date NOT NULL,
  `bank_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 364 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_client_codes
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_client_codes`;
CREATE TABLE `e_invoice_client_codes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_deduction_types
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_deduction_types`;
CREATE TABLE `e_invoice_deduction_types`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `deduction_types_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_deductions
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_deductions`;
CREATE TABLE `e_invoice_deductions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deductionType_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `deductions_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_document_items
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_document_items`;
CREATE TABLE `e_invoice_document_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double NOT NULL,
  `item_price` double NOT NULL,
  `rate` double NOT NULL,
  `discount_item_rate` double NULL DEFAULT NULL,
  `discount_item_amount` double NULL DEFAULT NULL,
  `taxable_fees` double NULL DEFAULT NULL,
  `value_difference` double NULL DEFAULT NULL,
  `net_total` double NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12670 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_document_taxes
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_document_taxes`;
CREATE TABLE `e_invoice_document_taxes`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `document_item_id` bigint(20) NOT NULL,
  `purchase_order_tax_id` bigint(20) NOT NULL,
  `amount_tax` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24610 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_documents
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_documents`;
CREATE TABLE `e_invoice_documents`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `document_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `organization_id` bigint(20) NOT NULL,
  `extra_invoice_discount` double NULL DEFAULT NULL,
  `type` enum('I','C','D') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1.0',
  `submit_status` tinyint(1) NOT NULL DEFAULT 0,
  `archive` tinyint(1) NOT NULL DEFAULT 0,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `submission_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `log_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hash_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `document_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_time_received` timestamp NULL DEFAULT NULL,
  `publicUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `signature_type` enum('I','S') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'I' COMMENT 'I: Issuer, S: Service provider',
  `signature_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `documents_document_number_unique`(`document_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1240 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_documents_invalid_steps
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_documents_invalid_steps`;
CREATE TABLE `e_invoice_documents_invalid_steps`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) NULL DEFAULT NULL,
  `invalid_steps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_foreigner_clients
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_foreigner_clients`;
CREATE TABLE `e_invoice_foreigner_clients`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `company_name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `person_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `person_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `person_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vat_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address_id` bigint(20) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `foreigner_clients_person_email_unique`(`person_email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_items
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_items`;
CREATE TABLE `e_invoice_items`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quotation_item_id` bigint(20) NULL DEFAULT NULL,
  `description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `quantity` double NULL DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EGP',
  `unit` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_price` double NOT NULL,
  `discount_item_rate` double NULL DEFAULT NULL,
  `discount_item_amount` double NULL DEFAULT NULL,
  `taxable_fees` double NULL DEFAULT NULL,
  `value_difference` double NULL DEFAULT NULL,
  `items_discount` double NULL DEFAULT NULL,
  `net_total` double NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14430 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_letters_guarantee
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_letters_guarantee`;
CREATE TABLE `e_invoice_letters_guarantee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `letters_guarantee_request_id` int(11) NULL DEFAULT NULL,
  `client_id` bigint(20) NULL DEFAULT NULL,
  `client_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_type` enum('b','p','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `side` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `purpose` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `project_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `supply_order_tax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `supply_order` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `supply_order_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cash_margin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('prepaid','primary_insurance','final_insurance','instant','maritime','financial') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `letter_guarantee_num` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `release_date` date NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `giver_name` int(11) NULL DEFAULT NULL,
  `recipient_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reply_date` date NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_letters_guarantee_bank_commissions
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_letters_guarantee_bank_commissions`;
CREATE TABLE `e_invoice_letters_guarantee_bank_commissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `letters_guarantee_id` int(11) NOT NULL,
  `value_commission` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statement` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_letters_guarantee_changing
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_letters_guarantee_changing`;
CREATE TABLE `e_invoice_letters_guarantee_changing`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `letters_guarantee_id` int(11) NOT NULL,
  `value` int(11) NULL DEFAULT NULL,
  `cash_margin` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 294 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_letters_guarantee_request
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_letters_guarantee_request`;
CREATE TABLE `e_invoice_letters_guarantee_request`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_type` enum('b','p','f','') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_id` bigint(20) NULL DEFAULT NULL,
  `client_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `supply_order_tax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supply_order` bigint(20) NULL DEFAULT NULL,
  `supply_order_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `main_project_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_number` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_amount` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_order_percentage` int(11) NULL DEFAULT NULL,
  `value` int(11) NOT NULL,
  `type` enum('prepaid','primary_insurance','final_insurance','instant','maritime','financial') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `duration_in_month` int(11) NOT NULL,
  `release_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `attached` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NOT NULL,
  `deleted_at` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_payment_deductions
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_payment_deductions`;
CREATE TABLE `e_invoice_payment_deductions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_id` bigint(20) NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `value` decimal(50, 30) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payment_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4686 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_payments
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_payments`;
CREATE TABLE `e_invoice_payments`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `table` enum('D','PO') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'D: Document, PO: Purchase order',
  `table_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `client_type` enum('b','p','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'b: Business client, p: Person client, f Foreigner client',
  `payment_method` enum('cashe','bank_transfer','cheque','deduction') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` bigint(20) NULL DEFAULT NULL,
  `payment_date` date NOT NULL,
  `value` decimal(50, 30) NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `payment_value` decimal(10, 2) NULL DEFAULT NULL,
  `approved` int(11) NULL DEFAULT 0,
  `approved_at` timestamp NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3503 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_person_clients
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_person_clients`;
CREATE TABLE `e_invoice_person_clients`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `national_id` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address_id` bigint(20) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `person_clients_national_id_unique`(`national_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_product_units
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_product_units`;
CREATE TABLE `e_invoice_product_units`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_units_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_products
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_products`;
CREATE TABLE `e_invoice_products`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `internal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `standard_code_type` enum('GS1','EGS') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'This column is type of standard code of product',
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` datetime NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_internal_code_unique`(`internal_code`) USING BTREE,
  UNIQUE INDEX `products_product_code_unique`(`product_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_purchase_order_deductions
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_purchase_order_deductions`;
CREATE TABLE `e_invoice_purchase_order_deductions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deduction_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for e_invoice_purchase_order_taxes
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_purchase_order_taxes`;
CREATE TABLE `e_invoice_purchase_order_taxes`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NOT NULL,
  `tax_type` tinyint(4) NULL DEFAULT 0,
  `subtype` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'V06',
  `tax_rate` double NULL DEFAULT 0,
  `amount_tax` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14389 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_purchase_order_taxes_details
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_purchase_order_taxes_details`;
CREATE TABLE `e_invoice_purchase_order_taxes_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) NOT NULL,
  `tax_type_id` int(11) NOT NULL COMMENT 'primary key in table tax_type',
  `sub_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'version type in table version_type_taxes',
  `tax_rate` int(11) NOT NULL,
  `amount_tax` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_purchase_orders
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_purchase_orders`;
CREATE TABLE `e_invoice_purchase_orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quotation_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `client_id` bigint(20) NOT NULL,
  `client_code_id` int(11) NULL DEFAULT NULL,
  `client_type` enum('b','p','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'b: Business client, p: Person client, f Foreigner client',
  `type` enum('budget','quantity') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'quantity',
  `item_type` enum('with_quotations','without_quotations','different_quotations') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'without_quotations',
  `purchase_order_reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_project_name` bigint(20) NULL DEFAULT NULL,
  `project_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_contract_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_contract_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchaseorder_document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `bank_id` bigint(20) NOT NULL,
  `tax_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subtype` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_rate` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delivery_approach` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_packaging` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `delivery_validate_date` date NULL DEFAULT NULL,
  `delivery_export_port` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delivery_country_origin` bigint(20) NOT NULL,
  `delivery_gross_weight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delivery_net_weight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delivery_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary_delivery_status` tinyint(1) NOT NULL DEFAULT 0,
  `tax_rate_letter_report` tinyint(1) NOT NULL DEFAULT 0,
  `final_delivery_status` tinyint(1) NOT NULL DEFAULT 0,
  `deduction_id` int(11) NULL DEFAULT NULL,
  `business_nature_id` int(11) NULL DEFAULT NULL,
  `social_insurance_status` tinyint(1) NOT NULL DEFAULT 0,
  `labor_insurance_status` tinyint(1) NOT NULL DEFAULT 0,
  `tax_exemption_certificate_status` tinyint(1) NOT NULL DEFAULT 0,
  `received_final_performance_bond_status` tinyint(1) NOT NULL DEFAULT 0,
  `archive` tinyint(1) NOT NULL DEFAULT 0,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `purchase_order_reference`(`purchase_order_reference`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 591 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_tax_types
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_tax_types`;
CREATE TABLE `e_invoice_tax_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_version_type_taxes
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_version_type_taxes`;
CREATE TABLE `e_invoice_version_type_taxes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_type_id` int(11) NOT NULL,
  `version_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for e_invoice_warranty_checks
-- ----------------------------
DROP TABLE IF EXISTS `e_invoice_warranty_checks`;
CREATE TABLE `e_invoice_warranty_checks`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` bigint(20) NOT NULL,
  `client_type` enum('b','p','f') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `side` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_number` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supply_order` bigint(20) NOT NULL,
  `value` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` enum('authentic_signature','notebook','payment_accepted','bank_deposit') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `source_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_id` bigint(20) NULL DEFAULT NULL,
  `bank_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cheque_number` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `check_date` date NOT NULL,
  `image` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `document_nature` enum('not_respond','respond') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purpose` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `giver_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recipient_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_date` date NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for eecportal_wp_users
-- ----------------------------
DROP TABLE IF EXISTS `eecportal_wp_users`;
CREATE TABLE `eecportal_wp_users`  (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL,
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `user_login_key`(`user_login`) USING BTREE,
  INDEX `user_nicename`(`user_nicename`) USING BTREE,
  INDEX `user_email`(`user_email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 609 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for emails_module
-- ----------------------------
DROP TABLE IF EXISTS `emails_module`;
CREATE TABLE `emails_module`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `organization_id` int(11) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ref_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `send` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40343 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code` int(11) NOT NULL,
  `religion` tinyint(4) NOT NULL DEFAULT 0,
  `not_uploaded_at_first` int(11) NULL DEFAULT 0,
  `user_id` int(11) NULL DEFAULT NULL,
  `function_id` bigint(20) NULL DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `sub_department_id` bigint(20) NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `group_id` bigint(20) NULL DEFAULT NULL,
  `job_group_id` bigint(20) NULL DEFAULT NULL,
  `shift_id` bigint(20) NULL DEFAULT NULL,
  `count_null_hr` bigint(20) NOT NULL,
  `count_not_null_hr` bigint(20) NOT NULL,
  `count_null_personal` bigint(20) NULL DEFAULT NULL,
  `count_not_null_personal` bigint(20) NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `preferable_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `employee_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hiring_date` date NULL DEFAULT NULL,
  `application_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `package_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `assessment_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `collar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_interviewer` tinyint(1) NULL DEFAULT NULL COMMENT '1 => yes , 2 => no',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$h9F/8WrWhxxXwWCxy80tF.Bp5vKDyVVh6LGNQjsJdqkJDY03fpCi6',
  `manager_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `technical_manager_id` bigint(20) NULL DEFAULT NULL,
  `evaluation_manager_id` bigint(20) NULL DEFAULT NULL,
  `sector_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `site_id` bigint(20) NULL DEFAULT NULL,
  `job_level_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `job_group_type` tinyint(4) NULL DEFAULT NULL,
  `position_type` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = active || 1 = not active',
  `is_exit` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: not exit, 1: exit',
  `is_interview` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: not interviewed exit, 1: exit interview',
  `is_out_of_work` tinyint(4) NULL DEFAULT 0,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `board_member` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delegated_at` tinyint(1) NOT NULL DEFAULT 0,
  `user_type_id` tinyint(1) NULL DEFAULT 0,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `marital_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `military_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `national_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nationality` int(11) NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `facebook_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `qualification_type` tinyint(4) NOT NULL COMMENT '1: master_degree, 2:hire, 3:middle, 4:lower, 5:no_qualification',
  `country` int(11) NULL DEFAULT NULL,
  `educational_department` bigint(20) NULL DEFAULT NULL,
  `educational_qualification` bigint(20) NULL DEFAULT NULL,
  `university` bigint(20) NULL DEFAULT NULL,
  `graduation_year` year NULL DEFAULT NULL,
  `school` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_number` int(11) NULL DEFAULT NULL,
  `insurance_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `perivous_insurance_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_out_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_authority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birth_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birth_location_id` int(11) NULL DEFAULT NULL,
  `hiring_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=> still worked / 1=>hold / 2=> deactivated',
  `structure_level_id` int(11) NULL DEFAULT NULL,
  `job_title_id` int(11) NULL DEFAULT NULL,
  `emergency_person_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `emergency_person_relative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `emergency_person_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `official_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hiring_status_id` int(11) NULL DEFAULT NULL,
  `hire_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job_in_insurance` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical_level` int(11) NULL DEFAULT NULL COMMENT '1: level one, 2:level two,3:level three,4:level four',
  `current_employed` tinyint(4) NULL DEFAULT NULL,
  `health_insurance_number` int(11) NULL DEFAULT NULL,
  `health_insurance_date` date NULL DEFAULT NULL,
  `health_insurance_date_end` date NULL DEFAULT NULL,
  `annual_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_card_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:Magnetic,2:plastic,3:none',
  `cost` float NULL DEFAULT NULL,
  `delivery_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `handle_after_leaving` tinyint(4) NULL DEFAULT NULL COMMENT '1:yes,2:no',
  `work_stub_number` int(11) NULL DEFAULT NULL,
  `qualification` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qualification_department` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job_offer_number` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `upload_cv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `current_work_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_unit_id` int(11) NULL DEFAULT NULL,
  `job_function_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `beginning_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `previous_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `number_of_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `change_job_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_of_job_change` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `salary_total_amount` double NULL DEFAULT NULL,
  `bank_account_number` int(11) NULL DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `passport_number` int(11) NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `salary_net_amount` double NULL DEFAULT NULL,
  `exit_type` int(11) NULL DEFAULT NULL COMMENT '0->resignitation,1->termination,2->death, 3->out of work',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `admin_manager_id` bigint(20) NULL DEFAULT NULL,
  `countNOTNull` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `countNull` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payroll_active` tinyint(1) NULL DEFAULT 0,
  `Payroll_admin_id` int(11) NULL DEFAULT NULL,
  `fingerprint_exemption` tinyint(1) NOT NULL DEFAULT 0,
  `exception_rule` tinyint(4) NOT NULL DEFAULT 0,
  `disability` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 == no | 1 == yes',
  `resignation_letter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `form_6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_work_date` date NULL DEFAULT NULL,
  `date_of_death` date NULL DEFAULT NULL,
  `expertise_type_id` int(11) NULL DEFAULT NULL,
  `employment_type` tinyint(4) NOT NULL DEFAULT 0,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `passport_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `has_site_kpi` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `uuid`) USING BTREE,
  INDEX `id_index`(`id`) USING BTREE,
  INDEX `shift_id`(`shift_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  INDEX `payroll_active`(`payroll_active`) USING BTREE,
  INDEX `Payroll_admin_id`(`Payroll_admin_id`) USING BTREE,
  INDEX `idx_employee_uuid`(`uuid`) USING BTREE,
  INDEX `idx_employee_org_id`(`organization_id`) USING BTREE,
  INDEX `idx_employee_user_id`(`user_id`) USING BTREE,
  INDEX `idx_employee_email`(`email`) USING BTREE,
  INDEX `idx_employee_national_id`(`national_id`) USING BTREE,
  INDEX `idx_employee_mobile`(`mobile`) USING BTREE,
  INDEX `idx_employee_hiring_status`(`hiring_status`) USING BTREE,
  INDEX `idx_employee_active_exit`(`active`, `is_exit`) USING BTREE,
  INDEX `idx_employee_managers`(`manager_id`, `technical_manager_id`, `evaluation_manager_id`) USING BTREE,
  INDEX `idx_employee_department_shift`(`department_id`, `shift_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1650 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_attendance_all
-- ----------------------------
DROP TABLE IF EXISTS `employee_attendance_all`;
CREATE TABLE `employee_attendance_all`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NULL DEFAULT NULL,
  `employee_code` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NULL DEFAULT NULL,
  `type` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'C/In',
  `location_id` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `transfered` tinyint(4) NULL DEFAULT 0 COMMENT '0:no,1:transfered to in_ont table',
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 82826 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_attendance_all_test
-- ----------------------------
DROP TABLE IF EXISTS `employee_attendance_all_test`;
CREATE TABLE `employee_attendance_all_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NULL DEFAULT NULL,
  `employee_code` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NULL DEFAULT NULL,
  `type` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'C/In',
  `location_id` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `transfered` tinyint(4) NULL DEFAULT 0 COMMENT '0:no,1:transfered to in_ont table',
  `checked` tinyint(4) NULL DEFAULT 0,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `transfer` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9501 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_bank_transfers
-- ----------------------------
DROP TABLE IF EXISTS `employee_bank_transfers`;
CREATE TABLE `employee_bank_transfers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_account_number` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_branch` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_currency` bigint(20) NULL DEFAULT NULL,
  `bank_ibn` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_swift` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `employee_id` bigint(20) NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_copy1
-- ----------------------------
DROP TABLE IF EXISTS `employee_copy1`;
CREATE TABLE `employee_copy1`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code` int(11) NOT NULL,
  `not_uploaded_at_first` int(11) NULL DEFAULT 0,
  `user_id` int(11) NULL DEFAULT NULL,
  `function_id` bigint(20) NULL DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `sub_department_id` bigint(20) NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `group_id` bigint(20) NULL DEFAULT NULL,
  `job_group_id` bigint(20) NULL DEFAULT NULL,
  `shift_id` bigint(20) NULL DEFAULT NULL,
  `count_null_hr` bigint(20) NOT NULL,
  `count_not_null_hr` bigint(20) NOT NULL,
  `count_null_personal` bigint(20) NULL DEFAULT NULL,
  `count_not_null_personal` bigint(20) NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `preferable_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `employee_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hiring_date` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `application_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `package_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `assessment_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `collar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_interviewer` tinyint(1) NULL DEFAULT NULL COMMENT '1 => yes , 2 => no',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$h9F/8WrWhxxXwWCxy80tF.Bp5vKDyVVh6LGNQjsJdqkJDY03fpCi6',
  `manager_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `technical_manager_id` bigint(20) NULL DEFAULT NULL,
  `evaluation_manager_id` bigint(20) NULL DEFAULT NULL,
  `sector_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `site_id` bigint(20) NOT NULL,
  `job_level_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `job_group_type` tinyint(4) NULL DEFAULT NULL,
  `position_type` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_exit` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: not exit, 1: exit',
  `is_interview` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: not interviewed exit, 1: exit interview',
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `board_member` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delegated_at` tinyint(1) NOT NULL DEFAULT 0,
  `user_type_id` tinyint(1) NULL DEFAULT 0,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `marital_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `military_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `national_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nationality` int(11) NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `facebook_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `qualification_type` tinyint(4) NOT NULL COMMENT '1: master_degree, 2:hire, 3:middle, 4:lower, 5:no_qualification',
  `country` int(11) NULL DEFAULT NULL,
  `educational_department` bigint(20) NULL DEFAULT NULL,
  `educational_qualification` bigint(20) NULL DEFAULT NULL,
  `university` bigint(20) NULL DEFAULT NULL,
  `graduation_year` year NULL DEFAULT NULL,
  `school` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_number` int(11) NULL DEFAULT NULL,
  `insurance_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `perivous_insurance_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_out_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_authority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birth_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birth_location_id` int(11) NULL DEFAULT NULL,
  `hiring_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=> still worked / 1=>hold / 2=> deactivated',
  `structure_level_id` int(11) NULL DEFAULT NULL,
  `job_title_id` int(11) NULL DEFAULT NULL,
  `emergency_person_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `emergency_person_relative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `emergency_person_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `official_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hiring_status_id` int(11) NULL DEFAULT NULL,
  `hire_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job_in_insurance` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical_level` int(11) NULL DEFAULT NULL COMMENT '1: level one, 2:level two,3:level three,4:level four',
  `current_employed` tinyint(4) NULL DEFAULT NULL,
  `health_insurance_number` int(11) NULL DEFAULT NULL,
  `health_insurance_date` date NULL DEFAULT NULL,
  `health_insurance_date_end` date NULL DEFAULT NULL,
  `annual_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_card_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:Magnetic,2:plastic,3:none',
  `cost` float NULL DEFAULT NULL,
  `delivery_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `handle_after_leaving` tinyint(4) NULL DEFAULT NULL COMMENT '1:yes,2:no',
  `work_stub_number` int(11) NULL DEFAULT NULL,
  `qualification` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qualification_department` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job_offer_number` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `upload_cv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `current_work_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_unit_id` int(11) NULL DEFAULT NULL,
  `job_function_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `beginning_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `previous_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `number_of_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `change_job_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_of_job_change` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `salary_total_amount` double NULL DEFAULT NULL,
  `bank_account_number` int(11) NULL DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `passport_number` int(11) NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `salary_net_amount` double NULL DEFAULT NULL,
  `exit_type` int(11) NULL DEFAULT NULL COMMENT '0->resignitation,1->termination,2->death',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `admin_manager_id` bigint(20) NOT NULL,
  `countNOTNull` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `countNull` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payroll_active` tinyint(1) NOT NULL DEFAULT 0,
  `fingerprint_exemption` tinyint(1) NOT NULL DEFAULT 0,
  `disability` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 == no | 1 == yes',
  `resignation_letter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `form_6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_work_date` date NULL DEFAULT NULL,
  `date_of_death` date NULL DEFAULT NULL,
  `expertise_type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `uuid`) USING BTREE,
  INDEX `id_index`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1189 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_course
-- ----------------------------
DROP TABLE IF EXISTS `employee_course`;
CREATE TABLE `employee_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_name` varchar(211) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_start_date` date NULL DEFAULT NULL,
  `course_end_date` date NULL DEFAULT NULL,
  `course_location` varchar(211) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_data_versions
-- ----------------------------
DROP TABLE IF EXISTS `employee_data_versions`;
CREATE TABLE `employee_data_versions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization_id` tinyint(4) NULL DEFAULT 1,
  `employee_id` int(11) NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `marital_status` int(11) NOT NULL,
  `military_status` int(11) NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emergency_person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emergency_person_relative` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emergency_person_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `national_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qualification_type` int(11) NOT NULL,
  `educational_department` int(11) NULL DEFAULT NULL,
  `graduation_year` year NULL DEFAULT NULL,
  `university` int(11) NULL DEFAULT NULL,
  `educational_qualification` int(11) NULL DEFAULT NULL,
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `not_updated_comment` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 524 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_documentation
-- ----------------------------
DROP TABLE IF EXISTS `employee_documentation`;
CREATE TABLE `employee_documentation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `birth_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `military_service_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `criminal_chip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `work_heel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `identification_card_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `guild_carnet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `personal_imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `brent_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `corona_virus_vaccination_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `academic_qualification_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_exit
-- ----------------------------
DROP TABLE IF EXISTS `employee_exit`;
CREATE TABLE `employee_exit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `exit_type` int(11) NOT NULL COMMENT '0: resignation,1: termination,2: death,3: out of work',
  `last_work_date_resigned` date NULL DEFAULT NULL,
  `resignation_letter` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `form_6_resigned` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `request_exit_date` date NULL DEFAULT NULL,
  `form_6_terminated` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_work_date_terminated` date NULL DEFAULT NULL,
  `date_of_death` date NULL DEFAULT NULL,
  `death_certificate` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `inheritance_information` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `out_of_work_from_date` date NULL DEFAULT NULL,
  `out_of_work_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` bigint(20) NOT NULL,
  `status` int(11) NULL DEFAULT 0,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_exit_interview
-- ----------------------------
DROP TABLE IF EXISTS `employee_exit_interview`;
CREATE TABLE `employee_exit_interview`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `induct` int(11) NOT NULL,
  `no_induct_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `supervision_type_id` bigint(20) NULL DEFAULT NULL,
  `leaving_reason` bigint(20) NULL DEFAULT NULL,
  `main_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `most_satisfying` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `most_stressful` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `any_policies` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `return_to_company` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `recommend_friend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keep_in_business` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `employee_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `interviewer_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `interviewer_signature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `employee_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_exit_interview_details
-- ----------------------------
DROP TABLE IF EXISTS `employee_exit_interview_details`;
CREATE TABLE `employee_exit_interview_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_exit_interview_id` int(11) NOT NULL,
  `option_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_experience
-- ----------------------------
DROP TABLE IF EXISTS `employee_experience`;
CREATE TABLE `employee_experience`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `experience_company_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `experience_job_title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `experience_date_to` date NULL DEFAULT NULL,
  `experience_date_from` date NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_history
-- ----------------------------
DROP TABLE IF EXISTS `employee_history`;
CREATE TABLE `employee_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `old_id` int(11) NULL DEFAULT NULL,
  `new_id` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `ref_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `attachments` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1263 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_logs
-- ----------------------------
DROP TABLE IF EXISTS `employee_logs`;
CREATE TABLE `employee_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `old_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `new_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_medical_history
-- ----------------------------
DROP TABLE IF EXISTS `employee_medical_history`;
CREATE TABLE `employee_medical_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `health_ensurance_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `health_ensurance_date_end` date NOT NULL,
  `health_ensurance_date` date NULL DEFAULT NULL,
  `annual_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `medical_level` tinyint(1) NULL DEFAULT NULL,
  `medical_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 344 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_of_the_month
-- ----------------------------
DROP TABLE IF EXISTS `employee_of_the_month`;
CREATE TABLE `employee_of_the_month`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ref_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `reason` tinyint(4) NOT NULL,
  `what_did_they_do` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `evidence` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attachments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `publish` tinyint(4) NULL DEFAULT NULL,
  `other_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `approve_by_first` int(11) NULL DEFAULT NULL,
  `approve_by_second` int(11) NULL DEFAULT NULL,
  `approve_by_third` int(11) NULL DEFAULT NULL,
  `approve_by_forth` int(11) NULL DEFAULT NULL,
  `approve_by_fifth` int(11) NULL DEFAULT NULL,
  `approve_by_sixth` int(11) NULL DEFAULT NULL,
  `last_approve` int(11) NULL DEFAULT NULL,
  `hr_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exception` tinyint(4) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `rejected_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_old
-- ----------------------------
DROP TABLE IF EXISTS `employee_old`;
CREATE TABLE `employee_old`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `sub_department_id` bigint(20) NULL DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `group_id` bigint(20) NULL DEFAULT NULL,
  `job_group_id` bigint(20) NULL DEFAULT NULL,
  `shift_id` bigint(20) NULL DEFAULT NULL,
  `count_null_hr` bigint(20) NOT NULL,
  `count_not_null_hr` bigint(20) NOT NULL,
  `count_null_personal` bigint(20) NULL DEFAULT NULL,
  `count_not_null_personal` bigint(20) NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `preferable_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `employee_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hiring_date` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `application_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `package_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `assessment_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `collar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_interviewer` tinyint(1) NULL DEFAULT NULL COMMENT '1 => yes , 2 => no',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$h9F/8WrWhxxXwWCxy80tF.Bp5vKDyVVh6LGNQjsJdqkJDY03fpCi6',
  `manager_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `technical_manager_id` bigint(20) NULL DEFAULT NULL,
  `evaluation_manager_id` bigint(20) NULL DEFAULT NULL,
  `sector_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `site_id` bigint(20) NOT NULL,
  `job_level_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `job_group_type` tinyint(4) NULL DEFAULT NULL,
  `position_type` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `board_member` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delegated_at` tinyint(1) NOT NULL DEFAULT 0,
  `user_type_id` tinyint(1) NULL DEFAULT 0,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `marital_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `military_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `national_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nationality` int(11) NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `facebook_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `qualification_type` tinyint(4) NOT NULL COMMENT '1: master_degree, 2:hire, 3:middle, 4:lower, 5:no_qualification',
  `country` int(11) NULL DEFAULT NULL,
  `educational_department` bigint(20) NULL DEFAULT NULL,
  `educational_qualification` bigint(20) NULL DEFAULT NULL,
  `university` bigint(20) NULL DEFAULT NULL,
  `graduation_year` year NULL DEFAULT NULL,
  `school` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_number` int(11) NULL DEFAULT NULL,
  `insurance_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `perivous_insurance_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_out_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_authority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birth_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birth_location_id` int(11) NOT NULL,
  `hiring_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=> still worked / 1=>hold / 2=> deactivated',
  `structure_level_id` int(11) NULL DEFAULT NULL,
  `job_title_id` int(11) NULL DEFAULT NULL,
  `emergency_person_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `emergency_person_relative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `emergency_person_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `official_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hiring_status_id` int(11) NULL DEFAULT NULL,
  `hire_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job_in_insurance` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical_level` int(11) NULL DEFAULT NULL COMMENT '1: level one, 2:level two,3:level three,4:level four',
  `current_employed` tinyint(4) NULL DEFAULT NULL,
  `health_insurance_number` int(11) NULL DEFAULT NULL,
  `health_insurance_date` date NULL DEFAULT NULL,
  `health_insurance_date_end` date NULL DEFAULT NULL,
  `annual_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_card_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:Magnetic,2:plastic,3:none',
  `cost` float NULL DEFAULT NULL,
  `delivery_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `handle_after_leaving` tinyint(4) NULL DEFAULT NULL COMMENT '1:yes,2:no',
  `work_stub_number` int(11) NULL DEFAULT NULL,
  `qualification` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qualification_department` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job_offer_number` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `upload_cv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `current_work_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_unit_id` int(11) NULL DEFAULT NULL,
  `job_function_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `insurance_department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `beginning_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `previous_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `number_of_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `change_job_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_of_job_change` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `salary_total_amount` double NULL DEFAULT NULL,
  `bank_account_number` int(11) NULL DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `passport_number` int(11) NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `salary_net_amount` double NULL DEFAULT NULL,
  `exit_type` int(11) NULL DEFAULT NULL COMMENT '0->resignitation,1->termination,2->death',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `admin_manager_id` bigint(20) NOT NULL,
  `countNOTNull` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `countNull` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payroll_active` tinyint(1) NOT NULL DEFAULT 0,
  `fingerprint_exemption` tinyint(1) NOT NULL DEFAULT 0,
  `disability` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 == no | 1 == yes',
  `resignation_letter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `form_6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_work_date` date NULL DEFAULT NULL,
  `date_of_death` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `uuid`) USING BTREE,
  INDEX `id_index`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms`;
CREATE TABLE `employee_pms`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `system_setting_id` bigint(20) NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `accepted_by` bigint(20) NULL DEFAULT NULL,
  `not_accepted_by` bigint(20) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  `ref_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `not_accept_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reject_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kpi_score` float NULL DEFAULT NULL,
  `kpi_weight_score` float NULL DEFAULT NULL,
  `competence_score` float NULL DEFAULT NULL,
  `final_score` float NULL DEFAULT NULL,
  `manager_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_employee_signature` timestamp NULL DEFAULT NULL,
  `date_manager_signature` timestamp NULL DEFAULT NULL,
  `status_employee` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `final_submit` tinyint(4) NULL DEFAULT 0 COMMENT '0: pending, 1: final submit',
  `total_target` float NULL DEFAULT NULL,
  `year` int(11) NOT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 510 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_career_plannings
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_career_plannings`;
CREATE TABLE `employee_pms_career_plannings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pms_id` int(11) NOT NULL,
  `short_term` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `long_term` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `improvement_area` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `action_improvement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `employee_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `manager_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `training` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `institute_source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `preferred_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 305 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_copy1
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_copy1`;
CREATE TABLE `employee_pms_copy1`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `system_setting_id` bigint(20) NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `accepted_by` bigint(20) NULL DEFAULT NULL,
  `not_accepted_by` bigint(20) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  `ref_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `not_accept_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reject_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kpi_score` float NULL DEFAULT NULL,
  `kpi_weight_score` float NULL DEFAULT NULL,
  `competence_score` float NULL DEFAULT NULL,
  `final_score` float NULL DEFAULT NULL,
  `manager_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_employee_signature` timestamp NULL DEFAULT NULL,
  `date_manager_signature` timestamp NULL DEFAULT NULL,
  `status_employee` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `final_submit` tinyint(4) NULL DEFAULT 0 COMMENT '0: pending, 1: final submit',
  `total_target` float NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 482 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_details
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_details`;
CREATE TABLE `employee_pms_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `emp_pms_id` bigint(20) NULL DEFAULT NULL,
  `kpi_id` bigint(20) NULL DEFAULT NULL,
  `baseline` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NULL DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NULL DEFAULT NULL,
  `weight` int(11) NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2842 CHARACTER SET = utf32 COLLATE = utf32_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_details_score_competencies
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_details_score_competencies`;
CREATE TABLE `employee_pms_details_score_competencies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pms_id` int(11) NOT NULL,
  `competence_id` int(11) NOT NULL,
  `point_value` float NOT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8383 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for employee_pms_details_score_kpis
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_details_score_kpis`;
CREATE TABLE `employee_pms_details_score_kpis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pms_id` int(11) NOT NULL,
  `pms_details_id` int(11) NOT NULL,
  `target` float NOT NULL,
  `weight` float NOT NULL,
  `achievement` float NULL DEFAULT NULL,
  `score` float NULL DEFAULT NULL,
  `weight_score` float NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7142 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_old
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_old`;
CREATE TABLE `employee_pms_old`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `accepted_by` bigint(20) NULL DEFAULT NULL,
  `not_accepted_by` bigint(20) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  `ref_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `not_accept_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reject_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kpi_score` float NULL DEFAULT NULL,
  `kpi_weight_score` float NULL DEFAULT NULL,
  `competence_score` float NULL DEFAULT NULL,
  `final_score` float NULL DEFAULT NULL,
  `manager_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_employee_signature` timestamp NULL DEFAULT NULL,
  `date_manager_signature` timestamp NULL DEFAULT NULL,
  `status_employee` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `final_submit` tinyint(4) NULL DEFAULT 0 COMMENT '0: pending, 1: final submit',
  `total_target` float NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 482 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_old-2
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_old-2`;
CREATE TABLE `employee_pms_old-2`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `system_setting_id` bigint(20) NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `accepted_by` bigint(20) NULL DEFAULT NULL,
  `not_accepted_by` bigint(20) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  `ref_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `not_accept_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reject_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kpi_score` float NULL DEFAULT NULL,
  `kpi_weight_score` float NULL DEFAULT NULL,
  `competence_score` float NULL DEFAULT NULL,
  `final_score` float NULL DEFAULT NULL,
  `manager_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_employee_signature` timestamp NULL DEFAULT NULL,
  `date_manager_signature` timestamp NULL DEFAULT NULL,
  `status_employee` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `final_submit` tinyint(4) NULL DEFAULT 0 COMMENT '0: pending, 1: final submit',
  `total_target` float NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 482 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_payroll_percentage
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_payroll_percentage`;
CREATE TABLE `employee_pms_payroll_percentage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` int(11) NULL DEFAULT NULL,
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `year` bigint(20) NOT NULL,
  `competency_percentage` float NULL DEFAULT NULL,
  `kpi_percentage` float NULL DEFAULT NULL,
  `percentage_of_increase_Below_60` float NULL DEFAULT NULL,
  `percentage_of_increase_From_61_to_70` float NULL DEFAULT NULL,
  `percentage_of_increase_From_71_to_80` float NULL DEFAULT NULL,
  `percentage_of_increase_From_81_to_95` float NULL DEFAULT NULL,
  `percentage_of_increase_more_than_96` float NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_payroll_percentage_copy1
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_payroll_percentage_copy1`;
CREATE TABLE `employee_pms_payroll_percentage_copy1`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` int(11) NULL DEFAULT NULL,
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `year` bigint(20) NOT NULL,
  `competency_percentage` float NULL DEFAULT NULL,
  `kpi_percentage` float NULL DEFAULT NULL,
  `percentage_of_increase_Below_60` float NULL DEFAULT NULL,
  `percentage_of_increase_From_61_to_70` float NULL DEFAULT NULL,
  `percentage_of_increase_From_71_to_80` float NULL DEFAULT NULL,
  `percentage_of_increase_From_81_to_95` float NULL DEFAULT NULL,
  `percentage_of_increase_more_than_96` float NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_versions
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_versions`;
CREATE TABLE `employee_pms_versions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_pms_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `kpi_percentage` int(11) NULL DEFAULT NULL,
  `competency_percentage` int(11) NULL DEFAULT NULL,
  `final_score` float NULL DEFAULT NULL,
  `year` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `month` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `percentage_of_increase` double NULL DEFAULT NULL,
  `type` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 962 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_pms_versions_copy1
-- ----------------------------
DROP TABLE IF EXISTS `employee_pms_versions_copy1`;
CREATE TABLE `employee_pms_versions_copy1`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_pms_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `kpi_percentage` int(11) NULL DEFAULT NULL,
  `competency_percentage` int(11) NULL DEFAULT NULL,
  `final_score` float NULL DEFAULT NULL,
  `year` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `month` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `percentage_of_increase` double NULL DEFAULT NULL,
  `type` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 950 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_private_vacation_access
-- ----------------------------
DROP TABLE IF EXISTS `employee_private_vacation_access`;
CREATE TABLE `employee_private_vacation_access`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `employee_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `vacation_type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `access` tinyint(3) UNSIGNED NULL DEFAULT 2,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 248 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for employee_probation
-- ----------------------------
DROP TABLE IF EXISTS `employee_probation`;
CREATE TABLE `employee_probation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `employee_id` int(11) NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `total_grade` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for employee_profile_report
-- ----------------------------
DROP TABLE IF EXISTS `employee_profile_report`;
CREATE TABLE `employee_profile_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `personal_percentage` int(11) NULL DEFAULT NULL,
  `hr_percentage` int(11) NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1059 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_rejection_pms_histories
-- ----------------------------
DROP TABLE IF EXISTS `employee_rejection_pms_histories`;
CREATE TABLE `employee_rejection_pms_histories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kpi_score` float NULL DEFAULT NULL,
  `pms_id` int(11) NOT NULL,
  `competence_score` float NOT NULL,
  `final_score` float NOT NULL,
  `reject_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reject_date` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL COMMENT '1 Approved -- 0 Rejected',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 622 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_shifts_history
-- ----------------------------
DROP TABLE IF EXISTS `employee_shifts_history`;
CREATE TABLE `employee_shifts_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `old_shift_id` int(11) NULL DEFAULT NULL,
  `new_shift_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 325 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_training
-- ----------------------------
DROP TABLE IF EXISTS `employee_training`;
CREATE TABLE `employee_training`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `type` tinyint(4) NULL DEFAULT 0 COMMENT '0: EEC TRAINING, 1:  without EEC TRAINIBG',
  `training_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `training_date_from` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `training_date_to` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `training_commitment_end_date` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `training_course_fees` bigint(20) NULL DEFAULT NULL,
  `training_center_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `training_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5234 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_vacation_balance
-- ----------------------------
DROP TABLE IF EXISTS `employee_vacation_balance`;
CREATE TABLE `employee_vacation_balance`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `organization_id` int(11) NOT NULL DEFAULT 1,
  `vacation_type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `balance` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `reserved_balance` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `remain` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `used` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `year` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `is_hidden` tinyint(4) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `checked` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40251 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_vacation_balance_copy1
-- ----------------------------
DROP TABLE IF EXISTS `employee_vacation_balance_copy1`;
CREATE TABLE `employee_vacation_balance_copy1`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `organization_id` int(11) NOT NULL DEFAULT 1,
  `vacation_type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `balance` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `remain` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `used` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `year` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22641 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_vacation_balance_import_history
-- ----------------------------
DROP TABLE IF EXISTS `employee_vacation_balance_import_history`;
CREATE TABLE `employee_vacation_balance_import_history`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `organization_id` int(11) NOT NULL,
  `old_vacation_type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `new_vacation_type_id` int(11) NOT NULL,
  `old_balance` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `new_balance` float(10, 2) NOT NULL,
  `old_remain` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `new_remain` float(10, 2) NOT NULL,
  `old_used` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `new_used` float(10, 2) NOT NULL,
  `year` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2069 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for employee_vacations
-- ----------------------------
DROP TABLE IF EXISTS `employee_vacations`;
CREATE TABLE `employee_vacations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization_id` int(11) NOT NULL DEFAULT 1,
  `employee_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `substitute_employee_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `vacation_type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `date_from` date NULL DEFAULT NULL,
  `date_to` date NULL DEFAULT NULL,
  `num_days` float UNSIGNED NULL DEFAULT NULL,
  `num_days_off` int(10) UNSIGNED NULL DEFAULT NULL,
  `year` int(10) UNSIGNED NULL DEFAULT NULL,
  `is_done` int(11) NULL DEFAULT 0 COMMENT '0=> not done, 1=>done',
  `attaches` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `approval_steps` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `done` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `ref_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `approval1` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `approval2` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `approval1_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `approval1_at` datetime NULL DEFAULT NULL,
  `approval2_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `approval2_at` datetime NULL DEFAULT NULL,
  `reject_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `num_days_canceled` int(10) UNSIGNED NULL DEFAULT NULL,
  `canceled_date_selected` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `canceled_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `canceled_by_hr` tinyint(1) NULL DEFAULT 0,
  `canceled_at` datetime NULL DEFAULT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  `compensation_days_expired` int(11) NULL DEFAULT NULL,
  `reject_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `reject_at` datetime NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10158 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for exception_leave_permissions
-- ----------------------------
DROP TABLE IF EXISTS `exception_leave_permissions`;
CREATE TABLE `exception_leave_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization_id` int(11) NOT NULL DEFAULT 1,
  `leave_permission_type` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `other_location` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shift_id` int(11) NULL DEFAULT NULL,
  `employee_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exception_date` date NULL DEFAULT NULL,
  `exception_time` time NULL DEFAULT NULL,
  `exception_num_hours` int(11) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '2=pending 1=approved 3=rejected 4=cancelled',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for exchange_requests
-- ----------------------------
DROP TABLE IF EXISTS `exchange_requests`;
CREATE TABLE `exchange_requests`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `request_type` tinyint(4) NOT NULL,
  `name_type` tinyint(4) NULL DEFAULT NULL,
  `payment_type_with` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_type_without` tinyint(4) NULL DEFAULT NULL,
  `cheque_number_request` bigint(20) NULL DEFAULT NULL,
  `requester_id` bigint(20) NULL DEFAULT NULL,
  `bank_id` bigint(20) NULL DEFAULT NULL,
  `number_bank_notebook` bigint(20) NULL DEFAULT NULL,
  `cheque_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_cheque_number` tinyint(4) NULL DEFAULT 0 COMMENT '0 not deleted and not used  - 1 - deleted and use - 2 - deleted and not use - null for bank_transfer',
  `name_type_id` bigint(20) NULL DEFAULT NULL,
  `other_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `export_location` tinyint(4) NULL DEFAULT NULL,
  `cheque_lined` tinyint(4) NULL DEFAULT NULL,
  `first_signer` bigint(20) NULL DEFAULT NULL,
  `second_signer` bigint(20) NULL DEFAULT NULL,
  `cheque_status` tinyint(4) NULL DEFAULT NULL,
  `bank_transfer_status` tinyint(4) NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `name_on_cheque` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value_letter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_account_number` bigint(20) NULL DEFAULT NULL,
  `to_account_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_person` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storing_id` bigint(20) NULL DEFAULT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purpose_transfer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6948 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for exit_interview_types
-- ----------------------------
DROP TABLE IF EXISTS `exit_interview_types`;
CREATE TABLE `exit_interview_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for expertise_categories
-- ----------------------------
DROP TABLE IF EXISTS `expertise_categories`;
CREATE TABLE `expertise_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for expertise_logs
-- ----------------------------
DROP TABLE IF EXISTS `expertise_logs`;
CREATE TABLE `expertise_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `old_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expertise_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for expertise_types
-- ----------------------------
DROP TABLE IF EXISTS `expertise_types`;
CREATE TABLE `expertise_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expertise_category_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fabrication_orders
-- ----------------------------
DROP TABLE IF EXISTS `fabrication_orders`;
CREATE TABLE `fabrication_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `weight` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `other_weight` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `unit_id` int(11) NULL DEFAULT NULL,
  `item_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status_deactivate` tinyint(1) NULL DEFAULT 0,
  `created_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for faculities
-- ----------------------------
DROP TABLE IF EXISTS `faculities`;
CREATE TABLE `faculities`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `university_id` int(11) NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for family_name_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `family_name_suppliers`;
CREATE TABLE `family_name_suppliers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `family_name_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `family_name_suppliers_supplier_id_foreign`(`supplier_id`) USING BTREE,
  INDEX `family_name_suppliers_family_name_id_foreign`(`family_name_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8192 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for family_names
-- ----------------------------
DROP TABLE IF EXISTS `family_names`;
CREATE TABLE `family_names`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_group_id` bigint(20) UNSIGNED NOT NULL,
  `both` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `uuid`) USING BTREE,
  INDEX `family_names_sub_group_id_foreign`(`sub_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for file_materials
-- ----------------------------
DROP TABLE IF EXISTS `file_materials`;
CREATE TABLE `file_materials`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_file` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `material_id` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for file_purchase_orders
-- ----------------------------
DROP TABLE IF EXISTS `file_purchase_orders`;
CREATE TABLE `file_purchase_orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `file_refused` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `file_purchase_orders_purchase_order_id_foreign`(`purchase_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2342 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for file_purchase_requests
-- ----------------------------
DROP TABLE IF EXISTS `file_purchase_requests`;
CREATE TABLE `file_purchase_requests`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `purchase_request_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `file_purchase_requests_purchase_request_id_foreign`(`purchase_request_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1362 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for file_repository
-- ----------------------------
DROP TABLE IF EXISTS `file_repository`;
CREATE TABLE `file_repository`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization_id` int(11) NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attachment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `published` tinyint(1) NULL DEFAULT 1 COMMENT '1 => published | 0 => not',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for functions
-- ----------------------------
DROP TABLE IF EXISTS `functions`;
CREATE TABLE `functions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sub_department_id` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `manager_id` bigint(20) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for governorates
-- ----------------------------
DROP TABLE IF EXISTS `governorates`;
CREATE TABLE `governorates`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `governorates_country_id_foreign`(`country_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `both` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for guarantees
-- ----------------------------
DROP TABLE IF EXISTS `guarantees`;
CREATE TABLE `guarantees`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `type_guarantees` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `user_party` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `right_date` date NULL DEFAULT NULL,
  `answer` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `guarantees_supplier_id_foreign`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for hiring_history
-- ----------------------------
DROP TABLE IF EXISTS `hiring_history`;
CREATE TABLE `hiring_history`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `employee_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `job_title_id` int(11) NULL DEFAULT NULL,
  `structure_level_id` int(11) NOT NULL,
  `head_manager_id` int(11) NULL DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'activate, deactivate, leave_job, assign_to_job',
  `created_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  `transaction_date` datetime NULL DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 701 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for hiring_request_form
-- ----------------------------
DROP TABLE IF EXISTS `hiring_request_form`;
CREATE TABLE `hiring_request_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_title_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `sub_department_id` bigint(20) NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `role` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `report_to_employee_id` bigint(20) NULL DEFAULT NULL,
  `job_summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `education` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `experince` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `working_hours` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `days_off` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `compensation_range` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `employment_type` enum('full_time','part_time') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reason_for_hiring` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `expecting_hiring_date` date NULL DEFAULT NULL,
  `number_of_employees` int(11) NULL DEFAULT NULL,
  `first_approve_by` int(11) NULL DEFAULT NULL,
  `first_approve_date` date NULL DEFAULT NULL,
  `first_approve_status` int(11) NULL DEFAULT NULL,
  `seconed_approve_by` int(11) NULL DEFAULT NULL,
  `seconed_approve_date` date NULL DEFAULT NULL,
  `seconed_approve_status` int(11) NULL DEFAULT NULL,
  `third_approve_by` int(11) NULL DEFAULT NULL,
  `third_approve_date` date NULL DEFAULT NULL,
  `third_approve_status` int(11) NULL DEFAULT NULL,
  `node_approve_status` int(11) NULL DEFAULT 0,
  `node_approved_by` bigint(20) NULL DEFAULT NULL,
  `node_approved_at` timestamp NULL DEFAULT NULL,
  `cancel_by` int(11) NULL DEFAULT NULL,
  `cancel_at` timestamp NULL DEFAULT NULL,
  `hold` int(11) NULL DEFAULT 0,
  `hold_at` timestamp NULL DEFAULT NULL,
  `unhold_or_hold_by` int(11) NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `rejected_by` int(11) NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for hiring_request_form_hired_history
-- ----------------------------
DROP TABLE IF EXISTS `hiring_request_form_hired_history`;
CREATE TABLE `hiring_request_form_hired_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hiring_request_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `hiring_date` date NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for hr_request_details
-- ----------------------------
DROP TABLE IF EXISTS `hr_request_details`;
CREATE TABLE `hr_request_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hr_request_id` int(11) NOT NULL,
  `record_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` int(11) NULL DEFAULT 0,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for hr_requests
-- ----------------------------
DROP TABLE IF EXISTS `hr_requests`;
CREATE TABLE `hr_requests`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` int(11) NULL DEFAULT NULL,
  `ref_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_id` int(11) NOT NULL,
  `hr_request_type` int(11) NOT NULL COMMENT '1: it_forms ---> it_change_request, 2: it_forms ---> exception_permission, 3: general_forms--->hr_letter, 4: general_forms--->medical_insurance, 5: general_forms--->request_change_user_profile_data',
  `services` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '[1:network_access,2:internet_access,3:email_account,4:other_services]',
  `equipment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '[1:laptop,2:desktop_computer,3:computer_monitor,4:computer_keyboard,5:computer_mouse,6:external_hard_disk,7:usb_flash_drive,8:memory_card,9:multi_outlet,10:A4_mono_laser_printer(black & white),11:A4 colour printer,12:A3 mono laser printer(black&white),13:a3 colour printer, 14:printer ink cartridges,15:computer_scanner,16:other_equipment]',
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `other_services` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `other_equipment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `date_from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_to` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `equipement_type` int(11) NULL DEFAULT NULL COMMENT '[1:laptop,2:desktop_computer,3:computer_monitor,4:computer_keyboard,5:computer_mouse,6:external_hard_disk,7:usb_flash_drive,8:memory_card,9:multi_outlet,10:A4_mono_laser_printer(black & white),11:A4 colour printer,12:A3 mono laser printer(black&white),13:a3 colour printer, 14:printer ink cartridges,15:computer_scanner,16:other_type]',
  `manufacturer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serial_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `other_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hr_lang` tinyint(1) NULL DEFAULT NULL COMMENT '1: arabic, 2: english',
  `hr_to` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hr_salary` tinyint(1) NULL DEFAULT NULL COMMENT '1:required,2:not required',
  `hr_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vacation_type` tinyint(1) NULL DEFAULT NULL,
  `vacation_date` date NULL DEFAULT NULL,
  `vacation_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `medical_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `social_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `bank_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `finger_date` date NULL DEFAULT NULL,
  `finger_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pantry_date` date NULL DEFAULT NULL,
  `pantry_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `emp_docs_type` tinyint(1) NULL DEFAULT NULL,
  `emp_docs_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `emp_docs_expect_date` date NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `done` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: default pending, 1: done',
  `action_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `it_status` tinyint(4) NULL DEFAULT 0 COMMENT '0: not proccess yet, 1:completed, 2:esclate,3:revert',
  `reject_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `esclate_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `revert_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_vacancy_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_vacancy_phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_vacancy_education` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `recommend_vacancy_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_vacancy_cv` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `recommend_vacancy_notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `referral_bounce_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `referral_bounce_notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `medical_program` tinyint(4) NULL DEFAULT NULL COMMENT '1:program one, 2: program two, 3: program three, 4: program four',
  `medical_for_id` int(11) NULL DEFAULT NULL COMMENT '0: my_self, 1: wife, 2: son or daughter, 3: other_employee, 4: galva',
  `full_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth_date` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `national_id` bigint(20) NULL DEFAULT NULL,
  `personnel_image` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `medical_notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 635 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for industries
-- ----------------------------
DROP TABLE IF EXISTS `industries`;
CREATE TABLE `industries`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 is published',
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for inquiry_purchase_requests
-- ----------------------------
DROP TABLE IF EXISTS `inquiry_purchase_requests`;
CREATE TABLE `inquiry_purchase_requests`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_request_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `item_request_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `send_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `receive_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `edit_item` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `approve` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `send_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `receive_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `alternate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `technical_office` int(11) NOT NULL,
  `approve_technical_office` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `aprove_first_date` datetime NULL DEFAULT NULL,
  `aprove_last_date` datetime NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inquiry_purchase_requests_purchase_request_id_foreign`(`purchase_request_id`) USING BTREE,
  INDEX `inquiry_purchase_requests_item_request_id_foreign`(`item_request_id`) USING BTREE,
  INDEX `inquiry_purchase_requests_send_id_foreign`(`send_id`) USING BTREE,
  INDEX `inquiry_purchase_requests_receive_id_foreign`(`receive_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 619 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for insurance
-- ----------------------------
DROP TABLE IF EXISTS `insurance`;
CREATE TABLE `insurance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `insurance_type` tinyint(4) NOT NULL,
  `construction_type` tinyint(4) NULL DEFAULT NULL,
  `requester_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NULL DEFAULT NULL,
  `project_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `desk` tinyint(4) NULL DEFAULT NULL,
  `governorate_id` bigint(20) NULL DEFAULT NULL,
  `claim_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `abstract_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_request_id` bigint(20) NULL DEFAULT NULL,
  `statement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_date` date NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eta_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `eta_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reference_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `item_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `business_nature_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `covenant_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `detection_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `type_person` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'sup',
  `purchases_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'others',
  `po_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `due_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `due_date_value` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `due_date2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `due_date_value2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_invoice` date NULL DEFAULT NULL,
  `invoice_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `specifications` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `currency` int(11) NOT NULL DEFAULT 1,
  `exchange_rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `value_tax_rate` int(11) NULL DEFAULT 0,
  `value_tax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `overall_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `other_discount` int(11) NULL DEFAULT NULL,
  `total_after_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restrained_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'not_restrained',
  `nature_dealing_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `expense_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'cashe',
  `tax_deduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `tax_deduction_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `net_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_insurance_rate` int(11) NULL DEFAULT NULL,
  `business_insurance_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `net_total_after_business_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_edit` timestamp NULL DEFAULT NULL,
  `transaction_taxes_id` int(11) NULL DEFAULT NULL,
  `vat_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `reference_number`(`reference_number`) USING BTREE,
  UNIQUE INDEX `eta_id`(`eta_id`) USING BTREE,
  UNIQUE INDEX `eta_id_2`(`eta_id`) USING BTREE,
  UNIQUE INDEX `eta_id_3`(`eta_id`) USING BTREE,
  UNIQUE INDEX `eta_url`(`eta_url`) USING BTREE,
  INDEX `invoices_item_id_foreign`(`item_id`) USING BTREE,
  INDEX `invoices_project_id_foreign`(`project_id`) USING BTREE,
  INDEX `invoices_business_nature_id_foreign`(`business_nature_id`) USING BTREE,
  INDEX `invoices_supplier_id_foreign`(`supplier_id`) USING BTREE,
  INDEX `invoices_nature_dealing_id_foreign`(`nature_dealing_id`) USING BTREE,
  INDEX `invoices_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52782 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for invoices_histories
-- ----------------------------
DROP TABLE IF EXISTS `invoices_histories`;
CREATE TABLE `invoices_histories`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `approve` date NULL DEFAULT NULL,
  `dupdate` date NULL DEFAULT NULL,
  `user_approve` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `user_edit` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_delete` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54049 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for invoices_po
-- ----------------------------
DROP TABLE IF EXISTS `invoices_po`;
CREATE TABLE `invoices_po`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 904 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for ipmachine
-- ----------------------------
DROP TABLE IF EXISTS `ipmachine`;
CREATE TABLE `ipmachine`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `type` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `deductions_attributeType_id_foreign`(`name_ar`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for item_orders
-- ----------------------------
DROP TABLE IF EXISTS `item_orders`;
CREATE TABLE `item_orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` float NOT NULL,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `item_request_id` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `comment_refuse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `comment_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `comment_item_refuse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `used_quantity` float NOT NULL,
  `specification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `unit_new` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `comment_change_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `action_comment_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_orders_purchase_order_id_foreign`(`purchase_order_id`) USING BTREE,
  INDEX `item_orders_unit_id_foreign`(`unit_id`) USING BTREE,
  INDEX `item_orders_action_comment_id_foreign`(`action_comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9965 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for item_requests
-- ----------------------------
DROP TABLE IF EXISTS `item_requests`;
CREATE TABLE `item_requests`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_request_id` bigint(20) UNSIGNED NOT NULL,
  `family_name_id` bigint(20) UNSIGNED NOT NULL,
  `specification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `comment_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` float NOT NULL,
  `stock_quantity` float NOT NULL,
  `actual_quantity` float NOT NULL,
  `used_quantity` float NOT NULL,
  `comment_refuse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `priority` enum('L','M','H') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'L: Low, M: Medium, H: High',
  `factory_specification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reserved_quantity` float NULL DEFAULT NULL,
  `max_date_delivery` date NULL DEFAULT NULL,
  `start_date_supply` date NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `edit_specification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `action_comment_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_requests_purchase_request_id_foreign`(`purchase_request_id`) USING BTREE,
  INDEX `item_requests_family_name_id_foreign`(`family_name_id`) USING BTREE,
  INDEX `item_requests_unit_id_foreign`(`unit_id`) USING BTREE,
  INDEX `item_requests_action_comment_id_foreign`(`action_comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21911 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for items_coding
-- ----------------------------
DROP TABLE IF EXISTS `items_coding`;
CREATE TABLE `items_coding`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit_id` bigint(20) NULL DEFAULT NULL,
  `family_name_id` bigint(20) NULL DEFAULT NULL,
  `group_id` bigint(20) NULL DEFAULT NULL,
  `sub_group_id` bigint(20) NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15770 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int(11) NULL DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for job_competencies
-- ----------------------------
DROP TABLE IF EXISTS `job_competencies`;
CREATE TABLE `job_competencies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `competency_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:core, 2: managerial,3:functional',
  `competency_indicator_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `competency_rule` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for job_competencies_indicators
-- ----------------------------
DROP TABLE IF EXISTS `job_competencies_indicators`;
CREATE TABLE `job_competencies_indicators`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for job_groups
-- ----------------------------
DROP TABLE IF EXISTS `job_groups`;
CREATE TABLE `job_groups`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_grade_id` int(11) NOT NULL,
  `code_type` int(11) NOT NULL,
  `compensations` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for job_levels
-- ----------------------------
DROP TABLE IF EXISTS `job_levels`;
CREATE TABLE `job_levels`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `grade` int(11) NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for job_transfers
-- ----------------------------
DROP TABLE IF EXISTS `job_transfers`;
CREATE TABLE `job_transfers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `structure_level_id` int(11) NOT NULL,
  `employee_id` int(11) NULL DEFAULT NULL,
  `job_id` int(11) NULL DEFAULT NULL,
  `head_manager_id` int(11) NULL DEFAULT NULL,
  `old_job_date` date NULL DEFAULT NULL,
  `new_job_date` date NULL DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transfered` tinyint(1) NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`, `structure_level_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for kpi_departments
-- ----------------------------
DROP TABLE IF EXISTS `kpi_departments`;
CREATE TABLE `kpi_departments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `equation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `department_id` bigint(20) NULL DEFAULT NULL,
  `frequency` tinyint(4) NULL DEFAULT NULL COMMENT '0: annual, 1: quarterly',
  `equition` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `objective_id` bigint(20) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `kpi_type_one` tinyint(4) NULL DEFAULT NULL COMMENT '0: strategic, 1: operational',
  `kpi_type_two` tinyint(4) NULL DEFAULT NULL COMMENT '0: linear, 1: inverted',
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for kpi_positions
-- ----------------------------
DROP TABLE IF EXISTS `kpi_positions`;
CREATE TABLE `kpi_positions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `equation` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `frequency` tinyint(4) NULL DEFAULT NULL COMMENT '0:annual, 1:quarterly',
  `kpi_type_one` tinyint(4) NULL DEFAULT NULL COMMENT '0: strategic, 1: operational',
  `kpi_type_two` tinyint(4) NULL DEFAULT NULL COMMENT '0: linear, 1: inverted',
  `department_id` bigint(20) NULL DEFAULT 38,
  `is_same_with_department` tinyint(4) NULL DEFAULT NULL COMMENT '0: not checked, 1: checked',
  `kpi_department_related` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 634 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for leave_permissions
-- ----------------------------
DROP TABLE IF EXISTS `leave_permissions`;
CREATE TABLE `leave_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `mission_request` tinyint(1) NOT NULL,
  `time` time NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `num_hours` int(11) NULL DEFAULT NULL,
  `permission_type` tinyint(4) NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(11) NOT NULL COMMENT '2=pending 1=approved 3=rejected 4=cancelled',
  `ref_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_done` int(11) NULL DEFAULT 0 COMMENT '0: not done, 1: done',
  `reject_comment` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approve_by` int(11) NOT NULL,
  `approve_date` date NULL DEFAULT NULL,
  `reject_by` int(11) NOT NULL,
  `reject_date` date NULL DEFAULT NULL,
  `cancelled_by` int(11) NOT NULL,
  `cancelled_date` date NULL DEFAULT NULL,
  `mission_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mission_date_from` date NULL DEFAULT NULL,
  `mission_date_to` date NULL DEFAULT NULL,
  `mission_time_from` time NULL DEFAULT NULL,
  `mission_time_to` time NULL DEFAULT NULL,
  `location_site_id` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22708 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ltm_translations
-- ----------------------------
DROP TABLE IF EXISTS `ltm_translations`;
CREATE TABLE `ltm_translations`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15360 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for majors
-- ----------------------------
DROP TABLE IF EXISTS `majors`;
CREATE TABLE `majors`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculity_id` int(11) NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 256 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for material_receipts
-- ----------------------------
DROP TABLE IF EXISTS `material_receipts`;
CREATE TABLE `material_receipts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `recipient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_order_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_received` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `receipt_number` int(11) NOT NULL,
  `recipient_date` datetime NOT NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `material_receipts_item_order_id_foreign`(`item_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for medical_management
-- ----------------------------
DROP TABLE IF EXISTS `medical_management`;
CREATE TABLE `medical_management`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attachments` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `medical_company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for model_has_roles-old
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles-old`;
CREATE TABLE `model_has_roles-old`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for model_has_roles_old
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles_old`;
CREATE TABLE `model_has_roles_old`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for months
-- ----------------------------
DROP TABLE IF EXISTS `months`;
CREATE TABLE `months`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for multi_organizations
-- ----------------------------
DROP TABLE IF EXISTS `multi_organizations`;
CREATE TABLE `multi_organizations`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `commercial_registration_number` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_file_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `short_name` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deactivate` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for nature_dealings
-- ----------------------------
DROP TABLE IF EXISTS `nature_dealings`;
CREATE TABLE `nature_dealings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nature_dealings_discount_type_id_foreign`(`discount_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for noding
-- ----------------------------
DROP TABLE IF EXISTS `noding`;
CREATE TABLE `noding`  (
  `id` bigint(20) NOT NULL,
  `uuid` char(36) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_en` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `manager_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf32 COLLATE = utf32_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `target_link` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for notifications_details
-- ----------------------------
DROP TABLE IF EXISTS `notifications_details`;
CREATE TABLE `notifications_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `read_message` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => no | 1 => yes',
  `read_by` int(11) NOT NULL,
  `read_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2180 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for objective
-- ----------------------------
DROP TABLE IF EXISTS `objective`;
CREATE TABLE `objective`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pay_roll_item_types
-- ----------------------------
DROP TABLE IF EXISTS `pay_roll_item_types`;
CREATE TABLE `pay_roll_item_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amount` float NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pay_roll_types
-- ----------------------------
DROP TABLE IF EXISTS `pay_roll_types`;
CREATE TABLE `pay_roll_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` int(11) NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_types_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_types_id`(`item_types_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for payment_exchange_details
-- ----------------------------
DROP TABLE IF EXISTS `payment_exchange_details`;
CREATE TABLE `payment_exchange_details`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `purchase_order_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for payment_invoices
-- ----------------------------
DROP TABLE IF EXISTS `payment_invoices`;
CREATE TABLE `payment_invoices`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `cheque_id` int(11) NULL DEFAULT NULL,
  `purchase_order_id` int(11) NULL DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `type_person` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'sup',
  `exchange_request_id` bigint(20) NULL DEFAULT NULL,
  `po_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `invoice_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_method` enum('cashe','cheque_accept_payment','cheque_document','bank_transfer','withhold','closing','cheque_payable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_payment` date NOT NULL,
  `exchange_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `supplier_bank_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `cheque_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_delivery_in` date NULL DEFAULT NULL,
  `recipient_name_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_delivery_out` date NULL DEFAULT NULL,
  `recipient_name_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `approved` tinyint(1) NULL DEFAULT NULL,
  `userApproved_id` bigint(20) NULL DEFAULT NULL,
  `approved_at` date NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_edit` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `opening_balance` tinyint(1) NULL DEFAULT NULL,
  `order_number_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `reference_number`(`reference_number`) USING BTREE,
  INDEX `payment_invoices_item_id_foreign`(`item_id`) USING BTREE,
  INDEX `payment_invoices_project_id_foreign`(`project_id`) USING BTREE,
  INDEX `payment_invoices_supplier_id_foreign`(`supplier_id`) USING BTREE,
  INDEX `payment_invoices_bank_id_foreign`(`bank_id`) USING BTREE,
  INDEX `payment_invoices_supplier_bank_id_foreign`(`supplier_bank_id`) USING BTREE,
  INDEX `payment_invoices_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19588 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for payment_invoices_old
-- ----------------------------
DROP TABLE IF EXISTS `payment_invoices_old`;
CREATE TABLE `payment_invoices_old`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `cheque_id` int(11) NULL DEFAULT NULL,
  `purchase_order_id` int(11) NULL DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `type_person` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'sup',
  `exchange_request_id` bigint(20) NULL DEFAULT NULL,
  `po_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `invoice_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_method` enum('cashe','cheque_accept_payment','cheque_document','bank_transfer','withhold','closing','cheque_payable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_payment` date NOT NULL,
  `exchange_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `supplier_bank_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `cheque_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_delivery_in` date NULL DEFAULT NULL,
  `recipient_name_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_delivery_out` date NULL DEFAULT NULL,
  `recipient_name_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `approved` tinyint(1) NULL DEFAULT NULL,
  `userApproved_id` bigint(20) NULL DEFAULT NULL,
  `approved_at` date NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_edit` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `opening_balance` tinyint(1) NULL DEFAULT NULL,
  `order_number_type` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `reference_number`(`reference_number`) USING BTREE,
  INDEX `payment_invoices_item_id_foreign`(`item_id`) USING BTREE,
  INDEX `payment_invoices_project_id_foreign`(`project_id`) USING BTREE,
  INDEX `payment_invoices_supplier_id_foreign`(`supplier_id`) USING BTREE,
  INDEX `payment_invoices_bank_id_foreign`(`bank_id`) USING BTREE,
  INDEX `payment_invoices_supplier_bank_id_foreign`(`supplier_bank_id`) USING BTREE,
  INDEX `payment_invoices_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14763 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for payroll_monthly_attendance_report
-- ----------------------------
DROP TABLE IF EXISTS `payroll_monthly_attendance_report`;
CREATE TABLE `payroll_monthly_attendance_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_id` int(11) NOT NULL,
  `month` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `month_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `month_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_delays_total_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delays_total_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `one_fp_total_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `absence_total_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `leave_no_pay_total_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for payslip_objection
-- ----------------------------
DROP TABLE IF EXISTS `payslip_objection`;
CREATE TABLE `payslip_objection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `objection_status` tinyint(1) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_by` int(11) NOT NULL,
  `done` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for permission_groups
-- ----------------------------
DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE `permission_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for permission_user
-- ----------------------------
DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `permission_id`, `user_type`) USING BTREE,
  INDEX `permission_user_permission_id_foreign`(`permission_id`) USING BTREE,
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_group_id` bigint(20) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 982 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for person_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `person_suppliers`;
CREATE TABLE `person_suppliers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `whatsapp` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `person_suppliers_supplier_id_foreign`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7990 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for perspectives
-- ----------------------------
DROP TABLE IF EXISTS `perspectives`;
CREATE TABLE `perspectives`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for position_kpi
-- ----------------------------
DROP TABLE IF EXISTS `position_kpi`;
CREATE TABLE `position_kpi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position_id` bigint(20) NOT NULL,
  `kpi_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4996 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `department_id` bigint(20) NOT NULL,
  `kpi_competency` tinyint(4) NULL DEFAULT 0 COMMENT '0: Not kpi and competence ,1: has  competence and kpi ,2: has competence ONLY',
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expertise_type_id` int(11) NULL DEFAULT NULL,
  `expertise_category_id` int(11) NULL DEFAULT NULL,
  `vacation_day_value` float NOT NULL,
  `vacation_approval` int(11) NULL DEFAULT NULL COMMENT '0 means auto aprove, 1 means manager of employee will aprrove, 2 with two approve of his managers0 ',
  `business_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position_objective` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `key_accountabilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `education` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `computer_skills` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `professional_certification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `experience` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `responsible_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `report_to` bigint(20) NULL DEFAULT NULL,
  `core_competency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `managerial_competency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `functional_competency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job_code_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `position_collar` int(11) NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `internal_relation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `external_relation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_names_job_code_id_foreign`(`job_code_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 735 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for positions-old
-- ----------------------------
DROP TABLE IF EXISTS `positions-old`;
CREATE TABLE `positions-old`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `department_id` bigint(20) NOT NULL,
  `performance_evaluation` tinyint(4) NULL DEFAULT 0 COMMENT '0: Not checked, 1: checked',
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position_objective` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `key_accountabilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `work_relation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `education` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `computer_skills` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `professional_certification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `experience` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `responsible_for` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `job_code_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_names_job_code_id_foreign`(`job_code_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 474 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for positions_10_7
-- ----------------------------
DROP TABLE IF EXISTS `positions_10_7`;
CREATE TABLE `positions_10_7`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `department_id` bigint(20) NOT NULL,
  `performance_evaluation` tinyint(4) NULL DEFAULT 0 COMMENT '0: Not checked, 1: checked',
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vacation_day_value` float NOT NULL,
  `vacation_approval` int(11) NULL DEFAULT NULL COMMENT '0 means auto aprove, 1 means manager of employee will aprrove, 2 with two approve of his managers0 ',
  `business_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position_objective` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `key_accountabilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `education` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `computer_skills` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `professional_certification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `experience` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `responsible_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `report_to` bigint(20) NULL DEFAULT NULL,
  `core_competency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `managerial_competency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `functional_competency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job_code_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `internal_relation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `external_relation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_names_job_code_id_foreign`(`job_code_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 513 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for positions_details
-- ----------------------------
DROP TABLE IF EXISTS `positions_details`;
CREATE TABLE `positions_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position_id` bigint(20) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'array [first_approve_status (1),second_approve_status (1),first_reject_status(1),second_reject_status(1)]',
  `by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'array[first_approve_by,second_approve_by,first_reject_by,second_reject_by]',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'array[first_approve_date,second_approve_date,first_reject_date,second_reject_date]',
  `reject_comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'array[first_reject_comment,second_reject_comment]',
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 600 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for positions_old
-- ----------------------------
DROP TABLE IF EXISTS `positions_old`;
CREATE TABLE `positions_old`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `department_id` bigint(20) NOT NULL,
  `performance_evaluation` tinyint(4) NULL DEFAULT 0 COMMENT '0: Not checked, 1: checked',
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expertise_type_id` int(11) NULL DEFAULT NULL,
  `vacation_day_value` float NOT NULL,
  `vacation_approval` int(11) NULL DEFAULT NULL COMMENT '0 means auto aprove, 1 means manager of employee will aprrove, 2 with two approve of his managers0 ',
  `business_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position_objective` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `key_accountabilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `education` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `computer_skills` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `professional_certification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `experience` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `responsible_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `report_to` bigint(20) NULL DEFAULT NULL,
  `core_competency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `managerial_competency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `functional_competency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job_code_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `internal_relation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `external_relation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_names_job_code_id_foreign`(`job_code_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 522 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for private_balance_history
-- ----------------------------
DROP TABLE IF EXISTS `private_balance_history`;
CREATE TABLE `private_balance_history`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `organization_id` int(11) NOT NULL,
  `vacation_type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `date_from` date NULL DEFAULT NULL,
  `date_to` date NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `num_days` int(10) UNSIGNED NULL DEFAULT NULL,
  `balance` float(10, 2) UNSIGNED NULL DEFAULT NULL,
  `used` float(10, 2) UNSIGNED NULL DEFAULT 0.00,
  `remain` float(10, 2) UNSIGNED NULL DEFAULT 0.00,
  `created_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 881 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for processing_employee_vacations
-- ----------------------------
DROP TABLE IF EXISTS `processing_employee_vacations`;
CREATE TABLE `processing_employee_vacations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `vacation_type_id` bigint(20) NOT NULL,
  `code` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vacation_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vacation_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0: pending, 1: approve, 2: reject, 3: cancel',
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 623 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `business_nature_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `sub_department_id` bigint(20) NOT NULL,
  `manager_id` bigint(20) UNSIGNED NOT NULL,
  `delegated_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `projects_item_id_foreign`(`item_id`) USING BTREE,
  INDEX `projects_business_nature_id_foreign`(`business_nature_id`) USING BTREE,
  INDEX `projects_sector_id_foreign`(`department_id`) USING BTREE,
  INDEX `projects_manager_id_foreign`(`manager_id`) USING BTREE,
  INDEX `projects_delegated_id_foreign`(`delegated_id`) USING BTREE,
  INDEX `projects_group_id_foreign`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for promotion_forms
-- ----------------------------
DROP TABLE IF EXISTS `promotion_forms`;
CREATE TABLE `promotion_forms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for public_holidays
-- ----------------------------
DROP TABLE IF EXISTS `public_holidays`;
CREATE TABLE `public_holidays`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_date` date NULL DEFAULT NULL,
  `to_date` date NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for purchase_orders
-- ----------------------------
DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE `purchase_orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_delivery` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `general_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requester_id` bigint(20) UNSIGNED NOT NULL,
  `suppling_duration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_gross` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxes` int(11) NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `total_after_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `with_holding` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `net_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remain_after_cheque` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `exist_comment` tinyint(1) NOT NULL DEFAULT 0,
  `comment_virtual_po` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `type_purchase_request` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type_purchase_order` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `manufacturing_order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `request_number_fabrication` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_purchase_request` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_purchase_request_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status_deactivate` tinyint(1) NULL DEFAULT 0,
  `comment_deleted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `delete_file_image_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delete_file_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delete_po_by` bigint(20) NULL DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_number`(`order_number`) USING BTREE,
  INDEX `purchase_orders_requester_id_foreign`(`requester_id`) USING BTREE,
  INDEX `purchase_orders_supplier_id_foreign`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4073 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for purchase_requests
-- ----------------------------
DROP TABLE IF EXISTS `purchase_requests`;
CREATE TABLE `purchase_requests`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `request_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requester_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `sub_department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `site_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `expected_duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `purchase_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'purchase_in',
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `exist_comment` tinyint(1) NOT NULL DEFAULT 0,
  `status_deactivate` tinyint(1) NULL DEFAULT 0,
  `manufacturing_order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `comment_deleted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `delete_file_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `delete_file_image_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `request_number`(`request_number`) USING BTREE,
  INDEX `purchase_requests_requester_id_foreign`(`requester_id`) USING BTREE,
  INDEX `purchase_requests_sector_id_foreign`(`department_id`) USING BTREE,
  INDEX `purchase_requests_department_id_foreign`(`sub_department_id`) USING BTREE,
  INDEX `purchase_requests_project_id_foreign`(`project_id`) USING BTREE,
  INDEX `purchase_requests_site_id_foreign`(`site_id`) USING BTREE,
  INDEX `purchase_requests_group_id_foreign`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2544 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for related_activities
-- ----------------------------
DROP TABLE IF EXISTS `related_activities`;
CREATE TABLE `related_activities`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activity_owner_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `short_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for request_tickets
-- ----------------------------
DROP TABLE IF EXISTS `request_tickets`;
CREATE TABLE `request_tickets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `files` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `priority_type` int(11) NOT NULL DEFAULT 0 COMMENT 'Not Specified yet: 0, High Priority: 1, Medium Priority: 2, Low Priority: 3',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0:BackLog, 1:InProgress, 2:Done, 3:Cancelled',
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 350 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for requests_sheet
-- ----------------------------
DROP TABLE IF EXISTS `requests_sheet`;
CREATE TABLE `requests_sheet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(20) NOT NULL,
  `request_date` date NOT NULL,
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `approx_date` date NOT NULL,
  `priority` int(11) NOT NULL COMMENT 'High:1, meduim:2,low:3',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `showstopper` int(11) NOT NULL COMMENT 'Must:1,desirable:2,nicetohave:3',
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`, `user_type`) USING BTREE,
  INDEX `role_user_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name`, `guard_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 264 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shift_substitute
-- ----------------------------
DROP TABLE IF EXISTS `shift_substitute`;
CREATE TABLE `shift_substitute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `break` tinyint(4) NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shift_substitute_details
-- ----------------------------
DROP TABLE IF EXISTS `shift_substitute_details`;
CREATE TABLE `shift_substitute_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_id` int(11) NOT NULL,
  `day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `from_hour` time NULL DEFAULT NULL,
  `to_hour` time NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for shift_vacations
-- ----------------------------
DROP TABLE IF EXISTS `shift_vacations`;
CREATE TABLE `shift_vacations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shift_id` int(11) NOT NULL,
  `is_substitute` tinyint(4) NULL DEFAULT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `vacations` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shifts
-- ----------------------------
DROP TABLE IF EXISTS `shifts`;
CREATE TABLE `shifts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `arabic_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `break` tinyint(4) NOT NULL,
  `must_working_days` int(11) NULL DEFAULT NULL,
  `compensation_days` int(11) NULL DEFAULT NULL,
  `shift_substitute_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_shift_substitute_id`(`shift_substitute_id`) USING BTREE,
  CONSTRAINT `fk_shift_substitute_id` FOREIGN KEY (`shift_substitute_id`) REFERENCES `shift_substitute` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for shifts_details
-- ----------------------------
DROP TABLE IF EXISTS `shifts_details`;
CREATE TABLE `shifts_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_id` int(11) NOT NULL,
  `day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `from_hour` time NULL DEFAULT NULL,
  `to_hour` time NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 985 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sites_project_id_foreign`(`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 252 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sms_module
-- ----------------------------
DROP TABLE IF EXISTS `sms_module`;
CREATE TABLE `sms_module`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `ref_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `send` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `response` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1578 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for status_cheque_requests
-- ----------------------------
DROP TABLE IF EXISTS `status_cheque_requests`;
CREATE TABLE `status_cheque_requests`  (
  `cheque_request_id` bigint(20) NOT NULL,
  `comment_deactivate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `comment_activate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `file_deactivate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_deactivate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_activate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_activate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deactivate_by` bigint(20) NULL DEFAULT NULL,
  `activate_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for status_purchase_orders
-- ----------------------------
DROP TABLE IF EXISTS `status_purchase_orders`;
CREATE TABLE `status_purchase_orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) NOT NULL,
  `comment_deactivate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `comment_activate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `file_deactivate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_deactivate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_activate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_activate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deactivate_by` bigint(20) NULL DEFAULT NULL,
  `activate_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for status_purchase_requests
-- ----------------------------
DROP TABLE IF EXISTS `status_purchase_requests`;
CREATE TABLE `status_purchase_requests`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_request_id` bigint(20) NOT NULL,
  `comment_deactivate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `comment_activate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `file_deactivate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_deactivate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_activate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_activate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deactivate_by` bigint(20) NULL DEFAULT NULL,
  `activate_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_user` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for storings
-- ----------------------------
DROP TABLE IF EXISTS `storings`;
CREATE TABLE `storings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NULL DEFAULT NULL,
  `parent` bigint(20) NULL DEFAULT NULL,
  `initial_balance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for strategies
-- ----------------------------
DROP TABLE IF EXISTS `strategies`;
CREATE TABLE `strategies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for strategy_objectives_details
-- ----------------------------
DROP TABLE IF EXISTS `strategy_objectives_details`;
CREATE TABLE `strategy_objectives_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `strategy_id` bigint(20) NOT NULL,
  `corporate_objective` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `objective_id` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sub_cards
-- ----------------------------
DROP TABLE IF EXISTS `sub_cards`;
CREATE TABLE `sub_cards`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sub_departments
-- ----------------------------
DROP TABLE IF EXISTS `sub_departments`;
CREATE TABLE `sub_departments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `manager_id` bigint(20) UNSIGNED NOT NULL,
  `delegated_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `departments_sector_id_foreign`(`department_id`) USING BTREE,
  INDEX `departments_manager_id_foreign`(`manager_id`) USING BTREE,
  INDEX `departments_delegated_id_foreign`(`delegated_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sub_groups
-- ----------------------------
DROP TABLE IF EXISTS `sub_groups`;
CREATE TABLE `sub_groups`  (
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `both` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `uuid`) USING BTREE,
  INDEX `sub_groups_group_id_foreign`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for summary_scheduale
-- ----------------------------
DROP TABLE IF EXISTS `summary_scheduale`;
CREATE TABLE `summary_scheduale`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_release` date NOT NULL,
  `ticket_request_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for supplier_bank_transfers
-- ----------------------------
DROP TABLE IF EXISTS `supplier_bank_transfers`;
CREATE TABLE `supplier_bank_transfers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `bank_account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_ibn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `supplier_bank_transfers_supplier_id_foreign`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for supplier_cheques
-- ----------------------------
DROP TABLE IF EXISTS `supplier_cheques`;
CREATE TABLE `supplier_cheques`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_on_cheque` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_on_cheque_to_bank` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `edited_name` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `supplier_cheques_supplier_id_foreign`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fax` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `website_url` varchar(520) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gmap_url` varchar(520) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `person_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `family_name_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `accredite_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'company',
  `tax_id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_id_number_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `commercial_registeration_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `commercial_registration_number_date` date NULL DEFAULT NULL,
  `commercial_registeration_number_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value_add_registeration_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value_add_registeration_number_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value_add_tax_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_file_number_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cash` tinyint(1) NULL DEFAULT NULL,
  `system` tinyint(1) NOT NULL DEFAULT 1,
  `approved` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `payment_method` tinyint(4) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'supplier',
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `delivery_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 normal supp',
  `is_hold` tinyint(4) NOT NULL DEFAULT 0,
  `hold_by` int(11) NULL DEFAULT NULL,
  `last_date_review` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_date_review_user` int(11) NULL DEFAULT NULL,
  `count_not_null` int(11) NULL DEFAULT NULL,
  `count_null` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `suppliers_address_id_foreign`(`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 911844869 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for support_tickets
-- ----------------------------
DROP TABLE IF EXISTS `support_tickets`;
CREATE TABLE `support_tickets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `support_user_id` bigint(20) NOT NULL,
  `request_ticket_id` bigint(20) NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_settings
-- ----------------------------
DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `message_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `class` int(11) NULL DEFAULT NULL COMMENT '1: info, 2: danger, 3: success, 4: secondary',
  `module_type` int(11) NULL DEFAULT NULL COMMENT '1: assign pms, 2: evaluate pms score, 3: medical, 4: data_version',
  `percentage_competency_score` int(11) NULL DEFAULT NULL,
  `percentage_kpi_score` int(11) NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for telescope_entries
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries`;
CREATE TABLE `telescope_entries`  (
  `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`sequence`) USING BTREE,
  UNIQUE INDEX `telescope_entries_uuid_unique`(`uuid`) USING BTREE,
  INDEX `telescope_entries_batch_id_index`(`batch_id`) USING BTREE,
  INDEX `telescope_entries_family_hash_index`(`family_hash`) USING BTREE,
  INDEX `telescope_entries_created_at_index`(`created_at`) USING BTREE,
  INDEX `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17856 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for telescope_entries_tags
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries_tags`;
CREATE TABLE `telescope_entries_tags`  (
  `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  INDEX `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`) USING BTREE,
  INDEX `telescope_entries_tags_tag_index`(`tag`) USING BTREE,
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for telescope_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `telescope_monitoring`;
CREATE TABLE `telescope_monitoring`  (
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for temporary_employees
-- ----------------------------
DROP TABLE IF EXISTS `temporary_employees`;
CREATE TABLE `temporary_employees`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `hiring_date` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `marital_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `temporary_employee_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `national_id` int(11) NOT NULL,
  `nationality` int(11) NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qualification_type` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `birth_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth_location_id` int(11) NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emergency_person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emergency_person_relative` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emergency_person_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `educational_qualification` bigint(20) NULL DEFAULT NULL,
  `educational_department` bigint(20) NULL DEFAULT NULL,
  `university` bigint(20) NULL DEFAULT NULL,
  `graduation_year` year NULL DEFAULT NULL,
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `sub_department_id` int(11) NULL DEFAULT NULL,
  `function_id` int(11) NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `business_unit_id` int(11) NULL DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `manager_id` bigint(20) NULL DEFAULT NULL,
  `technical_manager_id` bigint(20) NULL DEFAULT NULL,
  `admin_manager_id` bigint(20) NULL DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for time_zone
-- ----------------------------
DROP TABLE IF EXISTS `time_zone`;
CREATE TABLE `time_zone`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 420 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for to_do_lists
-- ----------------------------
DROP TABLE IF EXISTS `to_do_lists`;
CREATE TABLE `to_do_lists`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for transaction_taxes
-- ----------------------------
DROP TABLE IF EXISTS `transaction_taxes`;
CREATE TABLE `transaction_taxes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `year` int(11) NOT NULL,
  `delivery_date` date NULL DEFAULT NULL,
  `payment_receipt_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_receipt_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_id` int(11) NULL DEFAULT NULL,
  `delivery_period` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tax_period` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fileName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `originalName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for units
-- ----------------------------
DROP TABLE IF EXISTS `units`;
CREATE TABLE `units`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_type` tinyint(1) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `units_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 323 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for universities
-- ----------------------------
DROP TABLE IF EXISTS `universities`;
CREATE TABLE `universities`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 258 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for upgrade_versions
-- ----------------------------
DROP TABLE IF EXISTS `upgrade_versions`;
CREATE TABLE `upgrade_versions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `file_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `short_description_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `short_description_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for urls
-- ----------------------------
DROP TABLE IF EXISTS `urls`;
CREATE TABLE `urls`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` tinyint(4) NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 554 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_groups_group_id_foreign`(`group_id`) USING BTREE,
  INDEX `user_groups_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3363 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_inboxes
-- ----------------------------
DROP TABLE IF EXISTS `user_inboxes`;
CREATE TABLE `user_inboxes`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid_request` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 60728 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_widgets
-- ----------------------------
DROP TABLE IF EXISTS `user_widgets`;
CREATE TABLE `user_widgets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `wigdet_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5926 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_type` int(11) NULL DEFAULT 1,
  `organization_id` int(11) NULL DEFAULT 1,
  `employee_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$h9F/8WrWhxxXwWCxy80tF.Bp5vKDyVVh6LGNQjsJdqkJDY03fpCi6',
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `technical_manager_id` bigint(20) NULL DEFAULT NULL,
  `manager_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `sub_department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `job_name_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `job_grade_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `position_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `board_member` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delegated_at` tinyint(1) NOT NULL DEFAULT 0,
  `user_type_id` tinyint(1) NULL DEFAULT 0,
  `can_be_impersonated` tinyint(1) NULL DEFAULT 1,
  `is_interviewer` tinyint(1) NOT NULL DEFAULT 0,
  `business_unit_id` tinyint(4) NULL DEFAULT NULL,
  `lang_perfer` enum('ar','en') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `users_api_token_unique`(`api_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1803 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for users-old
-- ----------------------------
DROP TABLE IF EXISTS `users-old`;
CREATE TABLE `users-old`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NULL DEFAULT 1,
  `employee_id` tinyint(1) NULL DEFAULT 0,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$h9F/8WrWhxxXwWCxy80tF.Bp5vKDyVVh6LGNQjsJdqkJDY03fpCi6',
  `manager_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `sub_department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `job_name_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `job_grade_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `position_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `board_member` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delegated_at` tinyint(1) NOT NULL DEFAULT 0,
  `user_type_id` tinyint(1) NULL DEFAULT 0,
  `is_interviewer` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for vacation_type
-- ----------------------------
DROP TABLE IF EXISTS `vacation_type`;
CREATE TABLE `vacation_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(1) UNSIGNED NULL DEFAULT 1,
  `balance` int(10) UNSIGNED NULL DEFAULT NULL,
  `transaction` int(10) UNSIGNED NULL DEFAULT NULL,
  `request_limit` int(10) UNSIGNED NULL DEFAULT NULL,
  `service_limit` int(10) UNSIGNED NULL DEFAULT NULL,
  `pre_allowed` int(11) NULL DEFAULT NULL,
  `start_after_date` int(10) UNSIGNED NULL DEFAULT NULL,
  `with_attach` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `approval_needed` tinyint(1) UNSIGNED NULL DEFAULT 1,
  `auto_approved` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `usable` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `receivable` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `with_days` tinyint(1) UNSIGNED NULL DEFAULT 2,
  `day_value` int(10) UNSIGNED NULL DEFAULT 1,
  `limit_days` int(10) UNSIGNED NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `create_timestamp` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for vats
-- ----------------------------
DROP TABLE IF EXISTS `vats`;
CREATE TABLE `vats`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_id` int(11) NULL DEFAULT NULL,
  `payment_receipt_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_receipt_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delivery_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for welcome_message
-- ----------------------------
DROP TABLE IF EXISTS `welcome_message`;
CREATE TABLE `welcome_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `attachment` varchar(355) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for widgets
-- ----------------------------
DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` bigint(20) NULL DEFAULT NULL,
  `updated_by` bigint(20) NULL DEFAULT NULL,
  `deleted_by` bigint(20) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;


