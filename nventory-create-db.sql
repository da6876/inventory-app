CREATE TRIGGER `log_pro_info_update` BEFORE UPDATE ON `pro_info` FOR EACH ROW
INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
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
          USER());
          
CREATE TRIGGER `log_pro_info_delete` AFTER DELETE ON `pro_info` FOR EACH ROW
INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
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
          USER());
          
CREATE TRIGGER `log_pro_info_insert` AFTER INSERT ON `pro_info` 
FOR EACH ROW
INSERT INTO `change_log` (TABLE_NAME, operation_type, record_id, old_data, new_data, changed_by)
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
          USER());
==========================================================================================================
CREATE TABLE `pro_type` (
  `id` INT(10) NOT NULL,
  `uid` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `pro_type`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `pro_type`
  MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11010000;
CREATE TABLE `pro_category` (
  `id` INT(10) NOT NULL,
  `uid` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `pro_category`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `pro_category`
  MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11020000;
CREATE TABLE `pro_sub_category` (
  `id` INT(10) NOT NULL,
  `uid` VARCHAR(100) NOT NULL,
  `cat_id` INT(10) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `pro_sub_category`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `pro_sub_category`
  MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11030000;
  
CREATE TABLE `pro_info` (
  `product_id` INT(10) NOT NULL,
  `product_name` VARCHAR(80) NOT NULL,
  `product_type_id` INT(11) NOT NULL,
  `Categorie_id` INT(11) NOT NULL,
  `sub_Categorie_id` INT(11) NOT NULL,
  `shot_decs` VARCHAR(50) DEFAULT 'N',
  `decs` VARCHAR(500) NOT NULL DEFAULT 'N',
  `Gm` VARCHAR(10) NOT NULL DEFAULT 'N',
  `Pcs_Per_Ctn` VARCHAR(10) NOT NULL DEFAULT 'N',
  `dp_unit` INT(100) NOT NULL,
  `rp_unit` INT(100) NOT NULL,
  `mrp_unit` INT(100) NOT NULL,
  `product_sku_code` VARCHAR(50) DEFAULT 'N',
  `product_image` VARCHAR(500) NOT NULL DEFAULT 'N',
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`product_id`);
ALTER TABLE `product_info`
  MODIFY `product_id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11040000;
  
  ====================================================================================================================
    CREATE TABLE `user_type` (
  `id` INT(10) NOT NULL,
  `uid` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `user_type`
  MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11050000;
  
  CREATE TABLE `soc_divisions` (
  `id` INT(10) NOT NULL,
  `uid` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `soc_divisions`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `soc_divisions`
  MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11000;
  
  CREATE TABLE `soc_districts` (
  `id` INT(10) NOT NULL,
  `div_id` INT(10) NOT NULL,
  `uid` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `soc_districts`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `soc_districts`
  MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12000;
  
  CREATE TABLE `soc_thana` (
  `id` INT(10) NOT NULL,
  `dis_id` INT(10) NOT NULL,
  `uid` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `soc_thana`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `soc_thana`
  MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13000;
  
  CREATE TABLE `soc_area` (
  `id` INT(10) NOT NULL,
  `tha_id` INT(10) NOT NULL,
  `uid` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `soc_area`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `soc_area`
  MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14000;
  
  CREATE TABLE `soc_outlet` (
  `id` INT(10) NOT NULL,
  `div_id` INT(10) NOT NULL,
  `dis_id` INT(10) NOT NULL,
  `tha_id` INT(10) NOT NULL,
  `ara_id` INT(10) NOT NULL,
  `uid` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(10) NOT NULL,
  `create_date` VARCHAR(20) NOT NULL,
  `update_by` VARCHAR(10) DEFAULT NULL,
  `update_date` VARCHAR(20) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `soc_outlet`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `soc_outlet`
  MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15000;
  
CREATE TABLE product_stock (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pro_id BIGINT NOT NULL,
    batch_number VARCHAR(50) NOT NULL,
    production_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    quantity_in_stock INT NOT NULL,
    mrp DECIMAL(10, 2) NOT NULL,
    dealer_price DECIMAL(10, 2) NOT NULL,
    status ENUM('available', 'out_of_stock') NOT NULL,
    create_by VARCHAR(50) NOT NULL,
    create_date DATETIME NOT NULL,
    update_by VARCHAR(50) DEFAULT NULL,
    update_date DATETIME DEFAULT NULL
);
