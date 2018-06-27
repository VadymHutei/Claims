-- --------------------------------------------------------
-- Сервер:                       localhost
-- Версія сервера:               5.7.22 - MySQL Community Server (GPL)
-- ОС сервера:                   Linux
-- HeidiSQL Версія:              9.5.0.5280
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for claims
CREATE DATABASE IF NOT EXISTS `claims` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `claims`;

-- Dumping structure for таблиця claims.claims
CREATE TABLE IF NOT EXISTS `claims` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `store_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_claims_stores` (`store_id`),
  CONSTRAINT `FK_claims_stores` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дані для експорту не вибрані
-- Dumping structure for таблиця claims.managers
CREATE TABLE IF NOT EXISTS `managers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `position` varchar(256) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дані для експорту не вибрані
-- Dumping structure for таблиця claims.photos
CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `claim_id` int(8) unsigned NOT NULL,
  `photo` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_photos_claims` (`claim_id`),
  CONSTRAINT `FK_photos_claims` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дані для експорту не вибрані
-- Dumping structure for таблиця claims.stores
CREATE TABLE IF NOT EXISTS `stores` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `manager_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дані для експорту не вибрані
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
