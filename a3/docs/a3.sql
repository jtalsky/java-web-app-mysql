-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema jht24a
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `jht24a` ;

-- -----------------------------------------------------
-- Schema jht24a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jht24a` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `jht24a` ;

-- -----------------------------------------------------
-- Table `jht24a`.`petstore`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jht24a`.`petstore` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `jht24a`.`petstore` (
  `pst_id` SMALLINT NOT NULL,
  `pst_name` VARCHAR(45) NOT NULL,
  `pst_street` VARCHAR(45) NOT NULL,
  `pst_city` VARCHAR(45) NOT NULL,
  `pst_state` CHAR(2) NOT NULL,
  `pst_zip` INT(9) NOT NULL,
  `pst_phone` BIGINT NOT NULL,
  `pst_email` VARCHAR(100) NOT NULL,
  `pst_url` VARCHAR(100) NOT NULL,
  `pst_ytd_sales` DECIMAL(10,2) NOT NULL,
  `pst_notes` VARCHAR(255) NULL,
  PRIMARY KEY (`pst_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `jht24a`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jht24a`.`customer` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `jht24a`.`customer` (
  `cus_id` SMALLINT NOT NULL,
  `cus_fname` VARCHAR(15) NOT NULL,
  `cus_lname` VARCHAR(30) NOT NULL,
  `cus_street` VARCHAR(30) NOT NULL,
  `cus_city` VARCHAR(30) NOT NULL,
  `cus_state` CHAR(2) NOT NULL,
  `cus_zip` INT NOT NULL,
  `cus_phone` BIGINT NOT NULL,
  `cus_email` VARCHAR(100) NOT NULL,
  `cus_balance` DECIMAL(6,2) NOT NULL,
  `cus_total_sales` DECIMAL(6,2) NOT NULL,
  `cus_notes` VARCHAR(255) NULL,
  PRIMARY KEY (`cus_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `jht24a`.`pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jht24a`.`pet` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `jht24a`.`pet` (
  `pet_id` SMALLINT NOT NULL,
  `pst_id` SMALLINT NOT NULL,
  `cus_id` SMALLINT NULL,
  `pet_type` VARCHAR(45) NOT NULL,
  `pet_sex` ENUM('m', 'f') NOT NULL,
  `pet_cost` DECIMAL(6,2) NOT NULL,
  `pet_price` DECIMAL(6,2) NOT NULL,
  `pet_age` TINYINT NOT NULL,
  `pet_color` VARCHAR(30) NOT NULL,
  `pet_sale_date` DATE NULL,
  `pet_vaccine` ENUM('y', 'n') NOT NULL,
  `pet_neuter` ENUM('y', 'n') NOT NULL,
  `pet_notes` VARCHAR(255) NULL,
  PRIMARY KEY (`pet_id`),
  INDEX `fk_pet_customer_idx` (`cus_id` ASC) VISIBLE,
  INDEX `fk_pet_petstore1_idx` (`pst_id` ASC) VISIBLE,
  CONSTRAINT `fk_pet_customer`
    FOREIGN KEY (`cus_id`)
    REFERENCES `jht24a`.`customer` (`cus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_petstore1`
    FOREIGN KEY (`pst_id`)
    REFERENCES `jht24a`.`petstore` (`pst_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `jht24a`.`petstore`
-- -----------------------------------------------------
START TRANSACTION;
USE `jht24a`;
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (1, 'Pet Company', '84 East Street', 'Lincoln', 'NE', 68506, 2063428631, 'petco@gmail.com', 'petcompany.com', 1050000.00, NULL);
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (2, 'Paws & Reflect', '9984 Church Road', 'Blackwood', 'NJ', 08012, 7175501675, 'p.and.r@gmail.com', 'pawsandreflect.com', 325000.00, NULL);
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (3, 'Little Barkers', '75 Route 41', 'Michigan City', 'IN', 46360, 2487629356, 'littlebarkers@gmail.com', 'littlebarkers.com', 500000.00, NULL);
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (4, 'Sweet Whiskers', '7752 Hillcrest Drive', 'Sugar Land', 'TX', 77478, 2536441282, 'sweetwhiskersco@gmail.com', 'sweetwhiskers.com', 625000.00, NULL);
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (5, 'Claw & Order', '116 Fairview Road', 'Miami Beach', 'FL', 33139, 2093002557, 'claw.n.order@gmail.com', 'clawnorder.com', 1225000.00, NULL);
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (6, 'Cozy Critters', '9328 Fieldstone Drive', 'Ooltewah', 'TN', 37363, 2621621585, 'cozycritters1@gmail.com', 'cozycritterscc.com', 400000.00, NULL);
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (7, 'Meowtain Top', '291 Front Street South', 'Valley Stream', 'NY', 11580, 2522583799, 'meowtaintop@gmail.com', 'meowtaintop.com', 900000.00, NULL);
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (8, 'Pet Supply Company', '8701 Dogwood Drive', 'Medford', 'MA', 02155, 2341096666, 'petsupplyco@gmail.com', 'petsupplycompany.com', 350000.00, NULL);
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (9, 'Paw Studio', '661 Ann Street', 'New Baltimore', 'MI', 48047, 2018748593, 'paw.studio@gmail.com', 'pawstudio.com', 1325000.00, NULL);
INSERT INTO `jht24a`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (10, 'Pet Stop', '751 Mulberry Lane', 'Bensalem', 'PA', 19020, 2126583916, 'thepetstop@gmail.com', 'petstop.com', 875000.00, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `jht24a`.`customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `jht24a`;
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (1, 'Lydia', 'Brooks', '901 Desert Rose Lane', 'Phoenix', 'AZ', 85001, 2060177722, 'lydia.brooks@gmail.com', 0.00, 35.00, NULL);
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (2, 'Marcus', 'Sterling', '742 Evergreen Terrace', 'Springfield', 'IL', 62704, 7170102345, 'm.sterling@gmail.com', 275.00, 1425.00, NULL);
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (3, 'Elena', 'Vazquez', '1290 Ocean View Drive', 'Miami', 'FL', 33101, 2480129876, 'elena.v@icloud.com', 168.75, 1386.25, NULL);
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (4, 'Julian', 'Reed', '455 Maple Avenue', 'Portland', 'OR', 97201, 2530154321, 'jreed88@gmail.com', 0.00, 500.00, NULL);
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (5, 'Sonia', 'Patel', '832 High Street', 'Austin', 'TX', 78701, 2090115544, 'sonia.patel@hotmail.com', 75.00, 450.00, NULL);
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (6, 'Derek', 'Lowe', '33 Oak Lane', 'Boulder', 'CO', 80301, 2620146677, 'dlowe_test@gmail.com', 0.00, 100.00, NULL);
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (7, 'Fiona', 'Gallagher', '102 Southern Boulevard', 'Charlotte', 'NC', 28202, 2520168899, 'fiona.g@icloud.com', 0.00, 875.00, NULL);
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (8, 'Arjun', 'Singh', '677 Industrial Way', 'Seattle', 'WA', 98101, 2340180033, 'arjun.s@gmail.com', 0.00, 112.50, NULL);
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (9, 'Naomi', 'Kim', '1928 West 4th Street', 'Brooklyn', 'NY', 11211, 2010124411, 'nkim_dev@gmail.com', 0.00, 2900.00, NULL);
INSERT INTO `jht24a`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (10, 'Grant', 'Halloway', '54 Brierwood Court', 'Nashville', 'TN', 37203, 2120177722, 'gholloway@outlook.com', 125.00, 750.00, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `jht24a`.`pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `jht24a`;
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (1, 1, 1, 'Hamster', 'f', 4.00, 15.00, 6, 'Cream', '2026/01/12', 'n', DEFAULT, NULL);
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (2, 2, 2, 'Dog', 'm', 300.00, 1100.00, 20, 'Brown', NULL, 'y', 'n', NULL);
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (3, 3, 3, 'Dog', 'f', 350.00, 1350.00, 12, 'White', '2025/12/29', 'y', 'n', NULL);
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (4, 4, 4, 'Cat', 'm', 125.00, 450.00, 10, 'Black', '2025/09/30', 'y', 'n', NULL);
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (5, 5, 5, 'Cat', 'm', 90.00, 325.00, 58, 'Blue', NULL, 'y', 'y', NULL);
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (6, 6, 6, 'Guinea Pig', 'm', 20.00, 75.00, 14, 'Red', '2026/01/27', 'n', 'n', NULL);
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (7, 7, 7, 'Cat', 'f', 200.00, 700.00, 11, 'White', NULL, 'y', 'n', NULL);
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (8, 8, 8, 'Fish', 'f', 0.25, 2.50, 16, 'Orange', NULL, 'n', 'n', NULL);
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (9, 9, 9, 'Dog', 'f', 700.00, 2400.00, 108, 'Black', '2025/12/23', 'y', 'y', NULL);
INSERT INTO `jht24a`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (10, 10, 10, 'Parrot', 'm', 80.00, 250.00, 9, 'Green', '2026/02/02', 'n', 'n', NULL);

COMMIT;

