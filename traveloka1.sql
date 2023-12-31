-- MySQL Script generated by MySQL Workbench
-- Thu Nov  2 10:21:26 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema traveloka
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema traveloka
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `traveloka` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `traveloka` ;

-- -----------------------------------------------------
-- Table `traveloka`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveloka`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `traveloka`.`customer` (`customer_name`, `email`, `phone_number`) VALUES
('John Doe', 'john.doe@example.com', '1234567890'),
('Jane Smith', 'jane.smith@example.com', '0987654321'),
('Bob Johnson', 'bob.johnson@example.com', '5555555555'),
('Mary Davis', 'mary.davis@example.com', '7777777777'),
('Michael Lee', 'michael.lee@example.com', '9999999999'),
('Sarah Brown', 'sarah.brown@example.com', '6666666666'),
('David Williams', 'david.williams@example.com', '1111111111'),
('Emily Taylor', 'emily.taylor@example.com', '2222222222'),
('James Anderson', 'james.anderson@example.com', '3333333333'),
('Olivia Davis', 'olivia.davis@example.com', '4444444444');


-- -----------------------------------------------------
-- Table `traveloka`.`touristattractions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveloka`.`touristattractions` (
  `attraction_id` INT NOT NULL AUTO_INCREMENT,
  `attraction_name` VARCHAR(45) NULL DEFAULT NULL,
  `city_name` VARCHAR(45) NULL DEFAULT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  `entrance_fee` DECIMAL(10,2) NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`attraction_id`),
  INDEX `customerid_wisata_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customerid_wisata`
    FOREIGN KEY (`customer_id`)
    REFERENCES `traveloka`.`customer` (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `traveloka`.`touristattractions` (`attraction_name`, `city_name`, `description`, `entrance_fee`, `customer_id`) VALUES
('Eiffel Tower', 'Paris', 'Iconic iron lattice tower located on the Champ de Mars in Paris.', 25.00, 1),
('Statue of Liberty', 'New York', 'Iconic statue on Liberty Island in New York Harbor.', 18.00, 2),
('Great Wall of China', 'Beijing', 'Series of fortifications made of stone, brick, tamped earth, and other materials.', 30.00, 3),
('Machu Picchu', 'Cusco', 'Incan citadel situated on a mountain ridge in Peru.', 20.00, 4),
('Pyramids of Giza', 'Cairo', 'Ancient pyramids located in the Giza pyramid complex.', 15.00, 5),
('Colosseum', 'Rome', 'Ancient amphitheatre in the center of Rome.', 12.00, 6),
('Taj Mahal', 'Agra', 'White marble mausoleum located in Agra, India.', 22.00, 7),
('Angkor Wat', 'Siem Reap', 'Largest religious monument in the world.', 18.00, 8),
('Grand Canyon', 'Arizona', 'Iconic steep-sided canyon carved by the Colorado River.', 10.00, 9),
('Petra', 'Ma\'an', 'Historical and archaeological city in southern Jordan.', 15.00, 10);

-- -----------------------------------------------------
-- Table `traveloka`.`attractiontickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveloka`.`attractiontickets` (
  `ticket_id` INT NOT NULL AUTO_INCREMENT,
  `attraction_id` INT NULL DEFAULT NULL,
  `purchase_date` DATE NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  INDEX `fk_attraction_id _idx` (`attraction_id` ASC) VISIBLE,
  CONSTRAINT `fk_attraction_id `
    FOREIGN KEY (`attraction_id`)
    REFERENCES `traveloka`.`touristattractions` (`attraction_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `traveloka`.`attractiontickets` (`attraction_id`, `purchase_date`, `price`) VALUES
(1, '2023-11-02', 25.00),
(2, '2023-11-03', 18.00),
(3, '2023-11-04', 30.00),
(4, '2023-11-05', 20.00),
(5, '2023-11-06', 15.00),
(6, '2023-11-07', 12.00),
(7, '2023-11-08', 22.00),
(8, '2023-11-09', 18.00),
(9, '2023-11-10', 10.00),
(10, '2023-11-11', 15.00);

