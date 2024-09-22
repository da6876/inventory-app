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

/*Table structure for table `change_log` */

DROP TABLE IF EXISTS `change_log`;

CREATE TABLE `change_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL,
  `operation_type` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `record_id` int(10) NOT NULL,
  `old_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `changed_by` varchar(50) NOT NULL,
  `change_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `change_log` */

insert  into `change_log`(`log_id`,`table_name`,`operation_type`,`record_id`,`old_data`,`new_data`,`changed_by`,`change_date`) values 
(1,'pro_info','UPDATE',11040001,'{\"product_name\": \"Test 122\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"asdad22\", \"decs\": \"0\", \"Gm\": \"GM\", \"Pcs_Per_Ctn\": \"53\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E23D8B\", \"product_image\": \"323222\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 02:01:33\", \"update_by\": \"2\", \"update_date\": \"2024-09-13 11:12:05\"}','{\"product_name\": \"Test 12211\", \"product_type_id\": 11010001, \"Categorie_id\": 11020001, \"sub_Categorie_id\": 11030001, \"shot_decs\": \"asdad22222\", \"decs\": \"0\", \"Gm\": \"KG\", \"Pcs_Per_Ctn\": \"53\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E23D8B\", \"product_image\": \"3232222\", \"product_image2\": \"No Image\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 02:01:33\", \"update_by\": \"2\", \"update_date\": \"2024-09-13 11:23:27\"}','root@localhost','2024-09-13 11:23:27'),
(2,'pro_type','UPDATE',11010000,'{\"uid\": \"cb9c3e36-47f5-47c7-8f15-1dc4f1b53fe0\", \"name\": \"Test\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:49:06\", \"update_by\": \"0\", \"update_date\": \"0\"}','{\"uid\": \"cb9c3e36-47f5-47c7-8f15-1dc4f1b53fe0\", \"name\": \"Biscuits\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:49:06\", \"update_by\": \"2\", \"update_date\": \"2024-09-15 23:56:47\"}','root@localhost','2024-09-15 23:56:47'),
(3,'pro_type','UPDATE',11010001,'{\"uid\": \"e38459ae-208e-45d1-b39d-bda93401a646\", \"name\": \"Test11\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:49:12\", \"update_by\": \"2\", \"update_date\": \"2024-09-12 00:49:37\"}','{\"uid\": \"e38459ae-208e-45d1-b39d-bda93401a646\", \"name\": \"Breads\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:49:12\", \"update_by\": \"2\", \"update_date\": \"2024-09-15 23:56:57\"}','root@localhost','2024-09-15 23:56:57'),
(4,'pro_type','UPDATE',11010002,'{\"uid\": \"ffc33288-fe7b-420f-b84c-f527b0aecb83\", \"name\": \"dsfsf\", \"status\": \"Deleted\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:49:44\", \"update_by\": \"2\", \"update_date\": \"2024-09-12 00:49:47\"}','{\"uid\": \"ffc33288-fe7b-420f-b84c-f527b0aecb83\", \"name\": \"Cake\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:49:44\", \"update_by\": \"2\", \"update_date\": \"2024-09-12 00:49:47\"}','root@localhost','2024-09-15 23:58:52'),
(5,'pro_category','UPDATE',11020000,'{\"uid\": \"2c789134-661e-4591-a74e-d21c6e069f9a\", \"name\": \"Test\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:27:00\", \"update_by\": \"0\", \"update_date\": \"0\"}','{\"uid\": \"2c789134-661e-4591-a74e-d21c6e069f9a\", \"name\": \"Biscuits\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:27:00\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:06:38\"}','root@localhost','2024-09-16 00:06:38'),
(6,'pro_category','UPDATE',11020001,'{\"uid\": \"24e95fed-1c43-4f04-b936-078fa8e11e73\", \"name\": \"Test 1\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:27:09\", \"update_by\": \"2\", \"update_date\": \"2024-09-12 00:44:33\"}','{\"uid\": \"24e95fed-1c43-4f04-b936-078fa8e11e73\", \"name\": \"Breads\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:27:09\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:06:47\"}','root@localhost','2024-09-16 00:06:47'),
(7,'pro_category','UPDATE',11020003,'{\"uid\": \"d5401564-0a66-4ef9-871a-3846ba166bd7\", \"name\": \"TTTTT111\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:41:37\", \"update_by\": \"2\", \"update_date\": \"2024-09-12 00:44:27\"}','{\"uid\": \"d5401564-0a66-4ef9-871a-3846ba166bd7\", \"name\": \"Cake\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 00:41:37\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:06:56\"}','root@localhost','2024-09-16 00:06:56'),
(8,'pro_sub_category','UPDATE',11030000,'{\"uid\": \"5eec7f4b-f7de-4d69-9dd0-3cbc95f57570\", \"name\": \"Test\", \"cat_id\": 11020000, \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:01:32\", \"update_by\": \"0\", \"update_date\": \"0\"}','{\"uid\": \"5eec7f4b-f7de-4d69-9dd0-3cbc95f57570\", \"name\": \"Salt Biscuit\", \"cat_id\": 11020000, \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:01:32\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:08:21\"}','root@localhost','2024-09-16 00:08:21'),
(9,'pro_sub_category','UPDATE',11030001,'{\"uid\": \"2ab08954-ae33-4bf6-b567-f3fd7910e8e4\", \"name\": \"Test 1\", \"cat_id\": 11020001, \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:01:45\", \"update_by\": \"2\", \"update_date\": \"2024-09-12 01:02:25\"}','{\"uid\": \"2ab08954-ae33-4bf6-b567-f3fd7910e8e4\", \"name\": \"Biscuit\", \"cat_id\": 11020000, \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:01:45\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:09:08\"}','root@localhost','2024-09-16 00:09:08'),
(10,'pro_info','UPDATE',11040000,'{\"product_name\": \"Test1\", \"product_type_id\": 11010001, \"Categorie_id\": 11020001, \"sub_Categorie_id\": 11030001, \"shot_decs\": \"Test\", \"decs\": \"0\", \"Gm\": \"KG\", \"Pcs_Per_Ctn\": \"100\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E2322A\", \"product_image\": \"aAAAA\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:58:45\", \"update_by\": \"2\", \"update_date\": \"2024-09-12 02:10:15\"}','{\"product_name\": \"Dia Salt Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"Dia Salt Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"10\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E2322A\", \"product_image\": \"AAA\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:58:45\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:09:53\"}','root@localhost','2024-09-16 00:09:53'),
(11,'pro_info','UPDATE',11040001,'{\"product_name\": \"Test 12211\", \"product_type_id\": 11010001, \"Categorie_id\": 11020001, \"sub_Categorie_id\": 11030001, \"shot_decs\": \"asdad22222\", \"decs\": \"0\", \"Gm\": \"KG\", \"Pcs_Per_Ctn\": \"53\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E23D8B\", \"product_image\": \"3232222\", \"product_image2\": \"No Image\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 02:01:33\", \"update_by\": \"2\", \"update_date\": \"2024-09-13 11:23:27\"}','{\"product_name\": \"Econo Dia Salt Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"Econo Dia Salt Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"12\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E23D8B\", \"product_image\": \"3232222\", \"product_image2\": \"No Image\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 02:01:33\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:10:19\"}','root@localhost','2024-09-16 00:10:19'),
(12,'pro_info','UPDATE',11040003,'{\"product_name\": \"Test Pro\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"Test Pro Decs\", \"decs\": \"0\", \"Gm\": \"GM\", \"Pcs_Per_Ctn\": \"50\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-F1A89F83\", \"product_image\": \"AAAAAA\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-13 11:11:07\", \"update_by\": \"N\", \"update_date\": \"N\"}','{\"product_name\": \"Horlicks Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030001, \"shot_decs\": \"Horlicks Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"15\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-F1A89F83\", \"product_image\": \"AAAAAA\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-13 11:11:07\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:10:44\"}','root@localhost','2024-09-16 00:10:44'),
(13,'pro_type','UPDATE',11010001,'{\"uid\": \"31839b4d-7f77-4175-8754-9892e1da3346\", \"name\": \"Breads\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:10:08\", \"update_by\": null, \"update_date\": null}','{\"uid\": \"31839b4d-7f77-4175-8754-9892e1da3346\", \"name\": \"Cake\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:10:08\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 11:10:17\"}','root@localhost','2024-09-16 11:10:17'),
(14,'pro_type','INSERT',11010003,NULL,'{\"uid\": \"b334dff5-11b6-4c72-84d1-3adbaba2f62a\", \"name\": \"AAA\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:17:03\", \"update_by\": null, \"update_date\": null}','root@localhost','2024-09-16 11:17:03'),
(15,'pro_type','UPDATE',11010003,'{\"uid\": \"b334dff5-11b6-4c72-84d1-3adbaba2f62a\", \"name\": \"AAA\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:17:03\", \"update_by\": null, \"update_date\": null}','{\"uid\": \"b334dff5-11b6-4c72-84d1-3adbaba2f62a\", \"name\": \"AAA222\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:17:03\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 11:17:11\"}','root@localhost','2024-09-16 11:17:11'),
(16,'pro_type','UPDATE',11010001,'{\"uid\": \"31839b4d-7f77-4175-8754-9892e1da3346\", \"name\": \"Cake\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:10:08\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 11:10:17\"}','{\"uid\": \"31839b4d-7f77-4175-8754-9892e1da3346\", \"name\": \"Breads\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:10:08\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 11:18:47\"}','root@localhost','2024-09-16 11:18:47'),
(17,'pro_type','UPDATE',11010002,'{\"uid\": \"0449c061-f3f6-4ca8-afee-8ffcdff46694\", \"name\": \"Breads\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:10:41\", \"update_by\": null, \"update_date\": null}','{\"uid\": \"0449c061-f3f6-4ca8-afee-8ffcdff46694\", \"name\": \"Cake\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:10:41\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 11:18:51\"}','root@localhost','2024-09-16 11:18:51'),
(18,'pro_category','INSERT',11020009,NULL,'{\"uid\": \"37d397ed-f9d3-4b6f-92b0-58599145e8cb\", \"name\": \"hj\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:37:26\", \"update_by\": \"0\", \"update_date\": \"0\"}','root@localhost','2024-09-16 11:37:26'),
(19,'pro_sub_category','INSERT',11030005,NULL,'{\"uid\": \"3ae92ab1-af5c-4642-a9ed-3ef66881023d\", \"name\": \"Test\", \"cat_id\": 11020000, \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:46:31\", \"update_by\": \"0\", \"update_date\": \"0\"}','root@localhost','2024-09-16 11:46:31'),
(20,'pro_sub_category','UPDATE',11030005,'{\"uid\": \"3ae92ab1-af5c-4642-a9ed-3ef66881023d\", \"name\": \"Test\", \"cat_id\": 11020000, \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:46:31\", \"update_by\": \"0\", \"update_date\": \"0\"}','{\"uid\": \"3ae92ab1-af5c-4642-a9ed-3ef66881023d\", \"name\": \"Testaaa\", \"cat_id\": 11020009, \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:46:31\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 11:46:40\"}','root@localhost','2024-09-16 11:46:40'),
(21,'pro_type','INSERT',11010004,NULL,'{\"uid\": \"ae315405-d3fb-46c9-a67b-9fb58f4a7ab6\", \"name\": \"adad\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:47:43\", \"update_by\": null, \"update_date\": null}','root@localhost','2024-09-16 11:47:43'),
(22,'pro_type','UPDATE',11010004,'{\"uid\": \"ae315405-d3fb-46c9-a67b-9fb58f4a7ab6\", \"name\": \"adad\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:47:43\", \"update_by\": null, \"update_date\": null}','{\"uid\": \"ae315405-d3fb-46c9-a67b-9fb58f4a7ab6\", \"name\": \"adad\", \"status\": \"Deleted\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:47:43\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 11:49:13\"}','root@localhost','2024-09-16 11:49:13'),
(23,'pro_type','UPDATE',11010003,'{\"uid\": \"b334dff5-11b6-4c72-84d1-3adbaba2f62a\", \"name\": \"AAA222\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:17:03\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 11:17:11\"}','{\"uid\": \"b334dff5-11b6-4c72-84d1-3adbaba2f62a\", \"name\": \"AAA222\", \"status\": \"Deleted\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:17:03\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 11:49:41\"}','root@localhost','2024-09-16 11:49:41'),
(24,'pro_type','INSERT',11010005,NULL,'{\"uid\": \"aa8b9675-59b0-4fc1-9cdf-654f8fcab8d4\", \"name\": \"Test\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-16 11:49:57\", \"update_by\": null, \"update_date\": null}','root@localhost','2024-09-16 11:49:57'),
(25,'pro_info','UPDATE',11040000,'{\"product_name\": \"Dia Salt Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"Dia Salt Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"10\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E2322A\", \"product_image\": \"AAA\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:58:45\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:09:53\"}','{\"product_name\": \"Dia Salt Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"Dia Salt Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"10\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E2322A\", \"product_image\": \"assets/product_img/66e7ca643b649.png\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:58:45\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 12:04:20\"}','root@localhost','2024-09-16 12:04:20'),
(26,'pro_info','UPDATE',11040000,'{\"product_name\": \"Dia Salt Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"Dia Salt Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"10\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E2322A\", \"product_image\": \"assets/product_img/66e7ca643b649.png\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:58:45\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 12:04:20\"}','{\"product_name\": \"Dia Salt Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"Dia Salt Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"10\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E2322A\", \"product_image\": \"assets/product_img/66e7cab01d995.png\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 01:58:45\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 12:05:36\"}','root@localhost','2024-09-16 12:05:36'),
(27,'pro_info','UPDATE',11040001,'{\"product_name\": \"Econo Dia Salt Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"Econo Dia Salt Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"12\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E23D8B\", \"product_image\": \"3232222\", \"product_image2\": \"No Image\", \"status\": \"I\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 02:01:33\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:10:19\"}','{\"product_name\": \"Econo Dia Salt Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030000, \"shot_decs\": \"Econo Dia Salt Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"12\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-99E23D8B\", \"product_image\": \"assets/product_img/66e7cad0d80de.jpg\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-12 02:01:33\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 12:06:08\"}','root@localhost','2024-09-16 12:06:08'),
(28,'pro_info','UPDATE',11040003,'{\"product_name\": \"Horlicks Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030001, \"shot_decs\": \"Horlicks Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"15\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-F1A89F83\", \"product_image\": \"AAAAAA\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-13 11:11:07\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 00:10:44\"}','{\"product_name\": \"Horlicks Biscuit\", \"product_type_id\": 11010000, \"Categorie_id\": 11020000, \"sub_Categorie_id\": 11030001, \"shot_decs\": \"Horlicks Biscuit\", \"decs\": \"0\", \"Gm\": \"PCS\", \"Pcs_Per_Ctn\": \"15\", \"dp_unit\": 0, \"rp_unit\": 0, \"mrp_unit\": 0, \"product_sku_code\": \"SKU-F1A89F83\", \"product_image\": \"assets/product_img/66e7cae9d464f.png\", \"product_image2\": \"No Image\", \"status\": \"A\", \"create_by\": \"2\", \"create_date\": \"2024-09-13 11:11:07\", \"update_by\": \"2\", \"update_date\": \"2024-09-16 12:06:33\"}','root@localhost','2024-09-16 12:06:33');

/*Table structure for table `distributors` */

DROP TABLE IF EXISTS `distributors`;

CREATE TABLE `distributors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `uid` varchar(255) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `owner_phone` varchar(255) NOT NULL,
  `owner_email` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_phone` varchar(255) NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` varchar(255) NOT NULL,
  `update_date` varchar(255) NOT NULL,
  `update_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `distributors_uid_unique` (`uid`),
  UNIQUE KEY `distributors_owner_email_unique` (`owner_email`),
  UNIQUE KEY `distributors_company_email_unique` (`company_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `distributors` */

