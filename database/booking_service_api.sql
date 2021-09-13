/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST SERVER
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : laraapi

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 13/09/2021 08:22:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for booking_servis
-- ----------------------------
DROP TABLE IF EXISTS `booking_servis`;
CREATE TABLE `booking_servis`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_booking` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_booking` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jenis_motor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `plat_motor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keluhan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `nama_booking` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_hp_booking` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat_lengkap_booking` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status_booking` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking_servis
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'token-auth', 'e0379acbd11a03a610cc3106b11c5d4a425914047f0f42770511e19b0c2c79b0', '[\"*\"]', NULL, '2021-09-01 13:22:29', '2021-09-01 13:22:29');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 1, 'token-auth', 'c4f591a09d71aabf7ba07f7053369cd2fe39b08155b08344e7f6051d49aaf70e', '[\"*\"]', NULL, '2021-09-01 13:23:01', '2021-09-01 13:23:01');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 1, 'token-auth', '5686918376a4cd2c366701a02c4e72ab171e4261c0003d49f193f23e9ad3bc7e', '[\"*\"]', NULL, '2021-09-01 13:27:17', '2021-09-01 13:27:17');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 1, 'token-auth', '92eac739b6abade271f901f3a795a936fc6d68314a7f8d0fcba807c36f372e3e', '[\"*\"]', NULL, '2021-09-02 10:51:49', '2021-09-02 10:51:49');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 1, 'token-auth', '2ecd62d5e9857ff837af499f48b79582ed8935fa29cb3eb2dc070f8a093bf7fb', '[\"*\"]', NULL, '2021-09-02 10:53:16', '2021-09-02 10:53:16');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\Models\\User', 1, 'token-auth', '0882c2652dcce5efd81db32cb0ccb014b4339fb6e10ac271538d29dcbc69a295', '[\"*\"]', '2021-09-02 10:56:53', '2021-09-02 10:53:23', '2021-09-02 10:56:53');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\Models\\User', 1, 'token-auth', '72a9c3cc5f80b59884ae630ecf8bfb5460ced1235319ade909a68b27955dc237', '[\"*\"]', NULL, '2021-09-02 11:48:20', '2021-09-02 11:48:20');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\User', 1, 'auth-token', 'd6717ff78c63a8e3610d97cff3adbb6f41040932ce91da618939509f19918717', '[\"*\"]', '2021-09-07 03:24:16', '2021-09-07 02:27:04', '2021-09-07 03:24:16');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\User', 1, 'auth-token', 'ef1bebcb3cea7ad00f0164d2414c81dc6e8961166b178be850882843806ebb23', '[\"*\"]', '2021-09-07 08:30:34', '2021-09-07 08:28:56', '2021-09-07 08:30:34');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Gagas Agus Bahtiar', 'admin@gmail.com', NULL, '$2y$10$/fjpbYn7xKTDMuc3rSBRIemWbNB58vb9NGm4b9kZdZr.i/NDX8LlG', NULL, '2021-09-01 11:49:27', '2021-09-01 11:49:27');
INSERT INTO `users` VALUES (2, 'Gagas', 'email@domain.com', NULL, '$2y$10$l8SD8BE8pO/mblxs02fMWeIY17m/8rc7HW/Sqhj6FqdNOxncxZhCq', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