-- -----------------------------------------------------
-- Table `traveloka`.`hotelbookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveloka`.`hotelbookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NULL DEFAULT NULL,
  `guest_name` VARCHAR(45) NULL DEFAULT NULL,
  `hotel_name` BINARY(45) NULL DEFAULT NULL,
  `check_in_date` DATE NULL DEFAULT NULL,
  `check_out_date` DATE NULL DEFAULT NULL,
  `room_type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_customer_idhotel_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_idhotel`
    FOREIGN KEY (`customer_id`)
    REFERENCES `traveloka`.`customer` (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `traveloka`.`hotelbookings` (`customer_id`, `guest_name`, `hotel_name`, `check_in_date`, `check_out_date`, `room_type`) VALUES
(1, 'John Doe', 'Hotel Parisien', '2023-11-02', '2023-11-05', 'Deluxe Suite'),
(2, 'Jane Smith', 'New York Plaza', '2023-11-03', '2023-11-06', 'Executive Room'),
(3, 'Bob Johnson', 'Beijing Grand', '2023-11-04', '2023-11-07', 'Standard Room'),
(4, 'Mary Davis', 'Cusco Comfort', '2023-11-05', '2023-11-08', 'Family Suite'),
(5, 'Michael Lee', 'Cairo Oasis', '2023-11-06', '2023-11-09', 'King Suite'),
(6, 'Sarah Brown', 'Rome Retreat', '2023-11-07', '2023-11-10', 'Deluxe Room'),
(7, 'David Williams', 'Agra View', '2023-11-08', '2023-11-11', 'Standard Room'),
(8, 'Emily Taylor', 'Siem Reap Serenity', '2023-11-09', '2023-11-12', 'King Suite'),
(9, 'James Anderson', 'Arizona Inn', '2023-11-10', '2023-11-13', 'Executive Room'),
(10, 'Olivia Davis', 'Jordan Palace', '2023-11-11', '2023-11-14', 'Family Suite');

select * from `hotelbookings`;
-- -----------------------------------------------------
-- Table `traveloka`.`hotelpayments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveloka`.`hotelpayments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `booking_idhotel` INT NULL DEFAULT NULL,
  `payment_date` DATE NULL DEFAULT NULL,
  `amount_paid` DECIMAL(10,2) NULL DEFAULT NULL,
  `payment_method` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_booking_id_idx` (`booking_idhotel` ASC) VISIBLE,
  CONSTRAINT `fk_booking_idotel`
    FOREIGN KEY (`booking_idhotel`)
    REFERENCES `traveloka`.`hotelbookings` (`booking_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `traveloka`.`hotelpayments` (`booking_idhotel`, `payment_date`, `amount_paid`, `payment_method`) VALUES
(1, '2023-11-03', 250.00, 'Credit Card'),
(2, '2023-11-04', 180.00, 'PayPal'),
(3, '2023-11-05', 300.00, 'Cash'),
(4, '2023-11-06', 200.00, 'Credit Card'),
(5, '2023-11-07', 150.00, 'PayPal'),
(6, '2023-11-08', 120.00, 'Cash'),
(7, '2023-11-09', 220.00, 'Credit Card'),
(8, '2023-11-10', 180.00, 'PayPal'),
(9, '2023-11-11', 100.00, 'Cash'),
(10, '2023-11-12', 150.00, 'Credit Card');