insert  into `distributors`(`id`,`user_id`,`uid`,`owner_name`,`owner_phone`,`owner_email`,`company_name`,`company_phone`,`company_email`,`address`,`status`,`create_by`,`create_date`,`update_date`,`update_by`) values 
(1,NULL,'61ac550b-ed8c-4ad6-afb6-be4e2c3da4b0','Distributor Name','014785236','namedis@gmail.com','Distributor Company Name','0147852366','distributorcompanyname@gmail.com','Dhaka,Bangladesh','A','2','2024-09-15 19:13:46','0','0');

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

/*Table structure for table `menu_user` */

DROP TABLE IF EXISTS `menu_user`;

CREATE TABLE `menu_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `menu_id` bigint(20) unsigned NOT NULL,
  `permissions` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_user_user_id_foreign` (`user_id`),
  KEY `menu_user_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_user_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_user` */

insert  into `menu_user`(`id`,`user_id`,`menu_id`,`permissions`,`created_at`,`updated_at`) values 
(1,2,1,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(2,2,30,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(3,2,3,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(4,2,11,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(5,2,22,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(6,2,23,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(7,2,24,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(8,2,4,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(9,2,12,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(11,2,26,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(12,2,27,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(13,2,5,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(14,2,13,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(15,2,6,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(16,2,14,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(17,2,28,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(18,2,7,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(19,2,15,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(20,2,16,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(24,2,2,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(25,2,8,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(26,2,9,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(27,2,10,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(28,2,20,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(30,2,31,'view','2024-09-14 01:12:00','2024-09-14 01:12:00'),
(65,1,1,'view','2024-09-15 17:22:01','2024-09-15 17:22:01'),
(66,1,2,'view','2024-09-15 17:22:01','2024-09-15 17:22:01'),
(67,1,3,'view','2024-09-15 17:22:01','2024-09-15 17:22:01'),
(68,1,4,'view','2024-09-15 17:22:01','2024-09-15 17:22:01'),
(69,1,5,'view','2024-09-15 17:22:01','2024-09-15 17:22:01'),
(70,1,6,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(71,1,7,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(72,1,8,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(73,1,9,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(74,1,10,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(75,1,11,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(76,1,12,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(77,1,13,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(78,1,14,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(79,1,15,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(80,1,16,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(84,1,20,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(85,1,21,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(86,1,22,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(87,1,23,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(88,1,24,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(90,1,26,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(91,1,27,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(92,1,28,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(93,1,30,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(94,1,31,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(95,1,32,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(96,1,33,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(97,1,34,'view','2024-09-15 17:22:02','2024-09-15 17:22:02'),
(98,2,1,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(99,2,2,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(100,2,3,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(101,2,4,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(102,2,5,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(103,2,6,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(104,2,7,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(105,2,8,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(106,2,9,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(107,2,10,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(108,2,11,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(109,2,12,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(110,2,13,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(111,2,14,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(112,2,15,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(113,2,16,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(117,2,20,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(118,2,21,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(119,2,22,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(120,2,23,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(121,2,24,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(123,2,26,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(124,2,27,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(125,2,28,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(126,2,30,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(127,2,31,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(128,2,32,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(129,2,33,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(130,2,34,'view','2024-09-15 17:23:13','2024-09-15 17:23:13'),
(131,11,7,'view','2024-09-15 18:26:50','2024-09-15 18:26:50'),
(132,11,28,'view','2024-09-15 18:26:50','2024-09-15 18:26:50'),
(133,11,15,'view','2024-09-15 18:27:44','2024-09-15 18:27:44'),
(134,11,16,'view','2024-09-15 18:27:44','2024-09-15 18:27:44'),
(135,2,35,'view','2024-09-15 23:16:07','2024-09-15 23:16:07'),
(136,2,36,'view','2024-09-15 23:16:07','2024-09-15 23:16:07'),
(137,2,37,'view','2024-09-15 23:19:42','2024-09-15 23:19:42'),
(138,2,38,'view','2024-09-15 23:19:42','2024-09-15 23:19:42'),
(139,2,39,'view','2024-09-15 23:19:42','2024-09-15 23:19:42'),
(140,2,40,'view','2024-09-15 23:19:42','2024-09-15 23:19:42'),
(141,2,41,'view','2024-09-15 23:20:29','2024-09-15 23:20:29'),
(142,2,42,'view','2024-09-15 23:20:29','2024-09-15 23:20:29'),
(143,11,35,'view','2024-09-15 23:22:52','2024-09-15 23:22:52'),
(144,11,36,'view','2024-09-15 23:22:52','2024-09-15 23:22:52'),
(145,11,37,'view','2024-09-15 23:22:52','2024-09-15 23:22:52'),
(146,11,38,'view','2024-09-15 23:22:52','2024-09-15 23:22:52'),
(147,11,39,'view','2024-09-15 23:22:52','2024-09-15 23:22:52'),
(148,11,40,'view','2024-09-15 23:22:52','2024-09-15 23:22:52'),
(149,11,41,'view','2024-09-15 23:22:52','2024-09-15 23:22:52'),
(150,11,42,'view','2024-09-15 23:22:52','2024-09-15 23:22:52'),
(151,11,1,'view','2024-09-15 23:23:57','2024-09-15 23:23:57');

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` varchar(20) DEFAULT 'I',
  `create_by` varchar(20) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  `update_by` varchar(20) DEFAULT 'N',
  `update_date` varchar(20) DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`uid`,`title`,`url`,`icon`,`parent_id`,`order`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(1,'3d011d40-5f68-48bf-96b1-a077dadasb66','Dashboard','dashboard','typcn typcn-device-desktop',NULL,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:02:49'),
(2,'3d011d40-5f68-48bf-96b1-a077232abb66','Location Config','#','typcn typcn-document-text',NULL,8,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:04:16'),
(3,'3d011d40-5f68-48bf-96b1-a07asda6bb66','Product Setup','#','typcn typcn-film',NULL,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:04:21'),
(4,'3d011d40-5f68-48bf-2234-a077d8a6bb66','User Config','#','typcn typcn-chart-pie-outline',NULL,3,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:04:26'),
(5,'3d011d40-5f68-adad96b1-a077d8a6bb66','Stock Manage','#','typcn typcn-th-small-outline',NULL,4,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:04:29'),
(6,'asdadasd-5f68-48bf-96b1-a077d8a6bb66','Order Manage','#','typcn typcn-compass',NULL,5,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:04:33'),
(7,'3d011d40-5f68-48bf-a2f-a077d8a6bb66','Delivery Manage','#','typcn typcn-user-add-outline',NULL,7,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:04:37'),
(8,'1a3d7bc1-780f-11ef-9165-d8bbc14c2e2b','Division Info','DivisionInfo','bi',2,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:04:42'),
(9,'1a3d91ba-780f-11ef-9165-d8bbc14c2e2b','District Info','DistrictInfo','bi',2,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:04:46'),
(10,'1a3d9237-780f-11ef-9165-d8bbc14c2e2b','Thana Info','ThanaInfo','bi',2,3,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:01'),
(11,'1a3d9290-780f-11ef-9165-d8bbc14c2e2b','Product Type','ProType','bi',3,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:06'),
(12,'1a3d92d1-780f-11ef-9165-d8bbc14c2e2b','User Role','user-type','bi',4,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:10'),
(13,'1a3d930f-780f-11ef-9165-d8bbc14c2e2b','Add Pro. Stock','product-stock/create','bi',5,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:13'),
(14,'1a3d9359-780f-11ef-9165-d8bbc14c2e2b','Outlet Order','OutletOrder','bi',6,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:20'),
(15,'1a3d9395-780f-11ef-9165-d8bbc14c2e2b','Delivery to SO','pages/samples/blank-page.html','bi',7,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:29'),
(16,'1a3d93de-780f-11ef-9165-d8bbc14c2e2b','Distributor Order','pages/samples/error-404.html','bi',7,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:33'),
(20,'1a3d9419-780f-11ef-9165-d8bbc14c2e2b','Area Info','AreaInfo','bi',2,3,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:38'),
(21,'1a3d9456-780f-11ef-9165-d8bbc14c2e2b','Outlet Info','OutletInfo','bi',2,3,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:41'),
(22,'1a3d9492-780f-11ef-9165-d8bbc14c2e2b','Product Info','ProInfo','bi',3,4,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:47'),
(23,'1a3d94d6-780f-11ef-9165-d8bbc14c2e2b','Sub-Category','ProSubCategory','bi',3,3,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:05:51'),
(24,'1a3d950f-780f-11ef-9165-d8bbc14c2e2b','Category','ProCategory','bi',3,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:06:10'),
(26,'1a3d954d-780f-11ef-9165-d8bbc14c2e2b','Distributor Info','distributor-info','bi',4,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:06:07'),
(27,'1a3d9588-780f-11ef-9165-d8bbc14c2e2b','User Info','UserInfo','bi',4,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:06:03'),
(28,'1a3d95c1-780f-11ef-9165-d8bbc14c2e2b','Distributor Order','OutletOrder','bi',6,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:06:00'),
(30,'1a3d95fd-780f-11ef-9165-d8bbc14c2e2b','Settings','WebSettings','typcn typcn-weather-snow',NULL,11,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:30:40'),
(31,'1a3d963c-780f-11ef-9165-d8bbc14c2e2b','View Pro. Stock','product-stock','bi',5,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:30:33'),
(32,'1a3d9676-780f-11ef-9165-d8bbc14c2e2b','Menus Config','#','typcn typcn-th-menu',NULL,7,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:30:25'),
(33,'1a3d96b0-780f-11ef-9165-d8bbc14c2e2b','Menu Info','menu-info','bi',32,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:30:20'),
(34,'1a3d96e9-780f-11ef-9165-d8bbc14c2e2b','User Menu Assign','menu-permission','bi',32,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:30:16'),
(35,'1a3d9721-780f-11ef-9165-d8bbc14c2e2b','Distributor Info','#','typcn typcn-user-add-outline',NULL,7,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:30:05'),
(36,'1a3d975a-780f-11ef-9165-d8bbc14c2e2b','DB Stock','menu-permission','bi',35,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:30:01'),
(37,'1a3d9798-780f-11ef-9165-d8bbc14c2e2b','SO Info','menu-permission','bi',35,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:29:57'),
(38,'1a3d97d1-780f-11ef-9165-d8bbc14c2e2b','Pro. Orders','menu-permission','bi',35,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:29:53'),
(39,'1a3d980b-780f-11ef-9165-d8bbc14c2e2b','Pro. Returns','menu-permission','bi',35,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:29:48'),
(40,'1a3d9842-780f-11ef-9165-d8bbc14c2e2b','Reports','#','typcn typcn-th-menu',NULL,7,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:29:44'),
(41,'1a3d9884-780f-11ef-9165-d8bbc14c2e2b','Returns','menu-permission','bi',40,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:29:39'),
(42,'1a3d98bd-780f-11ef-9165-d8bbc14c2e2b','Sales Report','menu-permission','bi',40,2,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:29:32'),
(43,'1a3d98f8-780f-11ef-9165-d8bbc14c2e2b','User Permission','menu-permission','bi',4,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:29:21'),
(44,'1a3d9930-780f-11ef-9165-d8bbc14c2e2b','Roles','roles','bi',4,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:29:16'),
(45,'1a3d9973-780f-11ef-9165-d8bbc14c2e2b','Permissions','permission','bi',4,1,'A','2024-09-02 19:07:45','2024-09-02 19:07:45','2','2024-09-22 01:29:09');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(4,'2024_09_02_194001_create_menus_table',1),
(6,'2014_10_12_000000_create_users_table',2),
(21,'2019_12_14_000001_create_personal_access_tokens_table',3),
(22,'2024_09_05_063457_create_sessions_table',3),
(23,'2019_08_19_000000_create_failed_jobs_table',4),
(24,'2024_09_16_161228_create_role_menu_permissions_table',5),
(25,'2024_09_21_152717_create_roles_table',6),
(26,'2024_09_21_152749_create_permissions_table',6),
(27,'2024_09_21_152812_create_role_user_table',6),
(28,'2024_09_21_152831_create_permission_role_table',6);

/*Table structure for table `permission_role` */

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `role_id` bigint(20) unsigned NOT NULL,
  `menu_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`,`permission_id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_emnu_id_foreign` (`menu_id`),
  CONSTRAINT `permission_emnu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_role` */

insert  into `permission_role`(`role_id`,`menu_id`,`permission_id`) values 
(1,1,214),
(1,1,215),
(1,1,216),
(1,1,217),
(1,2,230),
(1,2,231),
(1,2,232),
(1,2,233),
(1,3,234),
(1,3,235),
(1,3,236),
(1,3,237),
(1,4,238),
(1,4,239),
(1,4,240),
(1,4,241),
(1,5,242),
(1,5,243),
(1,5,244),
(1,5,245),
(1,6,246),
(1,6,247),
(1,6,248),
(1,6,249),
(1,7,250),
(1,7,251),
(1,7,252),
(1,7,253),
(1,8,254),
(1,8,255),
(1,8,256),
(1,8,257),
(1,9,258),
(1,9,259),
(1,9,260),
(1,9,261),
(1,10,266),
(1,10,267),
(1,10,268),
(1,10,269),
(1,11,270),
(1,11,271),
(1,11,272),
(1,11,273),
(1,12,274),
(1,12,275),
(1,12,276),
(1,12,277),
(1,13,278),
(1,13,279),
(1,13,280),
(1,13,281),
(1,14,286),
(1,14,287),
(1,14,288),
(1,14,289),
(1,15,294),
(1,15,295),
(1,15,296),
(1,15,297),
(1,16,298),
(1,16,299),
(1,16,300),
(1,16,301),
(1,20,302),
(1,20,303),
(1,20,304),
(1,20,305),
(1,21,306),
(1,21,307),
(1,21,308),
(1,21,309),
(1,22,310),
(1,22,311),
(1,22,312),
(1,22,313),
(1,23,314),
(1,23,315),
(1,23,316),
(1,23,317),
(1,24,334),
(1,24,335),
(1,24,336),
(1,24,337),
(1,26,330),
(1,26,331),
(1,26,332),
(1,26,333),
(1,27,326),
(1,27,327),
(1,27,328),
(1,27,329),
(1,28,322),
(1,28,323),
(1,28,324),
(1,28,325),
(1,30,418),
(1,30,419),
(1,30,420),
(1,30,421),
(1,31,410),
(1,31,411),
(1,31,412),
(1,31,413),
(1,32,402),
(1,32,403),
(1,32,404),
(1,32,405),
(1,33,398),
(1,33,399),
(1,33,400),
(1,33,401),
(1,34,394),
(1,34,395),
(1,34,396),
(1,34,397),
(1,35,382),
(1,35,383),
(1,35,384),
(1,35,385),
(1,36,378),
(1,36,379),
(1,36,380),
(1,36,381),
(1,37,374),
(1,37,375),
(1,37,376),
(1,37,377),
(1,38,370),
(1,38,371),
(1,38,372),
(1,38,373),
(1,39,366),
(1,39,367),
(1,39,368),
(1,39,369),
(1,40,362),
(1,40,363),
(1,40,364),
(1,40,365),
(1,41,358),
(1,41,359),
(1,41,360),
(1,41,361),
(1,42,354),
(1,42,355),
(1,42,356),
(1,42,357),
(1,43,346),
(1,43,347),
(1,43,348),
(1,43,349),
(1,44,342),
(1,44,343),
(1,44,344),
(1,44,345),
(1,45,338),
(1,45,339),
(1,45,340),
(1,45,341);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`menu_id`,`created_at`,`updated_at`) values 
(214,'view','1',NULL,NULL),
(215,'create','1',NULL,NULL),
(216,'edit','1',NULL,NULL),
(217,'delete','1',NULL,NULL),
(230,'view','2',NULL,NULL),
(231,'create','2',NULL,NULL),
(232,'edit','2',NULL,NULL),
(233,'delete','2',NULL,NULL),
(234,'view','3',NULL,NULL),
(235,'create','3',NULL,NULL),
(236,'edit','3',NULL,NULL),
(237,'delete','3',NULL,NULL),
(238,'view','4',NULL,NULL),
(239,'create','4',NULL,NULL),
(240,'edit','4',NULL,NULL),
(241,'delete','4',NULL,NULL),
(242,'view','5',NULL,NULL),
(243,'create','5',NULL,NULL),
(244,'edit','5',NULL,NULL),
(245,'delete','5',NULL,NULL),
(246,'view','6',NULL,NULL),
(247,'create','6',NULL,NULL),
(248,'edit','6',NULL,NULL),
(249,'delete','6',NULL,NULL),
(250,'view','7',NULL,NULL),
(251,'create','7',NULL,NULL),
(252,'edit','7',NULL,NULL),
(253,'delete','7',NULL,NULL),
(254,'view','8',NULL,NULL),
(255,'create','8',NULL,NULL),
(256,'edit','8',NULL,NULL),
(257,'delete','8',NULL,NULL),
(258,'view','9',NULL,NULL),
(259,'create','9',NULL,NULL),
(260,'edit','9',NULL,NULL),
(261,'delete','9',NULL,NULL),
(266,'view','10',NULL,NULL),
(267,'create','10',NULL,NULL),
(268,'edit','10',NULL,NULL),
(269,'delete','10',NULL,NULL),
(270,'view','11',NULL,NULL),
(271,'create','11',NULL,NULL),
(272,'edit','11',NULL,NULL),
(273,'delete','11',NULL,NULL),
(274,'view','12',NULL,NULL),
(275,'create','12',NULL,NULL),
(276,'edit','12',NULL,NULL),
(277,'delete','12',NULL,NULL),
(278,'view','13',NULL,NULL),
(279,'create','13',NULL,NULL),
(280,'edit','13',NULL,NULL),
(281,'delete','13',NULL,NULL),
(286,'view','14',NULL,NULL),
(287,'create','14',NULL,NULL),
(288,'edit','14',NULL,NULL),
(289,'delete','14',NULL,NULL),
(294,'view','15',NULL,NULL),
(295,'create','15',NULL,NULL),
(296,'edit','15',NULL,NULL),
(297,'delete','15',NULL,NULL),
(298,'view','16',NULL,NULL),
(299,'create','16',NULL,NULL),
(300,'edit','16',NULL,NULL),
(301,'delete','16',NULL,NULL),
(302,'view','20',NULL,NULL),
(303,'create','20',NULL,NULL),
(304,'edit','20',NULL,NULL),
(305,'delete','20',NULL,NULL),
(306,'view','21',NULL,NULL),
(307,'create','21',NULL,NULL),
(308,'edit','21',NULL,NULL),
(309,'delete','21',NULL,NULL),
(310,'view','22',NULL,NULL),
(311,'create','22',NULL,NULL),
(312,'edit','22',NULL,NULL),
(313,'delete','22',NULL,NULL),
(314,'view','23',NULL,NULL),
(315,'create','23',NULL,NULL),
(316,'edit','23',NULL,NULL),
(317,'delete','23',NULL,NULL),
(322,'view','28',NULL,NULL),
(323,'create','28',NULL,NULL),
(324,'edit','28',NULL,NULL),
(325,'delete','28',NULL,NULL),
(326,'view','27',NULL,NULL),
(327,'create','27',NULL,NULL),
(328,'edit','27',NULL,NULL),
(329,'delete','27',NULL,NULL),
(330,'view','26',NULL,NULL),
(331,'create','26',NULL,NULL),
(332,'edit','26',NULL,NULL),
(333,'delete','26',NULL,NULL),
(334,'view','24',NULL,NULL),
(335,'create','24',NULL,NULL),
(336,'edit','24',NULL,NULL),
(337,'delete','24',NULL,NULL),
(338,'view','45',NULL,NULL),
(339,'create','45',NULL,NULL),
(340,'edit','45',NULL,NULL),
(341,'delete','45',NULL,NULL),
(342,'view','44',NULL,NULL),
(343,'create','44',NULL,NULL),
(344,'edit','44',NULL,NULL),
(345,'delete','44',NULL,NULL),
(346,'view','43',NULL,NULL),
(347,'create','43',NULL,NULL),
(348,'edit','43',NULL,NULL),
(349,'delete','43',NULL,NULL),
(354,'view','42',NULL,NULL),
(355,'create','42',NULL,NULL),
(356,'edit','42',NULL,NULL),
(357,'delete','42',NULL,NULL),
(358,'view','41',NULL,NULL),
(359,'create','41',NULL,NULL),
(360,'edit','41',NULL,NULL),
(361,'delete','41',NULL,NULL),
(362,'view','40',NULL,NULL),
(363,'create','40',NULL,NULL),
(364,'edit','40',NULL,NULL),
(365,'delete','40',NULL,NULL),
(366,'view','39',NULL,NULL),
(367,'create','39',NULL,NULL),
(368,'edit','39',NULL,NULL),
(369,'delete','39',NULL,NULL),
(370,'view','38',NULL,NULL),
(371,'create','38',NULL,NULL),
(372,'edit','38',NULL,NULL),
(373,'delete','38',NULL,NULL),
(374,'view','37',NULL,NULL),
(375,'create','37',NULL,NULL),
(376,'edit','37',NULL,NULL),
(377,'delete','37',NULL,NULL),
(378,'view','36',NULL,NULL),
(379,'create','36',NULL,NULL),
(380,'edit','36',NULL,NULL),
(381,'delete','36',NULL,NULL),
(382,'view','35',NULL,NULL),
(383,'create','35',NULL,NULL),
(384,'edit','35',NULL,NULL),
(385,'delete','35',NULL,NULL),
(394,'view','34',NULL,NULL),
(395,'create','34',NULL,NULL),
(396,'edit','34',NULL,NULL),
(397,'delete','34',NULL,NULL),
(398,'view','33',NULL,NULL),
(399,'create','33',NULL,NULL),
(400,'edit','33',NULL,NULL),
(401,'delete','33',NULL,NULL),
(402,'view','32',NULL,NULL),
(403,'create','32',NULL,NULL),
(404,'edit','32',NULL,NULL),
(405,'delete','32',NULL,NULL),
(410,'view','31',NULL,NULL),
(411,'create','31',NULL,NULL),
(412,'edit','31',NULL,NULL),
(413,'delete','31',NULL,NULL),
(418,'view','30',NULL,NULL),
(419,'create','30',NULL,NULL),
(420,'edit','30',NULL,NULL),
(421,'delete','30',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=11020010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pro_category` */

insert  into `pro_category`(`id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11020000,'2c789134-661e-4591-a74e-d21c6e069f9a','Biscuits','A','2','2024-09-12 00:27:00','2','2024-09-16 00:06:38'),
(11020001,'24e95fed-1c43-4f04-b936-078fa8e11e73','Breads','A','2','2024-09-12 00:27:09','2','2024-09-16 00:06:47'),
(11020002,'76b90785-968a-450a-a26c-aabb09fc63cb','TTTTT','Deleted','2','2024-09-12 00:37:05','2','2024-09-12 00:37:35'),
(11020003,'d5401564-0a66-4ef9-871a-3846ba166bd7','Cake','A','2','2024-09-12 00:41:37','2','2024-09-16 00:06:56'),
(11020009,'37d397ed-f9d3-4b6f-92b0-58599145e8cb','hj','A','2','2024-09-16 11:37:26','0','0');

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
) ENGINE=InnoDB AUTO_INCREMENT=11040004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pro_info` */

insert  into `pro_info`(`id`,`uid`,`name`,`pro_type_id`,`cat_id`,`sub_cat_id`,`shot_decs`,`decs`,`unit`,`pcs_per_ctn`,`dp_unit`,`rp_unit`,`mrp_unit`,`pro_sku_code`,`pro_image1`,`pro_image2`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11040000,'13474507-3c17-4c52-acb5-f5f9f1d75b26','Dia Salt Biscuit',11010000,11020000,11030000,'Dia Salt Biscuit','0','PCS','10',0,0,0,'SKU-99E2322A','assets/product_img/66e7cab01d995.png','No Image','A','2','2024-09-12 01:58:45','2','2024-09-16 12:05:36'),
(11040001,'89427be5-b715-4cb6-a5b9-d1a7787e9d15','Econo Dia Salt Biscuit',11010000,11020000,11030000,'Econo Dia Salt Biscuit','0','PCS','12',0,0,0,'SKU-99E23D8B','assets/product_img/66e7cad0d80de.jpg','No Image','A','2','2024-09-12 02:01:33','2','2024-09-16 12:06:08'),
(11040002,'18ee5954-23c7-4506-815a-46cdd3f01eee','asdasd',11010000,11020001,11030001,'asdasd','0','KG','22',0,0,0,'SKU-1946A055','asdasd','No Image','Deleted','2','2024-09-12 02:11:55','2','2024-09-12 02:12:00'),
(11040003,'f02d9eb5-558d-413c-a44f-84f7272952a6','Horlicks Biscuit',11010000,11020000,11030001,'Horlicks Biscuit','0','PCS','15',0,0,0,'SKU-F1A89F83','assets/product_img/66e7cae9d464f.png','No Image','A','2','2024-09-13 11:11:07','2','2024-09-16 12:06:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=11030006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pro_sub_category` */

insert  into `pro_sub_category`(`id`,`uid`,`cat_id`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11030000,'5eec7f4b-f7de-4d69-9dd0-3cbc95f57570',11020000,'Salt Biscuit','A','2','2024-09-12 01:01:32','2','2024-09-16 00:08:21'),
(11030001,'2ab08954-ae33-4bf6-b567-f3fd7910e8e4',11020000,'Biscuit','A','2','2024-09-12 01:01:45','2','2024-09-16 00:09:08'),
(11030002,'d2aff1e3-8f54-4e6c-8638-6bdbaeb3c879',11020003,'TTTT','Deleted','2','2024-09-12 01:01:52','2','2024-09-12 01:02:35'),
(11030005,'3ae92ab1-af5c-4642-a9ed-3ef66881023d',11020009,'Testaaa','A','2','2024-09-16 11:46:31','2','2024-09-16 11:46:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=11010006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pro_type` */

insert  into `pro_type`(`id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11010000,'3d011d40-5f68-48bf-96b1-a077d8a6bb66','Biscuits','A','2','2024-09-16 11:09:50',NULL,NULL),
(11010001,'31839b4d-7f77-4175-8754-9892e1da3346','Breads','A','2','2024-09-16 11:10:08','2','2024-09-16 11:18:47'),
(11010002,'0449c061-f3f6-4ca8-afee-8ffcdff46694','Cake','A','2','2024-09-16 11:10:41','2','2024-09-16 11:18:51'),
(11010003,'b334dff5-11b6-4c72-84d1-3adbaba2f62a','AAA222','Deleted','2','2024-09-16 11:17:03','2','2024-09-16 11:49:41'),
(11010004,'ae315405-d3fb-46c9-a67b-9fb58f4a7ab6','adad','Deleted','2','2024-09-16 11:47:43','2','2024-09-16 11:49:13'),
(11010005,'aa8b9675-59b0-4fc1-9cdf-654f8fcab8d4','Test','A','2','2024-09-16 11:49:57',NULL,NULL);

/*Table structure for table `product_stock` */

DROP TABLE IF EXISTS `product_stock`;

CREATE TABLE `product_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_id` bigint(20) NOT NULL,
  `batch_number` varchar(50) NOT NULL,
  `production_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `mrp` decimal(10,2) NOT NULL,
  `dealer_price` decimal(10,2) NOT NULL,
  `status` enum('available','out_of_stock') NOT NULL,
  `create_by` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `product_stock` */

insert  into `product_stock`(`id`,`pro_id`,`batch_number`,`production_date`,`expiry_date`,`quantity_in_stock`,`mrp`,`dealer_price`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(1,11040000,'BATCH-8XVV7UNG','2024-09-15','2024-10-05',500,70.00,60.00,'available','2','2024-09-15 12:14:41',NULL,NULL),
(2,11040001,'BATCH-I154VG3B','2024-09-15','2024-10-05',600,80.00,75.00,'available','2','2024-09-15 12:14:41',NULL,NULL),
(3,11040003,'BATCH-P81HAUGE','2024-09-15','2024-10-05',700,90.00,87.00,'available','2','2024-09-15 12:14:41',NULL,NULL),
(4,11040000,'BATCH-0YHQSR3L','2024-09-15','2024-09-16',50,50.00,60.00,'available','2','2024-09-15 12:42:40',NULL,NULL),
(5,11040000,'BATCH-MB3E16V2','2024-09-15','2024-09-17',80,80.00,80.00,'available','2','2024-09-15 12:43:32',NULL,NULL),
(6,11040000,'BATCH-3DQ02VFG','2024-09-15','2024-09-17',50,50.00,50.00,'available','2','2024-09-15 13:23:29',NULL,NULL);

/*Table structure for table `role_menu_permissions` */

DROP TABLE IF EXISTS `role_menu_permissions`;

CREATE TABLE `role_menu_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `menu_id` bigint(20) unsigned NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT 0,
  `add` tinyint(1) NOT NULL DEFAULT 0,
  `update` tinyint(1) NOT NULL DEFAULT 0,
  `delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_menu_permissions` */

insert  into `role_menu_permissions`(`id`,`role_id`,`menu_id`,`view`,`add`,`update`,`delete`,`created_at`,`updated_at`) values 
(1,11050001,1,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(2,11050001,2,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(3,11050001,3,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(4,11050001,4,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(5,11050001,5,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(6,11050001,6,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(7,11050001,7,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(8,11050001,8,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(9,11050001,9,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(10,11050001,10,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(11,11050001,11,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(12,11050001,12,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(13,11050001,13,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(14,11050001,14,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(15,11050001,15,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(16,11050001,16,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(17,11050001,20,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(18,11050001,21,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(19,11050001,22,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(20,11050001,23,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(21,11050001,24,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(22,11050001,26,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(23,11050001,27,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(24,11050001,28,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(25,11050001,30,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(26,11050001,31,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(27,11050001,32,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(28,11050001,33,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(29,11050001,34,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(30,11050001,35,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(31,11050001,36,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(32,11050001,37,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(33,11050001,38,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(34,11050001,39,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(35,11050001,40,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(36,11050001,41,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(37,11050001,42,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(38,11050001,43,1,1,1,1,'2024-09-21 14:39:26','2024-09-21 14:39:26'),
(39,11050001,44,1,1,1,1,'2024-09-21 15:37:11','2024-09-21 15:37:11'),
(40,11050001,45,1,1,1,1,'2024-09-21 15:37:47','2024-09-21 15:37:47'),
(41,1,1,0,0,0,0,'2024-09-21 20:35:19','2024-09-21 20:35:19'),
(42,1,2,0,0,0,0,'2024-09-21 20:35:19','2024-09-21 20:35:19'),
(43,1,3,0,0,0,0,'2024-09-21 20:35:19','2024-09-21 20:35:19');

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_user` */

insert  into `role_user`(`user_id`,`role_id`) values 
(2,2);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`description`,`created_at`,`updated_at`) values 
(1,'root','Root','2024-09-21 15:34:01','2024-09-21 15:34:01'),
(2,'admin','Admin','2024-09-21 15:34:01','2024-09-21 15:34:01'),
(3,'Administrator','Administrator','2024-09-21 15:34:01','2024-09-21 15:34:01'),
(4,'editor','Editor','2024-09-21 15:34:01','2024-09-21 15:34:01'),
(5,'user','Regular User','2024-09-21 15:34:01','2024-09-21 15:34:01'),
(6,'demo_user','Demo User','2024-09-21 15:34:01','2024-09-21 15:34:01'),
(8,'test_data','Test Data','2024-09-21 15:53:11','2024-09-21 15:54:21');

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
('xXJAqJD9JgTePPsE82xT0SpM0FF4TIGOWpeh270w',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:130.0) Gecko/20100101 Firefox/130.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibW5NbnRYb0pPQzZyajdGdklpRHJiWko5Yk5IVDByYmtKY1VSbFBTUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9Vc2VySW5mbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==',1727032779);

/*Table structure for table `soc_area` */

DROP TABLE IF EXISTS `soc_area`;

CREATE TABLE `soc_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dis_id` int(10) DEFAULT NULL,
  `div_id` int(10) DEFAULT NULL,
  `tha_id` int(10) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `soc_area` */

insert  into `soc_area`(`id`,`dis_id`,`div_id`,`tha_id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(14000,12000,11000,12,'a94cbf4d-d26d-4aa3-ac15-dbb7f2d4834b','Mirpur 1','A','2','2024-09-13 17:51:22','0','0'),
(14001,12000,11000,8,'41f3e441-755f-4505-b0fa-9231407577d5','Adabor 13','A','2','2024-09-13 17:52:16','2','2024-09-13 17:52:25');

/*Table structure for table `soc_districts` */

DROP TABLE IF EXISTS `soc_districts`;

CREATE TABLE `soc_districts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `div_id` int(10) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12032 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `soc_districts` */

insert  into `soc_districts`(`id`,`div_id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(12000,11000,'f1b957c1-65bd-47bf-a194-8ea303fa23f7','Dhaka','A','2','2024-09-13 15:46:24','0','0'),
(12001,11004,'a3d46342-ef59-4297-b544-2adbfc2a8989','Natore','A','2','2024-09-13 15:46:48','0','0'),
(12002,11004,'82852619-945f-49c0-b55d-52ebeefec2f5','Sirajganj','A','2','2024-09-13 15:47:06','0','0'),
(12003,11004,'f3ac8594-4ab9-4aaa-ae40-e78a078a3a83','Pabna','A','2','2024-09-13 15:47:14','0','0'),
(12004,11004,'1a2ecebb-e0cb-4361-8524-339f4bffcd6b','Bogura','A','2','2024-09-13 15:47:24','0','0'),
(12005,11004,'1c9285a0-77fd-4aea-b7d2-1037646b2ca2','Chapainawabganj','A','2','2024-09-13 15:47:34','0','0'),
(12006,11004,'600b3c6e-3f4f-4c14-b55a-3cb4fba55407','Naogaon','A','2','2024-09-13 15:47:42','0','0'),
(12007,11004,'32a41c42-2602-4b51-9b6c-5f9c650443a4','Joypurhat','A','2','2024-09-13 15:47:52','0','0'),
(12008,11000,'f6925f65-de00-4902-88a5-7f2d8dbedaaf','Dhaka District','A','2','2024-09-13 15:48:06','0','0'),
(12009,11000,'6037525d-20d4-4992-8dde-6c8ed78a638c','Gazipur District','A','2','2024-09-13 15:48:38','0','0'),
(12010,11000,'78958e4e-07e3-4277-a609-fb702457e29b','Kishoreganj District','A','2','2024-09-13 15:48:56','0','0'),
(12011,11000,'a9f1fa6c-a50e-426d-9437-24f495278cc0','Manikganj','A','2','2024-09-13 15:49:07','0','0'),
(12012,11000,'0a90cae0-2947-4bd0-bd08-aab088a9898a','Munshiganj','A','2','2024-09-13 15:49:12','0','0'),
(12013,11000,'7c3c2885-6cfa-469f-92a6-42cf1742202a','Narayanganj','A','2','2024-09-13 15:49:19','0','0'),
(12014,11000,'ff1a903b-7665-4ad9-bdeb-038cf86bf33f','Narsingdi','A','2','2024-09-13 15:49:24','0','0'),
(12015,11000,'f965ada9-6e57-4fda-b9e6-9ca6c0ae92b9','Tangail','A','2','2024-09-13 15:49:30','0','0'),
(12016,11000,'018f339d-1bb8-4747-af1b-db99a20b6efb','Faridpur','A','2','2024-09-13 15:49:35','0','0'),
(12017,11000,'16963db1-d079-4c8a-9eee-e26b4b5c46fe','Gopalganj','A','2','2024-09-13 15:49:40','0','0'),
(12018,11000,'11d6f8b3-b810-4901-b5be-9b331578fd62','Madaripur','A','2','2024-09-13 15:49:46','0','0'),
(12019,11000,'791abf63-81c7-44ca-9c3a-96e7cfd8fa93','Rajbari','A','2','2024-09-13 15:49:50','0','0'),
(12020,11000,'b0844589-396d-4846-ac40-e147277854ae','Shariatpur','A','2','2024-09-13 15:49:55','0','0'),
(12021,11007,'828c89a7-f597-4b8e-a1ca-34c47c360939','Brahmanbaria','A','2','2024-09-13 15:51:03','0','0'),
(12022,11007,'5c5f1dd8-87ba-441e-b3ed-793f02638bd0','Comilla','A','2','2024-09-13 15:51:15','0','0'),
(12023,11007,'625df7e6-d419-43d1-8b09-cf5ffb6a8057','Chandpur','A','2','2024-09-13 15:51:21','0','0'),
(12024,11007,'a7079fb3-1406-4ee1-bbd9-57249e827d0d','Lakshmipur','A','2','2024-09-13 15:51:27','0','0'),
(12025,11007,'c5cc1626-77ae-4d73-ae85-29832b7f3389','Maijdee','A','2','2024-09-13 15:51:32','0','0'),
(12026,11007,'51f147d9-015f-4cc3-877f-b94b8a207d18','Feni','A','2','2024-09-13 15:51:37','0','0'),
(12027,11007,'d1b4e637-f470-460e-8715-cc55bb619b09','Khagrachhari','A','2','2024-09-13 15:51:42','0','0'),
(12028,11007,'aa10b6f4-f73c-4ec5-b2eb-ddef8068ea0d','Rangamati','A','2','2024-09-13 15:51:47','0','0'),
(12029,11007,'fd2cbe16-8619-4fb0-8bdb-4fd1e03191d2','Bandarban','A','2','2024-09-13 15:51:53','0','0'),
(12030,11007,'a91f2b79-5f98-41f5-b8a0-96b113a64ba6','Chittagong','A','2','2024-09-13 15:52:00','0','0'),
(12031,11007,'0f303eb5-a81e-49fe-a8fa-e6dfb6525f10','Cox\'s Bazar','A','2','2024-09-13 15:52:09','0','0');

/*Table structure for table `soc_divisions` */

DROP TABLE IF EXISTS `soc_divisions`;

CREATE TABLE `soc_divisions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `soc_divisions` */

insert  into `soc_divisions`(`id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11000,'55239c43-584f-4085-9e4d-beaa8a0a9d98','Dhaka Division','A','2','2024-09-13 15:37:49','0','0'),
(11001,'1d559410-edd3-4677-a568-22da24d0fd31','Khulna Division','A','2','2024-09-13 15:38:18','0','0'),
(11002,'1604f9c8-393c-44af-a2c0-69c3c43bc874','Mymensingh Division','A','2','2024-09-13 15:38:26','0','0'),
(11003,'35a4e864-fe43-4356-97bf-630fb4423913','Barisal Division','A','2','2024-09-13 15:38:35','0','0'),
(11004,'860a4140-2ea8-4a33-9408-b154f7804b0a','Rajshahi Division','A','2','2024-09-13 15:38:44','0','0'),
(11005,'e9739c53-be46-40de-9e20-e5ac9f2952d7','Rangpur Division','A','2','2024-09-13 15:38:52','0','0'),
(11006,'1254bf8b-db55-4b7c-998e-2c0b89f20a7f','Sylhet Division','A','2','2024-09-13 15:39:01','0','0'),
(11007,'5137da04-6c1a-41e6-adfc-24ed2e162d92','Chittagong Division','A','2','2024-09-13 15:50:48','0','0');

/*Table structure for table `soc_outlet` */

DROP TABLE IF EXISTS `soc_outlet`;

CREATE TABLE `soc_outlet` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `div_id` int(10) NOT NULL,
  `dis_id` int(10) NOT NULL,
  `tha_id` int(10) NOT NULL,
  `ara_id` int(10) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `soc_outlet` */

insert  into `soc_outlet`(`id`,`div_id`,`dis_id`,`tha_id`,`ara_id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(15000,11000,12000,12,14000,'3931d713-6cc2-45cd-889d-87dadd2ff543','Test','A','2','2024-09-13 19:24:48','0','0');

/*Table structure for table `soc_thana` */

DROP TABLE IF EXISTS `soc_thana`;

CREATE TABLE `soc_thana` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `div_id` int(10) NOT NULL,
  `dis_id` int(10) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `soc_thana` */

insert  into `soc_thana`(`id`,`div_id`,`dis_id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(1,11007,12022,'90f75386-2f5a-4d99-b7c3-8bb1da64b586','Barura Upazila','A','2','2024-09-13 17:20:02','0','0'),
(2,11007,12022,'d1b3b7e3-25c9-463e-8781-cd7efd09d94c','Brahmanpara Upazila','A','2','2024-09-13 17:20:14','0','0'),
(3,11007,12022,'d5c5c4d7-a247-4e14-98ec-7ce1609412e0','Burichong Upazila','A','2','2024-09-13 17:20:27','0','0'),
(4,11007,12030,'a7aa4004-59e8-4841-bbb8-77514711dd35','Akbar Shah Thana','A','2','2024-09-13 17:20:57','0','0'),
(5,11007,12030,'936d66a4-52ab-44a9-8b79-7c78fc06c3a2','Bakoliya Thana','A','2','2024-09-13 17:21:10','0','0'),
(6,11007,12030,'1807981c-66a0-48b3-8c4e-dca3202e27f9','Bandar Thana','A','2','2024-09-13 17:21:20','0','0'),
(7,11007,12030,'c5af9a19-f70b-43ab-a276-475daf539f8e','Chandgaon Thana','A','2','2024-09-13 17:21:33','0','0'),
(8,11000,12000,'1dd218b7-196e-4189-bb9d-46c601ac3ee1','Adabar Thana','A','2','2024-09-13 17:40:21','0','0'),
(9,11000,12000,'22d97eeb-db36-4d2b-a72d-a7df416df8cc','Badda Thana','A','2','2024-09-13 17:40:43','0','0'),
(10,11000,12000,'9be2eb80-535c-4254-87d8-21b2e1c5efc0','Cantonment Thana','A','2','2024-09-13 17:41:00','0','0'),
(11,11000,12000,'0c21b800-9e0b-4b77-afe2-793644153998','Lalbagh Thana','A','2','2024-09-13 17:41:13','0','0'),
(12,11000,12000,'69de14ae-4f4f-466f-9d78-16e00a251589','Mirpur Model Thana','A','2','2024-09-13 17:41:29','0','0'),
(13,11000,12000,'450528ca-74ea-41e5-841b-49f6a37804c1','Mohammadpur Thana','A','2','2024-09-13 17:41:39','0','0'),
(14,11000,12000,'711924ef-9d4f-45c3-86e2-1f9b298b6009','Mirpur-1','Deleted','2','2024-09-13 17:41:58','2','2024-09-13 17:51:42'),
(15,11000,12000,'f85667fd-1a2d-45ac-b16a-5ba84b83390a','Mirpur-2','Deleted','2','2024-09-13 17:42:10','2','2024-09-13 17:51:52'),
(16,11000,12000,'191fda37-116a-42ce-86f0-d6e3f483257c','Adabar 12','Deleted','2','2024-09-13 17:43:36','2','2024-09-13 17:51:58');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_by` varchar(10) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `update_by` varchar(10) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11050009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`uid`,`name`,`status`,`create_by`,`create_date`,`update_by`,`update_date`) values 
(11050000,'76b3eac0-e8af-4db8-b141-071e268d4623','Root Admin','Deleted','2','2024-09-15 17:39:24','2','2024-09-15 17:39:39'),
(11050001,'5143bcd7-ca6e-4dc9-9a31-b397146513dc','Super Admin','A','2','2024-09-15 17:39:33','0','0'),
(11050002,'261a471a-978a-4fbe-a90b-8c15ada4b0a7','Admin','A','2','2024-09-15 17:39:57','0','0'),
(11050003,'3eadfef7-14e7-450b-809c-689dea4d259a','Manager','A','2','2024-09-15 17:40:09','0','0'),
(11050004,'2a97d045-195e-41f3-9e36-3eb536a4a553','Distributor','A','2','2024-09-15 17:40:26','0','0'),
(11050005,'52dc6ada-14e3-45c7-b8d6-1f5fdb4716f5','adad','Deleted','2','2024-09-16 03:22:21','2','2024-09-16 03:22:28'),
(11050006,'574658ff-7781-40b0-9e51-937c5ab44eb5','TEST','A','2','2024-09-21 16:22:44','0','0'),
(11050007,'f152951f-2961-450e-85bf-311b7dead4ef','asdas','A','2','2024-09-21 16:23:02','0','0'),
(11050008,'559b1d32-8c6c-4be0-bad9-42c429d42dd1','asdad','A','2','2024-09-21 16:24:02','0','0');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`uid`,`role_id`,`name`,`user_name`,`email`,`email_verified_at`,`password`,`longitude`,`latitude`,`ip`,`mac`,`last_login`,`status`,`create_by`,`create_date`,`update_date`,`update_by`,`token`) values 
(1,'admin001',2,'Admin User','adminuser','admin@example.com','2024-09-05 07:36:50','$2y$10$YHLibwvE5HlgD6J4XAWRreZ2RIoKwVjALBKey.Gam3Rbjuatg9b/6','90.361361','23.7857505','103.112.236.26','00:00:00:00:00:00','2024-09-14 01:20:18','A','system','2024-09-05 07:36:50','2024-09-23 01:05:28','2','z4Jmb8VgX8nuDefCXtW9FIA6arX7xxexFR9ozB7Z'),
(2,'superadmin001',1,'Super Admin','superadmin','superadmin@example.com','2024-09-05 07:36:50','$2y$10$hpF5dW9/hiTn0/lHZMOCe.qqD9j3mNAIXFNbNHPYtnQtEBXhT7Kdy','90.3613652','23.7857501','103.112.236.26','00:00:00:00:00:01','2024-09-23 00:28:11','A','system','2024-09-05 07:36:50','2024-09-23 01:05:34','2','mnMntXoJOC6rj7FvIiDrbZJ9bNHT0rbkJcURlPSQ'),
(10,'cf1ba2ab-8f08-4cde-a50d-8e134ae5c170',NULL,'Test44','TCZI13','test33@gmail.com',NULL,'$2y$10$cQIJBCClH2mmvEY5ng4nYO.JAhivqfDO04/CBD5E5x3sWqc02RAUK','0.0','0.0','0.0','0.0','1970-01-01 06:00:00','Deleted','2','2024-09-09 02:23:36','2024-09-15 17:28:48','2','ziBbKqYjYLajmT69JHJnrsnEbd0Nf0ZxybzxWIE2OmHoWq1QvF26ctE9LTg7'),
(11,'6da584ba-c720-4ca0-8682-736a3deb7ddf',11050004,'Distributor1','KJDD64','distributor1@gmail.com',NULL,'$2y$10$UgUueWj56KKQNfmQCXbzUuT/bN2IQRJaYXLZCfI5KtGkJL0XRD3Qq','90.3613563','23.7857501','103.112.236.26','0.0','2024-09-22 01:36:14','A','2','2024-09-15 18:23:39','6T4qaTIvqukBiGfIZIlkJaWEmXP7jO3AHgU7m1MM','11','6T4qaTIvqukBiGfIZIlkJaWEmXP7jO3AHgU7m1MM'),
(12,'68863927-e812-46f7-8f66-a0e762b9dea1',11050004,'Distributor2','HQBI84','distributor2@gmail.com',NULL,'$2y$10$Rge8gbnK8U6K..FCYGcqAePISUw/kA1YaI0zFl3msgV6Owz4imEuG','0.0','0.0','0.0','0.0','1970-01-01 06:00:00','A','2','2024-09-15 18:24:06','2024-09-15 19:04:51','2','2TSsQXNjl7v8XawbSQkPGYa2xdmzws7nUccDNKII2IL32MzJSBSngF2C6Ku1'),
(14,'66ee788be50a0',3,'Admin User','admin','admin@soc.com',NULL,'$2y$10$uWCnzuh6.2o1cmd7P18dzOq4pxoD85rfbZscoxFwf0yMpb.w1pv.2','0','0','127.0.0.1','00:00:00:00:00:00','2024-09-21 13:40:59','A','system','2024-09-21 13:40:59','2024-09-23 01:05:41','2','dBbH0KzwFKrPtxnydo8AL7RhyzCNGzOhdyQvuQGVKUmREyZoS2e67GXcZeVs');

/* Trigger structure for table `pro_category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_category_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_category_insert` AFTER INSERT ON `pro_category` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, new_data, changed_by)
    VALUES ('pro_category', 
            'INSERT', 
            NEW.id, 
            JSON_OBJECT('uid', NEW.uid, 
                        'name', NEW.name,
                        'status', NEW.status, 
                        'create_by', NEW.create_by, 
                        'create_date', NEW.create_date, 
                        'update_by', NEW.update_by, 
                        'update_date', NEW.update_date), 
            USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_category_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_category_update` BEFORE UPDATE ON `pro_category` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
  VALUES ('pro_category', 'UPDATE', OLD.id, 
          JSON_OBJECT('uid', OLD.uid, 
                      'name', OLD.name,
                      'status', OLD.status, 
                      'create_by', OLD.create_by, 
                      'create_date', OLD.create_date, 
                      'update_by', OLD.update_by, 
                      'update_date', OLD.update_date), 
          JSON_OBJECT('uid', NEW.uid, 
                      'name', NEW.name,
                      'status', NEW.status, 
                      'create_by', NEW.create_by, 
                      'create_date', NEW.create_date, 
                      'update_by', NEW.update_by, 
                      'update_date', NEW.update_date), 
          USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_category_delete` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_category_delete` AFTER DELETE ON `pro_category` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
  VALUES ('pro_category', 'DELETE', OLD.id, 
          JSON_OBJECT('uid', OLD.uid, 
                      'name', OLD.name,
                      'status', OLD.status, 
                      'create_by', OLD.create_by, 
                      'create_date', OLD.create_date, 
                      'update_by', OLD.update_by, 
                      'update_date', OLD.update_date), 
          USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_info` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_info_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_info_insert` AFTER INSERT ON `pro_info` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
  VALUES ('pro_info', 'DELETE', NEW.id, 
          JSON_OBJECT('product_name', NEW.name, 
                      'product_type_id', NEW.pro_type_id, 
                      'Categorie_id', NEW.cat_id, 
                      'sub_Categorie_id', NEW.sub_cat_id, 
                      'shot_decs', NEW.shot_decs, 
                      'decs', NEW.decs, 
                      'Gm', NEW.unit, 
                      'Pcs_Per_Ctn', NEW.pcs_per_ctn, 
                      'dp_unit', NEW.dp_unit, 
                      'rp_unit', NEW.rp_unit, 
                      'mrp_unit', NEW.mrp_unit, 
                      'product_sku_code', NEW.pro_sku_code, 
                      'product_image', NEW.pro_image1,
                      'product_image2', NEW.pro_image2,
                      'status', NEW.status, 
                      'create_by', NEW.create_by, 
                      'create_date', NEW.create_date, 
                      'update_by', NEW.update_by, 
                      'update_date', NEW.update_date), 
          USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_info` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_info_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_info_update` BEFORE UPDATE ON `pro_info` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
  VALUES ('pro_info', 'UPDATE', OLD.id, 
          JSON_OBJECT('product_name', OLD.name, 
                      'product_type_id', OLD.pro_type_id, 
                      'Categorie_id', OLD.cat_id, 
                      'sub_Categorie_id', OLD.sub_cat_id, 
                      'shot_decs', OLD.shot_decs, 
                      'decs', OLD.decs, 
                      'Gm', OLD.unit, 
                      'Pcs_Per_Ctn', OLD.pcs_per_ctn, 
                      'dp_unit', OLD.dp_unit, 
                      'rp_unit', OLD.rp_unit, 
                      'mrp_unit', OLD.mrp_unit, 
                      'product_sku_code', OLD.pro_sku_code, 
                      'product_image', OLD.pro_image1,
                      'product_image2', OLD.pro_image2,
                      'status', OLD.status, 
                      'create_by', OLD.create_by, 
                      'create_date', OLD.create_date, 
                      'update_by', OLD.update_by, 
                      'update_date', OLD.update_date), 
          JSON_OBJECT('product_name', NEW.name, 
                      'product_type_id', NEW.pro_type_id, 
                      'Categorie_id', NEW.cat_id, 
                      'sub_Categorie_id', NEW.sub_cat_id, 
                      'shot_decs', NEW.shot_decs, 
                      'decs', NEW.decs, 
                      'Gm', NEW.unit, 
                      'Pcs_Per_Ctn', NEW.pcs_per_ctn, 
                      'dp_unit', NEW.dp_unit, 
                      'rp_unit', NEW.rp_unit, 
                      'mrp_unit', NEW.mrp_unit, 
                      'product_sku_code', NEW.pro_sku_code, 
                      'product_image', NEW.pro_image1, 
                      'product_image2', NEW.pro_image2, 
                      'status', NEW.status, 
                      'create_by', NEW.create_by, 
                      'create_date', NEW.create_date, 
                      'update_by', NEW.update_by, 
                      'update_date', NEW.update_date), 
          USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_info` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_info_delete` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_info_delete` AFTER DELETE ON `pro_info` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
  VALUES ('pro_info', 'DELETE', OLD.id, 
          JSON_OBJECT('product_name', OLD.name, 
                      'product_type_id', OLD.pro_type_id, 
                      'Categorie_id', OLD.cat_id, 
                      'sub_Categorie_id', OLD.sub_cat_id, 
                      'shot_decs', OLD.shot_decs, 
                      'decs', OLD.decs, 
                      'Gm', OLD.unit, 
                      'Pcs_Per_Ctn', OLD.pcs_per_ctn, 
                      'dp_unit', OLD.dp_unit, 
                      'rp_unit', OLD.rp_unit, 
                      'mrp_unit', OLD.mrp_unit, 
                      'product_sku_code', OLD.pro_sku_code, 
                      'product_image', OLD.pro_image1,
                      'product_image2', OLD.pro_image2,
                      'status', OLD.status, 
                      'create_by', OLD.create_by, 
                      'create_date', OLD.create_date, 
                      'update_by', OLD.update_by, 
                      'update_date', OLD.update_date), 
          USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_sub_category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_sub_category_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_sub_category_insert` AFTER INSERT ON `pro_sub_category` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, new_data, changed_by)
    VALUES ('pro_sub_category', 
            'INSERT', 
            NEW.id, 
            JSON_OBJECT('uid', NEW.uid, 
                        'name', NEW.name,
                        'cat_id', NEW.cat_id,
                        'status', NEW.status, 
                        'create_by', NEW.create_by, 
                        'create_date', NEW.create_date, 
                        'update_by', NEW.update_by, 
                        'update_date', NEW.update_date), 
            USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_sub_category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_sub_category_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_sub_category_update` BEFORE UPDATE ON `pro_sub_category` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
  VALUES ('pro_sub_category', 'UPDATE', OLD.id, 
          JSON_OBJECT('uid', OLD.uid, 
                      'name', OLD.name,
                      'cat_id', OLD.cat_id,
                      'status', OLD.status, 
                      'create_by', OLD.create_by, 
                      'create_date', OLD.create_date, 
                      'update_by', OLD.update_by, 
                      'update_date', OLD.update_date), 
          JSON_OBJECT('uid', NEW.uid, 
                      'name', NEW.name,
                      'cat_id', NEW.cat_id,
                      'status', NEW.status, 
                      'create_by', NEW.create_by, 
                      'create_date', NEW.create_date, 
                      'update_by', NEW.update_by, 
                      'update_date', NEW.update_date), 
          USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_sub_category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_sub_category_delete` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_sub_category_delete` AFTER DELETE ON `pro_sub_category` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
  VALUES ('pro_sub_category', 'DELETE', OLD.id, 
          JSON_OBJECT('uid', OLD.uid, 
                      'cat_id', OLD.cat_id,
                      'name', OLD.name,
                      'status', OLD.status, 
                      'create_by', OLD.create_by, 
                      'create_date', OLD.create_date, 
                      'update_by', OLD.update_by, 
                      'update_date', OLD.update_date), 
          USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_type` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_type_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_type_insert` AFTER INSERT ON `pro_type` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, new_data, changed_by)
    VALUES ('pro_type', 
            'INSERT', 
            NEW.id, 
            JSON_OBJECT('uid', NEW.uid, 
                        'name', NEW.name,
                        'status', NEW.status, 
                        'create_by', NEW.create_by, 
                        'create_date', NEW.create_date, 
                        'update_by', NEW.update_by, 
                        'update_date', NEW.update_date), 
            USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_type` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_type_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_type_update` BEFORE UPDATE ON `pro_type` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
  VALUES ('pro_type', 'UPDATE', OLD.id, 
          JSON_OBJECT('uid', OLD.uid, 
                      'name', OLD.name,
                      'status', OLD.status, 
                      'create_by', OLD.create_by, 
                      'create_date', OLD.create_date, 
                      'update_by', OLD.update_by, 
                      'update_date', OLD.update_date), 
          JSON_OBJECT('uid', NEW.uid, 
                      'name', NEW.name,
                      'status', NEW.status, 
                      'create_by', NEW.create_by, 
                      'create_date', NEW.create_date, 
                      'update_by', NEW.update_by, 
                      'update_date', NEW.update_date), 
          USER()) */$$


DELIMITER ;

/* Trigger structure for table `pro_type` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `log_pro_type_delete` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `log_pro_type_delete` AFTER DELETE ON `pro_type` FOR EACH ROW INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
  VALUES ('pro_type', 'DELETE', OLD.id, 
          JSON_OBJECT('uid', OLD.uid, 
                      'name', OLD.name,
                      'status', OLD.status, 
                      'create_by', OLD.create_by, 
                      'create_date', OLD.create_date, 
                      'update_by', OLD.update_by, 
                      'update_date', OLD.update_date), 
          USER()) */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
