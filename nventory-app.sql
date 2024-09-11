/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - inventory-app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`inventory-app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `inventory-app`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`title`,`url`,`icon`,`parent_id`,`order`,`created_at`,`updated_at`) values 
(1,'Dashboard','dashboard','typcn typcn-device-desktop',NULL,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(2,'Location Config','#','typcn typcn-document-text',NULL,2,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(3,'Product Setup','#','typcn typcn-film',NULL,3,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(4,'User Config','#','typcn typcn-chart-pie-outline',NULL,4,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(5,'Stock Manage','#','typcn typcn-th-small-outline',NULL,5,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(6,'Order Manage','#','typcn typcn-compass',NULL,6,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(7,'Delivery Manage','#','typcn typcn-user-add-outline',NULL,7,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(8,'Division Info','DivisionInfo','',2,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(9,'District Info','DistrictInfo','',2,2,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(10,'Thana Info','ThanaInfo','',2,3,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(11,'Product Type','ProType','',3,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(12,'User Type','UserTypeInfo','',4,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(13,'Product Stock','ProductStock','',5,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(14,'Outlet Order','OutletOrder','',6,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(15,'Delivery to SO','pages/samples/blank-page.html','',7,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(16,'Distributor Order','pages/samples/error-404.html','',7,2,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(17,'500','pages/samples/error-500.html','',7,3,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(18,'Login','pages/samples/login.html','',7,4,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(19,'Register','pages/samples/register.html','',7,5,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(20,'Area Info','AreaInfo','',2,3,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(21,'Outlet Info','OutletInfo','',2,3,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(22,'Product Info','ProInfo','',3,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(23,'Sub-Category','ProSubCategory','',3,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(24,'Category','ProCategory','',3,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(25,'User Assigned','UserAssigned','',4,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(26,'Distributor Info','UserInfo','',4,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(27,'User Info','UserInfo','',4,1,'2024-09-02 19:07:45','2024-09-02 19:07:45'),
(28,'Distributor Order','OutletOrder','',6,1,'2024-09-02 19:07:45','2024-09-02 19:07:45');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(4,'2024_09_02_194001_create_menus_table',1),
(6,'2014_10_12_000000_create_users_table',2),
(7,'2019_08_19_000000_create_failed_jobs_table',2),
(8,'2019_12_14_000001_create_personal_access_tokens_table',2),
(9,'2024_09_05_063457_create_sessions_table',3);

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `pro_category` */

DROP TABLE IF EXISTS `pro_category`;

CREATE TABLE `pro_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11020004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pro_category` */

insert  into `pro_category`(`id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11020000,'2c789134-661e-4591-a74e-d21c6e069f9a','Test','A','2','2024-09-12 00:27:00','0','0'),
(11020001,'24e95fed-1c43-4f04-b936-078fa8e11e73','Test 1','I','2','2024-09-12 00:27:09','2','2024-09-12 00:44:33'),
(11020002,'76b90785-968a-450a-a26c-aabb09fc63cb','TTTTT','Deleted','2','2024-09-12 00:37:05','2','2024-09-12 00:37:35'),
(11020003,'d5401564-0a66-4ef9-871a-3846ba166bd7','TTTTT111','I','2','2024-09-12 00:41:37','2','2024-09-12 00:44:27');

/*Table structure for table `pro_info` */

DROP TABLE IF EXISTS `pro_info`;