-- -----------------------------------------------------
-- Table `traveloka`.`transportationbookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveloka`.`transportationbookings` (
  `booking_id` INT NOT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `passenger_name` VARCHAR(45) NULL DEFAULT NULL,
  `departure_city` VARCHAR(45) NULL DEFAULT NULL,
  `arrival_city` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `booking_date_time` DATETIME NULL DEFAULT NULL,
  `total_price` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_customer_id_idx` (`total_price` ASC) VISIBLE,
  INDEX `fk_customer id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `traveloka`.`customer` (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `traveloka`.`transportationbookings` (`booking_id`, `customer_id`, `passenger_name`, `departure_city`, `arrival_city`, `booking_date_time`, `total_price`) VALUES
(1, 1, 'John Doe', 'New York', 'Los Angeles', '2023-11-02 08:00:00', 150.00),
(2, 2, 'Jane Smith', 'London', 'Paris', '2023-11-03 10:00:00', 120.00),
(3, 3, 'Bob Johnson', 'Tokyo', 'Seoul', '2023-11-04 12:00:00', 180.00),
(4, 4, 'Mary Davis', 'Sydney', 'Melbourne', '2023-11-05 14:00:00', 100.00),
(5, 5, 'Michael Lee', 'Beijing', 'Shanghai', '2023-11-06 16:00:00', 130.00),
(6, 6, 'Sarah Brown', 'Mumbai', 'Delhi', '2023-11-07 18:00:00', 90.00),
(7, 7, 'David Williams', 'Rio de Janeiro', 'Sao Paulo', '2023-11-08 20:00:00', 200.00),
(8, 8, 'Emily Taylor', 'Toronto', 'Montreal', '2023-11-09 22:00:00', 110.00),
(9, 9, 'James Anderson', 'Los Angeles', 'San Francisco', '2023-11-10 08:00:00', 120.00),
(10, 10, 'Olivia Davis', 'Berlin', 'Amsterdam', '2023-11-11 10:00:00', 140.00);

-- -----------------------------------------------------
-- Table `traveloka`.`transportationpayments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveloka`.`transportationpayments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `booking_id` INT NULL DEFAULT NULL,
  `payment_date` DATE NULL DEFAULT NULL,
  `amount_paid` DECIMAL(10,2) NULL DEFAULT NULL,
  `payment_method` VARCHAR(45) NULL DEFAULT NULL,
  `TransportationPaymentscol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_booking_id_idx` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `fk_booking_id`
    FOREIGN KEY (`booking_id`)
    REFERENCES `traveloka`.`transportationbookings` (`booking_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `traveloka`.`transportationpayments` (`booking_id`, `payment_date`, `amount_paid`, `payment_method`, `TransportationPaymentscol`) VALUES
(1, '2023-11-02', 50.00, 'Credit Card', 'SomeValue1'),
(2, '2023-11-03', 40.00, 'PayPal', 'SomeValue2'),
(3, '2023-11-04', 60.00, 'Cash', 'SomeValue3'),
(4, '2023-11-05', 30.00, 'Credit Card', 'SomeValue4'),
(5, '2023-11-06', 70.00, 'PayPal', 'SomeValue5'),
(6, '2023-11-07', 20.00, 'Cash', 'SomeValue6'),
(7, '2023-11-08', 80.00, 'Credit Card', 'SomeValue7'),
(8, '2023-11-09', 10.00, 'PayPal', 'SomeValue8'),
(9, '2023-11-10', 90.00, 'Cash', 'SomeValue9'),
(10, '2023-11-11', 15.00, 'Credit Card', 'SomeValue10');


-- -----------------------------------------------------
-- Table `traveloka`.`travel_agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveloka`.`travel_agent` (
  `agent_id` INT NOT NULL,
  `agent_name` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`agent_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `traveloka`.`travel_agent` (`agent_id`, `agent_name`, `city`) VALUES
(1, 'TravelHub', 'New York'),
(2, 'Wanderlust Tours', 'Paris'),
(3, 'Adventure Seekers', 'Sydney');

-- -----------------------------------------------------
-- Table `traveloka`.`travelpackages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `traveloka`.`travelpackages` (
  `package_id` INT NOT NULL AUTO_INCREMENT,
  `package_name` VARCHAR(45) NULL DEFAULT NULL,
  `agent_name` VARCHAR(45) NULL DEFAULT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `agent_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`package_id`),
  INDEX `fk_customer_id_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_agent_id _idx` (`agent_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_id `
    FOREIGN KEY (`agent_id`)
    REFERENCES `traveloka`.`travel_agent` (`agent_id`),
  CONSTRAINT `fk_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `traveloka`.`customer` (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `traveloka`.`travelpackages` (`package_name`, `agent_name`, `description`, `price`, `customer_id`, `agent_id`) VALUES
('Paris Adventure', 'Wanderlust Tours', 'Explore the beauty of Paris with guided tours and activities.', 1200.00, 1, 2),
('New York Experience', 'TravelHub', 'Discover the vibrant culture of New York City.', 1500.00, 2, 1),
('Sydney Getaway', 'Adventure Seekers', 'Experience the wonders of Sydney, Australia.', 1100.00, 3, 3);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
