DROP DATABASE IF EXISTS exer1;
CREATE DATABASE exer1;
USE exer1;

CREATE TABLE `Employees`(
    `id_employees` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `surname` VARCHAR(255) NOT NULL,
    `D`.`N`.`I` VARCHAR(255) NOT NULL,
    `salary` DOUBLE(8, 2) NOT NULL,
    `rol` VARCHAR(255) NOT NULL,
    `telephone number` VARCHAR(255) NOT NULL,
    `id_enterprises` INT NOT NULL
);
CREATE TABLE `Enterprises`(
    `id_enterprises` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `area` DOUBLE(8, 2) NOT NULL
);
CREATE TABLE `clients`(
    `id_client` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `surname` VARCHAR(255) NOT NULL,
    `telephone num` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
);
CREATE TABLE `transaction`(
    `id_transaction` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `datatime` DATETIME NOT NULL,
    `id_cliente` INT NOT NULL,
    `total` DOUBLE(8, 2) NOT NULL
);
CREATE TABLE `transacion_products`(
    `id_trasaccion_prod` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_product` INT NOT NULL,
    `id_transaction` INT NOT NULL,
    `price` DOUBLE(8, 2) NOT NULL,
    `quantity` INT NOT NULL
);
CREATE TABLE `products`(
    `id_products` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `price` DOUBLE(8, 2) NOT NULL,
    `id_type_products` INT NOT NULL,
    `id_enterprises` INT NOT NULL
);
CREATE TABLE `type_products`(
    `id_type_products` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `description` VARCHAR(255) NOT NULL,
    `reference` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Employees` ADD CONSTRAINT `employees_id_enterprises_foreign` FOREIGN KEY(`id_enterprises`) REFERENCES `Enterprises`(`id_enterprises`);
ALTER TABLE
    `products` ADD CONSTRAINT `products_id_enterprises_foreign` FOREIGN KEY(`id_enterprises`) REFERENCES `Enterprises`(`id_enterprises`);
ALTER TABLE
    `transaction` ADD CONSTRAINT `transaction_id_cliente_foreign` FOREIGN KEY(`id_cliente`) REFERENCES `clients`(`id_client`);
ALTER TABLE
    `transacion_products` ADD CONSTRAINT `transacion_products_id_transaction_foreign` FOREIGN KEY(`id_transaction`) REFERENCES `transaction`(`id_transaction`);
ALTER TABLE
    `products` ADD CONSTRAINT `products_id_type_products_foreign` FOREIGN KEY(`id_type_products`) REFERENCES `type_products`(`id_type_products`);
ALTER TABLE
    `transacion_products` ADD CONSTRAINT `transacion_products_id_product_foreign` FOREIGN KEY(`id_product`) REFERENCES `products`(`id_products`);