CREATE TABLE `pro_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `pro_type_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `shot_decs` varchar(50) DEFAULT 'N',
  `decs` varchar(500) NOT NULL DEFAULT 'N',
  `unit` varchar(10) NOT NULL DEFAULT 'N',
  `pcs_per_ctn` varchar(10) NOT NULL DEFAULT 'N',
  `dp_unit` int(100) NOT NULL,
  `rp_unit` int(100) NOT NULL,
  `mrp_unit` int(100) NOT NULL,
  `pro_sku_code` varchar(50) DEFAULT 'N',
  `pro_image1` varchar(500) NOT NULL DEFAULT 'N',
  `pro_image2` varchar(500) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT 'N',
  `update_date` varchar(20) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11040003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pro_info` */

insert  into `pro_info`(`id`,`uid`,`name`,`pro_type_id`,`cat_id`,`sub_cat_id`,`shot_decs`,`decs`,`unit`,`pcs_per_ctn`,`dp_unit`,`rp_unit`,`mrp_unit`,`pro_sku_code`,`pro_image1`,`pro_image2`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11040000,'13474507-3c17-4c52-acb5-f5f9f1d75b26','Test1',11010001,11020001,11030001,'Test','0','KG','100',0,0,0,'SKU-99E2322A','aAAAA','No Image','A','2','2024-09-12 01:58:45','2','2024-09-12 02:10:15'),
(11040001,'89427be5-b715-4cb6-a5b9-d1a7787e9d15','Test 1',11010000,11020000,11030000,'asdad','0','GM','5',0,0,0,'SKU-99E23D8B','3232','No Image','A','2','2024-09-12 02:01:33','N','N'),
(11040002,'18ee5954-23c7-4506-815a-46cdd3f01eee','asdasd',11010000,11020001,11030001,'asdasd','0','KG','22',0,0,0,'SKU-1946A055','asdasd','No Image','Deleted','2','2024-09-12 02:11:55','2','2024-09-12 02:12:00');

/*Table structure for table `pro_sub_category` */

DROP TABLE IF EXISTS `pro_sub_category`;

CREATE TABLE `pro_sub_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11030003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pro_sub_category` */

insert  into `pro_sub_category`(`id`,`uid`,`cat_id`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11030000,'5eec7f4b-f7de-4d69-9dd0-3cbc95f57570',11020000,'Test','A','2','2024-09-12 01:01:32','0','0'),
(11030001,'2ab08954-ae33-4bf6-b567-f3fd7910e8e4',11020001,'Test 1','A','2','2024-09-12 01:01:45','2','2024-09-12 01:02:25'),
(11030002,'d2aff1e3-8f54-4e6c-8638-6bdbaeb3c879',11020003,'TTTT','Deleted','2','2024-09-12 01:01:52','2','2024-09-12 01:02:35');

/*Table structure for table `pro_type` */

DROP TABLE IF EXISTS `pro_type`;

CREATE TABLE `pro_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11010003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pro_type` */

insert  into `pro_type`(`id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11010000,'cb9c3e36-47f5-47c7-8f15-1dc4f1b53fe0','Test','A','2','2024-09-12 00:49:06','0','0'),
(11010001,'e38459ae-208e-45d1-b39d-bda93401a646','Test11','I','2','2024-09-12 00:49:12','2','2024-09-12 00:49:37'),
(11010002,'ffc33288-fe7b-420f-b84c-f527b0aecb83','dsfsf','Deleted','2','2024-09-12 00:49:44','2','2024-09-12 00:49:47');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values 
('ThxRldKgrDM96hnTBsS5sm5evewpQSvvQfEYwrQb',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:130.0) Gecko/20100101 Firefox/130.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUXU3SjNFaTNWT2VUVEtvWlpuUEhOcW1NRFFhSjJuamphd3hwYjNrMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1726085741);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `mac` varchar(255) NOT NULL,
  `last_login` varchar(255) NOT NULL,
  `status` varchar(10) DEFAULT 'I',
  `create_by` varchar(255) NOT NULL,
  `create_date` varchar(255) NOT NULL,
  `update_date` varchar(255) NOT NULL,
  `update_by` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_uid_unique` (`uid`),
  UNIQUE KEY `users_user_name_unique` (`user_name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`uid`,`name`,`user_name`,`email`,`email_verified_at`,`password`,`longitude`,`latitude`,`ip`,`mac`,`last_login`,`status`,`create_by`,`create_date`,`update_date`,`update_by`,`token`) values 
(1,'admin001','Admin User','adminuser','admin@example.com','2024-09-05 07:36:50','$2y$10$YHLibwvE5HlgD6J4XAWRreZ2RIoKwVjALBKey.Gam3Rbjuatg9b/6','90.3654296','23.774741','103.112.236.26','00:00:00:00:00:00','2024-09-05 20:12:01','I','system','2024-09-05 07:36:50','7DtRvHrzOSrHQy9C2FkIrzX5xV1lLpjT5PKsm87U','1','7DtRvHrzOSrHQy9C2FkIrzX5xV1lLpjT5PKsm87U'),
(2,'superadmin001','Super Admin','superadmin','superadmin@example.com','2024-09-05 07:36:50','$2y$10$hpF5dW9/hiTn0/lHZMOCe.qqD9j3mNAIXFNbNHPYtnQtEBXhT7Kdy','90.3613659','23.785737','103.112.236.26','00:00:00:00:00:01','2024-09-11 23:45:42','I','system','2024-09-05 07:36:50','Qu7J3Ei3VOeTTKoZZnPHNqmMDQaJ2njjawxpb3k3','2','Qu7J3Ei3VOeTTKoZZnPHNqmMDQaJ2njjawxpb3k3'),
(3,'b6dee4ca-b0d6-4ed3-b39a-abec6d338acc','Test2 User','0','test1@gmail.com',NULL,'$2y$10$IiIMBiCT/IMmfT3r5dm8zO7NL51IKBAta6AO5B.Y8jOPUgHFKthoC','0.0','0.0','0.0','0.0','1970-01-01 06:00:00','I','2','2024-09-09 00:30:44','2024-09-09 01:40:55','2','fdByDRrEcDQj980GeXkVGPw8NGTqDn1cfZeKZ5CnkLOCAzuaXCxpf9e4J2Aq'),
(6,'74ef128e-f8d5-4af1-803a-d67c39488d87','Test22','0OQU85','test22@gmail.com',NULL,'$2y$10$Z6SV0np8oVTwsISGC25tFujqRDo0ObPN/BtTVbcLV6h.fEcjxqPky','0.0','0.0','0.0','0.0','1970-01-01 06:00:00','I','2','2024-09-09 00:38:45','2024-09-09 01:39:47','2','BExy6SVjOd00RoXAwyfme0MXgcdR6iJw7WpEm1lT0ljiL2pJl8CmM143cpWD'),
(7,'c6c4c992-cc22-4d86-b0fb-558604f2e139','Test User 3','X3SJ34','test3@gmail.com',NULL,'$2y$10$3WAQLMxKbbL2rW2n80NxjepzrfqjLo/i.4ulGrZa2kIELYXJU2csa','0.0','0.0','0.0','0.0','1970-01-01 06:00:00','I','2','2024-09-09 01:06:09','2024-09-09 02:18:20','2','EbuVPyEUMKqYQeaCEhfhwkrJyWFYyELiTZ76GJtbjjdeygWaJeQYqWvuQdyj'),
(8,'07242445-790c-4aae-8b9f-c0bba6370e02','Test 4','7CII30','test4@gmail.com',NULL,'$2y$10$LCzELi0yEQwcG8sr5Hcz0ui3nSBfQWILFFugMrIxUhU10g.kccp3y','0.0','0.0','0.0','0.0','1970-01-01 06:00:00','Deleted','2','2024-09-09 01:07:13','2024-09-09 02:19:20','2','1JEC9fSkw80uRVZ8GzkwskUgLGmNf6AYzfSCYFbnDTAyEYzG2rIkM4gAFIMh'),
(9,'','','','',NULL,'','','','','','','Deleted','','','2024-09-09 02:19:14','2',''),
(10,'cf1ba2ab-8f08-4cde-a50d-8e134ae5c170','Test44','TCZI13','test33@gmail.com',NULL,'$2y$10$cQIJBCClH2mmvEY5ng4nYO.JAhivqfDO04/CBD5E5x3sWqc02RAUK','0.0','0.0','0.0','0.0','1970-01-01 06:00:00','A','2','2024-09-09 02:23:36','0.0','0.0','ziBbKqYjYLajmT69JHJnrsnEbd0Nf0ZxybzxWIE2OmHoWq1QvF26ctE9LTg7');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
